# Gunakan image PHP dari Docker Hub
FROM php:7.4-apache

# Salin semua file dari direktori proyek Anda ke dalam /var/www/html di container
COPY . /var/www/html

# Atur working directory ke /var/www/html
WORKDIR /var/www/html

# Pasang modul-modul PHP yang diperlukan
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Atur permission agar Apache dapat menulis ke direktori storage jika diperlukan
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 /var/www/html/storage

# Expose port 80 untuk Apache
EXPOSE 80

# Perintah default ketika container dijalankan
CMD ["apache2-foreground"]
