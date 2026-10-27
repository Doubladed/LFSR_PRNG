`timescale 1ns/1ps

module tb_lfsr_prng;

        logic clk, rstn;
        logic [7:0] out;

lfsr_prng prng(

	.clk(clk), .rstn(rstn),
        .out(out)
);

initial begin

	$vcdpluson;
end

initial begin

	clk = 1'b0;
	forever #5 clk = ~clk; 
end

initial begin

	$monitor("PRNG = %b (%0d)", out, out);
end

initial begin

	rstn = 1'b0;

	@(negedge clk);

	rstn = 1'b1;

	repeat(256) @(negedge clk);

	$finish;
end

endmodule
