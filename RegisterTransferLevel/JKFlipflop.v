module JKFlipflop (

	input wire J,
	input wire K,
	input wire clk,
	output wire Q,
	output wire nQ

);
	
	wire S;
	wire R;
	
	
	assign S = ~(J & clk & nQ);
	assign R = ~(K & clk & Q);
 	assign Q = ~(S & nQ);
	assign nQ = ~(R & Q);
endmodule


