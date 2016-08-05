--
-- User: tietang
-- Date: 16/8/1 10:19
--



local _M = {
    middlewares = {}
}

function _M:use(middleware)
    table.insert(self.middlewares, middleware)
end

function _M:use(middlewareName, middleware)
    self.middlewares[middlewareName] = middleware
end

function _M:init()
    for k, v in pairs(self.middlewares) do
        if v.set then v.set() end
    end
end

function _M:initWorker()
    for k, v in pairs(self.middlewares) do
        if v.set then v.set() end
    end
end

function _M:set()
    for k, v in pairs(self.middlewares) do
        if v.set then v.set() end
    end
end

function _M:rewrite()
    for k, v in pairs(self.middlewares) do
        if v.rewrite then v.rewrite() end
    end
end

function _M:access()
    for k, v in pairs(self.middlewares) do
        if v.access then v.access() end
    end
end

function _M:content()
    for k, v in pairs(self.middlewares) do
        if v.content then v.content() end
    end
end

function _M:headerFilter()
    for k, v in pairs(self.middlewares) do
        if v.headerFilter then v.headerFilter() end
    end
end

function _M:bodyFilter()
    for k, v in pairs(self.middlewares) do
        if v.bodyFilter then v.bodyFilter() end
    end
end

function _M:log()
    for k, v in pairs(self.middlewares) do
        if v.log then v.log() end
    end
end

return _M