Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32EA342ECB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 19:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhCTSSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Mar 2021 14:18:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32819 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhCTSSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Mar 2021 14:18:02 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 20 Mar 2021 11:18:01 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Mar 2021 11:17:59 -0700
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Mar 2021 23:47:08 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 793EE4AE7; Sat, 20 Mar 2021 23:47:07 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
Date:   Sat, 20 Mar 2021 23:47:00 +0530
Message-Id: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for eMMC and SD card on sc7280.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

---
This change is depends on the below patch series:
https://lore.kernel.org/patchwork/project/lkml/list/?series=488871
https://lore.kernel.org/patchwork/project/lkml/list/?series=489530
https://lore.kernel.org/patchwork/project/lkml/list/?series=488429

Changes since V1:
	- Moved SDHC nodes as suggested by Bjorn Andersson.
	- Dropped "pinconf-" prefix as suggested by Bjorn Andersson.
	- Removed extra newlines as suggested by Konrad Dybcio.
	- Changed sd-cd pin to bias-pull-up in sdc2_off as suggested by
	  Veerabhadrarao Badiganti.
	- Added bandwidth votes for eMMC and SD card.
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  25 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 213 ++++++++++++++++++++++++++++++++
 2 files changed, 238 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 54d2cb3..4105263 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
@@ -242,6 +243,30 @@
 	status = "okay";
 };
 
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+
+	vmmc-supply = <&vreg_l7b_2p9>;
+	vqmmc-supply = <&vreg_l19b_1p8>;
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
+
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
 &qup_uart5_default {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8f6b569..69eb064 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -20,6 +20,11 @@
 
 	chosen { };
 
+	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -305,6 +310,64 @@
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
+			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+			power-domains = <&rpmhpd SC7280_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
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
+			sdhc1_opp_table: sdhc1-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1200000 76000>;
+					opp-avg-kBps = <1200000 50000>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <6000000 300000>;
+				};
+			};
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x2000>;
@@ -328,6 +391,54 @@
 			};
 		};
 
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
+			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+			power-domains = <&rpmhpd SC7280_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
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
+			sdhc2_opp_table: sdhc2-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-100000000 {
+						opp-hz =/bits/ 64 <100000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+						opp-peak-kBps = <1200000 76000>;
+						opp-avg-kBps = <1200000 50000>;
+					};
+					opp-202000000 {
+						opp-hz = /bits/ 64 <202000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+						opp-peak-kBps = <3500000 1200000>;
+						opp-avg-kBps = <5000000 100000>;
+					};
+				};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
@@ -374,6 +485,108 @@
 				pins = "gpio46", "gpio47";
 				function = "qup13";
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
+			sdc2_on: sdc2-on {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				sd-cd {
+					pins = "gpio91";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_off: sdc2-off {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				sd-cd {
+					pins = "gpio91";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.7.4

