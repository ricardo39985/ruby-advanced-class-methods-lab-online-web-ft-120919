require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = Song.new
    all << song
    song

  end
  def self.all
    @@all
  end
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end
  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    all << new_song
    new_song
  end
  def self.find_by_name(name)
    all.find { |song| song.name==name }
  end
  def self.find_or_create_by_name(name)
    if result=find_by_name(name)
        result
    else
      create_by_name(name)
    end
  end
  def self.alphabetical
    all.sort_by { |e| e.name}
  end
  def self.new_from_filename(filename)
    song_name, song_artist= filename.split(" - ")[1].chomp(".mp3"), filename.split(" - ")[0]
    new_song, new_song.artist_name = create_by_name(song_name), song_artist
    new_song
  end
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    self.class.all << self
  end

end
