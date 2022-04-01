
set VIDEO=frag.mkv

ffprobe %VIDEO%
rem ================== H.264 de mp4 =========================

rem ffmpeg -i %VIDEO%  -vf scale=1280:720  -c:a mp3 -c:v h264 -b:v 2M output.mp4

rem ================== VP8 de Google =========================

rem ffmpeg -i %VIDEO%  -vf scale=1280:720 -c:a libvorbis -c:v vp8 -b:v 2M output.webm

rem ================== H.265 =========================
rem ffmpeg -i %VIDEO%  -vf scale=1280:720  -c:a mp3 -c:v hevc -b:v 2M output_HEVC.mp4

rem ================== AV1 de Google =========================
rem ffmpeg -i %VIDEO%  -vf scale=1280:720 -c:a libvorbis -c:v av1 -b:v 2M output_AV1.webm

pause