
util.AddNetworkString( "sendToPlayer" )
util.AddNetworkString( "PlayerFullyLoaded" )
util.AddNetworkString( "callHelp" )

net.Receive( "PlayerFullyLoaded", function( _, ply )
	if not ply.IsFullyLoaded then
		ply.IsFullyLoaded = true
		hook.Call( "PlayerFullyLoaded", GAMEMODE, ply )
	end
end )


hook.Add( "PlayerFullyLoaded", "fbfs bfls", function( ply )
	net.Start( "sendToPlayer" )
	net.Send( ply )
	--freezePlayr(ply)
	--timer.Simple(10, freeze) --trying to lock player movement so that it locks camera.
end )

hook.Add( "PlayerSay", "CallIntro", function( ply, text, public )
	if ( string.lower( text ) == "!intro" ) then
		net.Start( "sendToPlayer" )
		net.Send( ply )
	end
end )

hook.Add( "PlayerSay", "calldatbihhHelp", function( ply, text, public )
	if ( string.lower( text ) == "!help" ) then
		net.Start( "callHelp" )
		net.Send( ply )
	end
end )