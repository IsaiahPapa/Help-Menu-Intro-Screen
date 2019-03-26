resource.AddFile( "image/stamp.png" ) 
resource.AddFile("image/holiday.png")
resource.AddFile("image/holiday1.png")
hook.Add( "InitPostEntity", "FullyLoaded", function()
    net.Start( "PlayerFullyLoaded" )
    net.SendToServer()
end )

net.Receive( "sendToPlayer", function()
    drawMessage()
end)


net.Receive("callHelp", function()
  drawRules()
end)

local w = ScrW() / 2
local h = ScrH() / 2

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
  local x, y = panel:LocalToScreen(0, 0)
  local scrW, scrH = ScrW(), ScrH()
  surface.SetDrawColor(255, 255, 255)
  surface.SetMaterial(blur)
  for i = 1, 3 do
    blur:SetFloat("$blur", (i / 3) * (amount or 6))
    blur:Recompute()
    render.UpdateScreenEffectTexture()
    surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
  end
end
surface.CreateFont( "ProgText", {
  font = "DermaDefaultBold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
  antialias = true,
  size = 30,
  weight = 40,
  shadow = false,
} )
surface.CreateFont( "ProgText1", {
  font = "DermaDefaultBold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
  antialias = true,
  size = 20,
  weight = 10,
  shadow = false,
} )

function drawMessage()

    local menuI = vgui.Create( "DFrame")
    menuI.Paint = function( self, w, h )
        DrawBlur(self, 7)
    end
    menuI:SetTitle("")
    menuI:SetText("")
    menuI:ShowCloseButton(false)
    menuI:SetPos(0,0)
    menuI:SetSize(ScrW(),ScrH())
    menuI:MoveTo(0,0,0.1,10)
    menuI:SetAlpha(0)
    menuI:AlphaTo(255,1,1)
    menuI:AlphaTo(0,1,6)

    local Stamp = vgui.Create( "DImage")
    
    Stamp:SetMaterial(Material("image/stamp.png"))
    Stamp:SetImageColor( Color( 255, 255, 255, 255 ) )
    Stamp:SetSize(515/1.5, 98/1.5)
    Stamp:SetPos( ScrW() / 2 - 172, ScrH() / 2 - 32.66)
    Stamp:SetAlpha(0)
    Stamp:AlphaTo(255,1,2)
    Stamp:AlphaTo(0,1,6)

    local splash1 = vgui.Create( "DImage")

    splash1:SetMaterial(Material("image/holiday.png"))
    splash1:SetImageColor( Color( 255, 255, 255, 255 ) )
    splash1:SetSize(640/3, 112/3)
    splash1:SetPos(0, 1)
    splash1:SetAlpha(0)
    splash1:AlphaTo(255,1,2)
    splash1:AlphaTo(0,1,5)

    local splash2 = vgui.Create( "DImage")

    splash2:SetMaterial(Material("image/holiday1.png"))
    splash2:SetImageColor( Color( 255, 255, 255, 255 ) )
    splash2:SetSize(490/3, 480/3)
    splash2:SetPos( ScrW()-160, 0)
    splash2:SetAlpha(0)
    splash2:AlphaTo(255,1,2)
    splash2:AlphaTo(0,1,5)

    timer.Simple(10,function()

    splash1:Remove()
    splash2:Remove()
    Stamp:Remove()
    menuI:Remove()

    end)
end

