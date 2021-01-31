Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEEB53099B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhAaBkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:40:19 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:37881 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhAaBkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:16 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C7C441F6C5;
        Sun, 31 Jan 2021 02:39:15 +0100 (CET)
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
Subject: [PATCH 02/18] arm64: dts: qcom: msm8994: Fix remaining BLSP errors/mistakes
Date:   Sun, 31 Jan 2021 02:38:33 +0100
Message-Id: <20210131013853.55810-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

* Move 35500 clock-frequency to kitakami (turns out it's a Sony specific)
* Add missing interfaces
* Fix the naming scheme
* Fix up pin assignments to make all BLSPs work
* Add DMA where previously omitted

Co-authored-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-cityman.dts   |   2 +-
 .../msm8994-sony-xperia-kitakami-karin.dts    |   2 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  24 +--
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 163 ++++++++++++++----
 4 files changed, 149 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
index ed9034b96013..2d989a70e0b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
@@ -32,7 +32,7 @@ chosen {
 	};
 };
 
-&blsp_i2c1 {
+&blsp1_i2c1 {
 	status = "okay";
 
 	rmi4-i2c-dev@4b {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
index 4dcf42eafb3a..a1d1a075941a 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "sony,karin-row", "qcom,msm8994";
 };
 
-&blsp_i2c5 {
+&blsp2_i2c5 {
 	/*
 	 * TI LP8557 backlight driver @ 2c
 	 * AD AD7146 touch controller @ 2f
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 586d866188d7..48de66bf19c4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -94,7 +94,7 @@ tzapp: memory@c7800000 {
 	};
 };
 
-&blsp_spi0 {
+&blsp1_spi1 {
 	status = "okay";
 
 	/* FPC fingerprint reader */
@@ -102,26 +102,23 @@ &blsp_spi0 {
 
 /* I2C1 is disabled on this board */
 
-&blsp_i2c2 {
+&blsp1_i2c2 {
 	status = "okay";
+	clock-frequency = <355000>;
 
 	/* NXP PN547 NFC */
 };
 
-&blsp_i2c4 {
+&blsp1_i2c4 {
 	status = "okay";
+	clock-frequency = <355000>;
 
 	/* Empty but active */
 };
 
-&blsp_i2c5 {
-	status = "okay";
-
-	/* sii8620 HDMI/MHL bridge */
-};
-
-&blsp_i2c6 {
+&blsp1_i2c6 {
 	status = "okay";
+	clock-frequency = <355000>;
 
 	touchscreen: rmi4-i2c-dev@2c {
 		compatible = "syna,rmi4-i2c";
@@ -157,6 +154,13 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&blsp2_i2c5 {
+	status = "okay";
+	clock-frequency = <355000>;
+
+	/* sii8620 HDMI/MHL bridge */
+};
+
 &blsp2_uart2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index af1a9f7907b8..a6148b00e82c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -507,7 +507,7 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
-		blsp_i2c1: i2c@f9923000 {
+		blsp1_i2c1: i2c@f9923000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9923000 0x500>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
@@ -515,6 +515,8 @@ blsp_i2c1: i2c@f9923000 {
 						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
 			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c1_default>;
 			pinctrl-1 = <&i2c1_sleep>;
@@ -523,7 +525,7 @@ blsp_i2c1: i2c@f9923000 {
 			status = "disabled";
 		};
 
-		blsp_spi0: spi@f9923000 {
+		blsp1_spi1: spi@f9923000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0xf9923000 0x500>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
@@ -534,21 +536,21 @@ blsp_spi0: spi@f9923000 {
 			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_spi0_default>;
-			pinctrl-1 = <&blsp1_spi0_sleep>;
+			pinctrl-0 = <&blsp1_spi1_default>;
+			pinctrl-1 = <&blsp1_spi1_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
 		};
 
-		blsp_i2c2: i2c@f9924000 {
+		blsp1_i2c2: i2c@f9924000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9924000 0x500>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
 						<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
-			clock-frequency = <355000>;
+			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
@@ -561,14 +563,16 @@ blsp_i2c2: i2c@f9924000 {
 
 		/* I2C3 doesn't exist */
 
-		blsp_i2c4: i2c@f9926000 {
+		blsp1_i2c4: i2c@f9926000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9926000 0x500>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
 						<&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
-			clock-frequency = <355000>;
+			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 18>, <&blsp1_dma 19>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c4_default>;
 			pinctrl-1 = <&i2c4_sleep>;
@@ -577,31 +581,32 @@ blsp_i2c4: i2c@f9926000 {
 			status = "disabled";
 		};
 
-		blsp2_dma: dma-controller@f9944000 {
-			compatible = "qcom,bam-v1.7.0";
-			reg = <0xf9944000 0x19000>;
-			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
-			clock-names = "bam_clk";
-			#dma-cells = <1>;
-			qcom,ee = <0>;
-			qcom,controlled-remotely;
-			num-channels = <18>;
-			qcom,num-ees = <4>;
+		blsp1_i2c5: i2c@f9927000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9927000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
 		};
 
-		/* According to downstream kernels, i2c6
-		 * comes before i2c5 address-wise...
-		 */
-
-		blsp_i2c6: i2c@f9928000 {
+		blsp1_i2c6: i2c@f9928000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9928000 0x500>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
 						<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
-			clock-frequency = <355000>;
+			clock-frequency = <400000>;
 			dmas = <&blsp1_dma 22>, <&blsp1_dma 23>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
@@ -612,6 +617,19 @@ blsp_i2c6: i2c@f9928000 {
 			status = "disabled";
 		};
 
+		blsp2_dma: dma-controller@f9944000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0xf9944000 0x19000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
 		blsp2_uart2: serial@f995e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf995e000 0x1000>;
@@ -627,7 +645,43 @@ blsp2_uart2: serial@f995e000 {
 			status = "disabled";
 		};
 
-		blsp_i2c5: i2c@f9967000 {
+		blsp2_i2c1: i2c@f9963000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9963000 0x500>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+					<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 12>, <&blsp2_dma 13>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c7_default>;
+			pinctrl-1 = <&i2c7_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_spi4: spi@f9966000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0xf9966000 0x500>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			spi-max-frequency = <19200000>;
+			dmas = <&blsp2_dma 18>, <&blsp2_dma 19>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi10_default>;
+			pinctrl-1 = <&blsp2_spi10_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_i2c5: i2c@f9967000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9967000 0x500>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
@@ -638,8 +692,8 @@ blsp_i2c5: i2c@f9967000 {
 			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&i2c5_default>;
-			pinctrl-1 = <&i2c5_sleep>;
+			pinctrl-0 = <&i2c11_default>;
+			pinctrl-1 = <&i2c11_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -795,7 +849,56 @@ i2c6_sleep: i2c6-sleep {
 				bias-disable;
 			};
 
-			blsp1_spi0_default: blsp1-spi0-default {
+			i2c7_default: i2c7-default {
+				function = "blsp_i2c7";
+				pins = "gpio44", "gpio43";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c7_sleep: i2c7-sleep {
+				function = "gpio";
+				pins = "gpio44", "gpio43";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_spi10_default: blsp2-spi10-default {
+				default {
+					function = "blsp_spi10";
+					pins = "gpio53", "gpio54", "gpio55";
+					drive-strength = <10>;
+					bias-pull-down;
+				};
+				cs {
+					function = "gpio";
+					pins = "gpio55";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			blsp2_spi10_sleep: blsp2-spi10-sleep {
+				pins = "gpio53", "gpio54", "gpio55";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c11_default: i2c11-default {
+				function = "blsp_i2c11";
+				pins = "gpio83", "gpio84";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c11_sleep: i2c11-sleep {
+				function = "gpio";
+				pins = "gpio83", "gpio84";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_spi1_default: blsp1-spi1-default {
 				default {
 					function = "blsp_spi1";
 					pins = "gpio0", "gpio1", "gpio3";
@@ -810,7 +913,7 @@ cs {
 				};
 			};
 
-			blsp1_spi0_sleep: blsp1-spi0-sleep {
+			blsp1_spi1_sleep: blsp1-spi1-sleep {
 				pins = "gpio0", "gpio1", "gpio3";
 				drive-strength = <2>;
 				bias-disable;
-- 
2.30.0

