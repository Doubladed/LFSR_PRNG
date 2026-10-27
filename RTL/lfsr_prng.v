// 8-Bit pseudo random number generator using lfsr

module lfsr_prng(

	input clk, rstn,
	output reg [7:0] out
);

	wire feedback;

	// Primitive Polynomial, P(x) found using Galois Field, GF(2)
	// To cycle through all 255 possible combinations of 8 bits since 2^N - 1 

	// P(x) = x^8 + x^6 + x^5 + x^4 + 1
	// GF(2) addition is the same as XOR

	assign feedback = out[7] ^ out[5] ^ out[4] ^ out[3]; 

	always @(posedge clk or negedge rstn) begin

		if (!rstn) begin

			// Initial Seed, must not be all 0's
			out <= 8'b1001_1001;
		end
		else begin

			out <= {out[6:0], feedback};
		end
	end
endmodule
