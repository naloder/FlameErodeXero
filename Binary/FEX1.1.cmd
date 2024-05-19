
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


[Command]
name = "order"
command = /$B,b+c
time = 30

;-| Super Motions |--------------------------------------------------------

[Command]
name = "Super_Attack_1";3000
command = ~D, DF, F, x+y
time = 30

[Command]
name = "Super_Attack_2";3100
command = c+z
time = 30

[Command]
name = "Super_Attack_3";3200
command = ~D, DB, B, a+b
time = 30

[Command]
name = "Super_Attack_4";3300
command = ~D, DB, B, D, DB, B, y
time = 30

[Command]
name = "Super_Attack_5";3350
command = ~D, DF, F, a+b
time = 30

[Command]
name = "Super_Attack_6";3400
command = ~D, DB, B, x+y
time = 30

[Command]
name = "Super_Attack_7"
command = ~D, DF, F, D, DF, F, z
time = 30


;-| Special Motions |------------------------------------------------------

[Command]
name = "Special_Attack_1"
command = ~D, DF, F, a

[Command]
name = "Special_Attack_2"
command = ~D, DF, F, b

[Command]
name = "Special_Attack_3"
command = ~D, DF, F, c

[Command]
name = "Special_Attack_4"
command = ~D, DF, F, x

[Command]
name = "Special_Attack_5"
command = ~D, DF, F, y

[Command]
name = "Special_Attack_6"
command = ~D, DB, B, x

[Command]
name = "Special_Attack_7"
command = ~D, DB, B, a

[Command]
name = "Special_Attack_8"
command = ~D, DB, B, b

[Command]
name = "Special_Attack_9"
command = ~D, DB, B, c


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x


[Command]
name = "y"
command = y

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !(var(59)&1)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !(var(59)&1)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !(var(59)&1)
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

[State -1]
type = ChangeState
value = 665
triggerall =!IsHelper
triggerall = statetype != A
triggerall = Sysvar(4) = 2
triggerall =!numprojID(666)
triggerall = (var(1)&2048)
trigger1 = ctrl
ignorehitpause = 1

;---------------------------------------------------------------------------

[State 八稚女]
type = ChangeState
value = 3000
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = command = "Super_Attack_1"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 3000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 1500
ctrl = 0

[State 大招]
type = ChangeState
value = 3100
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = command = "Super_Attack_2"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 6000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 3000
ctrl = 0

[State 飞剑]
type = ChangeState
value = 3200
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = numhelper(3200) = 0
triggerall = command = "Super_Attack_3"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 2000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 1000
ctrl = 0

[State 高档当身]
type = ChangeState
value = 3300
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = command = "Super_Attack_4"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 3000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 1500
ctrl = 0

[State 搬运]
type = ChangeState
value = 3350
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = command = "Super_Attack_5"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 1000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 500
ctrl = 0

[State 天上掉]
type = ChangeState
value = 3400
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall = command = "Super_Attack_6"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 3000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 1500
ctrl = 0

[State 死之印]
type = ChangeState
value = 3500
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall =!numhelper(4444)
triggerall = command = "Super_Attack_7"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 3000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 1500
ctrl = 0

[State 撞击]
type = ChangeState
value = 300
triggerall = !(var(59)&1)
triggerall = ctrl
triggerall = statetype != A
triggerall =!NumExplod(10090)
triggerall = command = "holdfwd" && command = "c"
trigger1 = ((var(0)&50331648)/16777216)!= 2 || !(var(0)&4194304)
trigger1 = power >= 5000
trigger2 = ((var(0)&50331648)/16777216) = 2
trigger2 =!!(var(0)&4194304)
trigger2 = power >= 2500
ctrl = 0

;---------------------------------------------------------------------------

[State 无敌]
type = ChangeState
value = 289
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "z"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
ctrl = 0

[State 瞬移]
type = ChangeState
value = 290
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
ctrl = 0

[State 瞬移2]
type = ChangeState
value = 291
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
ctrl = 0

;---------------------------------------------------------------------------

[State 抓抓抓]
type = ChangeState
value = 1000
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_1"
ctrl = 0



[State 上挑]
type = ChangeState
value = 1200
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = ctrl
triggerall = statetype != A
trigger1 = command = "Special_Attack_2"
ctrl = 0


[State 当身]
type = ChangeState
value = 1300
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_3"
ctrl = 0

[State 当身]
type = ChangeState
value = 1400
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_4"
ctrl = 0

