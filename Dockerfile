FROM jrottenberg/ffmpeg
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

RUN apt-get update && \
    apt-get install python-dev python-pip -y && \
    apt-get clean

RUN pip install awscli

WORKDIR /tmp/workdir

COPY copy_thumbs.sh /tmp/workdir

ENTRYPOINT ffmpeg -i ${INPUT_VIDEO_FILE_URL} ${OUTPUT_THUMBS_FILE_NAME} && ./copy_thumbs.sh
