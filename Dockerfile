# FROM php:latest
# WORKDIR /var/www/html
# COPY . /var/www/html/
# EXPOSE 80


# # Use the latest PHP image with Apache
# FROM php:latest

# # Set the working directory
# WORKDIR /var/www/html

# # Copy the current directory contents into the container
# COPY . /var/www/html/

# # Install necessary packages and PHP extensions
# RUN apt-get update && apt-get install -y \
#     libpng-dev \
#     libjpeg-dev \
#     libfreetype6-dev \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install gd mysqli \
#     && a2enmod rewrite

# # Expose port 80
# EXPOSE 80

# # Start Apache in the foreground
# CMD ["apache2-foreground"]


FROM php:7.4-apache
RUN apt-get update && \
    apt-get install -y apache2-bin
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    a2enmod rewrite
COPY . /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
