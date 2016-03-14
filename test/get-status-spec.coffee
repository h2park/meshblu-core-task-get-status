GetStatus = require '../'

describe 'GetStatus', ->
  beforeEach ->
    @sut = new GetStatus {}

  describe '->do', ->
    context 'when given a valid request', ->
      beforeEach (done) ->
        request =
          metadata:
            responseId: 'its-electric'
          rawData: '{}'

        @sut.do request, (error, @response) => done error

      it 'should return a 204', ->
        expectedResponse =
          metadata:
            responseId: 'its-electric'
            code: 200
            status: 'OK'
          data:
            online: true
        expect(@response).to.deep.equal expectedResponse
