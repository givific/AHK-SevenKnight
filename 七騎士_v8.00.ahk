;選擇冒險方式(chooseAdventure) 一般冒險:Adventure|時光屋:TimeHouse|特殊副本:SpecialInstance|屠龍戰:DragonWar|競技場:Arena|攻城戰:Seige
;鑰匙購買方案(howBuyKey) A:等待一段時間|B:10名譽=1鑰匙|C:10紅寶=5鑰匙|D:45紅寶=45鑰匙|E:100紅寶=100鑰匙
chooseAdventure := "Adventure"		;起始的冒險
next_SpecialInstance := "Adventure"
chooseNextRun := "RunAgain"			;RunAgain|NextArea
btnSleep := 1500
sleepNoKey := 600 000
sortTypeBy := "Level"				;Level|Class

F2::


Return

F9::	;卡倫+5 哪吒+5競技場
account := "givific0528@gmail.com"
howBuyKey := "B"
monsterExchange := True
AdventureCounter := 3
AdventureCounterMAX := 5
next_Adventure := "TimeHouse"
next_TimeHouse := "Arena"
next_Arena := "DragonWar"
next_DragonWar := "Adventure"
killWhosDragon := "HalfLifeDragon"
killDragonCountSet := 3
findDragonCountSet := 3
goto, Main

F10::
account := "givific0528@gmail.com"
howBuyKey := "B"
monsterExchange := True
AdventureCounter := 5
AdventureCounterMAX := 30
next_Adventure := "TimeHouse"
next_TimeHouse := "Arena"
next_Arena := "Adventure"
next_DragonWar := "Adventure"
killWhosDragon := "SkipDragon"	
killDragonCountSet := 1
findDragonCountSet := 1
goto, Main

F11::	;拼合成黑玫瑰或賽茵 +171
account := "givific01@gmail.com"
howBuyKey := "B"
monsterExchange := True
AdventureCounter := 3
AdventureCounterMAX := 5
next_Adventure := "TimeHouse"				;TimeHouse
next_TimeHouse := "Arena"					;Arena
next_Arena := "DragonWar"					;DragonWar
next_DragonWar := "Adventure"				;Adventure
killWhosDragon := "HalfLifeDragon"			;SkipDragon|KillMyselfDragon|KillBrotherDragon|HalfLifeDragon|KillFirstDragon
killDragonCountSet := 3
findDragonCountSet := 3
goto, Main

F12::
account := "givific01@gmail.com"
howBuyKey := "B"
monsterExchange := True
AdventureCounter := 5
AdventureCounterMAX := 30
next_Adventure := "TimeHouse"
next_TimeHouse := "Arena"
next_Arena := "Adventure"
next_DragonWar := "Adventure"
killWhosDragon := "SkipDragon"	
killDragonCountSet := 1
findDragonCountSet := 1
goto, Main

F8::
;====每日任務=====
chooseAdventure := "TimeHouse"
next_SpecialInstance := "Seige"
next_Seige := "TimeHouse"
next_TimeHouse := "Arena"
next_Arena := "TimeHouse"
next_DragonWar := "Adventure"
killWhosDragon := "SkipDragon"	
killDragonCountSet := 1
findDragonCountSet := 1
goto, Main


;==========================以下開始自動通關======================================
Main:
WinActivate, BlueStacks App Player


;==========發現野生龍=================
findDragon := bool_FindDragon()

;====================處理突發事件======================
void_NormalEvent()

;========亞拉岡成就達成 => 英雄的名譽======
findAchieveHeroGlory := bool_AchieveHeroGlory()
If(findAchieveHeroGlory = True)
{
	void_ReturnHome()	;回到首頁
	loop
	{
		;首頁的功績 紅色獎勵
		PixelSearch, OutputVarX, OutputVarY, 167 ,751,167 ,751,0x0027C7 ,0, Fast
		If ErrorLevel = 0
		{
			click,%OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			;右邊成就 紅色獎勵
			PixelSearch, OutputVarX, OutputVarY, 775 ,375,775 ,375,0x0027C7 ,0, Fast
			If ErrorLevel = 0
			{
				click,%OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				break
			}
		}
		;上方TAB 紅色獎勵
		PixelSearch, OutputVarX, OutputVarY, 438 ,137,1265 ,161,0x0027C7 ,0, Fast
		If ErrorLevel = 0
		{
			click,%OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			click,1230 ,802		;接收全部
			sleep 5000
			click, 695 ,664		;確認領取
			sleep %btnSleep%
			break
		}
	}
	void_ReturnHome()	;回到首頁
	
	findAchieveHeroGlory := False
	goto, Main

}


;===============選擇關卡1/2==============
;------確認進入"遊戲首頁"畫面 左下紫色頭盔-----
PixelSearch, OutputVarX, OutputVarY, 85 ,745,85 ,745,0x9D2A36 ,0, Fast
If ErrorLevel = 0
{
	;選擇冒險類型
	If(chooseAdventure = "Adventure" || chooseAdventure = "TimeHouse" || chooseAdventure = "DragonWar" || chooseAdventure = "SpecialInstance" || chooseAdventure = "DailyInstance" || chooseAdventure = "AdvenceInstance")
	{
		click,1318 ,793		;右下 btn進行冒險
		sleep %btnSleep%
	}
	If(chooseAdventure = "Arena" || chooseAdventure = "Seige")
	{
		click,1058 ,798		;右下 btn進行戰鬥
		sleep %btnSleep%
	}
}


;===============選擇關卡2/2==============
;------確認進入"冒險關卡"畫面 下小鍵盤正上方-----
PixelSearch, OutputVarX, OutputVarY, 1156 ,865,1156 ,865,0x3B576D ,0, Fast
If ErrorLevel = 0
{
;選擇冒險關卡
	If(chooseAdventure = "Adventure" || chooseAdventure = "Arena")
	{
		click, 340 ,327		;左上 大按鈕
		sleep %btnSleep%
	}
	If(chooseAdventure = "TimeHouse" || chooseAdventure = "Seige")
	{
		click, 1119 ,327	;右上 大按鈕
		sleep %btnSleep%
	}
	If(chooseAdventure = "SpecialInstance" || chooseAdventure = "DailyInstance" || chooseAdventure = "AdvenceInstance")
	{
		click, 340 ,696		;左下 大按鈕
		sleep %btnSleep%
	}
	If(chooseAdventure = "DragonWar")
	{
		click, 1119 ,696	;右下 大按鈕
		sleep %btnSleep%
	}
}

chooseAdventureTemp := chooseAdventure		;暫存冒險變數，將來使用於最後的"無條件跑完"

;===============直接進入強化副本=======
/*
If(chooseAdventure = "AdvenceInstance")
{
	click, 681 ,561		;下方 強化副本
	sleep %btnSleep%
}
*/

;==========*************************一般冒險***************************========
chooseAdventure := "Adventure"
If(chooseAdventure = "Adventure")
{
	;-----確認進入"一般冒險 1/2 選擇關卡數字"畫面 最新的冒險-----
	PixelSearch, OutputVarX, OutputVarY, 1227 ,860,1227 ,860,0x011427 ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%
	}
	
	;==========再一次起始-一般冒險==============
	;-----確認進入"一般冒險 2/2 KEY-1"畫面 "自"動冒險-------
	PixelSearch, OutputVarX, OutputVarY, 768 ,693,768 ,693,0x90BFCB ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)

		;--------進行交換怪物---------
		if(monsterExchange = True)
		{
			bool_MonsterExchange(sortTypeBy,chooseNextRun,btnSleep)
		}
		
		;======如果一般冒險打?場，則跳回首頁，轉去下一戰=========
		AdventureCounterMod := Mod(AdventureCounter,AdventureCounterMAX) 
		
		If(AdventureCounterMod = 0)
		{
			AdventureCounter := AdventureCounter +1
			
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_Adventure
			void_ReturnHome()
			goto, Main
		}
		
		;============準備點擊"開始戰鬥"==============
		loop
		{
			;-----確認進入"一般冒險 2/2 KEY-1"畫面 btn自動冒險-------
			PixelSearch, OutputVarX, OutputVarY, 768 ,693,768 ,693,0x90BFCB ,0, Fast
			If ErrorLevel = 0
			{
				click, 1103 ,823		;btn開始
				sleep %btnSleep%
			}
			
			;----------檢查是否跳出"鑰匙不足"，如果不足則進行"購買方案"-----------------
			haveKey := bool_CheckKey(howBuyKey,sleepNoKey,btnSleep)
			If(haveKey = True)
			{
				;-----確認"剛戰鬥開始" 發現右上對話框-一般冒險--------
				PixelSearch, OutputVarX, OutputVarY, 1300 ,154,1300 ,154,0x0F2451 ,0, Fast
				If ErrorLevel = 0
				{
					haveKey := False
					break
				}
			}
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		AdventureCounter := AdventureCounter +1
		goto, Main
	}
}


