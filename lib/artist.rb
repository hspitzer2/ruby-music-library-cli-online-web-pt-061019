require 'pry'

class Artist
  extend Concerns::Findable

      attr_accessor :name, :songs, :genres

      @@all = []

      def initialize(name)
        @name = name
        @songs = []
      end

      def genres
        songs.collect {|song|song.genre}.uniq
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
        song = self.new(name)
        song.save
        song
      end

      def add_song(song)
        song.artist = self unless song.artist == self
        songs << song unless songs.include?(song)
      end
 end
