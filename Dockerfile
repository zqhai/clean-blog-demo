FROM hub.c.163.com/nce2/nodejs:0.12.2
MAINTAINER c.163.com
RUN wget http://mirrors.163.com/.help/sources.list.vivid
RUN cp -f sources.list.vivid /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes ruby ruby-dev gcc make
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
RUN gem install jekyll 
RUN gem install jekyll-paginate
COPY . /srv/jekyll
WORKDIR /srv/jekyll
CMD jekyll build && jekyll serve --host=* --port=80

