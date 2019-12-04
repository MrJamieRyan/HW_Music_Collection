require ('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :album_name, :album_genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @album_name = options['album_name']
    @album_genre = options['album_genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (
    album_name,
    album_genre,
    artist_id
    ) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@album_name, @album_genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def find_by_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result[0])
  end

end
