Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCBB44F606
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbhKNBbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:11 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:43441 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhKNBbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:07 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 7E13C3EE65;
        Sun, 14 Nov 2021 02:28:11 +0100 (CET)
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
Subject: [PATCH 09/16] arm64: dts: qcom: sm8350: Set up WRAP0 QUPs
Date:   Sun, 14 Nov 2021 02:27:48 +0100
Message-Id: <20211114012755.112226-9-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set up I2C&SPI hosts and UARTs connected to WRAP0 and their respective pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 287 +++++++++++++++++++++++++++
 1 file changed, 287 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 3d0d80e61405..4b864fcb04e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -619,6 +619,25 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qup_opp_table_100mhz: qup-100mhz-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-50000000 {
+				opp-hz = /bits/ 64 <50000000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+		};
+
 		qupv3_id_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
@@ -642,6 +661,84 @@ qupv3_id_0: geniqup@9c0000 {
 			ranges;
 			status = "disabled";
 
+			i2c0: i2c@980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00980000 0 0x4000>;
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
+			spi0: spi@980000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00980000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00984000 0 0x4000>;
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
+			spi1: spi@984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00984000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00988000 0 0x4000>;
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
+			spi2: spi@988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			uart2: serial@98c000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x0098c000 0 0x4000>;
@@ -650,6 +747,140 @@ uart2: serial@98c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart3_default_state>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			/* QUP no. 3 seems to be strictly SPI-only */
+
+			spi3: spi@98c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0098c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00990000 0 0x4000>;
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
+			spi4: spi@990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00990000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@994000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00994000 0 0x4000>;
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
+			spi5: spi@994000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00994000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@998000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c6_default>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi6: spi@998000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart6: serial@998000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart6_default>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@99c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c7_default>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi7: spi@99c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1017,6 +1248,62 @@ tx {
 				};
 			};
 
+			qup_uart6_default: qup-uart6-default {
+				pins = "gpio30", "gpio31";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_i2c0_default: qup-i2c0-default {
+				pins = "gpio4", "gpio5";
+				function = "qup0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_default: qup-i2c1-default {
+				pins = "gpio8", "gpio9";
+				function = "qup1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_default: qup-i2c2-default {
+				pins = "gpio12", "gpio13";
+				function = "qup2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c4_default: qup-i2c4-default {
+				pins = "gpio20", "gpio21";
+				function = "qup4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c5_default: qup-i2c5-default {
+				pins = "gpio24", "gpio25";
+				function = "qup5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c6_default: qup-i2c6-default {
+				pins = "gpio28", "gpio29";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c7_default: qup-i2c7-default {
+				pins = "gpio32", "gpio33";
+				function = "qup7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_i2c13_default_state: qup-i2c13-default-state {
 				mux {
 					pins = "gpio0", "gpio1";
-- 
2.33.1

