            add_file -type cst tangnano9k.cst
            add_file -type verilog blinky-clkdiv.v
            #add_file -type netlist impl/gwsynthesis/project.vg
            set_device -name GW1NR-9C GW1NR-LV9QN88PC6/I5
            set_option  -gen_posp 1 -gen_io_cst 1 -gen_ibis 1 -ireg_in_iob 0 -oreg_in_iob 0 -ioreg_in_iob 0 -timing_driven 0 -cst_warn_to_error 0 -use_jtag_as_gpio 0 -use_sspi_as_gpio 1 -use_mspi_as_gpio 1 -use_ready_as_gpio 0 -use_done_as_gpio 0 -use_reconfign_as_gpio 0 -use_mode_as_gpio 1 -use_i2c_as_gpio 1 -bit_crc_check 1 -bit_compress 0 -bit_encrypt 0 -bit_security 1 -bit_incl_bsram_init 0 -loading_rate 250/100 -spi_flash_addr 0x00FFF000 -bit_format txt -bg_programming off -secure_mode 0
            run pnr
            
