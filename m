Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3093C6AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 09:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhGMHKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 03:10:17 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35944 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbhGMHKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 03:10:17 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 13 Jul 2021 00:07:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Jul 2021 00:07:24 -0700
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg02-blr.qualcomm.com with ESMTP; 13 Jul 2021 12:36:12 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 59E314EE6; Tue, 13 Jul 2021 12:36:13 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V6] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
Date:   Tue, 13 Jul 2021 12:36:11 +0530
Message-Id: <1626159971-22519-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for eMMC and SD card on sc7280.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
---

This change is depends on the below patch series:
https://lore.kernel.org/patchwork/cover/1418814/

Changes since V5:
	- Modified sdhci1_opp_table: sdhc1-opp-table and sdhc2_opp_table:
	  sdhc2-opp-table tag names as per Stephen Boyd suggestion.

Changes since V4:
	- Included gpio header in proper order and moved default pins
	  configs to soc file as suggested by Stephen Boyd.

Changes since V3:
	- Changed pinconfig names as suggested by Konrad Dybcio.
	- Removed extra lines and aligned some of lines as
	  suggested by Bjorn Andersson.

Change since V2:
	- Added leading zero's for register address and "qcom,sc7280-sdhci"
	  string in compatible as suggested by Stephen Boyd and Doug.
	- Removed max-frequency flag, no-mmc and no-sdio flags
	  for Sd card as suggested by Doug and Stephen Boyd.
	- Moved non-removable, no-sd, no-sdio and some pin config
	  changes from soc to board dts file as suggested by Doug.
	- Removed sleep state for CD line and drive-strength for
	  input pins as suggested by Doug.
	- Updated bus vote numbers for eMMC and SD card.

Changes since V1:
	- Moved SDHC nodes as suggested by Bjorn Andersson.
	- Dropped "pinconf-" prefix as suggested by Bjorn Andersson.
	- Removed extra newlines as suggested by Konrad Dybcio.
	- Changed sd-cd pin to bias-pull-up in sdc2_off as suggested by
	  Veerabhadrarao Badiganti.
	- Added bandwidth votes for eMMC and SD card.
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  71 ++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 185 ++++++++++++++++++++++++++++++++
 2 files changed, 256 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 3900cfc..1be822c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
@@ -272,6 +273,34 @@
 	status = "okay";
 };
 
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	vmmc-supply = <&vreg_l7b_2p9>;
+	vqmmc-supply = <&vreg_l19b_1p8>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+};
+
 &uart5 {
 	status = "okay";
 };
@@ -291,3 +320,45 @@
 		bias-pull-up;
 	};
 };
+
+&sdc1_on {
+	clk {
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	cmd {
+		bias-pull-up;
+		drive-strength = <10>;
+	};
+
+	data {
+		bias-pull-up;
+		drive-strength = <10>;
+	};
+
+	rclk {
+		bias-pull-down;
+	};
+};
+
+&sdc2_on {
+	clk {
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	cmd {
+		bias-pull-up;
+		drive-strength = <10>;
+	};
+
+	data {
+		bias-pull-up;
+		drive-strength = <10>;
+	};
+
+	sd-cd {
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a8c274a..98aca96 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -24,6 +24,11 @@
 
 	chosen { };
 
+	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -436,6 +441,60 @@
 			#mbox-cells = <2>;
 		};
 
+		sdhc_1: sdhci@7c4000 {
+			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
+			status = "disabled";
+
+			reg = <0 0x007c4000 0 0x1000>,
+			      <0 0x007c5000 0 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			iommus = <&apps_smmu 0xc0 0x0>;
+			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
+			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+			power-domains = <&rpmhpd SC7280_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			bus-width = <8>;
+			supports-cqe;
+
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1800000 400000>;
+					opp-avg-kBps = <100000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <390000 0>;
+				};
+			};
+
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x2000>;
@@ -1035,6 +1094,51 @@
 			};
 		};
 
+		sdhc_2: sdhci@8804000 {
+			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
+			status = "disabled";
+
+			reg = <0 0x08804000 0 0x1000>;
+
+			iommus = <&apps_smmu 0x100 0x0>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
+			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+			power-domains = <&rpmhpd SC7280_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			bus-width = <4>;
+
+			qcom,dll-config = <0x0007642c>;
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1800000 400000>;
+					opp-avg-kBps = <100000 0>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <200000 0>;
+				};
+			};
+
+		};
+
 		dc_noc: interconnect@90e0000 {
 			reg = <0 0x090e0000 0 0x5080>;
 			compatible = "qcom,sc7280-dc-noc";
@@ -1185,6 +1289,87 @@
 				pins = "gpio46", "gpio47";
 				function = "qup13";
 			};
+
+			sdc1_on: sdc1-on {
+				clk {
+					pins = "sdc1_clk";
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+				};
+
+				data {
+					pins = "sdc1_data";
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+				};
+			};
+
+			sdc1_off: sdc1-off {
+				clk {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-bus-hold;
+				};
+			};
+
+			sdc2_on: sdc2-on {
+				clk {
+					pins = "sdc2_clk";
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+				};
+
+				data {
+					pins = "sdc2_data";
+				};
+
+				sd-cd {
+					pins = "gpio91";
+				};
+			};
+
+			sdc2_off: sdc2-off {
+				clk {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd {
+					pins ="sdc2_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data {
+					pins ="sdc2_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

