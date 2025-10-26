# .devcontainer/Dockerfile
FROM php:8.4-apache

# Install necessary packages
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install mysqli pdo pdo_pgsql pgsql zip gd \
    && a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy PHP files
# COPY ../src/ /var/www/html/

# Set permissions (optional, useful if using NFS)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]