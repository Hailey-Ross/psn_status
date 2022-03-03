local scenes = {}

RegisterServerEvent("psn_status:add")
AddEventHandler("psn_status:add", function(text)
    local _source = source
    local _text = tostring(text)
    local scene = {text = _text, serverid = _source}
    scenes[#scenes+1] = scene
    TriggerClientEvent("psn_status:sendscenes", -1, scenes)
end)

RegisterServerEvent("psn_status:getscenes")
AddEventHandler("psn_status:getscenes", function(text)
    local _source = source
    TriggerClientEvent("psn_status:sendscenes", _source, scenes)
end)

RegisterServerEvent("psn_status:delete")
AddEventHandler("psn_status:delete", function()
    local _source = source
    if scenes[1] ~= nil then
        for i,v in pairs(scenes) do
            if scenes[i].serverid == _source then
                table.remove(scenes, i)
                TriggerEvent("vorp:TipBottom", "Status cleared", 3000)
                break
            end
        end
    end
    TriggerClientEvent("psn_status:sendscenes", -1, scenes)
end)
