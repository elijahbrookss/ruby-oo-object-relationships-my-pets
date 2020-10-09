class Owner
  # code goes here

  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end
    
  def self.reset_all
    @@all.clear
  end

  def cats
    get_amount_owned(Cat)
  end

  def dogs
    get_amount_owned(Dog)
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    set_mood(self.dogs, "happy")
  end

  def feed_cats
    set_mood(self.cats, "happy")
  end
  
  def sell_pets
   dogs_and_cats =  self.dogs + self.cats

   set_mood(dogs_and_cats, "nervous")
   dogs_and_cats.each{|animal| animal.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  private

  def get_amount_owned(animal_class)
    animal_class.all.collect{|class_instance|if class_instance.owner == self then class_instance end}.compact
  end

  def set_mood(array, mood)
    array.each{|animal| animal.mood = mood}
  end

end