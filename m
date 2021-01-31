Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D813099DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhAaBlA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:41:00 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:47149 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhAaBk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:26 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 8C05B1F6D5;
        Sun, 31 Jan 2021 02:39:24 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 04/18] arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994
Date:   Sun, 31 Jan 2021 02:38:35 +0100
Message-Id: <20210131013853.55810-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This saves a good thousand lines of code, perhaps even
more in the long run.

Co-authored-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8992-bullhead-rev-101.dts     |   2 +-
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |  39 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 772 +-----------------
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |   6 +-
 4 files changed, 36 insertions(+), 783 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index cacbfdbd69e3..23cdcc9f7c72 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -283,7 +283,7 @@ pmi8994_regulators: pmi8994-regulators {
 	};
 };
 
-&sdhc_1 {
+&sdhc1 {
 	status = "okay";
 
 	mmc-hs400-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 5dab8ee0c7d3..357d55496e75 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -70,21 +70,6 @@ ramoops@dfc00000 {
 			pmsg-size = <0x20000>;
 		};
 
-		continuous_splash: framebuffer@3401000{
-			reg = <0x0 0x3401000 0x0 0x2200000>;
-			no-map;
-		};
-
-		dfps_data_mem: dfps_data_mem@3400000 {
-			reg = <0x0 0x3400000 0x0 0x1000>;
-			no-map;
-		};
-
-		peripheral_region: peripheral_region@7400000 {
-			reg = <0x0 0x7400000 0x0 0x1c00000>;
-			no-map;
-		};
-
 		modem_region: modem_region@9000000 {
 			reg = <0x0 0x9000000 0x0 0x5a00000>;
 			no-map;
@@ -97,43 +82,49 @@ tzapp: modem_region@ea00000 {
 	};
 };
 
-&blsp_i2c2 {
+&blsp1_i2c2 {
 	status = "okay";
 
 	/* Atmel or Synaptics touchscreen */
 };
 
-&blsp_i2c5 {
+&blsp1_i2c5 {
 	status = "okay";
 
-	/* Silabs si4705 FM transmitter */
+	/* ST lsm6db0 gyro/accelerometer */
 };
 
-&blsp_i2c6 {
+&blsp1_i2c6 {
 	status = "okay";
 
-	/* NCI NFC,
+	/*
+	 * NXP NCI NFC,
 	 * TI USB320 Type-C controller,
 	 * Pericom 30216a USB (de)mux switch
 	 */
 };
 
-&blsp_i2c7 {
+&blsp2_i2c1 {
 	status = "okay";
 
 	/* cm36686 proximity and ambient light sensor */
 };
 
-&blsp_i2c13 {
+&blsp2_i2c5 {
 	status = "okay";
 
-	/* ST lsm6db0 gyro/accelerometer */
+	/* Silabs si4705 FM transmitter */
 };
 
 &blsp2_uart2 {
 	status = "okay";
 };
 
+&peripheral_region {
+	reg = <0x0 0x7400000 0x0 0x1c00000>;
+	no-map;
+};
+
 &rpm_requests {
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
@@ -364,7 +355,7 @@ pmi8994_bby: boost-bypass {
 	};
 };
 
-&sdhc_1 {
+&sdhc1 {
 	status = "okay";
 
 	mmc-hs400-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index b2046497dcaa..58fe58cc7703 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -2,767 +2,29 @@
 /* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,gcc-msm8994.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
+#include "msm8994.dtsi"
 
-/ {
-	interrupt-parent = <&intc>;
+/* 8992 only features 2 A57 cores. */
+/delete-node/ &CPU6;
+/delete-node/ &CPU7;
+/delete-node/ &cpu6_map;
+/delete-node/ &cpu7_map;
 
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	chosen { };
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		CPU0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x0>;
-			next-level-cache = <&L2_0>;
-			enable-method = "psci";
-			L2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-			};
-		};
-
-		CPU1: cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x1>;
-			next-level-cache = <&L2_0>;
-			enable-method = "psci";
-		};
-
-		CPU2: cpu@2 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x2>;
-			next-level-cache = <&L2_0>;
-			enable-method = "psci";
-		};
-
-		CPU3: cpu@3 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			reg = <0x0 0x3>;
-			next-level-cache = <&L2_0>;
-			enable-method = "psci";
-		};
-
-		CPU4: cpu@100 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a57";
-			reg = <0x0 0x100>;
-			next-level-cache = <&L2_1>;
-			enable-method = "psci";
-			L2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-			};
-		};
-
-		CPU5: cpu@101 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a57";
-			reg = <0x0 0x101>;
-			next-level-cache = <&L2_1>;
-			enable-method = "psci";
-		};
-
-		cpu-map {
-			cluster0 {
-				core0 {
-					cpu = <&CPU0>;
-				};
-
-				core1 {
-					cpu = <&CPU1>;
-				};
-
-				core2 {
-					cpu = <&CPU2>;
-				};
-
-				core3 {
-					cpu = <&CPU3>;
-				};
-			};
-
-			cluster1 {
-				core0 {
-					cpu = <&CPU4>;
-				};
-
-				core1 {
-					cpu = <&CPU5>;
-				};
-			};
-		};
-	};
-
-	clocks {
-		xo_board: xo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-		};
-
-		sleep_clk: sleep_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	firmware {
-		scm {
-			compatible = "qcom,scm-msm8994", "qcom,scm";
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
-	};
-
-	pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
-	};
-
-	psci {
-		compatible = "arm,psci-0.2";
-		method = "hvc";
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		smem_region: smem@6a00000 {
-			reg = <0x0 0x6a00000 0x0 0x200000>;
-			no-map;
-		};
-	};
-
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_mutex_regs 0x0 0x100>;
-		#hwlock-cells = <1>;
-	};
-
-	smem {
-		compatible = "qcom,smem";
-		memory-region = <&smem_region>;
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-		hwlocks = <&sfpb_mutex 3>;
-	};
-
-	soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0 0 0xffffffff>;
-		compatible = "simple-bus";
-
-		intc: interrupt-controller@f9000000 {
-			compatible = "qcom,msm-qgic2";
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			reg = <0xf9000000 0x1000>,
-				<0xf9002000 0x1000>;
-		};
-
-		apcs: mailbox@f900d000 {
-			compatible = "qcom,msm8994-apcs-kpss-global", "syscon";
-			reg = <0xf900d000 0x2000>;
-			#mbox-cells = <1>;
-		};
-
-		timer@f9020000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			compatible = "arm,armv7-timer-mem";
-			reg = <0xf9020000 0x1000>;
-
-			frame@f9021000 {
-				frame-number = <0>;
-				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9021000 0x1000>,
-					<0xf9022000 0x1000>;
-			};
-
-			frame@f9023000 {
-				frame-number = <1>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9023000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9024000 {
-				frame-number = <2>;
-				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9024000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9025000 {
-				frame-number = <3>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9025000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9026000 {
-				frame-number = <4>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9026000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9027000 {
-				frame-number = <5>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9027000 0x1000>;
-				status = "disabled";
-			};
-
-			frame@f9028000 {
-				frame-number = <6>;
-				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xf9028000 0x1000>;
-				status = "disabled";
-			};
-		};
-
-		usb3: usb@f92f8800 {
-			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
-			reg = <0xf92f8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			clocks = <&gcc GCC_USB30_MASTER_CLK>,
-				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
-				 <&gcc GCC_USB30_SLEEP_CLK>,
-				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
-			clock-names = "core", "iface", "sleep", "mock_utmi", "ref", "xo";
-
-			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
-					  <&gcc GCC_USB30_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <120000000>;
-
-			power-domains = <&gcc USB30_GDSC>;
-			qcom,select-utmi-as-pipe-clk;
-
-			dwc3@f9200000 {
-				compatible = "snps,dwc3";
-				reg = <0xf9200000 0xcc00>;
-				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
-			};
-		};
-
-		sdhc_1: sdhci@f9824900 {
-			compatible = "qcom,sdhci-msm-v4";
-			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
-			reg-names = "hc_mem", "core_mem";
-
-			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				<&gcc GCC_SDCC1_AHB_CLK>,
-				<&xo_board>;
-			clock-names = "core", "iface", "xo";
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on
-					&sdc1_rclk_on>;
-			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off
-					&sdc1_rclk_off>;
-
-			regulator-always-on;
-			bus-width = <8>;
-			non-removable;
-
-			status = "disabled";
-		};
-
-		sdhc_2: sdhci@f98a4900 {
-			compatible = "qcom,sdhci-msm-v4";
-			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
-			reg-names = "hc_mem", "core_mem";
-
-			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hc_irq", "pwr_irq";
-
-			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-				<&gcc GCC_SDCC2_AHB_CLK>,
-				<&xo_board>;
-			clock-names = "core", "iface", "xo";
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
-			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
-
-			cd-gpios = <&tlmm 100 0>;
-			bus-width = <4>;
-			status = "disabled";
-		};
-
-		blsp1_uart2: serial@f991e000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xf991e000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>;
-			clock-names = "core", "iface";
-			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
-				<&gcc GCC_BLSP1_AHB_CLK>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-			status = "disabled";
-		};
-
-		blsp_i2c1: i2c@f9923000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9923000 0x500>;
-			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <400000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c1_default>;
-			pinctrl-1 = <&i2c1_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		blsp_i2c2: i2c@f9924000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9924000 0x500>;
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <400000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c2_default>;
-			pinctrl-1 = <&i2c2_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		/* Somebody was very creative with their numbering scheme downstream... */
-
-		blsp_i2c13: i2c@f9927000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9927000 0x500>;
-			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <400000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c13_default>;
-			pinctrl-1 = <&i2c13_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		blsp_i2c6: i2c@f9928000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9928000 0x500>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <400000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c6_default>;
-			pinctrl-1 = <&i2c6_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		blsp2_uart2: serial@f995e000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xf995e000 0x1000>;
-			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
-			clock-names = "core", "iface";
-			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
-				<&gcc GCC_BLSP2_AHB_CLK>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_uart2_default>;
-			pinctrl-1 = <&blsp2_uart2_sleep>;
-			status = "disabled";
-		};
-
-		blsp_i2c7: i2c@f9963000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9963000 0x500>;
-			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <400000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c7_default>;
-			pinctrl-1 = <&i2c7_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		blsp_i2c5: i2c@f9967000 {
-			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0xf9967000 0x500>;
-			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
-			clock-names = "iface", "core";
-			clock-frequency = <100000>;
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c5_default>;
-			pinctrl-1 = <&i2c5_sleep>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		gcc: clock-controller@fc400000 {
-			compatible = "qcom,gcc-msm8994";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0xfc400000 0x2000>;
-		};
-
-		rpm_msg_ram: memory@fc428000 {
-			compatible = "qcom,rpm-msg-ram";
-			reg = <0xfc428000 0x4000>;
-		};
-
-		restart@fc4ab000 {
-			compatible = "qcom,pshold";
-			reg = <0xfc4ab000 0x4>;
-		};
-
-		spmi_bus: spmi@fc4c0000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0xfc4cf000 0x1000>,
-			      <0xfc4cb000 0x1000>,
-			      <0xfc4ca000 0x1000>;
-			reg-names = "core", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-		};
-
-		sfpb_mutex_regs: syscon@fd484000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "syscon";
-			reg = <0xfd484000 0x400>;
-		};
-
-		tlmm: pinctrl@fd510000 {
-			compatible = "qcom,msm8994-pinctrl";
-			reg = <0xfd510000 0x4000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 146>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-
-			blsp1_uart2_default: blsp1-uart2-default {
-				function = "blsp_uart2";
-				pins = "gpio4", "gpio5";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
-			blsp1_uart2_sleep: blsp1-uart2-sleep {
-				function = "gpio";
-				pins = "gpio4", "gpio5";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			blsp2_uart2_default: blsp2-uart2-default {
-				function = "blsp_uart8";
-				pins = "gpio45", "gpio46", "gpio47", "gpio48";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
-			blsp2_uart2_sleep: blsp2-uart2-sleep {
-				function = "gpio";
-				pins = "gpio45", "gpio46", "gpio47", "gpio48";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			sdc1_clk_on: clk-on {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <6>;
-			};
-
-			sdc1_clk_off: clk-off {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <2>;
-			};
-
-			sdc1_cmd_on: cmd-on {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <6>;
-			};
-
-			sdc1_cmd_off: cmd-off {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
-
-			sdc1_data_on: data-on {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <6>;
-			};
-
-			sdc1_data_off: data-off {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
-
-			sdc1_rclk_on: rclk-on {
-				pins = "sdc1_rclk";
-				bias-pull-down;
-			};
-
-			sdc1_rclk_off: rclk-off {
-				pins = "sdc1_rclk";
-				bias-pull-down;
-			};
-
-			i2c1_default: i2c1-default {
-				function = "blsp_i2c1";
-				pins = "gpio2", "gpio3";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c1_sleep: i2c1-sleep {
-				function = "gpio";
-				pins = "gpio2", "gpio3";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c2_default: i2c2-default {
-				function = "blsp_i2c2";
-				pins = "gpio6", "gpio7";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c2_sleep: i2c2-sleep {
-				function = "gpio";
-				pins = "gpio6", "gpio7";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c5_default: i2c5-default {
-				/* Don't be fooled! Nobody knows the reason why though... */
-				function = "blsp_i2c11";
-				pins = "gpio83", "gpio84";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c5_sleep: i2c5-sleep {
-				function = "gpio";
-				pins = "gpio83", "gpio84";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c6_default: i2c6-default {
-				function = "blsp_i2c6";
-				pins = "gpio28", "gpio27";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c6_sleep: i2c6-sleep {
-				function = "gpio";
-				pins = "gpio28", "gpio27";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c7_default: i2c7-default {
-				function = "blsp_i2c7";
-				pins = "gpio43", "gpio44";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c7_sleep: i2c7-sleep {
-				function = "gpio";
-				pins = "gpio43", "gpio44";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c13_default: i2c13-default {
-				/* Not a typo either. */
-				function = "blsp_i2c5";
-				pins = "gpio23", "gpio24";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c13_sleep: i2c13-sleep {
-				function = "gpio";
-				pins = "gpio23", "gpio24";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			sdc2_clk_on: sdc2-clk-on {
-				pins = "sdc2_clk";
-				bias-disable;
-				drive-strength = <16>;
-			};
-
-			sdc2_clk_off: sdc2-clk-off {
-				pins = "sdc2_clk";
-				bias-disable;
-				drive-strength = <2>;
-			};
-
-			sdc2_cmd_on: sdc2-cmd-on {
-				pins = "sdc2_cmd";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
-
-			sdc2_cmd_off: sdc2-cmd-off {
-				pins = "sdc2_cmd";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
-
-			sdc2_data_on: sdc2-data-on {
-				pins = "sdc2_data";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
-
-			sdc2_data_off: sdc2-data-off {
-				pins = "sdc2_data";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
-		};
-	};
-
-	smd_rpm: smd {
-		compatible = "qcom,smd";
-		rpm {
-			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-			qcom,ipc = <&apcs 8 0>;
-			qcom,smd-edge = <15>;
-			qcom,local-pid = <0>;
-			qcom,remote-pid = <6>;
-
-			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8994";
-				qcom,smd-channels = "rpm_requests";
-
-				rpmcc: rpmcc {
-					compatible = "qcom,rpmcc-msm8992";
-					#clock-cells = <1>;
-				};
-
-				rpmpd: power-controller {
-					compatible = "qcom,msm8994-rpmpd";
-					#power-domain-cells = <1>;
-					operating-points-v2 = <&rpmpd_opp_table>;
-
-					rpmpd_opp_table: opp-table {
-						compatible = "operating-points-v2";
+&rpmcc {
+	compatible = "qcom,rpmcc-msm8992";
+};
 
-						rpmpd_opp_ret: opp1 {
-							opp-level = <1>;
-						};
-						rpmpd_opp_svs_krait: opp2 {
-							opp-level = <2>;
-						};
-						rpmpd_opp_svs_soc: opp3 {
-							opp-level = <3>;
-						};
-						rpmpd_opp_nom: opp4 {
-							opp-level = <4>;
-						};
-						rpmpd_opp_turbo: opp5 {
-							opp-level = <5>;
-						};
-						rpmpd_opp_super_turbo: opp6 {
-							opp-level = <6>;
-						};
-					};
-				};
-			};
-		};
-	};
+&tcsr_mutex {
+	compatible = "qcom,sfpb-mutex";
+};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+&timer {
+	interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-	};
-
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		regulator-always-on;
-	};
 };
 
+&tlmm {
+	compatible = "qcom,msm8992-pinctrl";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 60e04514af70..f49d442d2edf 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -132,11 +132,11 @@ core1 {
 					cpu = <&CPU5>;
 				};
 
-				core2 {
+				cpu6_map: core2 {
 					cpu = <&CPU6>;
 				};
 
-				core3 {
+				cpu7_map: core3 {
 					cpu = <&CPU7>;
 				};
 			};
@@ -1009,7 +1009,7 @@ sdc2_data_off: sdc2-data-off {
 		};
 	};
 
-	timer {
+	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 0xff08>,
 			     <GIC_PPI 3 0xff08>,
-- 
2.30.0

