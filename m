Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4651E44F60D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236193AbhKNBbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbhKNBbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:09 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF362C061206;
        Sat, 13 Nov 2021 17:28:14 -0800 (PST)
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id A14EF3EE6C;
        Sun, 14 Nov 2021 02:28:12 +0100 (CET)
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
Subject: [PATCH 10/16] arm64: dts: qcom: sm8350: Set up WRAP1 QUPs
Date:   Sun, 14 Nov 2021 02:27:49 +0100
Message-Id: <20211114012755.112226-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set up I2C&SPI hosts and UARTs connected to WRAP1 and their respective pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 213 +++++++++++++++++++++++++--
 1 file changed, 202 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 4b864fcb04e0..033d3984d572 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -638,6 +638,25 @@ opp-100000000 {
 			};
 		};
 
+		qup_opp_table_120mhz: qup-120mhz-opp-table {
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
+			opp-120000000 {
+				opp-hz = /bits/ 64 <120000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+		};
+
 		qupv3_id_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
@@ -898,18 +917,161 @@ qupv3_id_1: geniqup@ac0000 {
 			ranges;
 			status = "disabled";
 
+			i2c8: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c8_default>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi8: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c9_default>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi9: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c10_default>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi10: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c11_default>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi11: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c12_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi12: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c13: i2c@a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a94000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_i2c13_default_state>;
+				pinctrl-0 = <&qup_i2c13_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			spi13: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SM8350_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
@@ -1304,17 +1466,46 @@ qup_i2c7_default: qup-i2c7-default {
 				bias-disable;
 			};
 
-			qup_i2c13_default_state: qup-i2c13-default-state {
-				mux {
-					pins = "gpio0", "gpio1";
-					function = "qup13";
-				};
+			qup_i2c8_default: qup-i2c8-default {
+				pins = "gpio36", "gpio37";
+				function = "qup8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				config {
-					pins = "gpio0", "gpio1";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
+			qup_i2c9_default: qup-i2c9-default {
+				pins = "gpio40", "gpio41";
+				function = "qup9";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_default: qup-i2c10-default {
+				pins = "gpio44", "gpio45";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c11_default: qup-i2c11-default {
+				pins = "gpio48", "gpio49";
+				function = "qup11";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c12_default: qup-i2c12-default {
+				pins = "gpio52", "gpio53";
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c13_default: qup-i2c13-default {
+				pins = "gpio0", "gpio1";
+				function = "qup13";
+				drive-strength = <2>;
+				bias-pull-up;
 			};
 		};
 
-- 
2.33.1

