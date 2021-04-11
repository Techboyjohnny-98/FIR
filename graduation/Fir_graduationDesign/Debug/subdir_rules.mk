################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
%.obj: ../%.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1030/ccs/tools/compiler/ti-cgt-c2000_20.2.4.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="/Users/techboyjohnny/Documents/f2833x/headers/include" --include_path="/Users/techboyjohnny/Documents/f2833x/common/include" --include_path="/Users/techboyjohnny/workspace_v10/Fir_graduationDesign" --include_path="/Applications/ti/ccs1030/ccs/tools/compiler/ti-cgt-c2000_20.2.4.LTS/include" --advice:performance=all -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs1030/ccs/tools/compiler/ti-cgt-c2000_20.2.4.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="/Users/techboyjohnny/Documents/f2833x/headers/include" --include_path="/Users/techboyjohnny/Documents/f2833x/common/include" --include_path="/Users/techboyjohnny/workspace_v10/Fir_graduationDesign" --include_path="/Applications/ti/ccs1030/ccs/tools/compiler/ti-cgt-c2000_20.2.4.LTS/include" --advice:performance=all -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


