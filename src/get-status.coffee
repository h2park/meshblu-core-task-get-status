http = require 'http'

class GetStatus
  constructor: (options={}) ->

  do: (request, callback) =>
    @_respondWithOnline request, true, callback

  _respondWithOnline: (request, online, callback) =>
    response =
      metadata:
        responseId: request.metadata.responseId
        code: 200
        status: http.STATUS_CODES[200]
      data:
        online: true
    return callback null, response

module.exports = GetStatus
