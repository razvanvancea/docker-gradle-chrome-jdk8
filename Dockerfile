FROM gradle:jdk8

MAINTAINER Razvan Vancea <iamqarv@gmail.com>

RUN apt-get update

RUN apt-get install -y gnupg2

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable unzip \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' \
           "/opt/google/chrome/google-chrome"

RUN google-chrome --version 
