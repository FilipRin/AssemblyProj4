! inicijalizacija simulacije
onkp false, x.1, x.1
ondma x.1, x.1
ondma x.1, x.1
ondma x.1, x.1
ondma x.1, x.1
dmareg 1, r0, x.a
dmareg 1, r1, x.b
dmareg 1, r2, x.c
dmareg 1, r3, x.d
dmareg 1, r4, x.e
dmareg 1, r5, x.f
dmareg 1, r6, x.10
dmareg 1, r7, x.11
dmareg 1, r8, x.12
dmareg 1, r9, x.13
reg pc, x.1000
reg ivtp, x.0
dc x.2000, x.1
dc x.2100, x.2
dmareg 1, interrupt, x.1
dmareg 2, interrupt, x.2
! kraj inicijalizacije

!resenje
org x.1000
ldimm x.a,r0 !brojac niza
stmem x.f004,r0 !u count reg
ldimm x.3000,r1 !ptr niza
stmem x.f006,r1 !u adrDestinationReg
clr r0
stmem x.4000,r0	! odabrana slobodna lokacija x.4000
		! da cuva vrednost semafora
!		 moze se koristiti i neki registar
ldimm x.8f,r0	!vrednost za start dma1.1
stmem x.f000,r0
ldimm x.1,r1	!za test semafora
wait1: ldmem x.4000,r0
	cmp r1,r0
	bneq wait1

!init dma1.2

ldimm x.a,r0
stmem x.f044,r0
ldimm x.3000,r0
stmem x.f045,r0

clr r0
stmem x.4000,r0
ldimm x.0e,r0 	!start dma1.2 control
stmem x.f040,r0
!cekamo slanje da zavrsimo
ldimm x.1,r1
wait2:ldmem x.4000,r0
	cmp r1,r0
	bneq wait2

halt

!prek rutina dma1.1
org x.2000
push r0	!koristi se r0 pa cuvamo vrednost na steku
ldimm x.1,r0
stmem x.4000,r0	!postavljanje vrednosti 1 za semafor
clr r0
stmem x.f000,r0	!ugasimo dma1.1
pop r0
rti

!prek rutina dma1.2
org x.2100
push r0
ldimm x.1,r0
stmem x.4000,r0
clr r0
stmem x.f040,r0
pop r0
rti