;===================*****************時光屋***********************=========================
chooseAdventure := "TimeHouse"
If(chooseAdventure = "TimeHouse")
{
	;-----確認進入"時光屋 1/2 無限之塔"畫面 黃金屋-----
	PixelSearch, OutputVarX, OutputVarY, 568 ,223,568 ,223,0x0F84A5 ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%
	}
	
	;==========再一次起始-一般冒險==============
	;-----確認進入"時光屋 2/2 KEY-1"畫面 btn紫色鑰匙-------
	PixelSearch, OutputVarX, OutputVarY, 1058 ,811,1058 ,811,0xE6C0C1 ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)
		
		;============準備點擊"開始戰鬥"==============
		click, %OutputVarX%, %OutputVarY%		;btn紫色鑰匙
		sleep 2000
		
		;-------如果銀色鑰匙不足，跳回首頁前往下一戰------
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,580 ,393,580 ,393,0x0B2EC1 ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_TimeHouse
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		goto, Main
	}
}


;=================*******************競技場**********************====================
chooseAdventure := "Arena"
If(chooseAdventure = "Arena")
{
	;==========再一次起始-競技場==============
	;------確認進入"競技場 世界排名1/2"畫面 "準"備-----
	PixelSearch, OutputVarX, OutputVarY, 1098 ,798,1098 ,798,0xC0EEFA ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep 2000		;此處有誤點擊
	}
	
	;-------因季賽結束，無法進場 通知------
	PixelSearch, OutputVarX, OutputVarY,692,261,692 ,261,0x0C75A7 ,5, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%
		
		;==========連續點擊回首頁，設定下一站地點============
		chooseAdventure := next_Arena
		void_ReturnHome()
		goto, Main
	}
	
	;============準備點擊"開始戰鬥"==============
	;-----確認進入"競技場 戰前準備2/2"畫面 btn紫色刀刃-------
	PixelSearch, OutputVarX, OutputVarY, 1144 ,811,1144 ,811,0xB78C9E ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep 2000
		
		;-------名譽已達最大值，選擇 入場|離開 ------
		;名譽已達最大值 "名"譽已達最大值 入場|離開
		PixelSearch, OutputVarX, OutputVarY,632 ,416,632 ,416,0x85BECF ,0, Fast
		If ErrorLevel = 0
		{
			click, 882 ,655	;入場
			;click, 532 ,649	;離開
			sleep %btnSleep%
		}
		
		;-------如果紫色刀刃不足，跳回首頁前往下一戰------
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,462 ,646,462 ,646,0x093EDB ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_Arena
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		sleep 3000		;避開結束戰鬥會自動瞬間跳回首頁
		
		goto, Main
	}
}


