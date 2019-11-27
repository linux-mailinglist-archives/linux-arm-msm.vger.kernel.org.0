Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC9E10AEFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 12:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfK0LuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 06:50:07 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:39426
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbfK0LuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 06:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574855406;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=WlDrsgCVCWDXLmGPBhA+0beAWE9MAihheycKfW6qYJs=;
        b=ZFSHVlOVJuuRKRGvtkPkII4NRtJv6Rg9FcYTL8aI43e0/H8gKBBJHu/I/0W4/huG
        ENQBp7bBsFjQvouZDzjud2FzOQF7XvTFuPGeY/fJL+VrNhx3d19l/zln+ncjYSqPijk
        x6kZFzOb3eoSxBToLzV56cPykinzoWqMA+R4W4Cg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574855406;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=WlDrsgCVCWDXLmGPBhA+0beAWE9MAihheycKfW6qYJs=;
        b=B+jawMYKTTMs8++BSnHDGEgV4hoWZf51MCZSbXmrcPSrN/Pkh92CVotkuCxWWzki
        ykEVY1uhC42NtcUyGY7+BQrPYnM1JcP8vRUWypgEMjPAF465ngblyAYEd+Kzsg0dENs
        B8wijC8gOg/bVX7wxSl4JRc1+h+ahaqg+WbAaRrA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08AD3C447B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH V1 2/2] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD card
Date:   Wed, 27 Nov 2019 11:50:06 +0000
Message-ID: <0101016eacb27366-31803877-9137-4c0e-922b-6a71a0e63ab3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574855381-15193-1-git-send-email-vbadigan@codeaurora.org>
References: <1574855381-15193-1-git-send-email-vbadigan@codeaurora.org>
X-SES-Outgoing: 2019.11.27-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sdhc instances for supporting eMMC and SD-card on sc7180.
The regulators should be in HPM state for proper functionality of
eMMC and SD-card. Updating corresponding regulators accordingly.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---

This depends on the patch series (dt support for sc7180):
https://lkml.org/lkml/2019/11/8/149
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  32 +++++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 136 ++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 189254f..583c42c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -11,6 +11,7 @@
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. SC7180 IDP";
@@ -103,7 +104,7 @@
 		vreg_l12a_1p8: ldo12 {
 			regulator-min-microvolt = <1696000>;
 			regulator-max-microvolt = <1952000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l13a_1p8: ldo13 {
@@ -145,7 +146,7 @@
 		vreg_l19a_2p9: ldo19 {
 			regulator-min-microvolt = <2696000>;
 			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
 
@@ -191,7 +192,7 @@
 		vreg_l6c_2p9: ldo6 {
 			regulator-min-microvolt = <2696000>;
 			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c_3p0: ldo7 {
@@ -209,7 +210,7 @@
 		vreg_l9c_2p9: ldo9 {
 			regulator-min-microvolt = <2952000>;
 			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10c_3p3: ldo10 {
@@ -400,3 +401,26 @@
 			bias-pull-up;
 		};
 };
+
+&sdhc_1 {
+	status = "ok";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+	vmmc-supply = <&vreg_l19a_2p9>;
+	vqmmc-supply = <&vreg_l12a_1p8>;
+
+};
+
+&sdhc_2 {
+	status = "ok";
+
+	pinctrl-names = "default","sleep";
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+	vmmc-supply  = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+
+	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 666e9b9..207d44f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -897,6 +897,100 @@
 					function = "qup15";
 				};
 			};
+
+			sdc1_on: sdc1-on {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_off: sdc1-off {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_on: sdc2_on {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+				sd-cd {
+					pins = "gpio69";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_off: sdc2_off {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+				sd-cd {
+					pins = "gpio69";
+					bias-pull-down;
+				};
+			};
 		};
 
 		qspi: spi@88dc000 {
@@ -911,6 +1005,48 @@
 			status = "disabled";
 		};
 
+		sdhc_1: sdhci@7c4000 {
+			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x7c4000 0 0x1000>;
+			reg-names = "hc_mem";
+
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+					<&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core", "iface";
+
+			bus-width = <8>;
+			non-removable;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			status = "disabled";
+		};
+
+		sdhc_2: sdhci@8804000 {
+			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+			reg-names = "hc_mem";
+
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+					<&gcc GCC_SDCC2_AHB_CLK>;
+			clock-names = "core","iface";
+
+			bus-width = <4>;
+
+			status = "disabled";
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

