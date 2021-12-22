Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC9047D4CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 17:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhLVQGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 11:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhLVQGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 11:06:33 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FC1C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:06:33 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id j185so4599726oif.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rRI80y4BXBHNvelipvgB5I7wmg7BL+5/Nuj8zm8qgyU=;
        b=iH5Dyi0saxidvhERvJcf6Zlaw4wud7cn8rMzhyv9jIyDX0zSw0+K+LYHfwHGnUSvmv
         RLxqAHZjZdjlE0fq2T94gRezD+ut3OLo0R+/21DxLBNwgIFyMbDaopJ128tnGHgSs6GN
         YcX44H7pqrTncDFXR/hJAMr2ZdDm7CWsQPTRxyhZjXYh+Zki0C3oRkh3CSphg7phM8m4
         8jQM6HmH8LYYxPSa+Fd7jDXlOSNFJ2ngvQBLlf1TA+zcCClu91iDX3mx0NocHqZr27aZ
         /7M89nOKh/VQQteRu2rHdTaS0jFiWCV+9kaYd6y3o7PZLxaxil5RpxXEBTL6khT/aSOI
         QcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rRI80y4BXBHNvelipvgB5I7wmg7BL+5/Nuj8zm8qgyU=;
        b=OkyJj2oMVwm4hilfjJH5GaLJsOEdUbpYLUkjCT7aPph5avEqRUtbNMPBGvZFTyv2Lk
         exXj8LZImPTt/tRNDFtrBREtw7ZJyIr1pMA3f4YloUOob264jP0DEFLR4uOJjFG7G3Hw
         dAhe9kiWNEJPkQGx1R31rwYHiZrOr+8h6DL7EdTlUUDiKW/axjME2t6b+DoHKHOMHyOU
         3I4MtJcqhpPsWFAz7W+yHKaa1ExvJZuEN9Tx79N7VwaNzxS7hnBzi8kwCOgZqXKKRBBb
         nAv7lRBWVeyaHRt25PlZu4KGMJriCnVLSGnHYXNHhkbWkknFJoAWbyzAtUeUzeUvNMOp
         PnMg==
X-Gm-Message-State: AOAM530GQ/bJWa5ptokgJKTHqnWTtw/JfLaYwjEcLAY77JFGHg6XomC0
        5CzymYU5/0kpTQgQXj2w1fzM5w==
X-Google-Smtp-Source: ABdhPJwF8nUSzjVTn1K0Ju/93qCb+1lYB7eHfa8YQoIt5d1mR82hkpcFd7mdKW+fSJi9MykcXqJ06g==
X-Received: by 2002:a05:6808:2205:: with SMTP id bd5mr1249876oib.12.1640189192292;
        Wed, 22 Dec 2021 08:06:32 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q2sm418467otg.64.2021.12.22.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 08:06:31 -0800 (PST)
Date:   Wed, 22 Dec 2021 08:07:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable drivers for
 DragonBoard 410c
Message-ID: <YcNNSmSfqGlZRzpp@ripper>
References: <20211213113250.4249-1-stephan@gerhold.net>
 <20211213113250.4249-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213113250.4249-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Dec 03:32 PST 2021, Stephan Gerhold wrote:

