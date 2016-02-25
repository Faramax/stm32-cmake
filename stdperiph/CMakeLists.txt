PROJECT(stm32stdperiph)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
ENABLE_LANGUAGE(ASM)

IF(NOT DEFINED CMSIS_INCLUDE_DIR)
    FIND_PACKAGE(CMSIS REQUIRED)
ENDIF()

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/../cmake/locate_stdperiph_source.cmake)

STM32_LOCATE_STDPERIPH_LIB()

INCLUDE_DIRECTORIES(${STM32_STDPERIPH_INCLUDE_DIRECTORIES})
SET(STDPERIPH_HEADERS ${STM32_STDPERIPH_HEADERS})

SET(STDPERIPH_SOURCE_DIR ${STM32_STDPERIPH_PATH}/src)
SET(STDPERIPH_HEADER_DIR ${STM32_STDPERIPH_PATH}/inc)

IF(${STM32_FAMILY} STREQUAL "F0")
    SET(STDPERIPH_SOURCES
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_adc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_can.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_cec.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_comp.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_crc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_dbgmcu.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_dma.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_exti.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_flash.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_gpio.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_i2c.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_iwdg.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_misc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_pwr.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_rcc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_rtc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_spi.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_syscfg.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_tim.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_usart.c
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_wwdg.c
    )

    SET(STDPERIPH_SOURCES_051
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_dac.c
    )
    SET(STDPERIPH_SOURCES_071
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_dac.c
    )
    SET(STDPERIPH_SOURCES_072
        ${STDPERIPH_SOURCE_DIR}/stm32f0xx_dac.c
    )
    
ELSEIF(${STM32_FAMILY} STREQUAL "F1")
    
    SET(STDPERIPH_SOURCES
        ${STDPERIPH_SOURCE_DIR}/misc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_adc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_bkp.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_can.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_cec.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_crc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_dac.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_dbgmcu.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_dma.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_exti.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_flash.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_fsmc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_gpio.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_i2c.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_iwdg.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_pwr.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_rcc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_rtc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_sdio.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_spi.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_tim.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_usart.c
        ${STDPERIPH_SOURCE_DIR}/stm32f10x_wwdg.c
    )
    
    LIST(REMOVE_ITEM STDPERIPH_HEADERS ${STDPERIPH_HEADER_DIR}/stm32f10x_misc.h)
    INSTALL(FILES ${STDPERIPH_HEADER_DIR}/misc.h RENAME stm32f10x_misc.h DESTINATION include/stm32f1)
ELSEIF(${STM32_FAMILY} STREQUAL "F2")
    
    IF(EXISTS "${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal.c")
        MESSAGE(STATUS "Detected STM32F2 HAL library")
        SET(STDPERIPH_SOURCES
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_adc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_adc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_can.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_cortex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_crc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_cryp.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_dac.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_dac_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_dcmi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_dma.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_dma_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_eth.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_flash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_flash_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_gpio.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_hash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_hcd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_i2c.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_i2s.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_irda.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_iwdg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_msp_template.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_nand.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_nor.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_pccard.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_pcd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_pwr.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_pwr_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_rcc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_rcc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_rng.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_rtc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_rtc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_sd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_smartcard.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_spi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_sram.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_tim.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_tim_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_uart.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_usart.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hal_wwdg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_ll_fsmc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_ll_sdmmc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_ll_usb.c
        )
        STM32_PREPEND_FILE_NAMES(STDPERIPH_HEADERS ${STDPERIPH_HEADER_DIR}/ ${STM32_STDPERIPH_REL_HEADERS_HAL_F2})

    ELSE()
        SET(STDPERIPH_SOURCES
            ${STDPERIPH_SOURCE_DIR}/misc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_adc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_can.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_crc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_cryp.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_cryp_aes.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_cryp_des.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_cryp_tdes.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_dac.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_dbgmcu.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_dcmi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_dma.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_exti.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_flash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_fsmc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_gpio.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hash_md5.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_hash_sha1.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_i2c.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_iwdg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_pwr.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_rcc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_rng.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_rtc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_sdio.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_spi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_syscfg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_tim.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_usart.c
            ${STDPERIPH_SOURCE_DIR}/stm32f2xx_wwdg.c
        )
        
        LIST(REMOVE_ITEM STDPERIPH_HEADERS ${STDPERIPH_HEADER_DIR}/stm32f2xx_misc.h)
        INSTALL(FILES ${STDPERIPH_HEADER_DIR}/misc.h RENAME stm32f2xx_misc.h DESTINATION include/stm32f2)
    ENDIF()

