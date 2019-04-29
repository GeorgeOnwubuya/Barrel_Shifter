`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2019 09:43:06 AM
// Design Name: 
// Module Name: Barrel_Shifter_AnyBITS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Barrel_Shifter_AnySize #(parameter BITS = 8, LOGBITS = $clog2(BITS))
    (
        input  logic clk, 
        input  logic [BITS-1:0] in,
        input  logic [LOGBITS-1:0] shamt,
        output logic [BITS-1:0] out  
    );

 	//signal declarations
 	logic[BITS - 1 : 0] int_wires [LOGBITS : 0];
  	assign out = int_wires[LOGBITS];
 	assign int_wires[0] = in;
  
    genvar i;
    generate
        for(i = 0; i < LOGBITS; i++) begin: tumbler
        	assign int_wires[i + 1] = shamt[i] ? {int_wires[i][2**i - 1:0],int_wires[i][BITS - 1 : 2**i]} : int_wires[i];
        end
      		
    endgenerate   
endmodule
