# Gunakan image PHP dari Docker Hub
FROM php:7.4-apache

# Salin semua file dari direktori proyek Anda ke dalam /var/www/html di container
COPY . /var/www/html

# Atur working directory ke /var/www/html
WORKDIR /var/www/html

# Pasang modul-modul PHP yang diperlukan
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Create the storage directory if it doesn't exist
RUN mkdir -p /var/www/html/storage

# Set ownership of the directory (and its contents) to www-data
RUN chown -R www-data:www-data /var/www/html/storage

# Expose port 80 untuk Apache
EXPOSE 80

# Perintah default ketika container dijalankan
CMD ["apache2-foreground"]