ELSEIF(${STM32_FAMILY} STREQUAL "F4")
    
    SET(STDPERIPH_SOURCES
        ${STDPERIPH_SOURCE_DIR}/misc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_adc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_can.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_crc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_cryp.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_cryp_aes.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_cryp_des.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_cryp_tdes.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_dac.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_dbgmcu.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_dcmi.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_dma.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_dma2d.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_exti.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_flash.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_gpio.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_hash.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_hash_md5.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_hash_sha1.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_i2c.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_iwdg.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_ltdc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_pwr.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_rcc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_rng.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_rtc.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_sai.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_sdio.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_spi.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_syscfg.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_tim.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_usart.c
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_wwdg.c
    )
    
    SET(STDPERIPH_SOURCES_40_41xxx
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_fsmc.c
    )
    SET(STDPERIPH_SOURCES_427_437xx
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_fmc.c
    )
    SET(STDPERIPH_SOURCES_429_439xx
        ${STDPERIPH_SOURCE_DIR}/stm32f4xx_fmc.c
    )
        
    LIST(REMOVE_ITEM STDPERIPH_HEADERS ${STDPERIPH_HEADER_DIR}/stm32f4xx_misc.h)
    INSTALL(FILES ${STDPERIPH_HEADER_DIR}/misc.h RENAME stm32f4xx_misc.h DESTINATION include/stm32f4)

ELSEIF(${STM32_FAMILY} STREQUAL "F7")

    IF(EXISTS "${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal.c")
        MESSAGE(STATUS "Detected STM32F7 HAL library")
        SET(STDPERIPH_SOURCES
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_adc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_adc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_can.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_cec.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_cortex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_crc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_crc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_cryp.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_cryp_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dac.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dac_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dcmi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dcmi_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dma.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dma_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_dma2d.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_eth.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_flash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_flash_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_gpio.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_hash.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_hash_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_hcd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_i2c.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_i2c_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_i2s.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_irda.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_iwdg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_lptim.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_ltdc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_msp_template.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_nand.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_nor.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_pcd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_pcd_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_pwr.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_pwr_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_qspi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_rcc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_rcc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_rng.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_rtc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_rtc_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_sai.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_sai_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_sd.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_sdram.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_smartcard.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_smartcard_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_spdifrx.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_spi.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_sram.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_tim.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_tim_ex.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_uart.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_usart.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_hal_wwdg.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_ll_fmc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_ll_sdmmc.c
            ${STDPERIPH_SOURCE_DIR}/stm32f7xx_ll_usb.c
        )
        STM32_PREPEND_FILE_NAMES(STDPERIPH_HEADERS ${STDPERIPH_HEADER_DIR}/ ${STM32_STDPERIPH_REL_HEADERS_HAL_F7})
        STM32_PREPEND_FILE_NAMES(STDPERIPH_HEADER_DIRECTORIES ${STDPERIPH_HEADER_DIR}/ ${STM32_STDPERIPH_HEADER_DIRECTORIES_HAL_F7})
   ELSE()
      MESSAGE(ERROR "STM32F7 HAL library haven't beed detected")
   ENDIF()
ENDIF()

INCLUDE_DIRECTORIES(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMSIS_INCLUDE_DIR}
)

IF(USE_ASSERT)
    ADD_DEFINITIONS("-D\"assert_param(expr)\"=\"((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))\"")
ELSE()
    ADD_DEFINITIONS("-D\"assert_param(expr)\"=\"((void)0)\"")
ENDIF()

STRING(TOLOWER ${STM32_FAMILY} STM32_FAMILY_LOWER)
ADD_CUSTOM_TARGET(stdperiph_${STM32_FAMILY_LOWER})

STM32_GET_SELECTED_CHIP_TYPES(CMSIS_BUILD_FOR_CHIP_TYPES)
FOREACH(CHIP_TYPE ${CMSIS_BUILD_FOR_CHIP_TYPES})
    STRING(TOLOWER ${CHIP_TYPE} CHIP_TYPE_LOWER)
    
    LIST(APPEND STDPERIPH_LIBRARIES stdperiph_${STM32_FAMILY_LOWER}_${CHIP_TYPE_LOWER})
    SET(TARGET_NAME stdperiph_${STM32_FAMILY_LOWER}_${CHIP_TYPE_LOWER})
    ADD_LIBRARY(${TARGET_NAME} ${STDPERIPH_SOURCES} ${STDPERIPH_SOURCES_${CHIP_TYPE}})
    STM32_SET_CHIP_DEFINITIONS(${TARGET_NAME} ${CHIP_TYPE})
    ADD_DEPENDENCIES(stdperiph_${STM32_FAMILY_LOWER} ${TARGET_NAME})
ENDFOREACH()

INSTALL(TARGETS ${STDPERIPH_LIBRARIES} RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
INSTALL(FILES ${STDPERIPH_HEADERS} DESTINATION include/stm32${STM32_FAMILY_LOWER})
INSTALL(DIRECTORY ${STDPERIPH_HEADER_DIRECTORIES} DESTINATION include/stm32${STM32_FAMILY_LOWER})
