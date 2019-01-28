library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --Addition utan tecken

entity basic_config is
	port(
			sw : in std_logic_vector(9 downto 0);
			key_n : in std_logic_vector(3 downto 0);
			ledr : out std_logic_vector(9 downto 0);
			ledg : out std_logic_vector(7 downto 0));
end entity basic_config;

architecture basic_config_rtl of basic_config is

signal s_clk : std_logic;
signal s_reset : std_logic;

begin
	s_clk <= not key_n(0);
	s_reset <= not  key_n(1);
	
	p_a : process(s_clk, s_reset)
	begin		
		if s_reset = '1' then
			ledr <= "0000000000";
		elsif rising_edge(s_clk)then
			ledr <= "1111111111";
		end if;
	end process p_a;
end architecture basic_config_rtl;