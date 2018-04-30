# Vivado 2018.1
set project_directory ./
set project_name "VC707_mig"

create_project -force $project_name $project_directory

set board_part "xilinx.com:vc707:part0:1.3"
set_property "board_part" $board_part [current_project]

set_property "default_lib" "xil_defaultlib" [current_project]
set_property "simulator_language" "Mixed" [current_project]
set_property "target_language" "VHDL" [current_project]

set design_bd_tcl_file "design_1.tcl"
source $design_bd_tcl_file
regenerate_bd_layout
save_bd_design
set design_bd_name  [get_bd_designs]
make_wrapper -files [get_files $design_bd_name.bd] -top -import
