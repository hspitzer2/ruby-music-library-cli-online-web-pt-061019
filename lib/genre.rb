require 'pry'

class Genre
  extend Concerns::Findable

      attr_accessor :name, :artist, :songs

      @@all = []

      def initialize(name)
        @name = name
        @songs = []
      end

      def self.all
        @@all
      end

      def save
        self.class.all << self
      end

      def self.destroy_all
        @@all.clear
      end

      def self.create(name)
        genre = self.new(name)
        genre.save
        genre
      end

      def add_song(song)
        song.genre = self unless song.genre == self
        songs << song unless songs.include?(song)
      end

      def artists
        songs.collect {|song|song.artist}.uniq
      end

end
