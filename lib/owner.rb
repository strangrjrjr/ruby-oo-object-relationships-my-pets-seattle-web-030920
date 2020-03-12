class Owner
  # code goes here
  attr_reader :name, :species

  @@all =[]
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.select {|dog| dog.owner == self ? dog.mood = "happy" : nil}
  end

  def feed_cats
    Cat.all.select {|cat| cat.owner == self ? cat.mood = "happy" : nil}
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end