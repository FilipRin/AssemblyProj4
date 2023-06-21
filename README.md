# AssemblyProj4
Transfer of data between DMA controllers
----------------------------------------
ENG
- Write a program that loads a string of length Ah from the DMA1.1 controller into memory starting at address 3000h.
The DMA controller works in burst mode. After that, the loaded string is sent to the DMA1.2 controller in
cycle-stealing mode.
The interrupt routines for DMA1.1 and DMA1.2 are located at addresses 2000h and 2100h, respectively. Table IV is
set, as well as the entry numbers within the entry registers of these two controllers. The main program should be located
starting from the address 1000h

SRB
- Napisati program koji učitava niz dužine Ah sa DMA1.1 kontrolera u memoriju počev od adrese 3000h.
DMA kontroler radi u paketskom režimu rada. Nakon toga učitani niz poslati DMA1.2 kontroleru u
pojedinačnom režimu rada.
Prekidne rutine za DMA1.1 i DMA1.2 se nalaze na adresama 2000h i 2100h, respektivno. IV tabela je
podešena, kao i brojevi ulaza unutar entry registara ova dva kontrolera. Glavni program treba smestiti
počev od adrese 1000h