function drawRules()
    local Main = vgui.Create( "DPanel" )
    Main.Paint = function( self, w, h )
      DrawBlur(self, 4)
      draw.RoundedBox( 0, 0, 0, ScrW()-400, ScrH()-180, Color( 0, 0, 0, 195) )
    end
    Main:SetSize( ScrW()-400, ScrH()-180)
    Main:Center()
    Main:IsDraggable(true)

    local Text = vgui.Create( "DPanel", Main)
    Text:SetSize( ScrW()-400, ScrH()-330 )
    Text:SetPos(0,150)
    Text.Paint = function( self, w, h )

      draw.SimpleText( "", "ProgText", ScrW()/2-180 , 100, {r=255,g=255,b=255,a=255}, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    local richtext = vgui.Create( "RichText", Text )
    richtext:Dock( FILL )
    richtext:InsertColorChange( 38, 164, 226, 255 )
    richtext:AppendText( " General Rules\n\n" )
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  Don't be stupid\n\n    •  Every job can Raid and Mug\n\n    •  You")
    richtext:InsertColorChange( 255, 55, 55, 255 )
    richtext:AppendText(" DON'T ")
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("need to advert anything... at all.\n\n    •  Racist Comments result in a PERMA BAN, especially Hard R's\n\n\n\n")

    richtext:InsertColorChange( 244, 140, 66, 255 )
    richtext:AppendText( " Metagaming\n\n" )    
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  RP is Role-Playing, gaining information with communicaiton outside the game is metagaming. Ex. (Steam, Skype, Teamspeak, Discord, Snapchat(lul), Myspace, Facebook).\n\n    •  We don't care if you use Voice Chats but don't give info and stuff during raids.\n\n\n\n")
    
    richtext:InsertColorChange( 244, 140, 66, 255 )
    richtext:AppendText( " New Life Rule (RDM)\n\n" )    
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  When you die, you start a 'New Life'. You can remember only your friends NOT your enemies.\n\n\n\n")
    

    richtext:InsertColorChange( 244, 140, 66, 255 )
    richtext:AppendText( " Random Death Match (RDM)\n\n" )    
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  RDM is when you die bc someone is salty/stupid/sad.\n\n    •  Revenge RDM is when someone kills you and then kill them after respawning.\n\n    •  4+ warnings before killing someone is sufficent enough to give'em a blast.\n\n    \n\n")
    
    richtext:InsertColorChange( 244, 65, 65, 255 )
    richtext:AppendText( " Raiding\n\n" )
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  You cannot raid back to back, there must be a 15 min gap.\n\n    •  The time gap between raiding the SAME player/group/org is 25 minutes.\n\n\n\n")
    
    richtext:InsertColorChange( 244, 65, 65, 255 )
    richtext:AppendText( " Mugging\n\n" )
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  Max is $7,500.\n\n    •  Must give at least 8 seconds to comply.\n\n    •  You CAN run.\n\n    •  Only Fail-RP if player brings out a non-handgun firearm (no AR, Shotguns, Snipers).\n\n\n\n")
    
    richtext:InsertColorChange( 81, 214, 81, 255 )
    richtext:AppendText( " Dealers/Vendors\n\n" )
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("    •  You may not self-supply (this applies to switching job for someone else just to get said players weapons)\n\n    •  You may not Scam\n\n\n\n")
    
    richtext:InsertColorChange( 81, 214, 81, 255 )
    richtext:AppendText( " Cops/PD\n\n" )
    richtext:InsertColorChange( 255, 255, 255, 255 )
    richtext:AppendText("  •  You may not self-supply (this applies to switching job for someone else just to get said players weapons)\n\n  •  Police must have a valid reason to want, warrant or arrest an individual\n\n  •  Police must arrest instead of kill after giving a valid 10 second warning\n\n  •  Police may arrest people past the PD lobby or KOS them if they are armed with hostile intent\n\n  •  Police may resort to KOS if a seemingly harmless wanted criminal takes out weaponry after being wanted\n\n  •  Police may not place illegal items inside a base to arrest or warrant them\n\n  •  Police may only raid with a warrant\n\n  •  Police cannot raid with criminals\n\n  •  You may not Scam\n\n\n\n")
    

    function richtext:PerformLayout()
      self:SetFontInternal( "ProgText1" )
    end



    local Stamp = vgui.Create( "DImage", Main)
    Stamp:SetMaterial(Material("image/stamp.png"))
    Stamp:SetImageColor( Color( 255, 255, 255, 255 ) )
    Stamp:SetSize(515/1.5, 98/1.5)
    Stamp:SetPos( (ScrW()/2) - 360, 15)

    local noButton = vgui.Create("DButton", Main)
    noButton:SetText("Close")
    noButton:SetPos(200, ScrH()-160)
    noButton:SetSize(ScrW()-400, 70)
    noButton:SetTextColor(Color(255, 255, 255))
    noButton:MakePopup()

    function noButton:Paint(w, h)
      if noButton.Depressed or noButton.m_bSelected then
        draw.RoundedBox(1, 0, 0, w, h, Color(50, 200, 50, 255))
        noButton:SetTextColor(Color(45, 45, 45))
      elseif noButton.Hovered then
        draw.RoundedBox(1, 0, 0, w, h, Color(50, 200, 50, 255))
        noButton:SetTextColor(Color(45, 45, 45))
      else
        noButton:SetTextColor(Color(255, 245, 245))
        draw.RoundedBox(1, 0, 0, w, h, Color(33, 33, 33, 255))
      end
    end

    noButton.DoClick = function()
      surface.PlaySound("buttons/button14.wav")
      Main:Remove()
      noButton:Remove()
      Stamp:Remove()
    end

end
