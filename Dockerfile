FROM ruby:2.6-stretch
MAINTAINER poVoq <kris@outmo.de>
LABEL description="Ruby 2.6 Debian Strech with Nginx and Zhabogram"

RUN apt-get update &&\
    #apt-get install -y -q nginx &&\
    apt-get install -y -q git

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

RUN git clone https://git.narayana.im/narayana/zhabogram.git

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["./zhabogram.rb"]
