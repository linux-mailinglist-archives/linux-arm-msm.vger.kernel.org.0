Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A613032360E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 04:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhBXDcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 22:32:21 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30560 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233418AbhBXDcD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 22:32:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614137497; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=glMWfEKveaTT2wZGHyqDYNLPww9uubpB8hoGFVn+YkQ=; b=OVasNU5ryLylbwiVd8Gp7kuhIEq2sfan+gUEuBw4AmqeLDm85F6WDKVgecc+TvMRNaFkR78J
 TREZHSPUAECsLTMVnWH68cOJKd80StST9hUnMcyrxrKcZDieTNraFAVjzMgbivZBYhE+pBi8
 V/t3yvwOLiof2D4zUbhGDl6S/qk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6035c86aba086638307cad87 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:30:50
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F69DC43461; Wed, 24 Feb 2021 03:30:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        UPPERCASE_50_75,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33974C433CA;
        Wed, 24 Feb 2021 03:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33974C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 1/3] bus: mhi: core: Introduce internal register poll helper function
Date:   Tue, 23 Feb 2021 19:30:39 -0800
Message-Id: <1614137441-18872-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614137441-18872-1-git-send-email-bbhatt@codeaurora.org>
References: <1614137441-18872-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce helper function to allow MHI core driver to poll for
a value in a register field. This helps reach a common path to
read and poll register values along with a retry time interval.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 arch/arm64/configs/defconfig    | 76 ++++++++++++++++-------------------------
 drivers/bus/mhi/core/internal.h |  3 ++
 drivers/bus/mhi/core/main.c     | 23 +++++++++++++
 3 files changed, 55 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8383016..b3bc98a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -13,7 +13,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_HUGETLB=y
@@ -66,7 +65,6 @@ CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_SCHED_SMT=y
 CONFIG_NUMA=y
-CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_KEXEC_FILE=y
 CONFIG_CRASH_DUMP=y
@@ -84,7 +82,6 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=m
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
-CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
@@ -102,14 +99,12 @@ CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
-CONFIG_QCOM_SCM=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
 CONFIG_ACPI=y
 CONFIG_ACPI_APEI=y
 CONFIG_ACPI_APEI_GHES=y
-CONFIG_ACPI_APEI_PCIEAER=y
 CONFIG_ACPI_APEI_MEMORY_FAILURE=y
 CONFIG_ACPI_APEI_EINJ=y
 CONFIG_VIRTUALIZATION=y
@@ -182,14 +177,14 @@ CONFIG_NET_ACT_GATE=m
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
 CONFIG_QRTR_TUN=m
+CONFIG_QRTR_MHI=m
 CONFIG_BPF_JIT=y
 CONFIG_CAN=m
+CONFIG_CAN_FLEXCAN=m
 CONFIG_CAN_RCAR=m
 CONFIG_CAN_RCAR_CANFD=m
-CONFIG_CAN_FLEXCAN=m
 CONFIG_BT=m
 CONFIG_BT_HIDP=m
-# CONFIG_BT_HS is not set
 # CONFIG_BT_LE is not set
 CONFIG_BT_LEDS=y
 # CONFIG_BT_DEBUGFS is not set
@@ -226,13 +221,13 @@ CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_LAYERSCAPE=y
-CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_HISI=y
 CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_HISI_STB=y
 CONFIG_PCIE_TEGRA194_HOST=m
+CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
@@ -242,8 +237,9 @@ CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_HISILICON_LPC=y
 CONFIG_SIMPLE_PM_BUS=y
-CONFIG_FSL_MC_BUS=y
 CONFIG_TEGRA_ACONNECT=m
+CONFIG_MHI_BUS=y
+CONFIG_MHI_BUS_DEBUG=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -263,7 +259,6 @@ CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
@@ -348,18 +343,18 @@ CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_QCOM_IPA=m
-CONFIG_MDIO_BUS_MUX_MMIOREG=y
-CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
+CONFIG_MESON_GXL_PHY=m
 CONFIG_AQUANTIA_PHY=y
 CONFIG_MARVELL_PHY=m
 CONFIG_MARVELL_10G_PHY=m
-CONFIG_MESON_GXL_PHY=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_REALTEK_PHY=m
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_VITESSE_PHY=y
+CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_USB_PEGASUS=m
 CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=m
@@ -461,6 +456,7 @@ CONFIG_SPI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
+CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_FSL_LPSPI=y
 CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_NXP_FLEXSPI=y
@@ -523,9 +519,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
-CONFIG_POWER_AVS=y
-CONFIG_QCOM_CPR=y
-CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
 CONFIG_POWER_RESET_XGENE=y
@@ -533,9 +526,9 @@ CONFIG_POWER_RESET_SYSCON=y
 CONFIG_SYSCON_REBOOT_MODE=y
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
-CONFIG_SENSORS_ARM_SCMI=y
 CONFIG_BATTERY_MAX17042=m
 CONFIG_CHARGER_BQ25980=m
