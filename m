Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A55D368610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 19:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbhDVRhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 13:37:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31521 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238344AbhDVRg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 13:36:59 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 22 Apr 2021 10:36:23 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Apr 2021 10:36:21 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 22 Apr 2021 23:05:50 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0FA89394C; Thu, 22 Apr 2021 23:05:46 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add USB related nodes
Date:   Thu, 22 Apr 2021 23:05:31 +0530
Message-Id: <1619112931-2144-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619112931-2144-1-git-send-email-sanm@codeaurora.org>
References: <1619112931-2144-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for DWC3 USB controller, QMP and HS USB PHYs.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  40 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 150 ++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 54d2cb3..f1998d8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -242,6 +242,46 @@
 	status = "okay";
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
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p8>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
 &qup_uart5_default {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 2cc4785..8323f53 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -805,6 +805,110 @@
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sc7280-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e3000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+		};
+
+		usb_2_hsphy: phy@88e4000 {
+			compatible = "qcom,sc7280-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e4000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+		};
+
+		usb_1_qmpphy: phy-wrapper@88e9000 {
+			compatible = "qcom,sm8250-qmp-usb3-phy";
+			reg = <0 0x088e9000 0 0x200>,
+			      <0 0x088e8000 0 0x20>;
+			reg-names = "reg-base", "dp_com";
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
+			clock-names = "aux", "ref_clk_src", "com_aux";
+
+			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			usb_1_ssphy: usb3-phy@88e9200 {
+				reg = <0 0x088e9200 0 0x200>,
+				      <0 0x088e9400 0 0x200>,
+				      <0 0x088e9c00 0 0x400>,
+				      <0 0x088e9600 0 0x200>,
+				      <0 0x088e9800 0 0x200>,
+				      <0 0x088e9a00 0 0x100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+		};
+
+		usb_2: usb@8cf8800 {
+			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
+			reg = <0 0x08cf8800 0 0x400>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core", "iface","mock_utmi",
+				      "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <&pdc 13 IRQ_TYPE_EDGE_RISING>,
+				     <&pdc 12 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "hs_phy_irq",
+					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
+
+			resets = <&gcc GCC_USB30_SEC_BCR>;
+
+			usb_2_dwc3: dwc3@8c00000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x08c00000 0 0xe000>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0xa0 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_2_hsphy>;
+				phy-names = "usb2-phy";
+				maximum-speed = "high-speed";
+			};
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
 			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
@@ -812,6 +916,52 @@
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
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
+
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			usb_1_dwc3: dwc3@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xe000>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0xe0 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				maximum-speed = "super-speed";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