[State 剑]
type = ChangeState
value = 1500
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_5"
ctrl = 0

[State 血池]
type = ChangeState
value = 1900
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_6"
ctrl = 0

[State 血池]
type = ChangeState
value = 1600
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_7"
ctrl = 0

[State 血池]
type = ChangeState
value = 1700
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_8"
ctrl = 0


[State 血池]
type = ChangeState
value = 1800
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "Special_Attack_9"
ctrl = 0

;---------------------------------------------------------------------------
;
[State -1,立轻爪]
type = ChangeState
value = 200
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "x"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 240
trigger2 = animelemtime(4)>=0

[State -1,]
type = ChangeState
value = 220
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "a"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 240
trigger2 = animelemtime(4)>=0
ctrl = 0


[State -1,踢]
type = ChangeState
value = 210
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "b"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210
trigger2 = time > 10

[State -1,冲撞]
type = ChangeState
value = 230
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "c"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
ctrl = 0



[State -1,站重爪]
type = ChangeState
value = 240
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 240
trigger2 = animelemtime(4)>=0
ctrl = 0

;
[State -1,蹲轻踢]
type = ChangeState
value = 400
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "x"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
ctrl = 0

[State -1,剪刀脚第一段]
type = ChangeState
value = 410
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 410
trigger2 = time > 10
ctrl = 0


[State -1,砸地板]
type = ChangeState
value = 430
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "a"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
ctrl = 0

[State -1,砸地板]
type = ChangeState
value = 440
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "b"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
ctrl = 0

;
[State -1,回旋]
type = ChangeState
value = 600
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
ctrl = 0

[State -1,一抓]
type = ChangeState
value = 610
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
ctrl = 0

[State -1,一踢]
type = ChangeState
value = 630
triggerall = !(var(59)&1)
triggerall = Sysvar(2) != [4,5]
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
ctrl = 0

[State -1]
type = ChangeState
value = 40
triggerall = !(var(59)&1)
triggerall = !ishelper
triggerall = sysvar(4)!= 0
triggerall = command = "holdup"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = anim = 100
ignorehitpause = 1

[State -1]
type = Changestate
triggerall = !ishelper
triggerall = sysvar(4)!= 0
triggerall = alive
triggerall = statetype = S
triggerall = ctrl
triggerall = roundstate = 2
triggerall =!time
triggerall = anim != [100, 105]
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"
value = 20
ignorehitpause = 1

[State -1]
type = Changestate
triggerall = !ishelper
triggerall = sysvar(4)!= 0
triggerall = alive
triggerall = statetype = C
triggerall = ctrl
triggerall =!time
trigger1 = command != "holddown"
value = 12
ignorehitpause = 1

[State -1]
type = Changestate
triggerall = !ishelper
triggerall = sysvar(4)!= 0
triggerall = alive
triggerall = statetype = C
triggerall = ctrl
triggerall =!time
triggerall = animtime = 0
trigger1 = command = "holddown"
value = 11
ignorehitpause = 1

[State -1]
type = Changestate
triggerall = !ishelper
triggerall = sysvar(4)!= 0
triggerall = alive
triggerall = statetype = S
triggerall = ctrl
triggerall =!time
trigger1 = command = "holddown"
value = 10
ignorehitpause = 1

[State , AI关闭]
type = VarSet
triggerall =!ishelper
trigger1 = !Alive
trigger2 = roundstate != 2
trigger3 = sysvar(4) >= 2
var(59) = (var(59)&-2)
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
triggerall = roundstate = 2
triggerall =!NumExplod(10090)
trigger1 = Random%1000 =[888,999]
trigger1 = fvar(1) > 100
trigger2 = numexplod(1999)
value = 7000
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
triggerall = roundstate = 2
trigger1 = Random%1000 =[222,333]
value = 5555
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[0,111]
trigger1 = fvar(1) > 100*sysvar(4) = 2
value = 1700
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[111,222]
trigger1 = fvar(1) > 100*sysvar(4) = 2
value = 1600
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[222,333]
trigger1 = fvar(1) > 100*sysvar(4) = 2
value = 3000
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[333,444]
trigger1 = fvar(1) > 100*sysvar(4) = 2
value = 3401
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[444,555]
trigger1 = fvar(1) > 100
value = 3500
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[555,666]
trigger1 = fvar(1) > 100
value = 4000
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = Random%1000 =[666,777]
trigger1 = fvar(1) > 100
value = 4100
ignorehitpause = 1

