FROM wordpress:latest

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy your theme and plugin files
COPY ./wp-content/themes /var/www/html/wp-content/themes/
COPY ./wp-content/plugins /var/www/html/wp-content/plugins/

# Install dependencies (if needed)
# RUN apt-get update && apt-get install -y <any necessary packages>

# Expose port 80 (or your preferred port)
EXPOSE 80