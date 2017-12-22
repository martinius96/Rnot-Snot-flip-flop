library IEEE; --kniznica
use IEEE.STD_LOGIC_1164.ALL; --pouzitie log. funkcii STD_LOGIC
entity rs_nand is --opis entity
   port(r, s : in std_logic;
           q, qb : out std_logic);
end rs_nand;

architecture rs_nand_arch of rs_nand is
signal tmp_q, tmp_qb : STD_LOGIC;
begin
  tmp_q  <= s NAND tmp_qb;
  tmp_qb <= r NAND tmp_q;

  q  <= tmp_q;
  qb <= tmp_qb;
end rs_nand_arch;
--------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity rs_nand_tb is --entita testbench
end rs_nand_tb ;
architecture tb of rs_nand_tb  is --architektura
   component rs_nand is -- komponent rs_nand je komponentom architektury tb, ktora je pod entitou rs_nand_tb
      port(r, s : in std_logic; --port komponentu s vstupmi
             q, qb : out std_logic); --vystupmi
   end component; --uknceny popis komponentu
   -------------
   signal r, s, q, qb : std_logic; --logicke signaly, ktore je mozne dalej opisat v port mappingu
   -------------
begin
 mapping: rs_nand port map(r, s, q, qb); --mapovanie portov pre danu entitu

 process --opis procesu. V procese je kod rovnocenny
    --s <= '0'; a r <= '0';
  -- je to isté ako  r <= '0'; a s <= '0';
  --rychlost vykonavania krokov v procese je identicka, nezalezi na poradi, riadku v kode
 begin --zaciatok opisu procesov (ktore mozu nastat, stavy)
 -------------TEST 1
   s <= '0';
   r <= '0';
   wait for 10 ns;
   assert(q = '1') report "Error 1"	severity error; --zakazany stav
   assert(qb = '1'); --funkcia assert vie nastavit stav výstupu, moze aj referovat chybu!
	----------TEST 2
   s <= '0';
   r <= '1';
   wait for 10 ns;
   assert(q = '1'); --
	assert(qb = '0');
   ----------TEST 3
   s <= '1';
   r <= '0';
   wait for 10 ns; --10ns caka v tomto stave
   assert(q = '0');
	assert(qb = '1');
	----------TEST 4
   s <= '1';
   r <= '1';
   wait for 10 ns;
   assert(q = q);
	assert(qb = not q);
   
    end process; --koniec opisu procesov
end tb; --koniec opisu architektury tb
configuration cfg_tb of rs_nand_tb is --konfiguracia test bench entity
   for tb --cyklus je prazdny, nema ziadnu specificku funkciu v nasom pripade
   end for; --koniec cyklu
end cfg_tb --koniec opisu konfiguracie