[State 随机出招]
type = SelfState
triggerall = !ishelper
triggerall = Alive
triggerall = sysvar(4) >= 2
triggerall = ctrl
triggerall =!NumExplod(10090)
trigger1 = roundstate = 2
trigger1 = Random%1000 =[777,888]
trigger1 = fvar(1) > 100
value = 5554
ignorehitpause = 1

[state -1,令咒]
type = Selfstate
value = 6000
triggerall = !ishelper
triggerall = (var(0)&3) > 0
triggerall = statetype = S
triggerall =!!(var(59)&1073741824)
triggerall =!movehit
triggerall = anim!= [1900,1910]
triggerall = anim!= [3100,3103]
triggerall = anim!= [4000,8000]
triggerall = roundstate = 2
trigger1 = sysvar(4) = 0
trigger1 = (enemynear(var(54)),movetype!= A&&(movereversed||stateno<2000))||movetype = H
trigger1 = random <= 30
trigger1 = life<=lifemax*0.7
trigger1 =!!(var(59)&1)
trigger2 = sysvar(4) = 1
trigger2 = playerID(ceil(fvar(5))),sysvar(0) = 125 && playerID(ceil(fvar(5))),sysvar(2) > lifemax*0.7
trigger2 = random <= 30
trigger2 =!!(var(59)&1)
trigger3 = command = "order"
trigger3 =!(var(59)&1)
ignorehitpause = 1

;--------------------------------------------------------------------------------------------------
;特别优先执行

[State -3, 我受不了了 升他妈的]
type = ChangeState
value = 1900
triggerall = var(59) >= 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = EnemyNear(var(54)),Ctrl = 0
triggerall = InGuardDist
triggerall = (EnemyNear(var(54)),time <= 6)
triggerall = (EnemyNear(var(54)),StateNo = [0,1999])
triggerall = EnemyNear(var(54)), movetype != H
trigger1 = Random <= 120
trigger1 = ctrl  || (stateno = [10,12]) || (stateno = [19,24]) || stateno = 52 || (stateno = [100,115]) || (stateno = [120,140]) 
trigger2 = Random <= 150
trigger2 = (stateno = 200) || (stateno = 210) || (stateno = 220) || (stateno = 230) || (stateno = 240)
trigger2 = time <= 4

;起身闪避
[State 起身闪避]
type = ChangeState
value = IfElse(random%2,290,291)
triggerall = !ishelper;这不是helper
triggerall = var(59) >= 1
triggerall = roundstate = 2
triggerall = EnemyNear(var(54)),StateType != L
triggerall = EnemyNear(var(54)),Time >= 1
trigger1 = stateno = 5120 && Animtime = 0

;空震闪避超杀
[State -3 闪避超杀]
type = changestate
value = IfElse((EnemyNear, facing != facing),290,291)
triggerall = !ishelper;这不是helper
triggerall = var(59) >= 1
triggerall = roundstate = 2;在对局中
triggerall = Statetype != A;自己不在空中
triggerall = EnemyNear(var(54)),ctrl = 0
triggerall = EnemyNear(var(54)), movetype != H
triggerall = EnemyNear(var(54)),StateType != L
triggerall = ctrl  || (stateno = [10,12]) || (stateno = [19,24]) || stateno = 52 || (stateno = [100,115]) || (StateNo = [200,440]) 
triggerall = EnemyNear(var(54)),stateno >= 2000
trigger1 = random <= 600
trigger1 = stateno != [289,291]
trigger2 = stateno = [289,291]
trigger2 = animtime = 0

;空震闪避
[State -3 空震闪避]
type = changestate
value = IfElse(random%2,290,291)
triggerall = !ishelper;这不是helper
triggerall = var(59) >= 1
triggerall = roundstate = 2;在对局中
triggerall = Statetype != A;自己不在空中
triggerall = EnemyNear(var(54)),ctrl = 0
triggerall = EnemyNear(var(54)),StateType != L
triggerall = ctrl  || (stateno = [10,12]) || (stateno = [19,24]) || stateno = 52 || (stateno = [100,115])
triggerall = random <= 100
trigger1 = EnemyNear(var(54)),movetype = A

;闪避攻击
[State -3 闪避2]
type = changestate
value = IfElse(random%2,290,291)
triggerall = !ishelper;这不是helper
triggerall = var(59) >= 1
triggerall = roundstate = 2;在对局中
triggerall = Statetype != A;自己不在空中
triggerall = EnemyNear(var(54)),ctrl = 0
triggerall = (stateno = [120,140])
trigger1 = random <= 80
trigger1 = EnemyNear(var(54)),movetype = A;对方处于攻击状态
trigger2 = EnemyNear(var(54)),stateno >= 2000
trigger2 = EnemyNear(var(54)), facing != facing