> The DragonBoard 410c is mainly supported by the ARM64 architecture
> and defconfig, but it can also run well on the ARM32 architecture.
> Add the necessary options to the multi_v7_defconfig to simplify
> building an ARM32 kernel for DragonBoard 410c.
> 
> This is also a possible opportunity to slightly increase CI coverage
> for older Qualcomm-based ARM32 platforms that are currently not
> represented well in automated CI setups. The APQ8016 SoC used in DB410c
> is still quite similar to those. DB410c is already used in some CI systems
> so the same hardware could be re-used to get some basic ARM32 boot testing.
> 
> When deciding between built-in (y) and module (m), I usually used the
> same that is already being used (and functional) in the ARM64 defconfig.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/configs/multi_v7_defconfig | 57 ++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index c951aeed2138..ae227d309dc1 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -75,6 +75,7 @@ CONFIG_SOC_AM43XX=y
>  CONFIG_SOC_DRA7XX=y
>  CONFIG_ARCH_QCOM=y
>  CONFIG_ARCH_MSM8X60=y
> +CONFIG_ARCH_MSM8916=y
>  CONFIG_ARCH_MSM8960=y
>  CONFIG_ARCH_MSM8974=y
>  CONFIG_ARCH_ROCKCHIP=y
> @@ -109,11 +110,13 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
>  CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
>  CONFIG_CPUFREQ_DT=y
>  CONFIG_ARM_IMX6Q_CPUFREQ=y
> +CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
>  CONFIG_ARM_SCMI_CPUFREQ=y
>  CONFIG_QORIQ_CPUFREQ=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_ARM_CPUIDLE=y
> +CONFIG_ARM_PSCI_CPUIDLE=y
>  CONFIG_ARM_ZYNQ_CPUIDLE=y
>  CONFIG_ARM_EXYNOS_CPUIDLE=y
>  CONFIG_ARM_TEGRA_CPUIDLE=y
> @@ -157,6 +160,8 @@ CONFIG_IPV6_MIP6=m
>  CONFIG_IPV6_TUNNEL=m
>  CONFIG_IPV6_MULTIPLE_TABLES=y
>  CONFIG_NET_DSA=m
> +CONFIG_QRTR=m
> +CONFIG_QRTR_SMD=m
>  CONFIG_CAN=y
>  CONFIG_CAN_AT91=m
>  CONFIG_CAN_FLEXCAN=m
> @@ -169,6 +174,7 @@ CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_BCM=y
>  CONFIG_BT_MRVL=m
>  CONFIG_BT_MRVL_SDIO=m
> +CONFIG_BT_QCOMSMD=m
>  CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
>  CONFIG_RFKILL=y
> @@ -225,6 +231,7 @@ CONFIG_AD525X_DPOT_I2C=y
>  CONFIG_ICS932S401=y
>  CONFIG_ATMEL_SSC=m
>  CONFIG_QCOM_COINCELL=m
> +CONFIG_QCOM_FASTRPC=m
>  CONFIG_APDS9802ALS=y
>  CONFIG_ISL29003=y
>  CONFIG_PCI_ENDPOINT_TEST=m
> @@ -288,6 +295,7 @@ CONFIG_USB_LAN78XX=m
>  CONFIG_USB_USBNET=y
>  CONFIG_USB_NET_SMSC75XX=y
>  CONFIG_USB_NET_SMSC95XX=y
> +CONFIG_WCN36XX=m
>  CONFIG_BRCMFMAC=m
>  CONFIG_MWIFIEX=m
>  CONFIG_MWIFIEX_SDIO=m
> @@ -316,6 +324,7 @@ CONFIG_TOUCHSCREEN_ST1232=m
>  CONFIG_TOUCHSCREEN_STMPE=y
>  CONFIG_TOUCHSCREEN_SUN4I=y
>  CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_PM8941_PWRKEY=y
>  CONFIG_INPUT_MAX77693_HAPTIC=m
>  CONFIG_INPUT_MAX8997_HAPTIC=m
>  CONFIG_INPUT_CPCAP_PWRBUTTON=m
> @@ -397,6 +406,8 @@ CONFIG_I2C_IMX=y
>  CONFIG_I2C_MESON=y
>  CONFIG_I2C_MV64XXX=y
>  CONFIG_I2C_OWL=y
> +CONFIG_I2C_QCOM_CCI=m
> +CONFIG_I2C_QUP=y
>  CONFIG_I2C_RIIC=y
>  CONFIG_I2C_RK3X=y
>  CONFIG_I2C_S3C2410=y
> @@ -425,6 +436,7 @@ CONFIG_SPI_ORION=y
>  CONFIG_SPI_PL022=y
>  CONFIG_SPI_ROCKCHIP=m
>  CONFIG_SPI_RSPI=y
> +CONFIG_SPI_QUP=m
>  CONFIG_SPI_S3C64XX=m
>  CONFIG_SPI_SH_MSIOF=m
>  CONFIG_SPI_SH_HSPI=y
> @@ -475,6 +487,8 @@ CONFIG_GPIO_TWL4030=y
>  CONFIG_POWER_RESET_AS3722=y
>  CONFIG_POWER_RESET_GPIO=y
>  CONFIG_POWER_RESET_GPIO_RESTART=y
> +CONFIG_POWER_RESET_MSM=y
> +CONFIG_POWER_RESET_QCOM_PON=y
>  CONFIG_POWER_RESET_ST=y
>  CONFIG_POWER_RESET_KEYSTONE=y
>  CONFIG_POWER_RESET_RMOBILE=y
> @@ -515,6 +529,7 @@ CONFIG_ST_THERMAL_MEMMAP=y
>  CONFIG_TEGRA_SOCTHERM=m
>  CONFIG_TEGRA30_TSENSOR=m
>  CONFIG_GENERIC_ADC_THERMAL=m
> +CONFIG_QCOM_TSENS=y
>  CONFIG_UNIPHIER_THERMAL=y
>  CONFIG_DA9063_WATCHDOG=m
>  CONFIG_XILINX_WATCHDOG=y
> @@ -530,11 +545,13 @@ CONFIG_SUNXI_WATCHDOG=y
>  CONFIG_IMX2_WDT=y
>  CONFIG_ST_LPC_WATCHDOG=y
>  CONFIG_TEGRA_WATCHDOG=m
> +CONFIG_QCOM_WDT=m
>  CONFIG_MESON_WATCHDOG=y
>  CONFIG_DIGICOLOR_WATCHDOG=y
>  CONFIG_RENESAS_WDT=m
>  CONFIG_RENESAS_RZAWDT=m
>  CONFIG_STPMIC1_WATCHDOG=y
> +CONFIG_PM8916_WATCHDOG=m
>  CONFIG_BCM47XX_WDT=y
>  CONFIG_BCM2835_WDT=y
>  CONFIG_BCM_KONA_WDT=y
> @@ -601,7 +618,8 @@ CONFIG_REGULATOR_PALMAS=y
>  CONFIG_REGULATOR_PBIAS=y
>  CONFIG_REGULATOR_PWM=y
>  CONFIG_REGULATOR_QCOM_RPM=y
> -CONFIG_REGULATOR_QCOM_SMD_RPM=m
> +CONFIG_REGULATOR_QCOM_SMD_RPM=y
> +CONFIG_REGULATOR_QCOM_SPMI=y
>  CONFIG_REGULATOR_RK808=y
>  CONFIG_REGULATOR_RN5T618=y
>  CONFIG_REGULATOR_S2MPA01=m
> @@ -687,6 +705,7 @@ CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
>  CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
>  CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
>  CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_NXP_PTN3460=m
>  CONFIG_DRM_PARADE_PS8622=m
>  CONFIG_DRM_SII902X=m
> @@ -736,6 +755,8 @@ CONFIG_SND_SOC_FSL_SAI=m
>  CONFIG_SND_PXA_SOC_SSP=m
>  CONFIG_SND_MMP_SOC_SSPA=m
>  CONFIG_SND_PXA910_SOC=m
> +CONFIG_SND_SOC_QCOM=m
> +CONFIG_SND_SOC_APQ8016_SBC=m
>  CONFIG_SND_SOC_ROCKCHIP=m
>  CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
>  CONFIG_SND_SOC_ROCKCHIP_MAX98090=m
> @@ -768,6 +789,8 @@ CONFIG_SND_SOC_TEGRA_MAX98090=m
>  CONFIG_SND_SOC_AK4642=m
>  CONFIG_SND_SOC_CPCAP=m
>  CONFIG_SND_SOC_CS42L51_I2C=m
> +CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
> +CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
>  CONFIG_SND_SOC_SGTL5000=m
>  CONFIG_SND_SOC_STI_SAS=m
>  CONFIG_SND_SOC_WM8978=m
> @@ -930,6 +953,7 @@ CONFIG_RTC_DRV_AT91SAM9=m
>  CONFIG_RTC_DRV_VT8500=y
>  CONFIG_RTC_DRV_SUNXI=y
>  CONFIG_RTC_DRV_MV=y
> +CONFIG_RTC_DRV_PM8XXX=m
>  CONFIG_RTC_DRV_TEGRA=y
>  CONFIG_RTC_DRV_ST_LPC=y
>  CONFIG_RTC_DRV_STM32=y
> @@ -977,26 +1001,47 @@ CONFIG_COMMON_CLK_SCMI=y
>  CONFIG_COMMON_CLK_S2MPS11=m
>  CONFIG_CLK_RASPBERRYPI=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_QCOM_A53PLL=y
> +CONFIG_QCOM_CLK_APCS_MSM8916=y
>  CONFIG_QCOM_CLK_RPM=y
> +CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_APQ_MMCC_8084=y
>  CONFIG_MSM_GCC_8660=y
> +CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_MMCC_8960=y
>  CONFIG_MSM_MMCC_8974=y
> +CONFIG_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_MICROCHIP_PIT64B=y
>  CONFIG_BCM2835_MBOX=y
> +CONFIG_QCOM_APCS_IPC=y
> +CONFIG_QCOM_IPCC=y
>  CONFIG_ROCKCHIP_IOMMU=y
>  CONFIG_TEGRA_IOMMU_GART=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_EXYNOS_IOMMU=y
> +CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
> +CONFIG_QCOM_Q6V5_MSS=m
> +CONFIG_QCOM_SYSMON=m
> +CONFIG_QCOM_WCNSS_PIL=m
>  CONFIG_ST_REMOTEPROC=m
> +CONFIG_RPMSG_QCOM_SMD=y
>  CONFIG_RPMSG_VIRTIO=m
>  CONFIG_ASPEED_LPC_CTRL=m
>  CONFIG_ASPEED_LPC_SNOOP=m
>  CONFIG_ASPEED_P2A_CTRL=m
>  CONFIG_RASPBERRYPI_POWER=y
> +CONFIG_QCOM_CPR=y
>  CONFIG_QCOM_GSBI=y
> -CONFIG_QCOM_SMD_RPM=m
> +CONFIG_QCOM_RMTFS_MEM=m
> +CONFIG_QCOM_RPMPD=y
> +CONFIG_QCOM_SMEM=y
> +CONFIG_QCOM_SMD_RPM=y
> +CONFIG_QCOM_SMP2P=y
> +CONFIG_QCOM_SMSM=y
> +CONFIG_QCOM_SOCINFO=m
> +CONFIG_QCOM_STATS=m
>  CONFIG_QCOM_WCNSS_CTRL=m
>  CONFIG_ARCH_EMEV2=y
>  CONFIG_ARCH_R8A7794=y
> @@ -1029,6 +1074,7 @@ CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
>  CONFIG_EXTCON_MAX14577=m
>  CONFIG_EXTCON_MAX77693=m
>  CONFIG_EXTCON_MAX8997=m
> +CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_TI_AEMIF=y
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_EXYNOS5422_DMC=m
> @@ -1041,6 +1087,7 @@ CONFIG_BERLIN2_ADC=m
>  CONFIG_CPCAP_ADC=m
>  CONFIG_EXYNOS_ADC=m
>  CONFIG_MESON_SARADC=m
> +CONFIG_QCOM_SPMI_VADC=m
>  CONFIG_ROCKCHIP_SARADC=m
>  CONFIG_STM32_ADC_CORE=m
>  CONFIG_STM32_ADC=m
> @@ -1086,6 +1133,7 @@ CONFIG_PHY_BERLIN_USB=y
>  CONFIG_PHY_MMP3_USB=m
>  CONFIG_PHY_CPCAP_USB=m
>  CONFIG_PHY_QCOM_APQ8064_SATA=m
> +CONFIG_PHY_QCOM_USB_HS=y
>  CONFIG_PHY_RCAR_GEN2=m
>  CONFIG_PHY_ROCKCHIP_DP=m
>  CONFIG_PHY_ROCKCHIP_USB=y
> @@ -1103,6 +1151,7 @@ CONFIG_TI_PIPE3=y
>  CONFIG_TWL4030_USB=m
>  CONFIG_RAS=y
>  CONFIG_NVMEM_IMX_OCOTP=y
> +CONFIG_QCOM_QFPROM=y
>  CONFIG_ROCKCHIP_EFUSE=m
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_NVMEM_VF610_OCOTP=y
> @@ -1115,6 +1164,8 @@ CONFIG_FSI_MASTER_ASPEED=m
>  CONFIG_FSI_SCOM=m
>  CONFIG_FSI_SBEFIFO=m
>  CONFIG_FSI_OCC=m
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
>  CONFIG_COUNTER=m
>  CONFIG_STM32_TIMER_CNT=m
>  CONFIG_STM32_LPTIMER_CNT=m
> @@ -1154,6 +1205,8 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
>  CONFIG_CRYPTO_DEV_ATMEL_TDES=m
>  CONFIG_CRYPTO_DEV_ATMEL_SHA=m
>  CONFIG_CRYPTO_DEV_MARVELL_CESA=m
> +CONFIG_CRYPTO_DEV_QCE=m
> +CONFIG_CRYPTO_DEV_QCOM_RNG=m
>  CONFIG_CRYPTO_DEV_ROCKCHIP=m
>  CONFIG_CRYPTO_DEV_STM32_CRC=m
>  CONFIG_CRYPTO_DEV_STM32_HASH=m
> -- 
> 2.34.1
> 
