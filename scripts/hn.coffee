# # Description:
# #   Utility commands surrounding Hubot uptime.
# #
# # Commands:
# #   none
#
# NodePie = require("nodepie")
#
# module.exports = (robot) ->
#   robot.hear /^hn best (\d+)$/, (msg) ->
#     msg.http("http://hnbest.herokuapp.com/rss").get() (err, res, body) ->
#       feed = new NodePie(body)
#       try
#         feed.init()
#         items = feed.getItems(0, msg.match[1])
#         for item in items
#             msg.send item.getTitle() + ": " + item.getPermalink()
#       catch e
#         console.log(e)
#
#
#   interval = null
#   posted = []
#
#   robot.hear /.*/i, (msg) ->
#     return unless interval == null
#     # robot.send { room: "#twitter" }, 'Initialized HN watch'
#     interval = setInterval =>
#       # msg.send 'fetching'
#       msg.http("https://news.ycombinator.com/rss").get() (err, res, body) ->
#         # msg.send 'received'
#         if res.statusCode is not 200
#           # msg.send "Something's gone awry"
#         else
#           # msg.send "All OK"
#           feed = new NodePie(body)
#           try
#             # msg.send "Initializing feed"
#             feed.init()
#             items = feed.getItems(0, 30)
#
#             for item in items
#               title = item.getTitle()
#               if /(paypal)|(braintree)|(ebay)/i.test(title)
#                 if !(title in posted)
#                   posted.push title
#                   robot.send { room: "#twitter" }, title + ": " + item.getPermalink() + " (" + item.getComments()?.html + ")"
#           catch e
#             console.log(e)
#             # msg.send "Something's gone awry"
#     , 60000
