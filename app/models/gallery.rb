class Gallery

  attr_reader :name, :city
  @@all = []
  def initialize(name, city)
    @name = name
    @city = city
    Gallery.all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select {|painting| painting.gallery == self}
  end

  def artists
    paintings.map {|painting| painting.artist}.uniq
  end

  def artist_names
    artists.map {|artist| artist.name}.uniq
  end

  def most_expensive_painting
    price = paintings.map {|painting| painting.price}
    paintings.select { |painting| painting.price == price.max}
  end
end
