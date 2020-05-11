FROM ubuntu:20.04
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install openssh-server tmux rsync ssh s3cmd --no-install-recommends && apt-get clean

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh
COPY authorized_keys /root/.ssh/

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
