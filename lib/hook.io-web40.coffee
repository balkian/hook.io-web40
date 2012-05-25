# Imports
Hook = require('hook.io').Hook

class Web40Hook extends Hook
    constructor: (options) ->
        self = this
        Hook.call(self, options)

        self.on 'hook::ready', ->
            self.on '*::kill', (data,fn) ->
                if data? && data == self.name
                    console.log "Shutting down, Sir"
                    fn(true)
                    self.kill()
            self.on '*::ping', (data,fn) ->
                self.emit 'pong', {'name':self.name}
                fn(self.name)

module.exports.Web40Hook = Web40Hook
