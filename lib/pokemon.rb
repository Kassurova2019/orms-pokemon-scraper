class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?) ", name, type)
    end

    def self.find(id, db)
        #db.execute("SELECT * FROM pokemon WHERE (id = ?)", id)
        pokemon_1 = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        id_value = pokemon_1[0][0]
        #puts "HEYYYYYYY IM HEEERRREEEEEEEEEE"

        name_value = pokemon_1[0][1]
        type_value = pokemon_1[0][2]


        new_pokemon = Pokemon.new(id:id_value, name:name_value, type:type_value, db:db)
        

    end
end