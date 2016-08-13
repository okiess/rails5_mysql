FROM ruby:2.2.4
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient18 nodejs locales
RUN locale-gen en_DE.UTF-8
ENV LANG en_DE.UTF-8
ENV LANGUAGE en_DE:de
ENV LC_ALL en_DE.UTF-8
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
