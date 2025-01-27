require "telegram/bot"
require "byebug"
require "dotenv/load"

TOKEN = ENV["TOKEN"]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when "/start"
      bot.api.send_message(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}! Добро пожаловать в нашего бота.")
    when "/help"
      bot.api.send_message(chat_id: message.chat.id, text: "Вот список доступных команд:\n/start - начать\n/help - помощь")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Вы написали: #{message.text}")
    end
  end
end
