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

curr.album = music.dirs[3]
dir.level.test = str_count(curr.album, pattern = "/")

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

print(artist.dirs)
print(album.dirs)

#Step 3
album.dirs[1]
print(str_split(album.dirs[1], pattern = "/"))
##3.1-3.2
#wav.files.total = list()
wav.files = c()
for (album in album.dirs){
  album.name = str_split_i(album, pattern = "/", -1)
  artist.name = str_split_i(album, pattern = "/", -2)
  test = paste(artist.name, album.name, sep = "-")
  music.files <- list.files(album)
  for (music.file in music.files){
    #print(music.file)
    if (str_count(music.file, pattern = ".wav")){
      file.path = str_split_i(music.file, pattern = ".wav", -2)
      file.path = str.split_i(file.path, pattern = "-", -2)
      print(file.path)
      final.path = paste(test, "-", file.path, ".json", sep = "")
      wav.files = append(wav.files, final.path) #will contain all of the .wav files in all of the albums 
    }
  #print(wav.files)
  }
  #wav.files.total = append(wav.files.total, wav.files)
}
print(wav.files)

##3.3
code.to.process = c()
###3.3a
desired_output = c() # [artist name]-[album naame]-[track name].json

for (file in wav.files){
  track.name = str_split(file, pattern = ".", simplify = TRUE)
  print(track.name)
  #track.names.location = append(track.names.location, )
}
?str_split
