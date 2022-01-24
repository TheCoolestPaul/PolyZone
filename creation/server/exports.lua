local polyZones = {
    --[polyName] = polyZone
}


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
    end
end)