FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir -p /react-rails-cookbook
WORKDIR /react-rails-cookbook

COPY Gemfile /react-rails-cookbook
COPY Gemfile.lock /react-rails-cookbook
RUN bundle install
RUN rails webpacker:install

COPY . /react_rails_cookbook

