Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B01F332EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 20:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhCITTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 14:19:17 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17772 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhCITS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 14:18:59 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Mar 2021 11:18:59 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2021 11:18:56 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Mar 2021 00:48:03 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 6F78446DF; Wed, 10 Mar 2021 00:48:03 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, sartgarg@codeaurora.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V1] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
Date:   Wed, 10 Mar 2021 00:48:03 +0530
Message-Id: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for eMMC and SD card on sc7280.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

---
This change is depends on the below patch series:
https://lore.kernel.org/lkml/1613114930-1661-1-git-send-email-rnayak@codeaurora.org/
https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=28035&state=&q=&archive=&delegate=
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  26 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 170 ++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index ac79420..6abb2aa 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. SC7280 IDP platform";
@@ -256,3 +257,28 @@
 		bias-pull-up;
 	};
 };
+
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+
+	vmmc-supply = <&vreg_l7b_2p9>;
+	vqmmc-supply = <&vreg_l19b_1p8>;
+
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default","sleep";
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3b86052..91fb18a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -18,6 +18,11 @@
 
 	chosen { };
 
+	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -315,6 +320,69 @@
 			#power-domain-cells = <1>;
 		};
 
+		sdhc_1: sdhci@7c4000 {
+			compatible = "qcom,sdhci-msm-v5";
+			reg = <0 0x7c4000 0 0x1000>,
+					<0 0x7c5000 0 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			iommus = <&apps_smmu 0xC0 0x0>;
+			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+					<&gcc GCC_SDCC1_AHB_CLK>,
+					<&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <8>;
+			non-removable;
+			supports-cqe;
+			no-sd;
+			no-sdio;
+
+			max-frequency = <192000000>;
+
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			status = "disabled";
+
+		};
+
+		sdhc_2: sdhci@8804000 {
+			compatible = "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			iommus = <&apps_smmu 0x100 0x0>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+					<&gcc GCC_SDCC2_AHB_CLK>,
+					<&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <4>;
+
+			no-mmc;
+			no-sdio;
+
+			max-frequency = <202000000>;
+
+			qcom,dll-config = <0x0007642c>;
+
+			status = "disabled";
+
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x2000>;
@@ -385,6 +453,108 @@
 				pins = "gpio46", "gpio47";
 				function = "qup13";
 			};
+
+			sdc1_on: sdc1-on {
+				pinconf-clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				pinconf-cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				pinconf-data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				pinconf-rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_off: sdc1-off {
+				pinconf-clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				pinconf-cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				pinconf-data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				pinconf-rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_on: sdc2-on {
+				pinconf-clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				pinconf-cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				pinconf-data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				pinconf-sd-cd {
+					pins = "gpio91";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_off: sdc2-off {
+				pinconf-clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				pinconf-cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				pinconf-data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				pinconf-sd-cd {
+					pins = "gpio91";
+					bias-disable;
+					drive-strength = <2>;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.7.4