;紧急闪避
[State -3 紧急闪避]
type = changestate
value = IfElse(random%2,290,291)
triggerall = !ishelper;这不是helper
triggerall = var(59) >= 1
triggerall = roundstate = 2;在对局中
triggerall = Statetype != A;自己不在空中
triggerall = EnemyNear(var(54)),ctrl = 0
triggerall = (stateno = [150,153]) && time = 1
trigger1 = random <= 80
trigger1 = EnemyNear(var(54)),movetype = A;对方处于攻击状态
trigger2 = EnemyNear(var(54)),stateno >= 2000
trigger2 = EnemyNear(var(54)), facing != facing

;------------------------------------------------------------------------------
;分隔线

;--------------------------------------------------------------------------------------------------
;以下是AI

[State 大魔法]
type = ChangeState
value = 7000
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = power >= 5000
triggerall = statetype != A 
triggerall = (Ctrl || stateno = 19 || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 101)
trigger1 = Random <= 20
trigger2 =!!sysvar(4)
trigger2 = Random <= 50
IgnoreHitPause = 1

[State -1, 混沌军团]
type = ChangeState
value = 5555
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = power >= 5000
triggerall = statetype != A 
triggerall = (Ctrl || stateno = 19 || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 101)
trigger1 = Random <= 20
IgnoreHitPause = 1

[State -3, 混沌军团]
type = ChangeState
value = 5555
triggerall = !ishelper;这不是helper 
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = random <= 50
triggerall = power >= 5000;自己的能量大于等于5000
triggerall = fvar(37) = [-80,300];与对方的绝对值距离小于等于110
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120

[state -3,Dusk 飞剑]
type = changestate
value = 3200
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
TriggerAll = statetype != A
TriggerAll = Enemynear(var(54)),movetype = H || !NumTarget && !(Random%155)
TriggerAll = Power >= 1000
TriggerAll = !numHelper(3201)
trigger1 = Ctrl
Trigger1 = fvar(37) >= 80
Trigger1 = Enemynear(var(54)),movetype = H
Trigger1 = Enemynear(var(54)),statetype = L


[state -3,Dusk 搬运]
type = changestate
value = 3350
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
TriggerAll = statetype != A
TriggerAll = Enemynear(var(54)),statetype != L
TriggerAll = Enemynear(var(54)),movetype = H || !NumTarget && !(Random%155)
TriggerAll = Power >= 1000
trigger1 = Ctrl
Trigger1 = Enemynear(var(54)),movetype = H
Trigger1 = fvar(37) = [100,160]
Trigger1 = Enemynear(var(54)),Pos Y > -50
Trigger1 = Enemynear(var(54)),Pos Y < -10
Trigger1 = Enemynear(var(54)), vel y > 0

[State -3,Dusk 天降和刻印]
type = ChangeState
value = ifelse(random >= 500,3400,3500)
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = random <= 50
triggerall = power >= 3000;自己的能量大于等于3000
triggerall = fvar(37) = [-80,300];与对方的绝对值距离小于等于110
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120

[State 全屏凹]
type = ChangeState
value = 4000
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = random <= 100
triggerall = power >= 2000;自己的能量大于等于3000
trigger1 = EnemyNear(var(54)),movetype = H
trigger1 = EnemyNear(var(54)),statetype = A
trigger1 = ctrl||stateno=21||stateno=22||stateno=100
trigger1 = EnemyNear(var(54)),stateno != [5110,5200]
Trigger2 =(enemyNear(var(54)),AnimTime<=-5&&!enemyNear(var(57)),Ctrl)
trigger2 =(enemynear(var(54)),movetype=A)
trigger2 = ctrl||stateno=21||stateno=22||stateno=100
IgnoreHitPause = 1


[State -3,Dusk 飞剑和抓人]
type =ChangeState
value = ifelse(random >= 500,3200,3100)
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = random <= 100
triggerall = power >= 2000;自己的能量大于等于3000
triggerall = fvar(37) = [-80,300];与对方的绝对值距离小于等于110
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120

