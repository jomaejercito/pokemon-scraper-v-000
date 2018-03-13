class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []


  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end


  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", [name,type])
  end


  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3] , db: db)
  end


  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", [new_hp, self.id])
  end

end
