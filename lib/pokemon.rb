require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id

@@all = []

  def initialize(id)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db = @db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db = @db)

    db.execute("SELECT * FROM pokemon WHERE id = ?", num).map {|row| self.new_from_db(row) }.first}
    binding.pry
  end

end