+CONFIG_SENSORS_ARM_SCMI=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
@@ -546,10 +539,10 @@ CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-CONFIG_QORIQ_THERMAL=m
-CONFIG_SUN8I_THERMAL=y
 CONFIG_IMX_SC_THERMAL=m
 CONFIG_IMX8MM_THERMAL=m
+CONFIG_QORIQ_THERMAL=m
+CONFIG_SUN8I_THERMAL=y
 CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
@@ -566,7 +559,6 @@ CONFIG_WATCHDOG=y
 CONFIG_SL28CPLD_WATCHDOG=m
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_ARM_SBSA_WATCHDOG=y
-CONFIG_ARM_SMC_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
 CONFIG_DW_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=m
@@ -575,6 +567,7 @@ CONFIG_IMX_SC_WDT=m
 CONFIG_QCOM_WDT=m
 CONFIG_MESON_GXBB_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=m
+CONFIG_ARM_SMC_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_BCM2835_WDT=y
@@ -622,13 +615,12 @@ CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
 CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
 CONFIG_MEDIA_SDR_SUPPORT=y
-CONFIG_MEDIA_CONTROLLER=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_MEDIA_PLATFORM_SUPPORT=y
 # CONFIG_DVB_NET is not set
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_RCAR_CSI2=m
 CONFIG_VIDEO_RCAR_VIN=m
 CONFIG_VIDEO_SUN6I_CSI=m
@@ -643,7 +635,6 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
-CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_MALI_DISPLAY=m
@@ -677,8 +668,8 @@ CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
-CONFIG_DRM_NWL_MIPI_DSI=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_NWL_MIPI_DSI=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_THINE_THC63LVD1024=m
@@ -711,7 +702,6 @@ CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
-CONFIG_SND_SOC_FSL_SAI=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
 CONFIG_SND_SOC_FSL_EASRC=m
@@ -750,7 +740,6 @@ CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
-CONFIG_USB_CONN_GPIO=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
@@ -887,14 +876,13 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
-CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
 CONFIG_CROS_EC_SPI=y
 CONFIG_CROS_EC_CHARDEV=m
-CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_RK808=y
+CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
@@ -914,8 +902,8 @@ CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
-CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_6018=y
+CONFIG_IPQ_GCC_8074=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
@@ -923,12 +911,9 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SC_GCC_7180=y
 CONFIG_SDM_CAMCC_845=m
-CONFIG_SDM_GCC_845=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_GCC_8150=y
-CONFIG_SM_GCC_8250=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_QCOM_HFPLL=y
@@ -960,6 +945,7 @@ CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
+CONFIG_QCOM_CPR=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
@@ -971,28 +957,27 @@ CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_APR=m
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
+CONFIG_ARCH_R8A77995=y
+CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77950=y
 CONFIG_ARCH_R8A77951=y
+CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77960=y
 CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77995=y
+CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A779A0=y
+CONFIG_ARCH_R8A774C0=y
+CONFIG_ARCH_R8A774E1=y
+CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774B1=y
+CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
-CONFIG_ARCH_K3_AM6_SOC=y
-CONFIG_ARCH_K3_J721E_SOC=y
 CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_EXTCON_PTN5150=m
 CONFIG_EXTCON_USB_GPIO=y
@@ -1052,9 +1037,9 @@ CONFIG_PHY_UNIPHIER_USB3=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_ARM_SMMU_V3_PMU=m
 CONFIG_FSL_IMX8_DDR_PMU=m
-CONFIG_HISI_PMU=y
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
+CONFIG_HISI_PMU=y
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_SCU=y
 CONFIG_QCOM_QFPROM=y
@@ -1070,11 +1055,9 @@ CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
 CONFIG_TEE=y
 CONFIG_OPTEE=y
-CONFIG_SLIMBUS=m
+CONFIG_MUX_MMIO=y
 CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
-CONFIG_MUX_MMIO=y
-CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
@@ -1095,7 +1078,6 @@ CONFIG_CUSE=m
 CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
 CONFIG_HUGETLBFS=y
-CONFIG_CONFIGFS_FS=y
 CONFIG_EFIVAR_FS=y
 CONFIG_SQUASHFS=y
 CONFIG_NFS_FS=y
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 6f80ec3..005286b 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
 				    u32 shift, u32 *out);
+int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset, u32 mask,
+				    u32 shift, u32 val, u32 delayus);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
 void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4e0131b..249ae26 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
+int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset,
+				    u32 mask, u32 shift, u32 val, u32 delayus)
+{
+	int ret = -ENOENT;
+	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
+
+	while (retry--) {
+		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
+					 &out);
+		if (ret)
+			return -EIO;
+
+		if (out == val)
+			return 0;
+
+		udelay(delayus);
+	}
+
+	return ret;
+}
+
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

