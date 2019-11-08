Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 838F9F4348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 10:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731629AbfKHJ3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 04:29:46 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38912 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731373AbfKHJ3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 04:29:46 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1929E60D90; Fri,  8 Nov 2019 09:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205384;
        bh=7Yss9qpvrdasOy5OoM3KH9ciVil/gwVAv10XeEtcu0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aux60g/96pBSrkSSMu6zqx0EUse21X+rsFGk7pq2rcXbgoDg2sxD8K8rARp2v7bMa
         HHykeRrTqVLz8LWpYcyEJLqgugFjASuHjamYzfhj4YaxoXxqtbavIzqYyu0bTiAvtN
         7N0WKezKVQsj+nxYygANjnSQ00J/yhubkk5In2oQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E1FB660D5A;
        Fri,  8 Nov 2019 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205375;
        bh=7Yss9qpvrdasOy5OoM3KH9ciVil/gwVAv10XeEtcu0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+5ERXn5NLjpL5euULt2T3Sy68Zob7FRP63fTSmZY/Np8LfeZQ/1VhZVSgDT/ZIZ6
         U+tfgJ95XT7MvIozi+RamyCnj+kbSXAFeR0Eiv1JavaNzCZaSiGlj82oMVG+nQ7YOR
         zCnAiTS/5arBuyPP4Y+U3/o/vzxs5a71gZUG/VdE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1FB660D5A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 13/13] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
Date:   Fri,  8 Nov 2019 14:58:24 +0530
Message-Id: <20191108092824.9773-14-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191108092824.9773-1-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Add QUP SE instances configuration for sc7180.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 146 +++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 675 ++++++++++++++++++++++++
 2 files changed, 821 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index d8206d1b5896..189254f5ae95 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -17,6 +17,7 @@
 	compatible = "qcom,sc7180-idp";
 
 	aliases {
+		hsuart0 = &uart3;
 		serial0 = &uart8;
 	};
 
@@ -231,16 +232,100 @@
 	};
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&uart3 {
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 };
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
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
 &qup_uart8_default {
 	pinconf-tx {
 		pins = "gpio44";
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
index e1d6278d85f7..666e9b92c7ad 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -182,6 +182,214 @@
 			#power-domain-cells = <1>;
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
@@ -193,6 +401,93 @@
 			ranges;
 			status = "disabled";
 
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
 			uart8: serial@a88000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x00a88000 0 0x4000>;
@@ -203,6 +498,104 @@
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
 
 		pdc: interrupt-controller@b220000 {
@@ -228,12 +621,294 @@
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 120>;
 
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
+					function = "qup10";
+				};
+			};
+
+			qup_i2c7_default: qup-i2c7-default {
+				pinmux {
+					pins = "gpio6", "gpio7";
+					function = "qup11";
+				};
+			};
+
+			qup_i2c8_default: qup-i2c8-default {
+				pinmux {
+					pins = "gpio42", "gpio43";
+					function = "qup12";
+				};
+			};
+
+			qup_i2c9_default: qup-i2c9-default {
+				pinmux {
+					pins = "gpio46", "gpio47";
+					function = "qup13";
+				};
+			};
+
+			qup_i2c10_default: qup-i2c10-default {
+				pinmux {
+					pins = "gpio86", "gpio87";
+					function = "qup14";
+				};
+			};
+
+			qup_i2c11_default: qup-i2c11-default {
+				pinmux {
+					pins = "gpio53", "gpio54";
+					function = "qup15";
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
+					function = "qup10";
+				};
+			};
+
+			qup_spi8_default: qup-spi8-default {
+				pinmux {
+					pins = "gpio42", "gpio43",
+					       "gpio44", "gpio45";
+					function = "qup12";
+				};
+			};
+
+			qup_spi10_default: qup-spi10-default {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88", "gpio89",
+					       "gpio90", "gpio91";
+					function = "qup14";
+				};
+			};
+
+			qup_spi11_default: qup-spi11-default {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55", "gpio56";
+					function = "qup15";
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
+					function = "qup10";
+				};
+			};
+
+			qup_uart7_default: qup-uart7-default {
+				pinmux {
+					pins = "gpio6", "gpio7";
+					function = "qup11";
+				};
+			};
+
 			qup_uart8_default: qup-uart8-default {
 				pinmux {
 					pins = "gpio44", "gpio45";
 					function = "qup12";
 				};
 			};
+
+			qup_uart9_default: qup-uart9-default {
+				pinmux {
+					pins = "gpio46", "gpio47";
+					function = "qup13";
+				};
+			};
+
+			qup_uart10_default: qup-uart10-default {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88", "gpio89";
+					function = "qup14";
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55", "gpio56";
+					function = "qup15";
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
of Code Aurora Forum, hosted by The Linux Foundation

