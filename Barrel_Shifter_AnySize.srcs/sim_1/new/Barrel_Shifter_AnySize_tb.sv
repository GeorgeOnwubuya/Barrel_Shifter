`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2019 10:47:48 AM
// Design Name: 
// Module Name: Barrel_Shifter_AnyBITS_tb
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


module Barrel_Shifter_AnySize_tb();

    logic clk = 0;
  	logic [7:0] in = 0;
    logic [7:0] out;
    logic [7:0] desired_out = 0;
  	logic [2:0] shamt; //shift amount
    
  	Barrel_Shifter_AnySize dut(.*);
    
    always begin
    #5; 
    clk = ~clk;
    end
    
    initial begin
      	$dumpfile("dump.vcd");
      	$dumpvars;
      
        in = 8'b10100001;
       
      	repeat(2)@(posedge clk);
      
      	shamt = 3'b111;
      
      	repeat(1)@(posedge clk);
        
      case(shamt)  
        3'b000: begin
        	desired_out = in;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_0
            	$display("right result");
          	end  
          	else
            	$error("wrong result");
		end
        
        3'b001: begin
        	desired_out = 8'hd0;
           	repeat(2)@(posedge clk);
           
          	assert(out==desired_out) begin:verify_1
            	$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
		3'b010: begin
			desired_out = 8'h68;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_2
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        3'b011: begin
			desired_out = 8'h34;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_3
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        3'b100: begin
			desired_out = 8'h1a;
          	repeat(2)@(posedge clk);
          
          assert(out==desired_out) begin:verify_4
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        3'b101: begin
			desired_out = 8'h0d;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_5
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        3'b110: begin
			desired_out = 8'h86;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_6
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        3'b111: begin
			desired_out = 8'h43;
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_7
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
       	end
        
        default: begin
          	desired_out = in;
          	
          	repeat(2)@(posedge clk);
          
          	assert(out==desired_out) begin:verify_8
          		$display("right result");
          	end  
          	else
            	$error("wrong result");
        end  
          
        endcase  
      	$display("Shitfted Value : %d", out);
      	$finish();
    end
endmodule

