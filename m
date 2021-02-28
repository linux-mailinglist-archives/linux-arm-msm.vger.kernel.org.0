Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE42032725B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhB1NJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:42 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:57009 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbhB1NJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:38 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id AA8DC1F549;
        Sun, 28 Feb 2021 14:08:39 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: qcom: msm8996-*: Clean up QUP and UART names
Date:   Sun, 28 Feb 2021 14:08:20 +0100
Message-Id: <20210228130831.203765-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QUP and UART names start from 1. There are 6 QUPs and 2 UARTs
per BLSP. Let's not further confuse programmers by stating
otherwise.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 36 ++++++++++----------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  4 +--
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi    |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 16 ++++-----
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 4ed61675fdd6..7f57cdf9c753 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -41,14 +41,14 @@
 
 / {
 	aliases {
-		serial0 = &blsp2_uart1;
-		serial1 = &blsp2_uart2;
-		serial2 = &blsp1_uart1;
-		i2c0	= &blsp1_i2c2;
+		serial0 = &blsp2_uart2;
+		serial1 = &blsp2_uart3;
+		serial2 = &blsp1_uart2;
+		i2c0	= &blsp1_i2c3;
 		i2c1	= &blsp2_i2c1;
-		i2c2	= &blsp2_i2c0;
-		spi0	= &blsp1_spi0;
-		spi1	= &blsp2_spi5;
+		i2c2	= &blsp2_i2c1;
+		spi0	= &blsp1_spi1;
+		spi1	= &blsp2_spi6;
 	};
 
 	chosen {
@@ -133,24 +133,24 @@ wlan_en: wlan-en-1-8v {
 	};
 };
 
-&blsp1_i2c2 {
+&blsp1_i2c3 {
 	/* On Low speed expansion */
 	label = "LS-I2C0";
 	status = "okay";
 };
 
-&blsp1_spi0 {
+&blsp1_spi1 {
 	/* On Low speed expansion */
 	label = "LS-SPI0";
 	status = "okay";
 };
 
-&blsp1_uart1 {
+&blsp1_uart2 {
 	label = "BT-UART";
 	status = "okay";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart1_default>;
-	pinctrl-1 = <&blsp1_uart1_sleep>;
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
 
 	bluetooth {
 		compatible = "qcom,qca6174-bt";
@@ -162,7 +162,7 @@ bluetooth {
 	};
 };
 
-&blsp2_i2c0 {
+&blsp2_i2c1 {
 	/* On High speed expansion */
 	label = "HS-I2C2";
 	status = "okay";
@@ -174,13 +174,13 @@ &blsp2_i2c1 {
 	status = "okay";
 };
 
-&blsp2_spi5 {
+&blsp2_spi6 {
 	/* On High speed expansion */
 	label = "HS-SPI1";
 	status = "okay";
 };
 
-&blsp2_uart1 {
+&blsp2_uart2 {
 	label = "LS-UART1";
 	status = "okay";
 	pinctrl-names = "default", "sleep";
@@ -188,7 +188,7 @@ &blsp2_uart1 {
 	pinctrl-1 = <&blsp2_uart2_2pins_sleep>;
 };
 
-&blsp2_uart2 {
+&blsp2_uart3 {
 	label = "LS-UART0";
 	status = "disabled";
 	pinctrl-names = "default", "sleep";
@@ -424,7 +424,7 @@ config {
 		};
 	};
 
-	blsp1_uart1_default: blsp1_uart1_default {
+	blsp1_uart2_default: blsp1_uart2_default {
 		mux {
 			pins = "gpio41", "gpio42", "gpio43", "gpio44";
 			function = "blsp_uart2";
@@ -437,7 +437,7 @@ config {
 		};
 	};
 
-	blsp1_uart1_sleep: blsp1_uart1_sleep {
+	blsp1_uart2_sleep: blsp1_uart2_sleep {
 		mux {
 			pins = "gpio41", "gpio42", "gpio43", "gpio44";
 			function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index 9b55eae39e3e..4f67aa48633b 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -17,7 +17,7 @@ / {
 	qcom,board-id = <0x00010018 0>;
 
 	aliases {
-		serial0 = &blsp2_uart1;
+		serial0 = &blsp2_uart2;
 	};
 
 	chosen {
@@ -81,7 +81,7 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
-&blsp2_uart1 {
+&blsp2_uart2 {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&blsp2_uart2_2pins_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
index 5f46a1427f1f..1e1514e9158c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
@@ -7,7 +7,7 @@
 
 / {
 	aliases {
-		serial0 = &blsp2_uart1;
+		serial0 = &blsp2_uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7f7e3fc03bb9..029daa2ed53e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2325,7 +2325,7 @@ sdhc2: sdhci@74a4900 {
 			 bus-width = <4>;
 		 };
 
-		blsp1_uart1: serial@7570000 {
+		blsp1_uart2: serial@7570000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x07570000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
@@ -2335,7 +2335,7 @@ blsp1_uart1: serial@7570000 {
 			status = "disabled";
 		};
 
-		blsp1_spi0: spi@7575000 {
+		blsp1_spi1: spi@7575000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07575000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
@@ -2350,7 +2350,7 @@ blsp1_spi0: spi@7575000 {
 			status = "disabled";
 		};
 
-		blsp1_i2c2: i2c@7577000 {
+		blsp1_i2c3: i2c@7577000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x07577000 0x1000>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
@@ -2365,7 +2365,7 @@ blsp1_i2c2: i2c@7577000 {
 			status = "disabled";
 		};
 
-		blsp2_uart1: serial@75b0000 {
+		blsp2_uart2: serial@75b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x075b0000 0x1000>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -2375,7 +2375,7 @@ blsp2_uart1: serial@75b0000 {
 			status = "disabled";
 		};
 
-		blsp2_uart2: serial@75b1000 {
+		blsp2_uart3: serial@75b1000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x075b1000 0x1000>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
@@ -2385,7 +2385,7 @@ blsp2_uart2: serial@75b1000 {
 			status = "disabled";
 		};
 
-		blsp2_i2c0: i2c@75b5000 {
+		blsp2_i2c1: i2c@75b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x075b5000 0x1000>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
@@ -2400,7 +2400,7 @@ blsp2_i2c0: i2c@75b5000 {
 			status = "disabled";
 		};
 
-		blsp2_i2c1: i2c@75b6000 {
+		blsp2_i2c2: i2c@75b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x075b6000 0x1000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
@@ -2415,7 +2415,7 @@ blsp2_i2c1: i2c@75b6000 {
 			status = "disabled";
 		};
 
-		blsp2_spi5: spi@75ba000{
+		blsp2_spi6: spi@75ba000{
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x075ba000 0x600>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.30.1

