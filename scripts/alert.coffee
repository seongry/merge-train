cronJob = require('cron').CronJob
moment = require('moment')

module.exports = (robot) ->
  checkMergeTime = ()->
    currentTime = moment().format('HH:mm')
    mergeTime = ['09:00', '14:00', '17:30'];
    result = mergeTime.indexOf(currentTime);
    room = "testroom";
    if(result > 1)
      message = (result + 1) + "번째 MERGE 할 시간입니다 뿌뿌~~!";
      robot.messageRoom room, message;

  robot.hear /test/i, (res) ->
    checkMergeTime()

  'use strict'

  # Check for merge time, each o'clock, 30 min.
  # Monday to Friday.
  new cronJob('1 * * * * 1-5', checkMergeTime, null, true)
