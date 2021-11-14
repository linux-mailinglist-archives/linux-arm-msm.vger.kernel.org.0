Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F075344F60C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbhKNBbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236193AbhKNBbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:09 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D343FC06120A
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 17:28:15 -0800 (PST)
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id C1FAA3EE3F;
        Sun, 14 Nov 2021 02:28:13 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] arm64: dts: qcom: sm8350: Set up WRAP2 QUPs
Date:   Sun, 14 Nov 2021 02:27:50 +0100
Message-Id: <20211114012755.112226-11-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set up I2C&SPI hosts and UARTs connected to WRAP2 and their respective pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 200 +++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 033d3984d572..944ad864f73e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -667,6 +667,164 @@ qupv3_id_2: geniqup@8c0000 {
 			#size-cells = <2>;
 			ranges;
 			status = "disabled";
+
+			i2c14: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00880000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c14_default>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi14: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00880000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c15: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00884000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c15_default>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi15: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00884000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c16: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00888000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c16_default>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi16: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00888000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c17_default>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi17: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			/* QUP no. 18 seems to be strictly SPI/UART-only */
+
+			spi18: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00890000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart18: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00890000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart18_default>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@894000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c19_default>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi19: spi@894000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		qupv3_id_0: geniqup@9c0000 {
@@ -1417,6 +1575,13 @@ qup_uart6_default: qup-uart6-default {
 				bias-disable;
 			};
 
+			qup_uart18_default: qup-uart18-default {
+				pins = "gpio58", "gpio59";
+				function = "qup18";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-default {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -1507,6 +1672,41 @@ qup_i2c13_default: qup-i2c13-default {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			qup_i2c14_default: qup-i2c14-default {
+				pins = "gpio56", "gpio57";
+				function = "qup14";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_i2c15_default: qup-i2c15-default {
+				pins = "gpio60", "gpio61";
+				function = "qup15";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_i2c16_default: qup-i2c16-default {
+				pins = "gpio64", "gpio65";
+				function = "qup16";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_i2c17_default: qup-i2c17-default {
+				pins = "gpio72", "gpio73";
+				function = "qup17";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_i2c19_default: qup-i2c19-default {
+				pins = "gpio76", "gpio77";
+				function = "qup19";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		rng: rng@10d3000 {
-- 
2.33.1

