# Pull RHEL10 bootc image
FROM registry.redhat.io/rhel10/rhel-bootc

adduser --disabled-password --gecos '' pete

# Install LAMP components
dnf install cockpit  && \
    dnf clean all


RUN systemctl enable cockpit.socket
#

# Enable services to start automatically
#RUN systemctl enable httpd 

# Create a home page
#RUN echo '<h1 style="text-align:center;">Welcome to RHEL image mode</h1>' > /var/www/html/index.html

# Set the CMD to start httpd 
     CMD ["/usr/sbin/init"]



# podman run -it --name bootc-container --hostname bootc-container -p 2022:22 rhel-bootc-simple
