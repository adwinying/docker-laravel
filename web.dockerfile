FROM php:7.1-apache

# Change DocumentRoot directory
ENV APACHE_DOCUMENT_ROOT /var/www/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Install dependencies for nodejs & laravel
RUN apt-get update && apt-get install -y gnupg zlib1g-dev
RUN docker-php-ext-install zip

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
	apt-get install -y nodejs

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# Install laravel globally
RUN composer global require "laravel/installer"

# Add .composer/vendor/bin to bash_profile
RUN echo export PATH='$HOME/.composer/vendor/bin:$PATH' >> ~/.bashrc && \
	echo cd .. >> ~/.bashrc

# Allow Laravel to rewrite routes
RUN a2enmod rewrite
