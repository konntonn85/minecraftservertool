guard :shell do
  ll = ''
  watch(/latest.log/) {|m|
    # regexp joined|left|drown|slain
    ll = `tail -n 1 #{m[0]}`

    if ll.include?('joined') || ll.include?('left')
      message = ':white_check_mark: ' + ll.gsub(/(\r\n|\r|\n|\f)/,"") if ll.include?('joined')
      message = ':arrow_right: ' + ll.gsub(/(\r\n|\r|\n|\f)/,"") if ll.include?('left')
      message = "[マイクラ鯖の通知だよ！] #{message}"
      channel = '#minecraft'
      username = 'Minecraft'
      icon = ':minecraft:'
      token = 'hogehoge.piyopiyo.com'

      cmd = %Q{curl -X POST --data-urlencode 'payload={"channel": \"#{channel}\", "username": \"#{username}\", "text": \"#{message}\", "icon_emoji": \"#{icon}\"}' hogehogepiyopiyo.com}
      `#{cmd}` unless message.nil?
    end
  }
end
