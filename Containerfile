# Pull RHEL10 bootc image
FROM registry.redhat.io/rhel10/rhel-bootc

# Install LAMP components
RUN dnf install -y httpd mariadb mariadb-server php-fpm php-mysqlnd && \
    dnf clean all

# Enable services to start automatically
RUN systemctl enable httpd mariadb php-fpm

# Create a home page
RUN echo '<h1 style="text-align:center;">Welcome to RHEL image mode</h1> <?php phpinfo(); ?>' > /var/www/html/index.php

# Set the CMD to start httpd and mariadb
     CMD ["/usr/sbin/init"]
