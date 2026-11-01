`timescale 1ns/1ps  //time_delay/percision

module testBenchJKFlipflop;

	reg J;
	reg K;
	reg clk = 0;
	wire Q;
	wire nQ;

	JKFlipflop dut (.clk(clk), .J(J), .K(K), .Q(Q), .nQ(nQ));	 
 

	always #5 clk = ~clk; //cycle clk from 1 to 0 every 5[ns] thus 1

	initial begin 
		
		$dumpfile("JKFlipflop.vcd");		//surfer waveform viewer
		$dumpvars(0,testBenchJKFlipflop);	//surfer waveform viewer
	
		$monitor("t=%0t, clk=%b, J=%b, K=%b, S=%b, R=%b | Q=%b, nQ=%b", /*port list*/ 
			$time, clk, J, K, dut.S, dut.R, Q, nQ); //signal list

		J=0; K=0; #10; //NO CHANGE
		J=1; K=0; #10; //SET nQ=0
		J=1; K=1; #10; //toggle 
		J=0; K=1; #10; //RESET nQ=1
	
		$finish;
	
	end
	
endmodule
