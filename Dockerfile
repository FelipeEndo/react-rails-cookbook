FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update -qq && apt install -y nodejs postgresql-client yarn

RUN yarn add react-router-dom bootstrap jquery popper.js

RUN mkdir -p /react-rails-cookbook
WORKDIR /react-rails-cookbook

COPY Gemfile /react-rails-cookbook
COPY Gemfile.lock /react-rails-cookbook
RUN bundle install
RUN rails webpacker:install

COPY . /react_rails_cookbook