[State -3,Dusk 八稚女和搬运]
type =ChangeState
value = ifelse(random%2,3000,3350)
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = power >= 3000;自己的能量大于等于3000
triggerall = fvar(37) = [-80,100];与对方的绝对值距离小于等于110
triggerall = fvar(38) >= -60
triggerall = enemynear(var(54)),vel y >= 0;对方在下落中
triggerall = random <= 150
triggerall = enemynear(var(54)),movetype = H
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120



[State 黑化一击]
type = ChangeState
value = 4100
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = power >= 3000;自己的能量大于等于3000
triggerall = random <= 150
trigger1 = ctrl||stateno=21||stateno=22||stateno=100
IgnoreHitPause = 1

[State 延迟弹幕]
type =ChangeState
value = 3600
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = power >= 1000;自己的能量大于等于1000
triggerall = !numhelper(3601)
triggerall = fvar(37) >= 120
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120


[State -3,Dusk 当身超杀]
type = ChangeState
value = 3300
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = statetype != A;自己不在空中
triggerall = power >= 3000;自己的能量大于等于3000
triggerall = enemynear(var(54)),movetype=A
triggerall = fvar(37) <= 100;与对方的绝对值距离小于等于100
triggerall = random <= 350
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120

[State -3,Dusk 当身必杀]
type = ChangeState
value = 1300
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),hitdefattr = SCA,AA,AT,AP;对方hitdef的attr属性为SCA,AA,AT,AP
triggerall = fvar(37) <= 50;与对方的绝对值距离小于等于100
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120



[State -3,Dusk 瞬移]
type =ChangeState
value = 290
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = var(55) = 0;不在冷却中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = fvar(37) = [-60,60];与对方的绝对值距离小于等于60
trigger1 = enemynear(var(54)),movetype = A;对方在攻击状态
trigger2 = enemynear(var(54)),numproj > 0

[State -3,Dusk 保持距离]
type =ChangeState
value = 105
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = var(57) != 0;在冷却中
triggerall = var(56) != 0;在冷却中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype = L;对方在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) <= 100;与对方的绝对值距离小于等于100
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120

[State -3,Dusk 对地拳脚衔接]
type =ChangeState
value = 1700
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = !(random%5)
trigger1 = (stateno = [200,220]) && movehit && !animtime

[State -3,Dusk 对地基础拳脚]
type =ChangeState
value = 200+random%2*10
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = enemynear(var(54)),anim != 40;对方不在起跳状态
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,60];与对方的绝对值距离小于等于60
triggerall = fvar(38) >= -50;与对方的绝对值高度大于等于-50
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
triggerall = ifelse(numexplod(4000) = 0,enemynear(var(54)),numproj <= 0,1);若不在时停中则对方的proj数量小于等于0
trigger1 = ifelse(enemynear(var(54)),movetype = H,numtarget > 0,enemynear(var(54)),movetype != H)
trigger2 = enemynear(var(54)),stateno = [120,155];对方状态号等于120-155

[State -3,Dusk 对地拳脚衔接]
type =ChangeState
value = 210+random%4*10
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,60];与对方的绝对值距离小于等于60
triggerall = fvar(38) >= -50;与对方的绝对值高度大于等于-500
trigger1 = stateno = 200 && movehit && !animtime

[State -3,Dusk 对地拳脚衔接]
type =ChangeState
value = 220+random%2*10
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,60];与对方的绝对值距离小于等于60
triggerall = fvar(38) >= -50;与对方的绝对值高度大于等于-500
trigger1 = stateno = 210 && movehit && !animtime

[State -3,Dusk 对地拳脚衔接]
type =ChangeState
value = 200+random%4*10
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,60];与对方的绝对值距离小于等于60
triggerall = fvar(38) >= -50;与对方的绝对值高度大于等于-500
trigger1 = stateno = 220 && movehit && !animtime



[State -3,Dusk 空中攻击]
type =ChangeState
value = 610
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype = A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
trigger1 = ctrl || stateno = 50 || stateno = 132 || stateno = 5040 || stateno = 5210


[State -3,Dusk 超重击]
type =ChangeState
value = 300
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype = A;对方在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = enemynear(var(54)),pos y >= -120 || enemynear(var(54)),vel y >= 0
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = fvar(37) = [0+floor(4*floor(Facing*enemynear(var(54)),vel x)),100+floor(4*floor(Facing*enemynear(var(54)),vel x))]
trigger1 = fvar(38) = [-60-floor(4*(enemynear(var(54)),vel y)+(4*(4+1)/2)*enemynear(var(54)),const(movement.yaccel)),-35-floor(4*(enemynear(var(54)),vel y)+(4*(4+1)/2)*enemynear(var(54)),const(movement.yaccel))]





