----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2023 07:39:18 PM
-- Design Name: 
-- Module Name: ALUv4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OPCODE is
port(
         a : in std_logic_vector(7 downto 0);	
         b : in std_logic_vector(7 downto 0);
         Sus, Jos, Stanga, Dreapta, Centru : in std_logic;
         f : out std_logic_vector(7 downto 0)
	 );
end OPCODE;

architecture Behavioral of OPCODE is

begin
    process(Jos, Sus, Stanga, Dreapta, Centru)
	variable aux: std_logic_vector(7 downto 0);
	begin
	if Centru = '1' then
        aux:= "00000000";
    elsif Sus = '1' then
        aux:= std_logic_vector(to_unsigned((to_integer(unsigned(a)) + to_integer(unsigned(b))),8)) ;
    elsif Jos = '1' then
        aux:= std_logic_vector(to_unsigned((to_integer(unsigned(a)) - to_integer(unsigned(b))),8)) ;
    elsif Stanga = '1' then
        aux:= std_logic_vector(to_unsigned((to_integer(unsigned(a)) * to_integer(unsigned(b))),8)) ;
    elsif Dreapta = '1' then
        aux:= std_logic_vector(to_unsigned(to_integer(unsigned(a)) / to_integer(unsigned(b)),8)) ;
    end if;
    
	f <= aux;

    end process;

end Behavioral;

