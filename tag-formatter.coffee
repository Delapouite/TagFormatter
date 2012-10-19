{Formatter} = require 'caterpillar'

# Array white list
displayedTags = []

class TagFormatter extends Formatter

	# getTime
	getDate: ->
		# Prepare
		now      = new Date()
		hours    = @padLeft '0', 2, now.getHours()
		minutes  = @padLeft '0', 2, now.getMinutes()
		seconds  = @padLeft '0', 2, now.getSeconds()
		ms       = @padLeft '0', 3, now.getMilliseconds()

		# Return
		"#{hours}:#{minutes}:#{seconds}.#{ms}"

	# [tag1,tag2, tag3] message
	getTags: (message) ->
		# Get the content between the first pair of square brackets
		pattern = /^\[([\w, ]+)\]/i
		tags = pattern.exec message
		return [] unless tags
		tags = tags[1].split /[ ,]+/

	format: (levelCode,levelName,args) ->
		# Prepare
		{date,file,line,method,color,levelName,message} = @details(levelCode, levelName, args)

		# Check
		return message if !message
		tags = @getTags message

		# Display everything by default if white list empty
		if (displayedTags.length is 0) or (true in (val in displayedTags for val in tags))
			"[#{date}] #{message}"
		else
			null


module.exports = TagFormatter