[State -3,Dusk 必杀衔接]
type =ChangeState
value = ifelse(random >= 900,1600,1400)
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = stateno != 430 && stateno != 230
triggerall = fvar(37) = [-80,100];与对方的绝对值距离小于等于110
triggerall = fvar(38) >= -60
triggerall = enemynear(var(54)),movetype = H
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120


[State -3,Dusk 冲抓衔接]
type =ChangeState
value = 1600
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-80,120];与对方的绝对值距离小于等于110
triggerall = random >= 500
trigger1 = anim = 1400 && animelemtime(9)>0 
trigger1 = enemynear(var(54)),movetype = H

[State -3,Dusk 抓]
type =ChangeState
value = 1000
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [0,120]
triggerall = fvar(38) >= -40
triggerall = ((enemynear(var(54)),movetype != H) && (enemynear(var(54)),stateno < 2000)) || (enemynear(var(54)),movetype = H)
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = !(random%10)

[State -3,Dusk 下抓派生]
type =ChangeState
value = 1050
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [0,150]
triggerall = ((enemynear(var(54)),movetype != H) && (enemynear(var(54)),stateno < 2000)) || (enemynear(var(54)),movetype = H)
trigger1 = anim = 1000 && animelemtime(4)>0 

[State -3,Dusk 剪刀脚]
type =ChangeState
value = 1200
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = var(58) = 0;不在冷却中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype = A;对方在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = enemynear(var(54)),pos y >= -120 || enemynear(var(54)),vel y >= 0
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = fvar(37) = [0+floor(4*floor(Facing*enemynear(var(54)),vel x)),100+floor(4*floor(Facing*enemynear(var(54)),vel x))]
trigger1 = fvar(38) = [-120-floor(4*(enemynear(var(54)),vel y)+(4*(4+1)/2)*enemynear(var(54)),const(movement.yaccel)),-50-floor(4*(enemynear(var(54)),vel y)+(4*(4+1)/2)*enemynear(var(54)),const(movement.yaccel))]

[State -3,Dusk 血池]
type =ChangeState
value = 1900
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-80,200];与对方的绝对值距离小于等于200
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = enemynear(var(54)),movetype = A;对方在攻击状态
trigger2 = stateno = 1301 && animtime = 0
trigger2 = enemynear(var(54)),movetype != H;对方不在受击状态

[State -3,Dusk 随机]
type =ChangeState
value = ifelse(random >= 600,1500,ifelse(random >= 500,1700,1900))
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != A;对方不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = !(random%20)
triggerall = fvar(37) = [-80,200];与对方的绝对值距离小于等于200
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = enemynear(var(54)),movetype != H

[State -3,Dusk 束缚]
type =ChangeState
value = 1800
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [150,300];与对方的绝对值距离小于等于200
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
trigger1 = enemynear(var(54)),stateno < 2000
trigger1 = enemynear(var(54)),movetype != H

[State -3,Dusk 地震]
type =ChangeState
value = 430
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = var(56) = 0;不在冷却中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != A;对方不在空中
triggerall = enemynear(var(54)),statetype = L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,60];与对方的绝对值距离小于等于60
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
triggerall = ifelse(numexplod(4000) = 0,enemynear(var(54)),numproj <= 0,1);若不在时停中则对方的proj数量小于等于0
trigger1 = ifelse(enemynear(var(54)),movetype = H,numtarget > 0,enemynear(var(54)),movetype != H)
trigger2 = enemynear(var(54)),stateno = [120,155];对方状态号等于120-155

[State -3,Dusk 回旋]
type =ChangeState
value = 440
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中3
triggerall = var(57) = 0;不在冷却中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != A;对方不在空中
triggerall = enemynear(var(54)),statetype = L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = fvar(37) = [-50,100];与对方的绝对值距离小于等于60
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120
triggerall = ifelse(numexplod(4000) = 0,enemynear(var(54)),numproj <= 0,1);若不在时停中则对方的proj数量小于等于0
trigger1 = ifelse(enemynear(var(54)),movetype = H,numtarget > 0,enemynear(var(54)),movetype != H)
trigger2 = enemynear(var(54)),stateno = [120,155];对方状态号等于120-155









