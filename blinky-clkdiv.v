`define LEDS_NR 6
`define INV_BTN 0
`define NUM_HCLK 1

module top (
	input clk,
	input key_i,
	input rst_i,
	output [`LEDS_NR-1:0] led
);

/* Expected Result: 
    - 1 or 2 LEDs blinking, depending on your board.
    - The `faster` LED is associated with the input clock.
    - The `slower` LED is associated with a divided clock.
    - On boards with multiple CLKDIVs, the slower LED's blink rate changes as it cycles through CLKDIVs
      configured with different DIV_MODES.
    - If your board has only one LED, it should blink with the divided clock.
    - Holding the appropriate button should stop the blinking.
*/

localparam /*string*/ DIV_MODE_2 = "2";
localparam /*string*/ DIV_MODE_35 = "3.5";
localparam /*string*/ DIV_MODE_4 = "4";
localparam /*string*/ DIV_MODE_5 = "5";


wire key = key_i ^ `INV_BTN;
wire rst = rst_i ^ `INV_BTN;

reg [25:0] ctr_q;
wire [25:0] ctr_d;
// localparam NUM_HCLKi=NUM_HCLK;

wire [`NUM_HCLK-1:0] hclk_counts;
reg [$clog2(`NUM_HCLK)-1:0] curr_hclk_idx; 
wire curr_hclk; 
reg [30:0] sup_count; 

wire clkout;
wire div2_out;
wire o_clk;

assign clkout = clk;

CLKDIV2 my_div2 (
	.RESETN(1'b1),
	.HCLKIN(clkout),
	.CLKOUT(div2_out)
);

CLKDIV my_div (
	.RESETN(1'b1),
	.HCLKIN(div2_out),
	.CLKOUT(o_clk)
);
defparam my_div.DIV_MODE="5";

reg flip;
always @(posedge o_clk)begin
	flip <= ~flip;
end
assign led[1] = flip; 

endmodule
