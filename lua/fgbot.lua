local json = require('dkjson')
local base64 = require('ee5_base64')


function ok_cb(extra, success, result)
end


function on_msg_receive (msg)
    local responseJson = os.capture('php fgbot.php -- ' .. base64.encode(json.encode(msg)))
    local response = json.decode(responseJson)
    if 0 < string.len(response.to) then
        send_msg(response.to, response.message, ok_cb, false)
    end
end


function on_our_id (id)
end


function on_secret_chat_created (peer)
end


function on_user_update (user)
end


function on_chat_update (user)
end


function on_get_difference_end ()
end


function on_binlog_replay_end ()
end


function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end