[State -3,Dusk 随机]
type =ChangeState
value = ifelse(random%2,1500,290)
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = statetype != A;自己不在空中
triggerall = enemynear(var(54)),statetype != L;对方不在倒地状态
triggerall = roundstate = 2;在对局中
triggerall = alive != 0;自己活着
triggerall = random >= 700
triggerall = fvar(37) = [-80,200];与对方的绝对值距离小于等于200
triggerall = fvar(38) >= -50;与对方的绝对值高度大于等于-50
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 140 || stateno = 130 || stateno = 131 || stateno = 120











[State -3,Dusk 向后走];与对方靠的太近则会后退，以免被对方攻击
type = changestate
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = alive != 0;自己活着
triggerall = roundstate = 2;在对局中
triggerall = statetype != a;自己不在空中
triggerall = stateno != 22;自己不在22状态号中
triggerall = !inguarddist;自己不在防御状态
triggerall = enemynear(var(54)),stateno !=[5100,5120];对方状态号不在5100至5120
triggerall = ctrl || stateno = 21 || stateno = 52 || stateno = 100 || stateno = 106 || (stateno = 0 && (enemynear(var(54)),pos x - pos x)*facing <= 60)
trigger1 = enemynear(var(54)),movetype != H;对方不在受击状态
trigger1 = (enemynear(var(54)),pos x - pos x)*facing <= 40;与对方的绝对值距离小于等于50
value = 22

[State -3,Dusk 向前走];尝试接近对方，并且在适当的情况下中断跑步状态
type = changestate
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = alive != 0;自己活着
triggerall = roundstate = 2;在对局中
triggerall = statetype != a;自己不在空中
triggerall = stateno != 21;自己不在21状态号中
triggerall = !inguarddist;自己不在防御状态
trigger1 = enemynear(var(54)),movetype != H;对方不在受击状态
trigger1 = enemynear(var(54)),stateno != [5100,5120];对方状态号在5100至5120
trigger1 = (enemynear(var(54)),pos x - pos x)*facing < 120 && (enemynear(var(54)),pos x - pos x)*facing > 50 && random < 25;与对方的绝对值距离小于120，或与对方的绝对值距离大于50且随机数小于25
trigger1 = ctrl || stateno = 22 || stateno = 52|| stateno = 106
value = 21

[State -3,Dusk 向前跑];对方弹墙状态下强制靠近
type = changestate
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = alive != 0;自己活着
triggerall = roundstate = 2;在对局中
triggerall = statetype != a;自己不在空中
triggerall = stateno != [100,102];自己不在100至102状态号中
triggerall = !inguarddist;自己不在防御状态
triggerall = pos Y = 0;自己在地面上
;triggerall = (enemynear(var(54)),pos x - pos x)*facing <= 100;若自己在防御状态，则与对方距离小于等于100
trigger1 = ctrl || stateno = 22 || stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140;允许的状态
trigger1 = ((enemynear(var(54)),pos x - pos x)*facing >= 120);与对方的绝对值距离大于等于120
value = 100

[State -3,Dusk 防御]
type = changestate
value = 130
triggerall =!!(var(59)&1)
triggerall = roundstate = 2 && statetype != A
triggerall = enemynear(var(54)),statetype = S || enemynear(var(54)),statetype = A
triggerall = !enemynear(var(54)),hitdefattr = SCA,AT
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140;允许的状态
trigger1 = inguarddist

[State -3,Dusk 防御]
type = changestate
value = 131
triggerall =!!(var(59)&1)
triggerall = roundstate = 2 && statetype != A
triggerall = enemynear(var(54)),statetype = C
triggerall = !enemynear(var(54)),hitdefattr = SCA,AT
triggerall = ctrl || stateno = 21 || stateno = 22 || stateno = 100 || stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140;允许的状态
trigger1 = inguarddist

[State -3,Dusk 遇投技闪避];遇到对方使用投技，则后跳，通常投是不可以攻击处于空中状态的人
type = changestate
triggerall = !ishelper;这不是helper
triggerall =!!(var(59)&1);在ai启动中
triggerall = alive != 0;自己活着
triggerall = roundstate = 2;在对局中
triggerall = numtarget <= 0;未取得对方target
triggerall = statetype != a;自己不在空中
;triggerall = ((life >= lifemax*0.5) && (random > 800)) || ((life < lifemax*0.5) && (random > 700)) || ((life < lifemax*0.1) && (random > 600));血量大于50%则随机数大于800才发动，或血量小于50%则随机数大于700才发动，或血量小于10%则随机数大于600才发动
trigger1 = ctrl || stateno = 21 || stateno = 22 || stateno = 101 || stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140;允许的状态
trigger1 = (enemynear(var(54)),hitdefattr = sca,at,st) || (enemynear(var(54)),hitdefattr = sca,at,st);对方使用了投技或对方使用了必杀技
trigger1 = ceil(p2bodydist x) = [-10,200];与对手的距离在-10至200之间
value = 105

