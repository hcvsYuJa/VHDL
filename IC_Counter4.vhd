Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity IC_Counter4 is
port(CLK:in std_Logic;
	 CLR:in std_Logic;
	 Selout:in std_Logic;
	 A:out std_logic;
	 B:out std_logic;
	 C:out std_logic;
	 D:out std_logic
);
end entity;
architecture Data of IC_Counter4 is
signal cnt:std_Logic_vector(1 downto 0):="00";
--signal ;
begin
	process(CLK,CLR)
		begin
		if CLR='1' then
			cnt<="00";
		elsif CLK='0' and CLK'event then
			cnt<=cnt+1;
		end if;
	end process;
	process(cnt)
		variable result_Out:std_Logic_vector(3 downto 0);
	begin
		if Selout='0' then
		result_Out:="1111";
	elsif Selout='1' then
		result_Out:="0000";
	end if;
	case cnt is
		when "00" => --A
			result_Out(0):=Selout;
		when "01" => --B
			result_Out(1):=Selout;
		when "10" => --C
			result_Out(2):=Selout;
		when "11" => --D
			result_Out(3):=Selout;
	end case;
		A<=result_Out(0);
		B<=result_Out(1);
		C<=result_Out(2);
		D<=result_Out(3);
	end process;
end Data;
