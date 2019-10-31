Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8055EAB23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 08:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfJaHwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 03:52:51 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:51950 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726584AbfJaHwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 03:52:51 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 13:15:26 +0530
IronPort-SDR: sYUmktWeiHeU6FvJ3GpwHj9rRlDncj0Wah67DYgKFXYcV88SN/9xAJiZs5dxELggkc6CXQOI0v
 FG5PtuXSZ11BceemWmq2EOqsUAfe6Ag2PcjREOvUessQ1H/juUJDpm3u/wWMIKCuGm7sADO8i4
 2LVDH2vGAbUyZA4Aya7ShCUxKfzpkRZdu8q+2OIbM1K/1nHmZ8oDzXeuGxoXCvIdlTBOJFaEpf
 gyH0e8aKnD4lHDf/51Y/+US7XpQkZohp+FHyrRjQVCbEKKY4zTOSR8HIEumQxor8hR/PVCSFqQ
 R8iQ+8vmdmrIkQZ6qWpa6N6c
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 Oct 2019 13:15:06 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id A53C31A5A; Thu, 31 Oct 2019 13:15:05 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     mgautam@codeaurora.org, akashast@codeaurora.org,
        msavaliy@codeaurora.org, rojay@codeaurora.org, sanm@codeaurora.org,
        skakit@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
