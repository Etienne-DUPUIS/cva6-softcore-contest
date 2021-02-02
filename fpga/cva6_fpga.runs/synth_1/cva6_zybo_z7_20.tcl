# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/riscv/contest_Etienne/fpga/cva6_fpga.runs/synth_1/cva6_zybo_z7_20.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param general.maxThreads 2
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-82141-leom011/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-4480} -limit 1000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -id {[Synth 8-5858]}  -new_severity {INFO} 
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/riscv/contest_Etienne/fpga/cva6_fpga.cache/wt [current_project]
set_property parent.project_path /home/riscv/contest_Etienne/fpga/cva6_fpga.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-20:part0:1.0 [current_project]
set_property ip_output_repo /home/riscv/contest_Etienne/fpga/cva6_fpga.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs {
  /home/riscv/contest_Etienne/fpga/src/axi_sd_bridge/include
  /home/riscv/contest_Etienne/src/common_cells/include
} [current_fileset]
set_property verilog_define PS7_DDR=PS7_DDR [current_fileset]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog {
  /home/riscv/contest_Etienne/fpga/src/zybo-z7-20-ddr.svh
  /home/riscv/contest_Etienne/src/common_cells/include/common_cells/registers.svh
}
set_property file_type "Verilog Header" [get_files /home/riscv/contest_Etienne/fpga/src/zybo-z7-20-ddr.svh]
set_property is_global_include true [get_files /home/riscv/contest_Etienne/fpga/src/zybo-z7-20-ddr.svh]
set_property file_type "Verilog Header" [get_files /home/riscv/contest_Etienne/src/common_cells/include/common_cells/registers.svh]
set_property is_global_include true [get_files /home/riscv/contest_Etienne/src/common_cells/include/common_cells/registers.svh]
read_verilog -library xil_defaultlib -sv {
  /home/riscv/contest_Etienne/src/fpga-support/rtl/SyncSpRamBeNx64.sv
  /home/riscv/contest_Etienne/include/riscv_pkg.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dm_pkg.sv
  /home/riscv/contest_Etienne/include/ariane_pkg.sv
  /home/riscv/contest_Etienne/src/alu.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/amo_alu.sv
  /home/riscv/contest_Etienne/src/amo_buffer.sv
  /home/riscv/contest_Etienne/fpga/src/apb_timer/apb_timer.sv
  /home/riscv/contest_Etienne/src/register_interface/src/apb_to_reg.sv
  /home/riscv/contest_Etienne/tb/ariane_soc_pkg.sv
  /home/riscv/contest_Etienne/src/axi/src/axi_pkg.sv
  /home/riscv/contest_Etienne/include/ariane_axi_pkg.sv
  /home/riscv/contest_Etienne/src/ariane.sv
  /home/riscv/contest_Etienne/src/register_interface/src/reg_intf_pkg.sv
  /home/riscv/contest_Etienne/fpga/src/ariane_peripherals_xilinx.sv
  /home/riscv/contest_Etienne/src/ariane_regfile_ff.sv
  /home/riscv/contest_Etienne/fpga/src/axi2apb/src/axi2apb_64_32.sv
  /home/riscv/contest_Etienne/src/axi_mem_if/src/axi2mem.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_AR_allocator.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_AW_allocator.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_BR_allocator.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_BW_allocator.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_DW_allocator.sv
  /home/riscv/contest_Etienne/src/axi_adapter.sv
  /home/riscv/contest_Etienne/src/axi_adapter_32.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_address_decoder_AR.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_address_decoder_AW.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_address_decoder_BR.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_address_decoder_BW.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_address_decoder_DW.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_ar_buffer.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_aw_buffer.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_b_buffer.sv
  /home/riscv/contest_Etienne/src/axi/src/axi_cut.sv
  /home/riscv/contest_Etienne/include/axi_intf.sv
  /home/riscv/contest_Etienne/src/axi/src/axi_join.sv
  /home/riscv/contest_Etienne/src/clint/axi_lite_interface.sv
  /home/riscv/contest_Etienne/src/util/axi_master_connect.sv
  /home/riscv/contest_Etienne/src/axi/src/axi_multicut.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_multiplexer.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_node.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_node_arbiter.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_node_intf_wrap.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_node_wrap_with_slices.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_r_buffer.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_request_block.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_res_tbl.sv
  /home/riscv/contest_Etienne/src/axi_node/src/axi_response_block.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_riscv_amos.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_riscv_amos_alu.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_riscv_atomics.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_riscv_atomics_wrap.sv
  /home/riscv/contest_Etienne/src/axi_riscv_atomics/src/axi_riscv_lrsc.sv
  /home/riscv/contest_Etienne/src/axi_shim.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_single_slice.sv
  /home/riscv/contest_Etienne/src/util/axi_slave_connect.sv
  /home/riscv/contest_Etienne/fpga/src/axi_slice/src/axi_w_buffer.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/axis_gmii_rx.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/axis_gmii_tx.sv
  /home/riscv/contest_Etienne/src/frontend/bht.sv
  /home/riscv/contest_Etienne/fpga/src/bootrom/bootrom.sv
  /home/riscv/contest_Etienne/src/branch_unit.sv
  /home/riscv/contest_Etienne/src/frontend/btb.sv
  /home/riscv/contest_Etienne/include/std_cache_pkg.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/cache_ctrl.sv
  /home/riscv/contest_Etienne/src/common_cells/src/cdc_2phase.sv
  /home/riscv/contest_Etienne/src/clint/clint.sv
  /home/riscv/contest_Etienne/src/tech_cells_generic/src/cluster_clock_inverter.sv
  /home/riscv/contest_Etienne/src/commit_stage.sv
  /home/riscv/contest_Etienne/src/compressed_decoder.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv
  /home/riscv/contest_Etienne/src/controller.sv
  /home/riscv/contest_Etienne/src/csr_buffer.sv
  /home/riscv/contest_Etienne/src/csr_regfile.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/debug_rom/debug_rom.sv
  /home/riscv/contest_Etienne/src/decoder.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dm_csrs.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dm_mem.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dm_sba.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dm_top.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dmi_cdc.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dmi_jtag.sv
  /home/riscv/contest_Etienne/src/riscv-dbg/src/dmi_jtag_tap.sv
  /home/riscv/contest_Etienne/src/dromajo_ram.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/dualmem_widen.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/dualmem_widen8.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/eth_mac_1g.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/eth_mac_1g_rgmii.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/eth_mac_1g_rgmii_fifo.sv
  /home/riscv/contest_Etienne/src/ex_stage.sv
  /home/riscv/contest_Etienne/src/common_cells/src/exp_backoff.sv
  /home/riscv/contest_Etienne/src/common_cells/src/deprecated/fifo_v1.sv
  /home/riscv/contest_Etienne/src/common_cells/src/deprecated/fifo_v2.sv
  /home/riscv/contest_Etienne/src/common_cells/src/fifo_v3.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_pkg.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_cast_multi.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_classifier.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_divsqrt_multi.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_fma.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_fma_multi.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_noncomp.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_opgroup_block.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_opgroup_fmt_slice.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_opgroup_multifmt_slice.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_rounding.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpnew_top.sv
  /home/riscv/contest_Etienne/src/fpu_wrap.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/framing_top.sv
  /home/riscv/contest_Etienne/src/frontend/frontend.sv
  /home/riscv/contest_Etienne/src/id_stage.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/iddr.sv
  /home/riscv/contest_Etienne/src/frontend/instr_queue.sv
  /home/riscv/contest_Etienne/src/instr_realign.sv
  /home/riscv/contest_Etienne/src/frontend/instr_scan.sv
  /home/riscv/contest_Etienne/src/issue_read_operands.sv
  /home/riscv/contest_Etienne/src/issue_stage.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv
  /home/riscv/contest_Etienne/src/common_cells/src/lfsr_8bit.sv
  /home/riscv/contest_Etienne/src/load_store_unit.sv
  /home/riscv/contest_Etienne/src/load_unit.sv
  /home/riscv/contest_Etienne/src/common_cells/src/lzc.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/miss_handler.sv
  /home/riscv/contest_Etienne/src/mmu.sv
  /home/riscv/contest_Etienne/tb/common/mock_uart.sv
  /home/riscv/contest_Etienne/src/mult.sv
  /home/riscv/contest_Etienne/src/multiplier.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/oddr.sv
  /home/riscv/contest_Etienne/src/perf_counters.sv
  /home/riscv/contest_Etienne/src/rv_plic/rtl/plic_regmap.sv
  /home/riscv/contest_Etienne/src/rv_plic/rtl/plic_top.sv
  /home/riscv/contest_Etienne/src/pmp/src/pmp.sv
  /home/riscv/contest_Etienne/src/pmp/src/pmp_entry.sv
  /home/riscv/contest_Etienne/src/common_cells/src/popcount.sv
  /home/riscv/contest_Etienne/src/fpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv
  /home/riscv/contest_Etienne/src/ptw.sv
  /home/riscv/contest_Etienne/src/tech_cells_generic/src/pulp_clock_mux2.sv
  /home/riscv/contest_Etienne/src/frontend/ras.sv
  /home/riscv/contest_Etienne/src/re_name.sv
  /home/riscv/contest_Etienne/src/register_interface/src/reg_intf.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/rgmii_core.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/rgmii_lfsr.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/rgmii_phy_if.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/rgmii_soc.sv
  /home/riscv/contest_Etienne/src/common_cells/src/rr_arb_tree.sv
  /home/riscv/contest_Etienne/src/common_cells/src/rstgen.sv
  /home/riscv/contest_Etienne/src/common_cells/src/rstgen_bypass.sv
  /home/riscv/contest_Etienne/src/rv_plic/rtl/rv_plic_gateway.sv
  /home/riscv/contest_Etienne/src/rv_plic/rtl/rv_plic_target.sv
  /home/riscv/contest_Etienne/src/scoreboard.sv
  /home/riscv/contest_Etienne/src/serdiv.sv
  /home/riscv/contest_Etienne/src/common_cells/src/shift_reg.sv
  /home/riscv/contest_Etienne/src/common_cells/src/spill_register.sv
  /home/riscv/contest_Etienne/src/util/sram.sv
  /home/riscv/contest_Etienne/fpga/src/ariane-ethernet/ssio_ddr_in.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/std_cache_subsystem.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/std_icache.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/std_nbdcache.sv
  /home/riscv/contest_Etienne/src/store_buffer.sv
  /home/riscv/contest_Etienne/src/store_unit.sv
  /home/riscv/contest_Etienne/src/common_cells/src/stream_arbiter.sv
  /home/riscv/contest_Etienne/src/common_cells/src/stream_arbiter_flushable.sv
  /home/riscv/contest_Etienne/src/common_cells/src/stream_demux.sv
  /home/riscv/contest_Etienne/src/common_cells/src/stream_mux.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/tag_cmp.sv
  /home/riscv/contest_Etienne/fpga/src/apb_timer/timer.sv
  /home/riscv/contest_Etienne/src/tlb.sv
  /home/riscv/contest_Etienne/src/common_cells/src/unread.sv
  /home/riscv/contest_Etienne/include/wt_cache_pkg.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_axi_adapter.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_cache_subsystem.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_dcache.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_dcache_ctrl.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_dcache_mem.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_dcache_missunit.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_dcache_wbuffer.sv
  /home/riscv/contest_Etienne/src/cache_subsystem/wt_icache.sv
  /home/riscv/contest_Etienne/fpga/src/cva6_zybo_z7_20.sv
}
read_vhdl -library xil_defaultlib {
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/apb_uart.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_clock_div.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_counter.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_edge_detect.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_fifo.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_input_filter.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_input_sync.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/slib_mv_filter.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/uart_baudgen.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/uart_interrupt.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/uart_receiver.vhd
  /home/riscv/contest_Etienne/fpga/src/apb_uart/src/uart_transmitter.vhd
}
read_ip -quiet /home/riscv/contest_Etienne/fpga/xilinx/xlnx_processing_system7/ip/xlnx_processing_system7.xci
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_processing_system7/ip/xlnx_processing_system7.xdc]

