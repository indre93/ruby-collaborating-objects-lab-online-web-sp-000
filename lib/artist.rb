class Artist
  attr_accessor :name, :song

  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end

  def add_song(song)
    song = Song.new(song)
    self.songs << song.name
    song.artist = self
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    self.all.find {|person| person.name = name} || @@all << self.new
  end

  def print_songs
    @songs.each {|song| puts "#{song.name}"}
  end

end
