FROM kalilinux/kali-rolling

RUN apt update && apt install -y openssh-server sudo curl

RUN useradd -m fly && echo "fly:flypass" | chpasswd && adduser fly sudo

RUN mkdir /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]