read_ip -quiet /home/riscv/contest_Etienne/fpga/xilinx/xlnx_clk_gen/ip/xlnx_clk_gen.xci
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_clk_gen/ip/xlnx_clk_gen_board.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_clk_gen/ip/xlnx_clk_gen.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_clk_gen/ip/xlnx_clk_gen_ooc.xdc]

read_ip -quiet /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_master/ip/xlnx_axi_dwidth_converter_dm_master.xci
set_property used_in_synthesis false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_master/ip/xlnx_axi_dwidth_converter_dm_master_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_master/ip/xlnx_axi_dwidth_converter_dm_master_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_master/ip/xlnx_axi_dwidth_converter_dm_master_ooc.xdc]

read_ip -quiet /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_slave/ip/xlnx_axi_dwidth_converter_dm_slave.xci
set_property used_in_synthesis false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_slave/ip/xlnx_axi_dwidth_converter_dm_slave_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_slave/ip/xlnx_axi_dwidth_converter_dm_slave_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/riscv/contest_Etienne/fpga/xilinx/xlnx_axi_dwidth_converter_dm_slave/ip/xlnx_axi_dwidth_converter_dm_slave_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/riscv/contest_Etienne/fpga/constraints/zybo_z7_20.xdc
set_property used_in_implementation false [get_files /home/riscv/contest_Etienne/fpga/constraints/zybo_z7_20.xdc]

read_xdc /home/riscv/contest_Etienne/fpga/constraints/cva6_fpga.xdc
set_property used_in_implementation false [get_files /home/riscv/contest_Etienne/fpga/constraints/cva6_fpga.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top cva6_zybo_z7_20 -part xc7z020clg400-1 -retiming
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cva6_zybo_z7_20.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file cva6_zybo_z7_20_utilization_synth.rpt -pb cva6_zybo_z7_20_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
