Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2760AEB189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 14:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfJaNuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 09:50:10 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:34825 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727446AbfJaNuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 09:50:10 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 19:19:37 +0530
IronPort-SDR: tOZQep9yi+hYi70fpoamKgfI4jkNF15pKHwIdCg5Ed5Y1Um3m3fJ7GUkScrr8Eh9Fut/COthea
 CsZRUlqUh19DIoAWZiWQb/PjTyz3r6SHPQnbRt/Ljdlg9/uhpQktJ5MZdR8zIsbBY+ed3amD6h
 4M0AGzLg/mXVDQTjHWniV9fydT5U9L/3s6ZL/+tYxw54QxfmJ7HLgYZuMQ+O6mfps3tmqY6NkD
 yucOtTbm10CmhtUFAxzihtIzzryDP2pPemOkjy1Vzv4lgCr8DjgUYlwGVornWTBBD0G0sjJxl1
 BamKJuDauV3uZOy+TbdOv75e
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Oct 2019 19:19:27 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 5F3DE19D7; Thu, 31 Oct 2019 19:19:26 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     sanm@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Date:   Thu, 31 Oct 2019 19:19:22 +0530
Message-Id: <1572529762-31256-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572529762-31256-1-git-send-email-sanm@codeaurora.org>
References: <1572529762-31256-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for DWC3 USB controller, QMP and QUSB PHYs.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 104 ++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 189254f..aecc994 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -400,3 +400,28 @@
 			bias-pull-up;
 		};
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+	vdd-supply = <&vreg_l4a_0p8>;
+	vdda-pll-supply = <&vreg_l11a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l4a_0p8>;
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index cb623b7..7ee068f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/phy/phy-qcom-qusb2.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -184,6 +185,17 @@
 			#power-domain-cells = <1>;
 		};
 
+		qfprom@784000 {
+			compatible = "qcom,qfprom";
+			reg = <0 0x00784000 0 0x8ff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qusb2p_hstx_trim: hstx-trim-primary@25b {
+				reg = <0x25b 0x1>;
+				bits = <1 3>;
+			};
+		};
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm845-pdc";
 			reg = <0 0xb220000 0 0x30000>;
@@ -913,6 +925,98 @@
 			status = "disabled";
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sc7180-qusb2-phy";
+			reg = <0 0x088e3000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			<&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_ahb","ref";
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			nvmem-cells = <&qusb2p_hstx_trim>;
+		};
+
+		usb_1_qmpphy: phy@88e9000 {
+			compatible = "qcom,sc7180-qmp-usb3-phy";
+			reg = <0 0x088e9000 0 0x18c>,
+			      <0 0x088e8000 0 0x38>;
+			reg-names = "reg-base", "dp_com";
+			status = "disabled";
+			#clock-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
+
+			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			usb_1_ssphy: lanes@88e9200 {
+				reg = <0 0x088e9200 0 0x128>,
+				      <0 0x088e9400 0 0x200>,
+				      <0 0x088e9c00 0 0x218>,
+				      <0 0x088e9600 0 0x128>,
+				      <0 0x088e9800 0 0x200>,
+				      <0 0x088e9a00 0 0x18>;
+				#phy-cells = <0>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <150000000>;
+
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq",
+					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			usb_1_dwc3: dwc3@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xe000>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x540 0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0xc440000 0 0x1100>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

