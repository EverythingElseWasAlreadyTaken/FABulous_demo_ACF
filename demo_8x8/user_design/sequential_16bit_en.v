module sequential_16bit_en #(
    parameter WIDTH = 16
)(input wire clk, input wire [WIDTH-1:0] io_in, output wire [WIDTH-1:0] io_out, output wire [WIDTH-1:0] io_oeb);
    wire rst = io_in[0];
    wire en = io_in[1];
    reg [WIDTH-1:0] ctr;

    always @(posedge clk)
        if (en)
            if (rst)
                ctr <= 0;
            else
                ctr <= ctr + 1'b1;
        else
            ctr <= ctr;

    assign io_out = ctr;
    assign io_oeb = {WIDTH{1'b1}};
endmodule
