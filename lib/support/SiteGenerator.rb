class SiteGenerator
  def initialize(path)
    @path = path
  end


  def rendered_path
    @path
  end

  def build_index
    html = File.read('app/views/index.html.erb')
    template = ERB.new(html)
    src = template.result(binding)
    File.write("#{rendered_path}/index.html", src)
  end

  def build_artists_index
    html = File.read('app/views/artists/index.html.erb')
    template = ERB.new(html)
    src = template.result(binding)
    File.write("#{rendered_path}/artists/index.html", src)
  end

  def build_artist_page
    html = File.read('app/views/artists/show.html.erb')
    template = ERB.new(html)

    Artist.all.each do |artist|
      @artist = artist
      src = template.result(binding)
      File.write("#{rendered_path}/artists/#{artist.to_slug}.html", src)
    end
  end

  def build_genres_index
    html = File.read('app/views/genres/index.html.erb')
    template = ERB.new(html)
    src = template.result(binding)
    File.write("#{rendered_path}/genres/index.html", src)
  end

  def build_genre_page
    html = File.read('app/views/genres/show.html.erb')
    template = ERB.new(html)

    Genre.all.each do |genre|
      @genre = genre
      src = template.result(binding)
      File.write("#{rendered_path}/genres/#{genre.to_slug}.html", src)
    end
  end

  def build_songs_index
    html = File.read('app/views/songs/index.html.erb')
    template = ERB.new(html)
    src = template.result(binding)
    File.write("#{rendered_path}/songs/index.html", src)
  end
  def build_song_page
    1
  end
end