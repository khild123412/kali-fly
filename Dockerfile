FROM kalilinux/kali-rolling

# Update and install OpenSSH
RUN apt update && apt install -y openssh-server sudo

# Create SSH run directory
RUN mkdir -p /var/run/sshd

# Set root password
RUN echo 'root:toor' | chpasswd

# Configure SSH to allow root login and password authentication
RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]