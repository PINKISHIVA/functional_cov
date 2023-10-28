//design.sv

module full_addr(
  input logic a,b,c,
  output logic sum,cout);
  
  assign sum =a^b^c;
  assign cout =(a&b)|(a^b)&c;
  
endmodule 
