cronJob = require('cron').CronJob
moment = require('moment')

module.exports = (robot) ->

  checkMergeTime = (res)->
    currentTime = moment().format('HH:mm')
    result = (currentTime == '09:00') or (currentTime == '14:00') or (currentTime == '17:30')
    res.send '머지할 시간입니다 뿌뿌~~!';

  robot.hear /test/i, (res) ->
     mergeShouldFire(res)

  'use strict'

  # Check for merge time, each o'clock, 30 min.
  # Monday to Friday.
  new cronJob('1 * * * * 1-5', checkMergeTime, null, true)
