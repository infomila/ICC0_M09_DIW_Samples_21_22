

rem ffprobe frag.mkv

pause

set VIDEO=frag.mkv
mkdir frag
mkdir frag\360p
mkdir frag\480p
mkdir frag\720p
mkdir frag\1080p



ffmpeg -hide_banner -y -i %VIDEO% ^
  -vf scale=640:trunc(ow/a/2)*2  -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 4 -hls_playlist_type vod  -b:v 800k -maxrate 856k -bufsize 1200k -b:a 96k -hls_segment_filename frag/360p/S%%03d.ts frag/360p/360p.m3u8 ^
  -vf scale=842:trunc(ow/a/2)*2  -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 4 -hls_playlist_type vod -b:v 1400k -maxrate 1498k -bufsize 2100k -b:a 128k -hls_segment_filename frag/480p/S%%03d.ts frag/480p/480p.m3u8 ^
  -vf scale=1280:trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 4 -hls_playlist_type vod -b:v 2800k -maxrate 2996k -bufsize 4200k -b:a 128k -hls_segment_filename frag/720p/S%%03d.ts frag/720p/720p.m3u8 ^
  -vf scale=1920:trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 -hls_time 4 -hls_playlist_type vod -b:v 5000k -maxrate 5350k -bufsize 7500k -b:a 192k -hls_segment_filename frag/1080p/S%%03d.ts frag/1080p/1080p.m3u8
  
  
  
(echo #EXTM3U^
#EXT-X-VERSION:3^

#EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360^

frag\360p\360p.m3u8^

#EXT-X-STREAM-INF:BANDWIDTH=1400000,RESOLUTION=842x480^

frag\480p\480p.m3u8^

#EXT-X-STREAM-INF:BANDWIDTH=2800000,RESOLUTION=1280x720^

frag\720p\720p.m3u8^

#EXT-X-STREAM-INF:BANDWIDTH=5000000,RESOLUTION=1920x1080^

frag\1080p\1080p.m3u8^
  )> play_list.m3u8
  
pause

 