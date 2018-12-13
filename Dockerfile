FROM ruby:2.5
 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
 
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN gem install pg

COPY Gemfile /usr/src/app/
 
RUN bundle install
 
COPY . /usr/src/app
 
EXPOSE 3000
CMD puma -C config/puma.rb
