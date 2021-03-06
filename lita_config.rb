Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Johnny Hevelius"
  config.robot.mention_name = ENV["USERNAME"]
  config.robot.alias = "h"

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack
  config.robot.admins = [ENV["ROBOT_ADMIN"]]
  config.adapters.slack.token = ENV["SLACK_KEY"]

  ## Example: Set options for the Redis connection.
  config.redis[:url] = ENV["REDISCLOUD_URL"]
  config.http.port = ENV["PORT"]

  config.handlers.responder.cleverbot = false
  config.handlers.forecast.api_key = '9e717b9447269b7dbffa7fa71e577e9a'

  config.handlers.memegen.command_only = true
  config.handlers.memegen.username = ENV["USERNAME"]
  config.handlers.memegen.password = ENV["USERNAME"]

  config.handlers.custom_meme.command_only = false

  config.handlers.static_meme.mapping = {
      /greenfood/i => ["http://i.imgur.com/KKX9ARf.jpg", "http://i.imgur.com/PobPmnv.jpg"], # specify a single response image...
      /deal with it/i => ["http://i.imgur.com/ykDuU.gif", "http://i.imgur.com/3PWHn.gif"], # ...or a set to randomly choose from
      /lobster/i => ["http://media.giphy.com/media/bxIAYZGzgsGU8/giphy.gif", "http://media.giphy.com/media/nGly4XkxGdwZy/giphy.gif", "http://media.giphy.com/media/zAHGio5ZlFvMY/giphy.gif","http://media3.giphy.com/media/43CqcyCMVOPvO/giphy.gif","http://media3.giphy.com/media/sBnzU37Cnr03K/giphy.gif","http://media1.giphy.com/media/V99yowOGfCorm/giphy.gif","http://media4.giphy.com/media/g5zlGQyK3GjS0/giphy.gif","http://media3.giphy.com/media/e8IBXAqD9iY1O/giphy.gif", "http://media2.giphy.com/media/smsHPxUngn1xm/giphy.gif"],# ...or a set to randomly choose from
      /etam lobs/i => ["http://media4.giphy.com/media/qVv6wEyFxldRK/giphy.gif"],
      /c'nie/i => ["no raczej"],
      /good good/i => ["https://www.youtube.com/watch?v=tfslY_AvhLw"]
    }

  config.handlers.giphy.api_key = "dc6zaTOxFJmzC"

end
