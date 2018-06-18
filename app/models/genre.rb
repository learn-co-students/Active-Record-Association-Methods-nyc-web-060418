class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.all.count
  end

  def artist_count
    # return the number of artists associated with the genre
    Artist.all.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Artist.all.map do |item|
      item.name
    end
  end
end
