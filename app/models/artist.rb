class Artist

  attr_reader :name, :years_experience


  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    Artist.all << self
  end

  def self.all
    @@all
  end

  def paintings ######
    Painting.all.select { |painting| painting.artist == self }
  end

  def galleries #########
    paintings.map { |painting| painting.gallery }
  end

  def cities
    galleries.map { |gallery| gallery.city }
  end

  def self.total_experience
    total = 0
    Artist.all.each { |artist| total += artist.years_experience }
    total
  end

  def self.most_prolific
    Artist.all.max_by do |artist| 
      (artist.paintings.count.to_f / artist.years_experience)
    end
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

end
