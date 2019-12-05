require("pry")
require_relative("../models/artists.rb")
require_relative("../models/albums.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({'artist_name' => "Take That"})
artist1.save

artist2 = Artist.new ({'artist_name' => 'Muse'})
artist2.save

album1 = Album.new ({"album_name" => "Progress", "album_genre" => "Pop", "artist_id" => artist1.id})
album1.save

album2 = Album.new ({"album_name" => "Odyssey", "album_genre" => "Pop", "artist_id" => artist1.id})
album2.save

binding.pry
nil
