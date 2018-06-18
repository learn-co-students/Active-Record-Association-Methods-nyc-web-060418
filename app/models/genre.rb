class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.each do |song|
      if !self.artists.include?(song.artist)
        self.artists << song.artist
      end
    end
    self.artists.count
    # return the number of artists associated with the genre
  end

  def all_artist_names
    artist_array =self.songs.map do |song|
      song.artist.name
    end
    artist_array.uniq
    # return an array of strings containing every musician's name
  end
end
