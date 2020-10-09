class Dog
  @@all = []

  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner_instance)
    @name = name
    @owner = owner_instance
    @mood = "nervous"

    @@all << self
  end

  def self.all
    @@all
  end
end