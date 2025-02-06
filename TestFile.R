########
#Lab 2
########

###############################################
#Task 1: Build a Batch File for Data Processing
###############################################

#Step 0
library(stringr)

#Step 1
music.dirs <- list.dirs("MUSIC")

#Step 2
artist.dirs = c()
album.dirs = c()
for (directory in music.dirs){
  dir.level <- str_count(directory, pattern = "/")
  if (dir.level == 1){
  artist.dirs = append(artist.dirs, directory)
  }
  else if (dir.level == 2){
    album.dirs = append(album.dirs, directory)
  }
}

#Step 3

##3.1-3.2
json.files = c()
for (album in album.dirs){
  ###Splits the string of the directory into Music, Artist, Album
  split.string = str_split(album, pattern = "/", simplify = TRUE)
  album.name = split.string[1, 3]
  artist.name = split.string[1, 2]
  art.n.album = paste(artist.name, album.name, sep = "-") #artist and album
                                                          #comined in desired format

  ##Lists the music files in each album, goes through them, creates the final
  ##desired string of [artist name]-[album name]-[trackname].json
  music.files <- list.files(album)
  for (music.file in music.files){
    if (str_count(music.file, pattern = ".wav")){
      #Makes sure we are only dealing with .wav files
      file.path = str_split(music.file, pattern = ".wav", simplify =  TRUE)
      file.path = str_split(file.path, pattern = "-", simplify = TRUE)
      song.name = file.path[1, 3]
      final.path = paste(art.n.album, "-", song.name, ".json", sep = "")
      json.files = append(wav.files, final.path) #will contain all of the .wav files in all of the albums 
    }
  }
}
print(json.files)

?writeLines()
#3d
code.to.process = paste(json.files, "streaming_extractor_music.exe")
print(code.to.process)

writeLines(code.to.process, "batfile.txt")
###############################################
#Task 2: Process JSON Output
###############################################


#Step 0
library(jsonlite)

#Step 1
json.file = (list.files())[8] 
#gives us the file we want. In the future, we can just loop through the .json
#files that we have in a list or folder
split.file = str_split(json.file, "-", simplify = TRUE)
artist.name = split.file[1, 1]
album = split.file[1, 2]
song.name = split.file[1, 3] #this still has .json on it
song.name = str_split(song.name, ".json", simplify = TRUE)[1,1]

#Step 2
json.data = fromJSON(json.file)

#Step 3
average.loudness = json.data$lowlevel$average_loudness
mean.spectral.enrgy = json.data$lowlevel$spectral_energy$mean
danceability = json.data$rhythm$danceability
bpm = json.data$rhythm$bpm
musical.key = json.data$tonal$key_key
musical.mode = json.data$tonal$key_scale
#duration = json.data ####in seconds, cant find right now.