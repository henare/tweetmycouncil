Tweet My Council
================

When's the next bin pick up in your street? How do you submit a development application? Where's my closest library?

You shouldn't have to know who your local council is to have these questions answered. Tweet My Council is a simple service that works this out for you. Just use the hashtag `#tmyc`, geotag your tweet and Tweet My Council will work out your local council and RT your question to them.

How does it work?
-----------------

Tweet My Council uses the Twitter Streaming API to search for the `#tmyc` hashtag. When it finds a Tweet, it uses the [geo information](http://blog.twitter.com/2009/11/think-globally-tweet-locally.html) attached to the Tweet to look up what council the person is in using the [Geo2Gov service](http://www.geo2gov.com/). It then queries a database to find out if the council is on Twitter (the data is crowd-sourced from a [Google Doc](https://docs.google.com/spreadsheet/ccc?key=0AppM8FtCInYXdGxRZGpCY0t6eDV5aFNwSEFPWnJqV3c&hl=en_GB#gid=0)).

If the council is on Twitter the original Tweet is RTed to the council. If the council is not on Twitter the Tweet is emailed to the council. The council can then reply to that Tweet and this is [displayed on a web page](http://tweetmycouncil.herokuapp.com/emails) and Tweeted back to the citizen.

We use [TweetStream](https://github.com/intridea/tweetstream) in [Event Machine](https://github.com/eventmachine/eventmachine) and [Sinatra](http://www.sinatrarb.com/), deployed on the [Heroku](http://www.heroku.com/) [Cedar stack](http://devcenter.heroku.com/articles/ruby). The [Geo2Gov service](http://www.geo2gov.com/) does the geo to local authority look up for Australia.

Configuration
-------------

For local development, copy `configuration.yaml.example` to `configuration.yaml` and set up your Twitter credentials.

When deploying to Heroku, environment variables are used and are set with `heroku config:add CONSUMER_KEY=8N029N81`, etc.

Contributors
------------

* Henare Degan
* Matthew Landauer
* Gavin Carr

License
-------

AGPL v3, see `LICENSE.txt` for full details.
