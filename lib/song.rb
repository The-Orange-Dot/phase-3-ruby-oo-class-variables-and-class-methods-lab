require 'pry'

class Song
  attr_reader :name, :artist, :genre
  @@artists = []
  @@genres = []
  @@count = 0

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@artists << self.artist
    @@genres << self.genre
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    # Groups unique strings and groups them together into a key value hash (in an array) [group => "item", "item"]
    grouped_genres = @@genres.group_by { |genre| genre }

    # Maps the array and returns a [key, value] pair
    mapped_genres = grouped_genres.map { |key, value| [key, value.length] }

    # Converts [key, value] pair into a [key => value] paired hash
    mapped_genres.to_h
  end

  def self.artist_count
    grouped_artists = @@artists.group_by { |artist| artist }
    mapped_artists = grouped_artists.map { |key, values| [key, values.length] }
    mapped_artists.to_h
  end
  # binding.pry
end