;================*********************屠龍戰*****************==================
chooseAdventure := "DragonWar"
If(chooseAdventure = "DragonWar")
{
	;-----屠龍戰畫面 已參與屠龍戰 -------- PS:發現屠龍戰進入端點
	;屠龍戰畫面 "未參與屠龍戰"(暗色)
	PixelSearch, OutputVarX, OutputVarY,306 ,158,306 ,158,0x060E1F ,0, Fast
	If ErrorLevel = 0
	{	
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%

		;====如果有發現屠龍戰，則"暫存狀態"，先設定"打自己的龍"
		If(findDragon = True)
		{
			findDragon := False
			killWhosDragonTemp := killWhosDragon
			killWhosDragon := "KillMyselfDragon"
		}

		;打自己的龍(通常作用於"發現屠龍"狀況)
		If(killWhosDragon = "KillMyselfDragon")
		{
			;-----屠龍戰畫面 未參與屠龍戰 --------
			;屠龍戰畫面 "未參與屠龍戰"(暗色)
			PixelSearch, OutputVarX, OutputVarY,357 ,133,357 ,133,0x07132C ,0, Fast
			If ErrorLevel = 0
			{	
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			
			if(account = "givific0528@gmail.com")
			{
				bmpDragon := "玉米兄.bmp"
			}
			if(account = "givific01@gmail.com")
			{
				bmpDragon := "玉米銘.bmp"
			}

			;-------比對圖案字樣"玉米X"----------
			;圖像比對 有找到 "玉米"銘 點擊右側 x=1331 的btn入場
			ImageSearch, FoundX, FoundY,400 ,209,784 ,748,*100 %A_ScriptDir%\%bmpDragon%
			If ErrorLevel = 0
			{
				click, 1331,%FoundY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
		}
		;打我兄弟的龍
		If(killWhosDragon = "KillBrotherDragon")
		{
			;-----屠龍戰畫面 未參與屠龍戰 --------
			;屠龍戰畫面 "未參與屠龍戰"(暗色)
			PixelSearch, OutputVarX, OutputVarY,357 ,133,357 ,133,0x07132C ,0, Fast
			If ErrorLevel = 0
			{	
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			
			;-------比對圖案字樣"玉米"----------
			;圖像比對 有找到 "玉米"銘 點擊右側 x=1331 的btn入場
			ImageSearch, FoundX, FoundY,400 ,209,784 ,748,*100 %A_ScriptDir%\玉米.bmp
			If ErrorLevel = 0
			{
				click, 1331,%FoundY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
		}
		;打所有人的龍
		If(killWhosDragon = "KillFirstDragon")
		{
			;-----屠龍戰畫面 未參與屠龍戰 --------
			;右側屠龍戰入場 btn入場 btn入場
			PixelSearch, OutputVarX, OutputVarY,1336 ,258,1336 ,258,0x56B2D3 ,0, Fast
			If ErrorLevel = 0
			{	
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
		}
		;打血一半的龍
		If(killWhosDragon = "HalfLifeDragon")
		{
			;-----屠龍戰畫面 未參與屠龍戰 --------
			;右側屠龍戰入場 btn入場 btn入場
			PixelSearch, FoundX, FoundY,1121 ,270,1121 ,757,0x457492 ,5, Fast
			If ErrorLevel = 0
			{	
				click, 1331,%FoundY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
		}
		;跳過打龍
		If(killWhosDragon = "SkipDragon")
		{
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_DragonWar
			void_ReturnHome()
			goto, Main
		}
		
		;===讀出"暫存狀態"，寫入killWhosDragon====
		If(findDragon = True)
		{
			killWhosDragon := killWhosDragonTemp
		}
	}

	DragonWarStart:
	;==========再一次起始-屠龍戰==============
	;-----確認進入"屠龍戰1/2 參加人數"畫面 btn準備-----
	PixelSearch, OutputVarX, OutputVarY,1097 ,792,1097 ,792,0xC0EFFA ,0, Fast
	If ErrorLevel = 0
	{
		click,%OutputVarX%, %OutputVarY%
		sleep %btnSleep%
	}
	;-------確認進入"屠龍戰2/2 KEY-1"畫面 btn金色鑰匙-------
	PixelSearch, OutputVarX, OutputVarY, 1257 ,811,1257 ,811,0x67BFE9 ,0, Fast
	If ErrorLevel = 0
	{
		;============準備點擊"開始戰鬥"==============
		loop
		{
			click,1122 ,758		;btn金色鑰匙
			sleep 3000		;防止一開始進入屠龍戰時點到技能
			
			;-------如果"已經結束的團體戰"，則跳回首頁前往下一站------
			;入次場次已使用完畢 "入"次場次 紅色XX
			PixelSearch, OutputVarX, OutputVarY,607 ,449,607 ,449,0x6094AE ,0, Fast
			If ErrorLevel = 0
			{
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
				
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
			
			;-------如果"討伐戰入次場次已使用完畢"，則跳回首頁前往下一站------
			;入次場次已使用完畢 "入"次場次 紅色XX
			PixelSearch, OutputVarX, OutputVarY,573 ,414,573 ,414,0x80B8C9 ,0, Fast
			If ErrorLevel = 0
			{
				click, 458 ,648
				sleep %btnSleep%
				
				;==========連續點擊回首頁，設定下一站地點============
				chooseAdventure := next_DragonWar
				void_ReturnHome()
				goto, Main
			}
			
			;----------檢查是否跳出"鑰匙不足"，如果不足則進行"購買方案"-----------------
			haveKey := bool_CheckKey(howBuyKey,sleepNoKey,btnSleep)
			If(haveKey = True)
			{
				;-----確認"剛戰鬥開始" 發現右上對話框-屠龍戰--------
				PixelSearch, OutputVarX, OutputVarY, 1291 ,75,1291 ,75,0x76BDD0 ,0, Fast
				If ErrorLevel = 0
				{
					haveKey := False
					break
				}
			}
		}
		
		;初始化打龍計數器
		If(dragonKillCounter = null)
		{
			dragonKillCounter := 0
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		sleep 5000		;避開結束戰鬥會自動瞬間跳回首頁
		
		;====如果有發現屠龍戰，則"暫存狀態"，先設定"打龍3次"
		If(findDragon = True)
		{
			findDragon := False
			killDragonCountSetTemp := killDragonCountSet
			killDragonCountSet := findDragonCountSet
		}
		
		;-------如果打龍達到數量，則跳回首頁前往下一站------
		dragonKillCounter := dragonKillCounter +1
		If(dragonKillCounter = killDragonCountSet)
		{
			;===讀出"暫存狀態"，寫入killWhosDragon====
			killDragonCountSet := killDragonCountSetTemp
		
			dragonKillCounter := 0
			
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_DragonWar
			void_ReturnHome()
			goto, Main
		}
		
		;------如果直接到領取獎勵畫面，則跳回首頁前往下一站---------
		;"領取獎勵"畫面 btn"領取獎勵"
		PixelSearch, OutputVarX, OutputVarY,1196 ,689,1196 ,689,0x0391D6 ,0, Fast
		If ErrorLevel = 0
		{
			/*
			click,%OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			click,691 ,648		;領獎確認
			sleep %btnSleep%
			*/
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_DragonWar
			void_ReturnHome()
			goto, Main
		}
		
		;------如果因"錯誤"已經結束的討伐戰被轉回首頁，則goto, Main---------
		;遊戲首頁 左下紫色頭盔
		PixelSearch, OutputVarX, OutputVarY, 85 ,745,85 ,745,0x9D2A36 ,0, Fast
		If ErrorLevel = 0
		{
			goto, Main
		}
		
		goto, DragonWarStart
	}
}


;=================*******************攻城戰********************************************====================
chooseAdventure := "Seige"
If(chooseAdventure = "Seige")
{
	;======選擇七個攻城區域 1/2=======
	;------選擇七個攻城區域 右下羊皮捲-----
	PixelSearch, OutputVarX, OutputVarY, 1011 ,846,1011 ,846,0x1D2D46 ,0, Fast
	If ErrorLevel = 0
	{
		If(seigeCount = null)
		{
			seigeCount := 1
		}
		
		;seigeCountMod := Mod(seigeCount,7) 
		
		If(seigeCount = 1)
		{
			Click,322 ,189
			sleep %btnSleep%
		}
		else If(seigeCount = 2)
		{
			Click,681 ,183
			sleep %btnSleep%
		}
		else If(seigeCount = 3)
		{
			Click,227 ,403
			sleep %btnSleep%
		}		
		else If(seigeCount = 4)
		{
			Click,539 ,425
			sleep %btnSleep%
		}
		else If(seigeCount = 5)
		{
			Click,764 ,390
			sleep %btnSleep%
		}		
		else If(seigeCount = 6)
		{
			Click,429 ,676
			sleep %btnSleep%
		}
		else If(seigeCount = 7)
		{
			Click,800 ,678
			sleep %btnSleep%
		}
	}
	;==========選擇七個攻城區域 2/2==============	
	;------確認進入"攻城戰 1/2 公會排名"畫面 "準"備(暗色)-----
	PixelSearch, OutputVarX, OutputVarY,1096 ,798,1096 ,798,0x718D95 ,0, Fast
	If ErrorLevel = 0
	{	
		click,56 ,69	;點擊回上一頁
		sleep %btnSleep%

		if(seigeCount = 7)
		{
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_Seige
			void_ReturnHome()
			goto, Main
		}
		
		seigeCount := seigeCount +1
	
		goto, Main
	}
	
	;==========再一次起始-攻城戰==============
	;------確認進入"攻城戰 1/2 公會排名"畫面 "攻"城戰-----
	PixelSearch, OutputVarX, OutputVarY, 117 ,50,117 ,50,0xE0F6FC ,0, Fast
	If ErrorLevel = 0
	{
		click, 1031 ,807		;btn準備
		sleep %btnSleep%
	}
	
	;============準備點擊"開始戰鬥"==============
	;-----確認進入"攻城戰 2/2 KEY-1"畫面 btn城門-------
	PixelSearch, OutputVarX, OutputVarY, 1058 ,817,1058 ,817,0x546980 ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)
		
		;-------開啟好友加入-----
		PixelSearch, OutputVarX, OutputVarY,1185 ,262,1185 ,262,0x0293E1 ,0, Fast
		If ErrorLevel = 0
		{
			click, 1185 ,262	;開啟好友加入
			sleep %btnSleep%
		}
		
		click, 1058 ,817	;戰鬥開始
		sleep 2000
		
		;-------如果城門不足，跳回首頁前往下一戰------
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,463 ,651,463 ,651,0x0A3BCB ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			click,1185 ,262		;關閉好友加入
			sleep %btnSleep%
			
			;==========連續點擊回首頁，設定下一站地點============
			chooseAdventure := next_Seige
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		goto, Main
	}
}


;===================*****************特殊副本**********************************************=========================
chooseAdventure := "SpecialInstance"
If(chooseAdventure = "SpecialInstance")
{
	;-----確認進入"特殊副本"畫面-----
	PixelSearch, OutputVarX, OutputVarY, 130, 63, 130, 63, 0xD0EBF8, 0, Fast
	If ErrorLevel = 0
	{
		;-------檢查難度 困難-------
		PixelSearch, OutputVarX, OutputVarY,1236 ,143,1236 ,143,0x6CD0FD ,0, Fast
		If ErrorLevel = 1
		{
			click, 1278 ,158	;設定難度
			sleep %btnSleep%
			click, 1278 ,219	;困難
			sleep %btnSleep%
		}
		
		click, 404,711		;選擇"草仔貴副本"
		sleep %btnSleep%
		
		;----第一個特殊副本 可參加次數"0"次----
		PixelSearch, OutputVarX, OutputVarY, 1389 ,230,1389 ,230,0x1B6BE9 ,0, Fast
		If ErrorLevel = 0
		{
			/*
			click, 416 ,378		;選擇"第二個強化副本"
			sleep %btnSleep%
			*/
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_SpecialInstance
			void_ReturnHome()
			goto, Main
		}
		If ErrorLevel = 1
		{
			click, 1175 824		;點擊鑰匙進入該副本
			sleep %btnSleep%
		}
		/*
		;----第二個強化副本副本 可參加次數"0"次----
		PixelSearch, OutputVarX, OutputVarY, 1389 ,230,1389 ,230,0x1B6BE9 ,0, Fast
		If ErrorLevel = 0
		{
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_SpecialInstance
			void_ReturnHome()
			goto, Main
		}
		If ErrorLevel = 1
		{
			click, 1175 824		;點擊進入該副本
			sleep %btnSleep%
		}
		*/
	}

	;-----準備點擊"開始戰鬥" btn金色鑰匙-----
	PixelSearch, OutputVarX, OutputVarY, 1078 ,811,1078 ,811,0x5E95CB ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)
		
		;=======如果鑰匙不足，跳回首頁前往下一戰======
		
		;點擊"開始戰鬥"
		click, %OutputVarX%, %OutputVarY%	;btn鑰匙
		sleep 2000
		
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,476 ,650,476 ,650,0x0A3CCF ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_SpecialInstance
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		goto, Main
	}
}


;===================*****************強化副本**********************************************=========================
/*
chooseAdventure := "AdvenceInstance"
If(chooseAdventure = "AdvenceInstance")
{
	;-----確認進入"強化副本"畫面-----
	PixelSearch, OutputVarX, OutputVarY, 109 ,55,109 ,55,0xDDF4FB ,0, Fast
	If ErrorLevel = 0
	{
		;-------檢查難度 困難-------
		PixelSearch, OutputVarX, OutputVarY,1236 ,143,1236 ,143,0x6CD0FD ,0, Fast
		If ErrorLevel = 1
		{
			click, 1278 ,158	;設定難度
			sleep %btnSleep%
			click, 1278 ,219	;困難
			sleep %btnSleep%
		}
		
		click, 381 ,207		;選擇"第一個強化副本"
		sleep %btnSleep%
		
		;----第一個強化副本副本 免費次數"0"次----
		PixelSearch, OutputVarX, OutputVarY, 1389 ,230,1389 ,230,0x1B6BE9 ,0, Fast
		If ErrorLevel = 0
		{
			
			click, 416 ,378		;選擇"第二個強化副本"
			sleep %btnSleep%
			
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_AdvenceInstance
			void_ReturnHome()
			goto, Main
		}
		If ErrorLevel = 1
		{
			click, 1175 824		;點擊進入該副本
			sleep %btnSleep%
		}
		
		;----第二個強化副本副本 免費次數"0"次----
		PixelSearch, OutputVarX, OutputVarY, 1389 ,230,1389 ,230,0x1B6BE9 ,0, Fast
		If ErrorLevel = 0
		{
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_AdvenceInstance
			void_ReturnHome()
			goto, Main
		}
		If ErrorLevel = 1
		{
			click, 1175 824		;點擊進入該副本
			sleep %btnSleep%
		}
		
	}

	;-----準備點擊"開始戰鬥" btn金色鑰匙-----
	PixelSearch, OutputVarX, OutputVarY, 1078 ,811,1078 ,811,0x5E95CB ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)
		
		;=======如果鑰匙不足，跳回首頁前往下一戰======
		
		;點擊"開始戰鬥"
		click, %OutputVarX%, %OutputVarY%	;btn鑰匙
		sleep 2000
		
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,476 ,650,476 ,650,0x0A3CCF ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_AdvenceInstance
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		goto, Main
	}
}
*/

;===================*****************每日副本**********************************************=========================
/*
chooseAdventure := "DailyInstance"
If(chooseAdventure = "DailyInstance")
{
	;-----選擇 每日副本|強化副本 免費次數"1"次-----
	PixelSearch, OutputVarX, OutputVarY, 1003 ,456,1003 ,456,0x0A32C2 ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%
	}
	
	;-----選擇 每日副本|強化副本 免費次數"0"次-----
	PixelSearch, OutputVarX, OutputVarY, 995 ,455,995 ,455,0x0A32C6 ,0, Fast
	If ErrorLevel = 0
	{
		;==========連續點擊回首頁，設定下一站地點============
		chooseAdventure := next_DailyInstance
		void_ReturnHome()
		goto, Main
	}

	;-----每日副本 普通|困難 "準"備-----
	PixelSearch, OutputVarX, OutputVarY, 1016 ,790,1016 ,790,0xC3F1FB ,0, Fast
	If ErrorLevel = 0
	{
		click, 354 ,493		;普通
		;click, 354 ,640	;困難
		sleep %btnSleep%
	
		click, %OutputVarX%, %OutputVarY%
		sleep %btnSleep%
	}
	
	;-----準備點擊"開始戰鬥" btn金色鑰匙-----
	PixelSearch, OutputVarX, OutputVarY, 1062 ,810,1062 ,810,0x5FB7E6 ,0, Fast
	If ErrorLevel = 0
	{
		;-------進行切換隊伍--------
		void_SwitchTeam(chooseAdventure)
		
		;=======如果鑰匙不足，跳回首頁前往下一戰======
		;點擊"開始戰鬥"
		click, %OutputVarX%, %OutputVarY%	;btn鑰匙
		sleep 2000
		
		;彈出鑰匙不足 紅色XX 紅色XX
		PixelSearch, OutputVarX, OutputVarY,476 ,650,476 ,650,0x0A3CCF ,0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			
			;--------連續點擊回首頁，設定下一站地點------------
			chooseAdventure := next_DailyInstance
			void_ReturnHome()
			goto, Main
		}
		
		;============執行戰鬥中================
		void_Fighting(chooseAdventure,account)
		;============結束戰鬥了================
		void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)
		
		goto, Main
	}
}
*/

chooseAdventure := chooseAdventureTemp		;若無條件跑完，則進入預設"一般冒險"
goto, Main	;LOOP END
Return





;=========確認進入"XXXXXX"畫面 偵測RGB的座標===========
/*
void_CheckPage(x,y,RGB)
{
	loop
	{	
		PixelSearch, OutputVarX, OutputVarY, x ,y,x ,y,RGB ,0, Fast
		If ErrorLevel = 0
		{
			break
		}
	}
}
*/

;==========連續點擊回首頁===========
void_ReturnHome()
{
	loop
	{
		click,56 ,69	;點擊回上一頁
		sleep 1000
		
		;遊戲首頁 左下紫色頭盔
		PixelSearch, OutputVarX, OutputVarY, 85 ,745,85 ,745,0x9D2A36 ,0, Fast
		If ErrorLevel = 0
		{
			Return
		}
		
		void_NormalEvent()		;防止有穿插事件
		bool_AchieveHeroGlory()
	}
}
;======切換隊伍:依照關卡型態(chooseAdventure := Adventure|DragonWar)決定切換第幾隊=======
void_SwitchTeam(chooseAdventure)
{
	loop
	{
		;解除好友加入
		PixelSearch, OutputVarX, OutputVarY, 1224, 261, 1224, 261, 0x0C32D0, 0, Fast
		If ErrorLevel = 0
		{
			Click, %OutputVarX%, %OutputVarY%
			sleep 2000
		}
		;確定好友不參與進行
		PixelSearch, OutputVarX, OutputVarY, 1232, 257, 1232, 257, 0x00A3F7, 0, Fast
		If ErrorLevel = 0
		{
			break
		}
	}
	If(chooseAdventure = "Adventure")
	{
		loop
		{
			;-----切換到第一隊(刷肥隊)------
			;準備開始戰鬥 btn第一隊 btn第一隊
			PixelSearch, OutputVarX, OutputVarY, 222 ,162,222,162,0x0465A9 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
			If ErrorLevel = 1
			{
				click,222 ,162	;切換至第一隊(刷肥隊)
				sleep 2000
			}
		}
	}
	If(chooseAdventure = "TimeHouse" || chooseAdventure = "Seige")
	{
		loop
		{
			;-----切換到第二隊(打塔隊)------
			;準備開始戰鬥 btn第二隊 btn第二隊
			PixelSearch, OutputVarX, OutputVarY, 377 ,157,377 ,157,0x046CB1 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
			If ErrorLevel = 1
			{
				click,377 ,157	;切換到第二隊(打塔隊)
				sleep 2000
			}
		}
		
	}
	If(chooseAdventure = "DailyInstance" || chooseAdventure = "AdvenceInstance")
	{
		loop
		{
			;-----切換到第三隊(打塔隊)------
			;準備開始戰鬥 btn第三隊 btn第三隊
			PixelSearch, OutputVarX, OutputVarY, 492 ,155,492 ,155,0x046FB5 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
			If ErrorLevel = 1
			{
				click,532 ,157	;切換到第三隊(無敵隊)
				sleep 2000
			}
		}
		
	}
	If(chooseAdventure = "SpecialInstance")
	{
		loop
		{
			;-----切換到第二隊(打塔隊)------
			;準備開始戰鬥 btn第二隊 btn第二隊
			PixelSearch, OutputVarX, OutputVarY, 377 ,157,377 ,157,0x046CB1 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
			If ErrorLevel = 1
			{
				click,377 ,157	;切換到第二隊(打塔隊)
				sleep 2000
			}
		}
		
	}
}
;==========交換怪物:依照怪物等級(PixelSearch)與接關型態(chooseNextRun := NextArea|!NextArea)，決定是否交換怪物===============
bool_MonsterExchange(sortTypeBy,chooseNextRun,btnSleep)
{
	;------FLAG重置為怪物不需要交換-------
	needMonsterExchange := False
	
	;-------如果不是通關模式(chooseNextRun != "NextArea") 則交換怪物------
	If(chooseNextRun != "NextArea")
	{
		;------判斷是否需要交換怪物 => Lv30指定位置---------
		Loop
		{	
			;準備開始戰鬥頁面 判斷1號位置是否有Lv30
			PixelSearch, OutputVarX, OutputVarY, 416 ,318,416 ,318,0x0B9AEA ,0, Fast
			If ErrorLevel = 0
			{
				needMonsterExchange := True
			}
			;準備開始戰鬥頁面 判斷2號位置是否有Lv30
			PixelSearch, OutputVarX, OutputVarY, 417 ,468,417 ,468,0x0A92E9 ,0, Fast
			If ErrorLevel = 0
			{
				needMonsterExchange := True
			}
			;準備開始戰鬥頁面 判斷3號位置是否有Lv30
			PixelSearch, OutputVarX, OutputVarY,416 ,616,416 ,616,0x0A9AED ,0, Fast
			If ErrorLevel = 0
			{
				needMonsterExchange := True
			}
			
			;======如果 needMonsterExchange = True 則進行交換怪物=========
			If (needMonsterExchange = True)
			{
				;------確認進入"戰前準備"頁面 btn英雄管理------
				loop
				{
					PixelSearch, OutputVarX, OutputVarY, 535, 779, 535, 779, 0x5EBAE5, 0, Fast
					If ErrorLevel = 0
					{
						Click, %OutputVarX%, %OutputVarY%
						sleep %btnSleep%
						break
					}
				}
				
				;------確認進入"英雄管理"頁面 左上英雄管理------
				loop
				{
					PixelSearch, OutputVarX, OutputVarY,232 ,82,232 ,82,0xAED5F1 ,0, Fast
					If ErrorLevel = 0
					{
						break
					}
				}
				
				;------------------怪物排序-------------------
				;初始化怪物排序FALG
				sortTypeSet := False
				sortAscendingSet := False
				
	;click,1023 ,161		;升級元素英雄
				
				loop
				{
					;依"等級"排序怪物
					If(sortTypeBy = "Level")
					{
						;調整排序為"等級"
						PixelSearch, OutputVarX, OutputVarY,1213 ,170,1213 ,170,0x748EC6 ,0, Fast
						If ErrorLevel = 0
						{
							sortTypeSet := True
						}
							If ErrorLevel = 1
						{
							click, 1255 ,167
							sleep %btnSleep%
							click, 1234,533			;btn等級
							sleep %btnSleep%
							click, 1362 ,163
							sleep %btnSleep%
						}
					}
					;依"階級"排序怪物
					If(sortTypeBy = "Class")
					{
						;調整排序為"階級"
						PixelSearch, OutputVarX, OutputVarY,1208 ,169,1208 ,169,0x7790C8 ,0, Fast
						If ErrorLevel = 0
						{
							sortTypeSet := True
						}
						If ErrorLevel = 1
						{
							click, 1255 ,167
							sleep %btnSleep%
							click, 1245,486			;btn階級
							sleep %btnSleep%
							click, 1362 ,163
							sleep %btnSleep%
						}
					}
					
					;調整排序為"升冪"排序
					PixelSearch, OutputVarX, OutputVarY,1357 ,171,1357 ,171,0x7E96CE ,0, Fast
					If ErrorLevel = 0
					{
						sortAscendingSet := True
					}
					If ErrorLevel = 1
					{
						click, 1357 ,171
						sleep %btnSleep%
					}
					
					If(sortTypeSet = True && sortAscendingSet = True)
					{
						break
					}
				}
				
				;-------怪物交換:如果隊伍右排上面兩格怪物都是Lv3X開頭，則選擇包包第一隻Lv1怪物交換位置------
				loop
				{
					;檢查左欄隊伍 右排第一號位置 怪物是否Lv30
					PixelSearch, OutputVarX_Lv30, OutputVarY_Lv30 ,331 ,311,331 ,311,0x0E9BDC ,0, Fast
					If ErrorLevel = 0
					{
						PickUpMonsterStart:
						monster_Arrays := [,[595 ,632],[1297 ,309],[826 ,640],[1065 ,316],[1058 ,635],[830 ,315],[1302 ,635],[588 ,320]]
						monsterShiftNum := 1
						
						PickUpMonster:
						monsterShiftNum := Mod(monsterShiftNum,9)
						
						monster_X := monster_Arrays[monsterShiftNum +1,1]
						monster_Y := monster_Arrays[monsterShiftNum +1,2]
						click,%monster_X% ,%monster_Y%		;點擊右欄包包 指定的Lv1怪物
						
						;=====1-0/2判定狀況:此怪物是否已在隊伍中 隊伍配置|離開隊伍====
						loop
						{
							;------1-1/2判定為"隊伍配置"，進行位置交換-----
							;隊伍配置畫面 btn隊伍配置 btn隊伍配置
							PixelSearch, OutputVarX, OutputVarY, 1324 ,746,1324 ,746,0x53C4E5 ,0, Fast
							If ErrorLevel = 0
							{
								click,%OutputVarX%, %OutputVarY%
								sleep %btnSleep%
								
								;-----選擇Lv30怪物位置畫面------
								loop
								{
									;英雄管理頁面 左上英雄管理
									PixelSearch, OutputVarX, OutputVarY,131 ,64,131 ,64,0xCAE7F7 ,0, Fast
									If ErrorLevel = 0
									{
										;點擊左欄Lv30怪物的位置
										click,%OutputVarX_Lv30%, %OutputVarY_Lv30%
										sleep %btnSleep%
										
										;========判定狀況是否重複角色，有則直接選下一位角色=====
										;出現英雄隊伍中有重複角色 英雄隊"伍" 英雄隊"伍"
										PixelSearch, OutputVarX, OutputVarY,707 ,243,707 ,243,0x12B0F5 ,0, Fast
										If ErrorLevel = 0
										{
											click,%OutputVarX%, %OutputVarY%
											sleep %btnSleep%
											
											monsterShiftNumMod := Mod(monsterShiftNum,8)

											If(monsterShiftNumMod = 0)
											{
												;拖曳向上
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												goto, PickUpMonsterStart
											}
											
											monsterShiftNum := monsterShiftNum + 1
											goto, PickUpMonster
										}
										
										;==========怪物交換成功，回到一般冒險戰前準備畫面========
										click,56 ,69	;點擊回上一頁
										sleep %btnSleep%
										return True													;有做交換怪物，回傳 True
									}
								}
							}
							
							;-----1-2/2判定為"離開隊伍"，直接選下一位角色-----
							PixelSearch, OutputVarX, OutputVarY, 1324 ,750,1324 ,750,0x142747 ,0, Fast
							If ErrorLevel = 0
							{
								click,1382 ,78	;點擊XX
								sleep %btnSleep%
								monsterShiftNum := monsterShiftNum + 1
								goto, PickUpMonster
							}
						}
					}
					;檢查左欄隊伍 右排第二號位置 怪物是否Lv30
					PixelSearch, OutputVarX_Lv30, OutputVarY_Lv30 ,331 ,462,331,462,0x089EF8 ,0, Fast
					If ErrorLevel = 0
					{
						PickUpMonsterStart_2:
						monster_Arrays := [,[595 ,632],[1297 ,309],[826 ,640],[1065 ,316],[1058 ,635],[830 ,315],[1302 ,635],[588 ,320]]
						monsterShiftNum := 1
						
						PickUpMonster_2:
						monsterShiftNum := Mod(monsterShiftNum,9)
						
						monster_X := monster_Arrays[monsterShiftNum +1,1]
						monster_Y := monster_Arrays[monsterShiftNum +1,2]
						click,%monster_X% ,%monster_Y%		;點擊右欄包包 指定的Lv1怪物
						
						;=====1-0/2判定狀況:此怪物是否已在隊伍中 隊伍配置|離開隊伍====
						loop
						{
							;------1-1/2判定為"隊伍配置"，進行位置交換-----
							;隊伍配置畫面 btn隊伍配置 btn隊伍配置
							PixelSearch, OutputVarX, OutputVarY, 1324 ,746,1324 ,746,0x53C4E5 ,0, Fast
							If ErrorLevel = 0
							{
								click,%OutputVarX%, %OutputVarY%
								
								;-----選擇Lv30怪物位置畫面------
								loop
								{
									;英雄管理頁面 左上英雄管理
									PixelSearch, OutputVarX, OutputVarY,131 ,64,131 ,64,0xCAE7F7 ,0, Fast
									If ErrorLevel = 0
									{
										;點擊左欄Lv30怪物的位置
										click,%OutputVarX_Lv30%, %OutputVarY_Lv30%
										sleep %btnSleep%
										
										;========判定狀況是否重複角色，有則直接選下一位角色=====
										;出現英雄隊伍中有重複角色 英雄隊"伍" 英雄隊"伍"
										PixelSearch, OutputVarX, OutputVarY,707 ,243,707 ,243,0x12B0F5 ,0, Fast
										If ErrorLevel = 0
										{
											click,%OutputVarX%, %OutputVarY%
											sleep %btnSleep%
											
											monsterShiftNumMod := Mod(monsterShiftNum,8)
											
											If(monsterShiftNumMod = 0)
											{
												;拖曳向上
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												goto, PickUpMonsterStart_2
											}
											
											monsterShiftNum := monsterShiftNum + 1
											goto, PickUpMonster_2
										}
										
										;==========怪物交換成功，回到一般冒險戰前準備========
										click,56 ,69	;點擊回上一頁
										sleep %btnSleep%
										return True													;有做交換怪物，回傳 True
									}
								}
							}
							
							;-----1-2/2判定為"離開隊伍"，直接選下一位角色-----
							PixelSearch, OutputVarX, OutputVarY, 1324 ,750,1324 ,750,0x142747 ,0, Fast
							If ErrorLevel = 0
							{
								click,1382 ,78	;點擊XX
								sleep %btnSleep%
								monsterShiftNum := monsterShiftNum + 1
								goto, PickUpMonster_2
							}
						}
					}
					;檢查左欄隊伍 右排第三號位置 怪物是否Lv30
					PixelSearch, OutputVarX_Lv30, OutputVarY_Lv30 ,332 ,610,332 ,610,0x0793FD ,0, Fast
					If ErrorLevel = 0
					{
						PickUpMonsterStart_3:
						monster_Arrays := [,[595 ,632],[1297 ,309],[826 ,640],[1065 ,316],[1058 ,635],[830 ,315],[1302 ,635],[588 ,320]]
						monsterShiftNum := 1
						
						PickUpMonster_3:
						monsterShiftNum := Mod(monsterShiftNum,9)
						
						monster_X := monster_Arrays[monsterShiftNum +1,1]
						monster_Y := monster_Arrays[monsterShiftNum +1,2]
						click,%monster_X% ,%monster_Y%		;點擊右欄包包 指定的Lv1怪物
						
						;=====1-0/2判定狀況:此怪物是否已在隊伍中 隊伍配置|離開隊伍====
						loop
						{
							;------1-1/2判定為"隊伍配置"，進行位置交換-----
							;隊伍配置畫面 btn隊伍配置 btn隊伍配置
							PixelSearch, OutputVarX, OutputVarY, 1324 ,746,1324 ,746,0x53C4E5 ,0, Fast
							If ErrorLevel = 0
							{
								click,%OutputVarX%, %OutputVarY%
								
								;-----選擇Lv30怪物位置畫面------
								loop
								{
									;英雄管理頁面 左上英雄管理
									PixelSearch, OutputVarX, OutputVarY,131 ,64,131 ,64,0xCAE7F7 ,0, Fast
									If ErrorLevel = 0
									{
										;點擊左欄Lv30怪物的位置
										click,%OutputVarX_Lv30%, %OutputVarY_Lv30%
										sleep %btnSleep%
										
										;========判定狀況是否重複角色，有則直接選下一位角色=====
										;出現英雄隊伍中有重複角色 英雄隊"伍" 英雄隊"伍"
										PixelSearch, OutputVarX, OutputVarY,707 ,243,707 ,243,0x12B0F5 ,0, Fast
										If ErrorLevel = 0
										{
											click,%OutputVarX%, %OutputVarY%
											sleep %btnSleep%
											
											monsterShiftNumMod := Mod(monsterShiftNum,8)
											
											If(monsterShiftNumMod = 0)
											{
												;拖曳向上
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												MouseMove, 827 ,645 ,100
												Click down
												sleep 200
												MouseMove, 830 ,316 ,100
												Click up
												sleep 2000
												goto, PickUpMonsterStart_3
											}
											
											monsterShiftNum := monsterShiftNum + 1
											goto, PickUpMonster_3
										}
										
										;==========怪物交換成功，回到一般冒險戰前準備========
										click,56 ,69	;點擊回上一頁
										sleep %btnSleep%
										return True													;有做交換怪物，回傳 True
									}
								}
							}
							
							;-----1-2/2判定為"離開隊伍"，直接選下一位角色-----
							PixelSearch, OutputVarX, OutputVarY, 1324 ,750,1324 ,750,0x142747 ,0, Fast
							If ErrorLevel = 0
							{
								click,1382 ,78	;點擊XX
								sleep %btnSleep%
								monsterShiftNum := monsterShiftNum + 1
								goto, PickUpMonster_3
							}
						}
					}
				}
			}
			else
			{
				return False																		;沒有交換怪物，回傳 False
			}
		}
	}
}
;=========檢查鑰匙:依照彈出"鑰匙不足"畫面，判斷是否持有鑰匙，有鑰匙回傳True|沒有鑰匙回傳False===================
bool_CheckKey(howBuyKey,sleepNoKey,btnSleep)
{
	;======彈出鑰匙不足 選擇消費方案(howBuyKey) A:等待一段時間|B:10名譽=1鑰匙|C:10紅寶=5鑰匙|D:45紅寶=45鑰匙|E:100紅寶=100鑰匙=====
	;彈出鑰匙不足 "商"店
	PixelSearch, OutputVarX, OutputVarY,920 ,639,920 ,639,0x00A2F6 ,5, Fast
	If ErrorLevel = 0
	{
		If(howBuyKey = "A")						;A:等待一段時間
		{
			sleep %sleepNoKey%
			click, 462 ,653		;紅色XX
			sleep %btnSleep%
			return False
		}
		If(howBuyKey = "B" || howBuyKey = "C" || howBuyKey = "D" || howBuyKey = "E")
		{
			loop	
			{
				click, 802, 653		;點擊進入商店
				sleep %btnSleep%
			
				;每日一次特價商品 右上XX
				PixelSearch, OutputVarX, OutputVarY,1352 ,107,1352 ,107,0x0B3DC6 ,0, Fast
				If ErrorLevel = 0
				{
					click, %OutputVarX%, %OutputVarY%
					sleep %btnSleep%
				}
				;每日一次特價商品-今天將無法再次購買 中止
				PixelSearch, OutputVarX, OutputVarY,923 ,695,923 ,695,0x019DF0 ,0, Fast
				If ErrorLevel = 0
				{
					click, %OutputVarX%, %OutputVarY%
					sleep %btnSleep%
				}
		
				;-------確認進入商店畫面------
				;消費方案 左上鑰匙
				PixelSearch, OutputVarX, OutputVarY,100 ,166,100 ,166,0x0470B5 ,0, Fast
				If ErrorLevel = 0
				{
					break
				}
			}
			
			void_StoreBuyKey(howBuyKey,btnSleep)
			
			return False
		}			
	}
	If ErrorLevel = 1
	{
		return True
	}
}
;===========商店購買鑰持==============
void_StoreBuyKey(howBuyKey,btnSleep)
{
	;-------確認進入商店畫面------
	loop
	{
		;消費方案 左上鑰匙
		PixelSearch, OutputVarX, OutputVarY,100 ,166,100 ,166,0x0470B5 ,0, Fast
		If ErrorLevel = 0
		{
			If(howBuyKey = "B")
			{
				click, 449 ,834				;btn_10名譽
				sleep %btnSleep%
			}
			If(howBuyKey = "C")
			{
				click, 1090 ,835			;btn_100名譽
				sleep %btnSleep%
			}
			If(howBuyKey = "D")
			{
				;拖曳左移
				MouseMove, 1368 ,573 ,10
				Click down
				sleep 200
				MouseMove, 364 ,607 ,40
				Click up
				sleep 2000
				
				click, 952 ,834				;btn_45紅寶
				sleep %btnSleep%
			}
			If(howBuyKey = "E")
			{
				;拖曳左移
				MouseMove, 1368 ,573 ,10
				Click down
				sleep 200
				MouseMove, 364 ,607 ,40
				Click up
				sleep 2000
				
				click, 1275 ,833			;btn_100紅寶
				sleep %btnSleep%
			}
		}
		
		;無法購買 btn確認
		PixelSearch, OutputVarX, OutputVarY,623,690,623,690,0x1BB9FF ,0, Fast
		If ErrorLevel = 0
		{
			break
		}
		
		;購買鑰匙 btn購"買"
		PixelSearch, OutputVarX, OutputVarY, 900, 678, 900, 678, 0x0291DF, 0, Fast
		If ErrorLevel = 0
		{
			break
		}
	}
	
	;---------制式購買動作--------
	loop
	{
		;購買鑰匙 btn購"買"
		PixelSearch, OutputVarX, OutputVarY, 900, 678, 900, 678, 0x0291DF, 0, Fast
		If ErrorLevel = 0
		{
			click, 934 ,688		 ;btn購買(縫隙)
			sleep %btnSleep%
		}
		;購買完成 btn完成
		PixelSearch, OutputVarX, OutputVarY,614 ,651,614 ,651,0x0C5B90 ,0, Fast
		If ErrorLevel = 0
		{
			click, 614 ,633	 ;btn完成(縫隙)
			sleep 3000
		}
		;無法購買 btn確認 btn確認
		PixelSearch, OutputVarX, OutputVarY,623,690,623,690,0x1BB9FF ,0, Fast
		If ErrorLevel = 0
		{
			sleep 1800 000		;錢不購買，等待30分鐘
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
		}
		;回上一頁 左上箭頭 左上箭頭
		PixelSearch, OutputVarX, OutputVarY, 58, 72, 58, 72, 0x0B38C0, 0, Fast
		If ErrorLevel = 0
		{
			click, %OutputVarX%, %OutputVarY%
			sleep %btnSleep%
			break
		}
	}
	;-------確認離開商店--------
	loop
	{
		;消費方案 左上鑰匙 左上箭頭
		PixelSearch, OutputVarX, OutputVarY,100 ,166,100 ,166,0x0470B5 ,0, Fast
		If ErrorLevel = 0
		{
			click, 56 ,70		;左上箭頭
			sleep %btnSleep%
		}
		If ErrorLevel = 1
		{
			return
		}
	}
}
;============執行戰鬥中================
void_Fighting(chooseAdventure,account)
{
	;--------在"屠龍戰"模式------------
	If(chooseAdventure = "DragonWar")
	{
		loop
		{
			;-----確認"剛戰鬥開始" 發現右上對話框-屠龍戰--------
			PixelSearch, OutputVarX, OutputVarY, 1291 ,75,1291 ,75,0x76BDD0 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		;-----------施放技能----------
		Loop
		{
			;賽因技能可使用
			PixelSearch, OutputVarX, OutputVarY, 824 ,759,824,759,0x6F7070 ,0, Fast
			If ErrorLevel = 0
			{
				click,836 ,770
				sleep 5000
				loop
				{
					;偵測技能是否仍在駐列中
					PixelSearch, OutputVarX, OutputVarY, 865 ,775,865 ,775,0x58C1EE ,0, Fast
					If ErrorLevel = 1
					{
						break
					}
				}
			}

			;-----沒有發現右上對話框-屠龍戰 跳出--------
			PixelSearch, OutputVarX, OutputVarY, 1291 ,75,1291 ,75,0x76BDD0 ,0, Fast
			If ErrorLevel = 1
			{
				Break
			}
		}
	}
	
	;------在"一般冒險"模式---------
	If(chooseAdventure = "Adventure")
	{
		loop
		{
			;-----確認"剛戰鬥開始" 發現右上對話框-一般冒險--------
			PixelSearch, OutputVarX, OutputVarY, 1300 ,154,1300 ,154,0x0F2451 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		
		;初始化回合FLAG
		roundOne := False
		roundTwo := False
		roundThree := False
		finishRoundOne := False
		finishRoundTwo := False
		finishRoundThree := False
		
		;-----------施放技能----------
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1328 ,806,1328 ,806,0x6FD7F6 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
			
			;舊帳號
			If(account = "givific0528@gmail.com")
			{
				;偵測到上方第一回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 607 ,56,607,56, 0x415569 ,0, Fast
				If ErrorLevel = 0
				{
					roundOne := True
				}
				;偵測到上方第二回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 724 ,65,724 ,65, 0x1BE5F8 ,0, Fast
				If ErrorLevel = 0
				{
					roundTwo := True
				}
				;偵測到上方第三回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 798 ,66,798 ,66, 0x1BE5F8 ,0, Fast
				If ErrorLevel = 0
				{
					roundThree := True
				}
				
				;第一回合
				If(roundOne = True && roundTwo = False && roundThree = False && finishRoundOne = False)		
				{	
					;若自動技能為開啟改為關閉
					PixelSearch, OutputVarX, OutputVarY, 186 ,775,186 ,775, 0xFFFFFF ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					
					click,973 ,696		;使用技能3
					sleep 100
					finishRoundOne := True
				}
				;第二回合
				If(roundOne = True && roundTwo = True && roundThree = False && finishRoundTwo = False)
				{
					;若自動技能為開啟改為關閉
					PixelSearch, OutputVarX, OutputVarY, 186 ,775,186 ,775, 0xFFFFFF ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					
					click,835 ,809		;使用技能2
					sleep 100
					finishRoundTwo := True
				}
				;第三回合
				If(roundOne = True && roundTwo = True && roundThree = True && finishRoundThree = False)
				{
					click,837 ,698		;使用技能1
					sleep 100
					click,976 ,814		;使用技能4
					sleep 100
					finishRoundThree := True
					
					;若自動技能為關閉改為開啟
					PixelSearch, OutputVarX, OutputVarY, 186 ,774,186 ,774, 0x82A9BD ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					break
				}
				/*
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,837 ,698	;開始點選使用技能1
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}		
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,1111 ,693	;開始點選使用技能5
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}		
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,835 ,809	;開始點選使用技能2
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,973 ,696	;開始點選使用技能3
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,976 ,814	;開始點選使用技能4
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,1104 ,809	;開始點選使用技能6
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,837 ,698	;開始點選使用技能1
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
					
				;最後戰鬥中 發現右上對話框 
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,835 ,809	;開始點選使用技能2
						sleep 10 000
						break
					}
				*/
			}
			;新帳號
			Else If(account = "givific01@gmail.com")
			{
				;偵測到上方第一回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 607 ,56,607,56, 0x415569 ,0, Fast
				If ErrorLevel = 0
				{
					roundOne := True
				}
				;偵測到上方第二回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 724 ,65,724 ,65, 0x1BE5F8 ,0, Fast
				If ErrorLevel = 0
				{
					roundTwo := True
				}
				;偵測到上方第三回合讀取條為黃色
				PixelSearch, OutputVarX, OutputVarY, 798 ,66,798 ,66, 0x1BE5F8 ,0, Fast
				If ErrorLevel = 0
				{
					roundThree := True
				}
				
				;第一回合
				If(roundOne = True && roundTwo = False && roundThree = False && finishRoundOne = False)		
				{
					;若自動技能為開啟改為關閉
					PixelSearch, OutputVarX, OutputVarY, 186 ,775,186 ,775, 0xFFFFFF ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					
					click,976 ,814		;使用技能4
					sleep 100
					finishRoundOne := True
				}
				;第二回合
				If(roundOne = True && roundTwo = True && roundThree = False && finishRoundTwo = False)		
				{
					;若自動技能為開啟改為關閉
					PixelSearch, OutputVarX, OutputVarY, 186 ,775,186 ,775, 0xFFFFFF ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					
					click,837 ,698		;使用技能1
					sleep 100
					finishRoundTwo := True
				}
				;第三回合
				If(roundOne = True && roundTwo = True && roundThree = True && finishRoundThree = False)		
				{
					click,973 ,696		;使用技能3
					sleep 100
					click,835 ,809		;使用技能2
					sleep 100
					finishRoundThree := True
					
					;若自動技能為關閉改為開啟
					PixelSearch, OutputVarX, OutputVarY, 186 ,774,186 ,774, 0x82A9BD ,0, Fast
					If ErrorLevel = 0
					{
						click,184 ,784		;點擊自動施放
						sleep 100
					}
					break
				}
				/*
				;戰鬥中 發現右上對話框 開始點選使用技能1
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,837 ,698
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}		
				;戰鬥中 發現右上對話框 開始點選使用技能4
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,976 ,814
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}		
					
				;戰鬥中 發現右上對話框 開始點選使用技能6
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,1104 ,809
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 開始點選使用技能3
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,973 ,696
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				;戰鬥中 發現右上對話框 開始點選使用技能5
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,1111 ,693
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}		
					
				;戰鬥中 發現右上對話框 開始點選使用技能2
					PixelSearch, OutputVarX, OutputVarY, 1393 ,182,1393 ,182,0x0D2A71 ,0, Fast
					If ErrorLevel = 0
					{
						click,835 ,809
						sleep 10 000
					}
					If ErrorLevel = 1
					{
						break
					}
				*/
			}
			;如果帳號等於為其他，可能是作每日任務或自動技能
			Else
			{
				break
			}
		}
	}
	
	;------在"攻城戰"模式---------
	If(chooseAdventure = "Seige")
	{
		loop
		{
			;戰鬥中 發現右上對話框
			PixelSearch, OutputVarX, OutputVarY, 1291 ,75,1291 ,75,0x76BDD0 ,0, Fast
			If ErrorLevel = 0
			{
				click,675 ,774		;開啟召喚好友
				sleep 5 000
				
				;戰鬥中 發現招喚好友預約字樣
				PixelSearch, OutputVarX, OutputVarY, 719 ,791,719 ,791,0x1368CE ,0, Fast
				If ErrorLevel = 0
				{
					break
				}
				;戰鬥中 發現招喚好友邊框不見
				PixelSearch, OutputVarX, OutputVarY, 728 ,761,728 ,761,0x3D4E60 ,0, Fast
				If ErrorLevel = 1
				{
					break
				}
			}

		}
	}
	Return
}
;============結束戰鬥了================
void_FightFinish(chooseAdventure,chooseNextRun,btnSleep)	
{
	;==============戰鬥結束==================
	;-----------下面所有動作，皆是確保回到"再一次戰鬥"畫面僅此---------
	
	;一般冒險 戰鬥結束
	If(chooseAdventure = "Adventure")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1328 ,806,1328 ,806,0x6FD7F6 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1328 ,806,1328 ,806,0x6FD7F6 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain")
				{
					click, 1321 ,263				;再一次
					sleep %btnSleep%
				}
				If(chooseNextRun = "NextArea")
				{
					click, 1320 ,434				;下一個地區
					sleep %btnSleep%
				}
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	
	;時光屋 戰鬥結束
	If(chooseAdventure = "TimeHouse")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1328 ,806,1328 ,806,0x6FD7F6 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain" || chooseNextRun = "NextArea")
				{
					break
				}
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1328 ,806,1328 ,806,0x6FD7F6 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain" || chooseNextRun = "NextArea")
				{
					click, 1323 ,430				;再一次
					sleep %btnSleep%
				}
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	
	;競技場 戰鬥結束
	If(chooseAdventure = "Arena")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1348 ,760,1348 ,760,0x0E5074 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1348 ,760,1348 ,760,0x0E5074 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain" || chooseNextRun = "NextArea")
				{
					click, 1349 ,607				;再一次
					sleep %btnSleep%
				}
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	
	;攻城戰 戰鬥結束
	If(chooseAdventure = "Seige")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1350 ,762,1350 ,762,0x347796 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1350 ,762,1350 ,762,0x347796 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain" || chooseNextRun = "NextArea")
				{
					click, 1339 ,612				;再一次
					sleep %btnSleep%
				}
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	
	;屠龍戰 戰鬥結束
	If(chooseAdventure = "DragonWar")
	{
		loop
		{
			;----"錯誤"已經結束的討伐戰----
			PixelSearch, OutputVarX, OutputVarY, 714 ,648,714 ,648,0x00A1F4 ,0, Fast
			If ErrorLevel = 0
			{
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
				Return
			}
			
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1367 ,765,1367 ,765,0x6FD6F5 ,0, Fast
			If ErrorLevel = 0
			{
				
				break
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1367 ,765,1367 ,765,0x6FD6F5 ,0, Fast
			If ErrorLevel = 0
			{
				If(chooseNextRun = "RunAgain" || chooseNextRun = "NextArea")
				{
					click, 1349 ,406				;再一次
					sleep %btnSleep%
				}
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	
	;每日副本 戰鬥結束
	If(chooseAdventure = "DailyInstance")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1323 ,777,1323 ,777,0x14567B ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}
		
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1323 ,777,1323 ,777,0x14567B ,0, Fast
			If ErrorLevel = 0
			{
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	;進階副本 戰鬥結束
	If(chooseAdventure = "AdvenceInstance")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1330 ,772,1330 ,772,0x357897 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}

		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1330 ,772,1330 ,772,0x357897 ,0, Fast
			If ErrorLevel = 0
			{
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
	;特殊副本 戰鬥結束
	If(chooseAdventure = "SpecialInstance")
	{
		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1330 ,772,1330 ,772,0x357897 ,0, Fast
			If ErrorLevel = 0
			{
				break
			}
		}

		loop
		{
			;----確認進入"戰鬥結束"畫面 btn村莊----
			PixelSearch, OutputVarX, OutputVarY, 1330 ,772,1330 ,772,0x357897 ,0, Fast
			If ErrorLevel = 0
			{
				click, %OutputVarX%, %OutputVarY%
				sleep %btnSleep%
			}
			If ErrorLevel = 1
			{
				Return
			}
		}
	}
}
;====================處理突發事件======================
void_NormalEvent()
{
	;點擊女神提醒LV30 => 右下確認邊框
	PixelSearch, OutputVarX, OutputVarY,1399 ,757,1399 ,757,0xA2E1F9 ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%		;點擊右下SKIP
		sleep 3000		;防止LAG連點處發
	}
	;點擊女神主角升級 => 右下確認邊框
	PixelSearch, OutputVarX, OutputVarY,1407 ,757,1407 ,757,0x9CD6EE ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%		;點擊右下SKIP
		sleep 3000		;防止LAG連點處發
	}
	
	;點擊亞拉岡每日任務 => 右下確認邊框
	PixelSearch, OutputVarX, OutputVarY,1413 ,759,1413 ,759,0x9EDCF3 ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%		;點擊右下SKIP
		sleep 3000		;防止LAG連點處發
	}
	
	;故事劇情對話 SKIP
	PixelSearch, OutputVarX, OutputVarY,1380 ,56,1380 ,56,0xFFFFFF ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%		;點擊右下SKIP
		sleep 3000		;防止LAG連點處發
	}
	
	;紫色畫面 右下XX
	PixelSearch, OutputVarX, OutputVarY,1419 ,853,1419 ,853,0x00D0FD ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%
		sleep 3000		;防止LAG連點處發
	}
}
;==========發現野生龍=================
bool_FindDragon()
{
	;出現屠龍戰(屠龍關)
	PixelSearch, OutputVarX, OutputVarY,166 ,858,166 ,858,0xFEFEFF ,0, Fast
	If ErrorLevel = 0
	{
		click, %OutputVarX%, %OutputVarY%		;點擊發現龍類動畫
		sleep 3000
		
		loop
		{
			;屠龍戰畫面 "未參與屠龍戰"(暗色)
			PixelSearch, OutputVarX, OutputVarY,357 ,133,357 ,133,0x07132C ,0, Fast
			If ErrorLevel = 0
			{
				findDragon := True
				Return findDragon
			}
		}
	}
}
;==========亞拉岡成就達成: 英雄的名譽=================
bool_AchieveHeroGlory()
{
	;點擊亞拉岡成就達成 => "成"就達成
	PixelSearch, OutputVarX, OutputVarY,1051 ,777,1051 ,777,0x13B5FB ,0, Fast
	If ErrorLevel = 0
	{
		click,1399 ,757		;右下邊框
		sleep 3000
		
		findAchieveHeroGlory := True
		Return findAchieveHeroGlory
	}
}

F7::
;快速榮譽鑰匙 快速屠龍領獎
Loop
{
	;榮譽鑰匙 左上鑰匙
	PixelSearch, OutputVarX, OutputVarY,100 ,166,100 ,166,0x0470B5 ,0, Fast
	If ErrorLevel = 0
	{
		click, 449 ,834			;btn_10名譽
		sleep 200
	}
	;購買鑰匙 btn購"買"
	PixelSearch, OutputVarX, OutputVarY, 900, 678, 900, 678, 0x0291DF, 0, Fast
	If ErrorLevel = 0
	{
		click, 934 ,688		 ;btn購買(縫隙)
		sleep 800
	}
	;購買完成 btn完成
	PixelSearch, OutputVarX, OutputVarY,614 ,651,614 ,651,0x0C5B90 ,0, Fast
	If ErrorLevel = 0
	{
		click, 614 ,633	 ;btn完成(縫隙)
		sleep 200
	}
	
	;屠龍已結束的討伐戰 btn入場
	PixelSearch, OutputVarX, OutputVarY,1335 ,260,1335 ,260,0x56B3D4 ,0, Fast
	If ErrorLevel = 0
	{
		click,%OutputVarX%, %OutputVarY%
		sleep 200
	}

	;屠龍"領取獎勵"畫面 btn領取獎勵(黃色)
	PixelSearch, OutputVarX, OutputVarY,1198 ,674,1198 ,674,0x0489D1 ,0, Fast
	If ErrorLevel = 0
	{
		If(gotAward = False || gotAward = Null)
		{
			gotAward := True
			
			click,%OutputVarX%, %OutputVarY%
			sleep 1000
		}
		Else
		{
			gotAward := False
			
			click,54 ,72	;回上頁
			sleep 200
		}
	}
	;獎勵名單 btn確認
	PixelSearch, OutputVarX, OutputVarY,618 ,649,618 ,649,0x2ECBFF ,0, Fast
	If ErrorLevel = 0
	{
		click,%OutputVarX%, %OutputVarY%
		sleep 200
	}
}
Return

F1::
MouseGetPos, mouseX, mouseY
PixelGetColor, color, %mouseX%, %mouseY%
clipboard = PixelSearch, OutputVarX, OutputVarY, %mouseX%, %mouseY%, %mouseX%, %mouseY%, %color%, 0, Fast`nIf ErrorLevel = 0`n{`n`tClick, `%OutputVarX`%, `%OutputVarY`%`n`tsleep 1000`n}`n
MSGBOX PixelSearch, OutputVarX, OutputVarY, %mouseX%, %mouseY%, %mouseX%, %mouseY%, %color%, 0, Fast
Return

F3::
Reload
Return