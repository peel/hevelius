Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Johnny Hevelius"
  config.robot.mention_name = "hevelius"
  config.robot.alias = "h"

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack
  config.robot.admins = ["U03DJL1J4"]
  config.adapters.slack.token = "xoxb-4146560239-7bhj4u4aMMCo95SjAHt3kHNd"

  ## Example: Set options for the Redis connection.
  config.redis[:url] = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  config.handlers.responder.cleverbot = true
  config.handlers.forecast.api_key = '9e717b9447269b7dbffa7fa71e577e9a'

  config.handlers.memegen.command_only = true
  config.handlers.memegen.username = 'hevelius'
  config.handlers.memegen.password = 'hevelius'

  normalized_karma_user_term = ->(user_id, user_name) {
    "@#{user_id} (#{user_name})" #=> @UUID (Liz Lemon)
  }

  config.handlers.karma.term_normalizer = lambda do |full_term|
    term = full_term.to_s.strip.sub(/[<:]([^>:]+)[>:]/, '\1')
    user = Lita::User.fuzzy_find(term.sub(/\A@/, ''))

    if user
      normalized_karma_user_term.call(user.id, user.name)
    else
      term.downcase
    end
  end

  config.handlers.slack_karma_sync.user_term_normalizer = normalized_karma_user_term

  config.handlers.custom_meme.command_only = false

end
