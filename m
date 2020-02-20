Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45571165CF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 12:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbgBTLvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 06:51:04 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:61592 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbgBTLvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 06:51:04 -0500
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Feb 2020 03:51:03 -0800
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 20 Feb 2020 03:51:00 -0800
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id F03FB214C7; Thu, 20 Feb 2020 17:20:58 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH V2] arm64: dts: ipq6018: Add a few device nodes
Date:   Thu, 20 Feb 2020 17:20:46 +0530
Message-Id: <1582199446-29890-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add i2c, spi, crypto, rng, watchdog, peripheral nodes, also add
support for wcss Q6 remoteproc driver and enable hw mutex, smem,
mailbox, smp2p and rpmsg drivers

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2] * Addressed review comments from Stephen
This patch depends on Sricharan's ipq6018 dts patch
https://patchwork.kernel.org/patch/11340681/
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  34 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 226 +++++++++++++++++++++++++++
 2 files changed, 260 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 897b4b2..b31117a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -28,3 +28,37 @@
 	pinctrl-names = "default";
 	status = "ok";
 };
+
+&i2c_1 {
+	pinctrl-0 = <&i2c_1_pins>;
+	pinctrl-names = "default";
+	status = "ok";
+};
+
+&spi_0 {
+	cs-select = <0>;
+	status = "ok";
+
+	m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		compatible = "n25q128a11";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&tlmm {
+	i2c_1_pins: i2c-1-pins {
+		pins = "gpio42", "gpio43";
+		function = "blsp2_i2c";
+		drive-strength = <8>;
+	};
+
+	spi_0_pins: spi-0-pins {
+		pins = "gpio38", "gpio39", "gpio40", "gpio41";
+		function = "blsp0_spi";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0fb44e5..1aa8d85 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+#include <dt-bindings/reset/qcom,gcc-ipq6018.h>
 
 / {
 	#address-cells = <2>;
@@ -69,6 +70,18 @@
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm";
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x80>;
+		#hwlock-cells = <1>;
+	};
+
 	pmuv8: pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
@@ -89,6 +102,22 @@
 			reg = <0x0 0x48500000 0x0 0x00200000>;
 			no-map;
 		};
+
+		smem_region: memory@4aa00000 {
+			reg = <0x0 0x4aa00000 0x0 0x00100000>;
+			no-map;
+		};
+
+		q6_region: memory@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x02800000>;
+			no-map;
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_region>;
+		hwlocks = <&tcsr_mutex 0>;
 	};
 
 	soc: soc {
@@ -98,6 +127,36 @@
 		dma-ranges;
 		compatible = "simple-bus";
 
+		prng: qrng@e1000 {
+			compatible = "qcom,prng-ee";
+			reg = <0xe3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		cryptobam: dma@704000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely = <1>;
+			qcom,config-pipe-trust-reg = <0>;
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x0073a000 0x6000>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				<&gcc GCC_CRYPTO_AXI_CLK>,
+				<&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 2>, <&cryptobam 3>;
+			dma-names = "rx", "tx";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq6018-pinctrl";
 			reg = <0x01000000 0x300000>;
@@ -125,6 +184,26 @@
 			#reset-cells = <1>;
 		};
 
+		tcsr_mutex_regs: syscon@1905000 {
+			compatible = "syscon";
+			reg = <0x01905000 0x8000>;
+		};
+
+		tcsr_q6: syscon@1945000 {
+			compatible = "syscon";
+			reg = <0x01945000 0xe000>;
+		};
+
+		blsp_dma: dma@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x2b000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
 		blsp1_uart3: serial@78b1000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x078b1000 0x200>;
@@ -135,6 +214,66 @@
 			status = "disabled";
 		};
 
+		spi_0: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x078b5000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			spi-max-frequency = <50000000>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		spi_1: spi@78b6000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			spi-max-frequency = <50000000>;
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		i2c_0: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency  = <400000>;
+			dmas = <&blsp_dma 15>, <&blsp_dma 14>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
+			compatible = "qcom,i2c-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x078b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency  = <400000>;
+			dmas = <&blsp_dma 17>, <&blsp_dma 16>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
@@ -146,6 +285,21 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		watchdog@b017000 {
+			compatible = "qcom,kpss-wdt";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x0b017000 0x40>;
+			clocks = <&sleep_clk>;
+			timeout-sec = <10>;
+		};
+
+		apcs_glb: mailbox@b111000 {
+			compatible = "qcom,ipq8074-apcs-apps-global";
+			reg = <0x0b111000 0xc>;
+
+			#mbox-cells = <1>;
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -213,5 +367,77 @@
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+				<0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc GCC_WCSSAON_RESET>,
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "prng";
+
+			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+
+				qrtr_requests {
+					qcom,glink-channels = "IPCRTR";
+				};
+			};
+		};
+
+	};
+
+	wcss: wcss-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };
-- 
2.7.4

