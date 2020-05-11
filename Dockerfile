FROM ubuntu:20.04
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install tmux rsync ssh s3cmd --no-install-recommends