Date:   Thu, 31 Oct 2019 13:15:00 +0530
Message-Id: <20191031074500.28523-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031074500.28523-1-rojay@codeaurora.org>
References: <20191031074500.28523-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUP SE instances configuration for sc7180.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 152 +++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 683 +++++++++++++++++++++++-
 2 files changed, 828 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index e0724ef3317d..189254f5ae95 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -17,7 +17,8 @@
 	compatible = "qcom,sc7180-idp";
 
 	aliases {
-		serial0 = &uart10;
+		hsuart0 = &uart3;
+		serial0 = &uart8;
 	};
 
 	chosen {
@@ -231,17 +232,101 @@
 	};
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
-&uart10 {
+&uart3 {
+	status = "okay";
+};
+
+&uart8 {
 	status = "okay";
 };
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
-&qup_uart10_default {
+&qup_i2c2_default {
+	pinconf {
+		pins = "gpio15", "gpio16";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c4_default {
+	pinconf {
+		pins = "gpio115", "gpio116";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c7_default {
+	pinconf {
+		pins = "gpio6", "gpio7";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_i2c9_default {
+	pinconf {
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_uart3_default {
+	pinconf-cts {
+		/*
+		 * Configure a pull-down on 38 (CTS) to match the pull of
+		 * the Bluetooth module.
+		 */
+		pins = "gpio38";
+		bias-pull-down;
+		output-high;
+	};
+
+	pinconf-rts {
+		/* We'll drive 39 (RTS), so no pull */
+		pins = "gpio39";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-tx {
+		/* We'll drive 40 (TX), so no pull */
+		pins = "gpio40";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	pinconf-rx {
+		/*
+		 * Configure a pull-up on 41 (RX). This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio41";
+		bias-pull-up;
+	};
+};
+
+&qup_uart8_default {
 	pinconf-tx {
 		pins = "gpio44";
 		drive-strength = <2>;
@@ -254,3 +339,64 @@
 		bias-pull-up;
 	};
 };
+
+&qup_spi0_default {
+	pinconf {
+		pins = "gpio34", "gpio35", "gpio36", "gpio37";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi6_default {
+	pinconf {
+		pins = "gpio59", "gpio60", "gpio61", "gpio62";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi10_default {
+	pinconf {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&qspi_cs0 {
+		pinconf {
+			pins = "gpio68";
+			bias-disable;
+		};
+};
+
+&qspi_clk {
+		pinconf {
+			pins = "gpio63";
+			bias-disable;
+		};
+};
+
+&qspi_data01 {
+		pinconf {
+			pins = "gpio64", "gpio65";
+
+			/* High-Z when no transfers; nice to park the lines */
+			bias-pull-up;
+		};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 07ea393c2b5f..cb623b72d00b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -194,6 +194,214 @@
 			interrupt-controller;
 		};
 
+		qupv3_id_0: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x008c0000 0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c0: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00880000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c0_default>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi0: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00880000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi0_default>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart0: serial@880000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00880000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart0_default>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00884000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c1_default>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi1: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00884000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi1_default>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart1: serial@884000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00884000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart1_default>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00888000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c2_default>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart2: serial@888000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00888000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart2_default>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c3_default>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi3: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi3_default>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart3: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart3_default>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00890000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c4_default>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart4: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00890000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart4_default>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@894000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c5_default>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi5: spi@894000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi5_default>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart5: serial@894000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart5_default>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -205,16 +413,201 @@
 			ranges;
 			status = "disabled";
 
-			uart10: serial@a88000 {
+			i2c6: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c6_default>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi6: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi6_default>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart6: serial@a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart6_default>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c7_default>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart7: serial@a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart7_default>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c8_default>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi8: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi8_default>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart8: serial@a88000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x00a88000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_uart10_default>;
+				pinctrl-0 = <&qup_uart8_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
+
+			i2c9: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c9_default>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart9: serial@a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart9_default>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c10_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi10: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi10_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart10: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart10_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c11_default>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi11: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi11_default>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart11: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart11_default>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
 		};
 
 		tlmm: pinctrl@3500000 {
@@ -230,12 +623,294 @@
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 120>;
 
-			qup_uart10_default: qup-uart10-default {
+			qspi_clk: qspi-clk {
+				pinmux {
+					pins = "gpio63";
+					function = "qspi_clk";
+				};
+			};
+
+			qspi_cs0: qspi-cs0 {
+				pinmux {
+					pins = "gpio68";
+					function = "qspi_cs";
+				};
+			};
+
+			qspi_cs1: qspi-cs1 {
+				pinmux {
+					pins = "gpio72";
+					function = "qspi_cs";
+				};
+			};
+
+			qspi_data01: qspi-data01 {
+				pinmux-data {
+					pins = "gpio64", "gpio65";
+					function = "qspi_data";
+				};
+			};
+
+			qspi_data12: qspi-data12 {
+				pinmux-data {
+					pins = "gpio66", "gpio67";
+					function = "qspi_data";
+				};
+			};
+
+			qup_i2c0_default: qup-i2c0-default {
+				pinmux {
+					pins = "gpio34", "gpio35";
+					function = "qup00";
+				};
+			};
+
+			qup_i2c1_default: qup-i2c1-default {
+				pinmux {
+					pins = "gpio0", "gpio1";
+					function = "qup01";
+				};
+			};
+
+			qup_i2c2_default: qup-i2c2-default {
+				pinmux {
+					pins = "gpio15", "gpio16";
+					function = "qup02";
+				};
+			};
+
+			qup_i2c3_default: qup-i2c3-default {
+				pinmux {
+					pins = "gpio38", "gpio39";
+					function = "qup03";
+				};
+			};
+
+			qup_i2c4_default: qup-i2c4-default {
+				pinmux {
+					pins = "gpio115", "gpio116";
+					function = "qup04";
+				};
+			};
+
+			qup_i2c5_default: qup-i2c5-default {
+				pinmux {
+					pins = "gpio25", "gpio26";
+					function = "qup05";
+				};
+			};
+
+			qup_i2c6_default: qup-i2c6-default {
+				pinmux {
+					pins = "gpio59", "gpio60";
+					function = "qup06";
+				};
+			};
+
+			qup_i2c7_default: qup-i2c7-default {
+				pinmux {
+					pins = "gpio6", "gpio7";
+					function = "qup07";
+				};
+			};
+
+			qup_i2c8_default: qup-i2c8-default {
+				pinmux {
+					pins = "gpio42", "gpio43";
+					function = "qup08";
+				};
+			};
+
+			qup_i2c9_default: qup-i2c9-default {
+				pinmux {
+					pins = "gpio46", "gpio47";
+					function = "qup09";
+				};
+			};
+
+			qup_i2c10_default: qup-i2c10-default {
+				pinmux {
+					pins = "gpio86", "gpio87";
+					function = "qup10";
+				};
+			};
+
+			qup_i2c11_default: qup-i2c11-default {
+				pinmux {
+					pins = "gpio53", "gpio54";
+					function = "qup11";
+				};
+			};
+
+			qup_spi0_default: qup-spi0-default {
+				pinmux {
+					pins = "gpio34", "gpio35",
+					       "gpio36", "gpio37";
+					function = "qup00";
+				};
+			};
+
+			qup_spi1_default: qup-spi1-default {
+				pinmux {
+					pins = "gpio0", "gpio1",
+					       "gpio2", "gpio3",
+					       "gpio12", "gpio94";
+					function = "qup01";
+				};
+			};
+
+			qup_spi3_default: qup-spi3-default {
+				pinmux {
+					pins = "gpio38", "gpio39",
+					       "gpio40", "gpio41";
+					function = "qup03";
+				};
+			};
+
+			qup_spi5_default: qup-spi5-default {
+				pinmux {
+					pins = "gpio25", "gpio26",
+					       "gpio27", "gpio28";
+					function = "qup05";
+				};
+			};
+
+			qup_spi6_default: qup-spi6-default {
+				pinmux {
+					pins = "gpio59", "gpio60",
+					       "gpio61", "gpio62",
+					       "gpio68", "gpio72";
+					function = "qup06";
+				};
+			};
+
+			qup_spi8_default: qup-spi8-default {
+				pinmux {
+					pins = "gpio42", "gpio43",
+					       "gpio44", "gpio45";
+					function = "qup08";
+				};
+			};
+
+			qup_spi10_default: qup-spi10-default {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88", "gpio89",
+					       "gpio90", "gpio91";
+					function = "qup10";
+				};
+			};
+
+			qup_spi11_default: qup-spi11-default {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55", "gpio56";
+					function = "qup11";
+				};
+			};
+
+			qup_uart0_default: qup-uart0-default {
+				pinmux {
+					pins = "gpio34", "gpio35",
+					       "gpio36", "gpio37";
+					function = "qup00";
+				};
+			};
+
+			qup_uart1_default: qup-uart1-default {
+				pinmux {
+					pins = "gpio0", "gpio1",
+					       "gpio2", "gpio3";
+					function = "qup01";
+				};
+			};
+
+			qup_uart2_default: qup-uart2-default {
+				pinmux {
+					pins = "gpio15", "gpio16";
+					function = "qup02";
+				};
+			};
+
+			qup_uart3_default: qup-uart3-default {
+				pinmux {
+					pins = "gpio38", "gpio39",
+					       "gpio40", "gpio41";
+					function = "qup03";
+				};
+			};
+
+			qup_uart4_default: qup-uart4-default {
+				pinmux {
+					pins = "gpio115", "gpio116";
+					function = "qup04";
+				};
+			};
+
+			qup_uart5_default: qup-uart5-default {
+				pinmux {
+					pins = "gpio25", "gpio26",
+					       "gpio27", "gpio28";
+					function = "qup05";
+				};
+			};
+
+			qup_uart6_default: qup-uart6-default {
+				pinmux {
+					pins = "gpio59", "gpio60",
+					       "gpio61", "gpio62";
+					function = "qup06";
+				};
+			};
+
+			qup_uart7_default: qup-uart7-default {
+				pinmux {
+					pins = "gpio6", "gpio7";
+					function = "qup07";
+				};
+			};
+
+			qup_uart8_default: qup-uart8-default {
 				pinmux {
 					pins = "gpio44", "gpio45";
-					function = "qup12";
+					function = "qup08";
+				};
+			};
+
+			qup_uart9_default: qup-uart9-default {
+				pinmux {
+					pins = "gpio46", "gpio47";
+					function = "qup09";
 				};
 			};
+
+			qup_uart10_default: qup-uart10-default {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88", "gpio89";
+					function = "qup10";
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55", "gpio56";
+					function = "qup11";
+				};
+			};
+		};
+
+		qspi: spi@88dc000 {
+			compatible = "qcom,qspi-v1";
+			reg = <0 0x088dc000 0 0x600>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface", "core";
+			status = "disabled";
 		};
 
 		spmi_bus: spmi@c440000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of the Code Aurora Forum, hosted by The Linux Foundation

