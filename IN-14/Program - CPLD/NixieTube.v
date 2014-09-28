module NixieTube(clk, data, pwm, sel, out, en);
input clk;
input data;
input pwm;
input sel;
input en;
output [71:0]out;
reg [71:0]data1;
reg [71:0]data2;

always@ (posedge clk)
begin
	if (sel)
	begin
		data1 <= data1 << 1;
		data1[0] <= data;
	end else begin
		data2 <= data2 << 1;
		data2[0] <= data;
	end
end

assign out = (en == 1) ? 
			(pwm == 1) ? data1 : data2
			: 72'b0;
endmodule
								