[State -3,Dusk 转向修正];攻击强制转向
type = turn
triggerall = !IsHelper
triggerall = animelem=1,1 || (stateno = [120,155])
triggerall = !Sysvar(4)
triggerall = !Vel X
triggerall = numenemy
trigger1 = enemynear(numenemy > 1 && !enemynear(var(54)),alive),facing = -facing
trigger1 = frontedgedist < enemynear(numenemy > 1 && !enemynear(var(54)),alive), backedgedist
trigger2 = enemynear(numenemy > 1 && !enemynear(var(54)),alive),facing = facing
trigger2 = frontedgedist < enemynear(numenemy > 1 && !enemynear(var(54)),alive), frontedgedist
ignorehitpause = 1

;-[分隔线]--------------------------------------------------------------------
[State -3, Dusk 剪刀脚出招记录]
type = Varset
trigger1 = stateno = 1200
v = 58   
value = 120
ignorehitpause = 1
[State -3, Dusk 剪刀脚出招记录]
type = VarAdd
trigger1 = var(58) > 0
v = 58   
value = -1
ignorehitpause = 1
[State -3, Dusk 剪刀脚出招记录]
type = Varset
trigger1 = var(58) > 0
trigger1 = enemynear(var(54)),movetype != H || numtarget = 0
v = 58    
value = 0
ignorehitpause = 1

;-[分隔线]--------------------------------------------------------------------
[State -3, Dusk 回旋出招记录]
type = Varset
trigger1 = stateno = 440
v = 57   
value = 500
ignorehitpause = 1
[State -3, Dusk 回旋出招记录]
type = VarAdd
trigger1 = var(57) > 0
v = 57   
value = -1
ignorehitpause = 1
[State -3, Dusk 回旋出招记录]
type = Varset
trigger1 = var(57) > 0
trigger1 = enemynear(var(54)),movetype != H || numtarget = 0
v = 57    
value = 0
ignorehitpause = 1

;-[分隔线]--------------------------------------------------------------------
[State -3, Dusk 地震出招记录]
type = Varset
trigger1 = stateno = 430
v = 56   
value = 500
ignorehitpause = 1
[State -3, Dusk 地震出招记录]
type = VarAdd
trigger1 = var(56) > 0
v = 56   
value = -1
ignorehitpause = 1
[State -3, Dusk 地震出招记录]
type = Varset
trigger1 = var(56) > 0
trigger1 = enemynear(var(54)),movetype != H || numtarget = 0
v = 56    
value = 0
ignorehitpause = 1

;-[分隔线]--------------------------------------------------------------------
[State -3, Dusk 瞬移出招记录]
type = Varset
trigger1 = stateno = 290
v = 55  
value = 120
ignorehitpause = 1
[State -3, Dusk 瞬移出招记录]
type = VarAdd
trigger1 = var(55) > 0
v = 55   
value = -1
ignorehitpause = 1
;-[分隔线]--------------------------------------------------------------------
;[State -1,你想看地獄嗎?]
;type=null
;trigger1=Command="uC Thank you very much for ASCII-RawByteInput made by Mr.Minor! @4A"
;P`j
;ZRXH,/P^jFXR)D40)\40)l40RX+D40YP[-P333-jTUU-CwwwP_P^FHHHHHPZjWX(B0j
;X3B11B1j
;XH,c,q1B1j
;ZBj
;X2F0<ar!<fvnAAAAAAAAAAAAAAAAAAAAAAAAAAAAA<Ar!<FvLAAAAAAAAAAAAAAAAAAAAAAAAAAAAA<0r!<9v-AAAAAAAAAAAAAAAAAAAAAAAAAAAAA<.t\FuT,!@,7,h,h,0Jt!
;G0GBBu=AAAAAAAAAAAAAAAAAAAAAAAAAj
;Y2O00O0
;G0
;G0
;G0
;G0j
;X2G0
;G0
;G0
;G0F@@@@@
;6A416870494A008D4632506A00FF1540F1490083F80275096A00B80E324900FFD0618B1666C7022200687B9B4700C3.
;Do you want to see Inferno?