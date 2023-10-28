//write a functional coverage for full_adder

module tb_full_addr();
  logic a,b,c;
  logic sum,cout;
  
  full_addr Dut(.*);
  
  initial begin 
    {a,b,c}=0;
    for(int i=0;i<7;i++)
      begin
        {a,b,c}=i;
        #20;
      end 
  end 
  
  covergroup cg;
    option.per_instance=1;
    A:    coverpoint a;
    B:    coverpoint b;
    C:    coverpoint c;
    SUM:  coverpoint sum;
    COUT: coverpoint cout;
  endgroup 
  
  cg cg_h;
  initial 
    begin 
      cg_h=new();
      $monitor ($time,"a=%0b,b=%0b,c=%0b,sum=%0b,cout=%0b",a,b,c,sum,cout);
      repeat(20)
        begin
          #10;
          cg_h.sample();
        end
    end
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars;
    end 
  
endmodule 
