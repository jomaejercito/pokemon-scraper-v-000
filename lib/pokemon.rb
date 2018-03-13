class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []


  def initialize(id:, name:, type:, :hp, db:)
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
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).first
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

end
