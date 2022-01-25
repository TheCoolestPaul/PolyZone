exports("boxZoneCreate", function(...)
    return BoxZone:Create(...)
end)
exports("circleZoneCreate", function(...)
    return CircleZone:Create(...)
end)

--[[
exports("createPolyZone", function(polyName, polyType, polyData, debugPolyIn)
    if ( polyZones[polyName] ) then
        print("Replacing an existing zone")
        polyZones[polyName]:destroy()
    end
    if ( string.lower( polyType ) == "circle" ) then
        if ( not polyData.center or not polyData.center.x or not polyData.center.y or not polyData.center.z or not polyData.radius ) then
            return print(("You didn't pass createPolyZone the correct polyData! Data: [%s]"):format(json.encode(polyData)))
        end
        polyZones[polyName] = CircleZone:Create(vector3(polyData.center.x, polyData.center.y, polyData.center.z), polyData.radius, {
            name = polyName,
            debugPoly = debugPolyIn,
        })
    elseif ( string.lower( polyType ) == "box" ) then
        if (not polyData.scale or not polyData.scale.x or not polyData.scale.y or not polyData.scale.z or not polyData.center or not polyData.center.x or not polyData.center.y or not polyData.center.z or not polyData.width or not polyData.length ) then
            return print(("You didn't pass createPolyZone the correct polyData! Data: [%s]"):format(json.encode(polyData)))
        end
        polyZones[polyName] = BoxZone:Create(vector3(polyData.center.x, polyData.center.y, polyData.center.z), polyData.length, polyData.width, {
            name = polyName,
            scale = {polyData.scale.x, polyData.scale.y, polyData.scale.z},
            debugPoly = debugPolyIn,
        })
    else
        return print( ("Invalid polyType [%s]"):format(polyType) )
    end
    return polyZones[polyName]
end)
]]