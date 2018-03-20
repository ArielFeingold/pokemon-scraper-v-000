require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id

@@all = []

  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = ?", num).first
    self.new(id: num, name: pk[1], type: pk[2], db: db)
  end


end
