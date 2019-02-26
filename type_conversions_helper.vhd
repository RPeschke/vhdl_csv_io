library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package type_conversions_pgk is


procedure integer_to_sl(signal I_in : in integer; signal SL_out : out STD_LOGIC);
procedure integer_to_slv(signal I_in : in integer; signal SLV_out : out STD_LOGIC_VECTOR);                                                                        
procedure integer_to_slv_var(signal I_in : in integer; SLV_out : out STD_LOGIC_VECTOR);   

procedure integer_to_integer(signal I_in : in integer; signal Int_out : out integer);      
procedure integer_to_natural(signal I_in : in integer; signal Natural_out : out natural);

procedure sl_to_integer(signal SL_in : in STD_LOGIC ; signal Int_out : out integer) ;

  procedure slv_to_integer(signal SLV_in : in STD_LOGIC_VECTOR ; signal Int_out : out integer);
  
  procedure natural_to_integer(signal Nat_in :in natural ; signal int_out :out integer);
end type_conversions_pgk;

package body type_conversions_pgk is
  
procedure natural_to_integer(signal Nat_in :in natural ; signal int_out :out integer) is begin 
  
  int_out <= Nat_in;
end procedure;


  procedure slv_to_integer(signal SLV_in : in STD_LOGIC_VECTOR ; signal Int_out : out integer) is begin
    Int_out <= to_integer(signed('0'&SLV_in));
  end procedure;

  procedure sl_to_integer(signal SL_in : in STD_LOGIC ; signal Int_out : out integer) is begin
    if (SL_in = '1') then 
      Int_out <=1;
    else 
      Int_out <=0;
    end if;

  end procedure;
  
  
  procedure integer_to_integer(signal I_in : in integer; signal Int_out : out integer) is begin

    Int_out<= I_in;
  end procedure;
  procedure integer_to_sl(signal I_in : in integer; signal SL_out : out STD_LOGIC) is begin 
    if (I_in>0) then 
      SL_out <= '1';
    else 
      SL_out <= '0';
    end if;

  end procedure;

  procedure integer_to_slv(signal I_in : in integer; signal SLV_out : out STD_LOGIC_VECTOR) is begin
    SLV_out<= std_logic_vector(to_unsigned(I_in, SLV_out'length));
  end procedure;

  procedure integer_to_slv_var(signal I_in : in integer; SLV_out : out STD_LOGIC_VECTOR) is begin
    SLV_out:= std_logic_vector(to_unsigned(I_in, SLV_out'length));

  end procedure;
  
  procedure integer_to_natural(signal I_in : in integer; signal Natural_out : out natural) is 
    variable I_in_buffer1 : STD_LOGIC_VECTOR(31 downto 0);
    variable I_in_buffer2 : natural:=0;

  begin
    integer_to_slv_var(I_in ,I_in_buffer1);

    I_in_buffer2  :=  to_integer(UNSIGNED(I_in_buffer1));
    Natural_out <=  I_in_buffer2 ;

  end procedure;
 
  
end package body type_conversions_pgk;
