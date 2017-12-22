library IEEE; --kniznica IEEE
use IEEE.STD_LOGIC_1164.ALL; --pouzitie IEEE.STD_LOGIC pre vyuzitie STD_LOGIC FUNKCII

entity rs_nand is -- popis entity
Port (r,s: in  STD_LOGIC; -- definovany port s log.vstupmi R, S
      q,qb : out STD_LOGIC); -- VYSTUPY Q QB
end rs_nand; --koniec popisu entity

architecture rs_nand_arch of rs_nand is --popis architektury

signal tmp_q, tmp_qb : STD_LOGIC; -- vytvorenie logickych signalov tmp_q a tmp_qb

begin
  tmp_q  <= s NAND tmp_qb; -- popis signalu architektury na NAND hradle
  tmp_qb <= r NAND tmp_q; -- popis signalu architektury na NAND hradle

  q  <= tmp_q; -- priradenie signalu tmp_q pre vystup q
  qb <= tmp_qb; -- priradenie signalu tmp_qb pre vystup qb
end rs_nand_arch; --koniec popisu architektury