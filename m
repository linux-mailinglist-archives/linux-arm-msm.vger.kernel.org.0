Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A047F1A4E19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 07:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgDKFC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 01:02:56 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23293 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726037AbgDKFC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 01:02:56 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Apr 2020 22:02:56 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 10 Apr 2020 22:02:53 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 2F98D21681; Sat, 11 Apr 2020 10:32:49 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V2 5/5] arm64: dts: ipq8074: enable USB support
Date:   Sat, 11 Apr 2020 10:32:32 +0530
Message-Id: <1586581352-27017-6-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
References: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 has two super speed usb ports, add phy and dwc3 nodes
to enable them.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2]
 * Addressed Bjorn's review comments
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  24 +++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 167 ++++++++++++++++++++++++++++++
 2 files changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index 6754cb0..dadaa8e 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -82,3 +82,27 @@
 		nand-bus-width = <8>;
 	};
 };
+
+&qusb_phy_0 {
+	status = "ok";
+};
+
+&qusb_phy_1 {
+	status = "ok";
+};
+
+&ssphy_0 {
+	status = "ok";
+};
+
+&ssphy_1 {
+	status = "ok";
+};
+
+&usb_0 {
+	status = "ok";
+};
+
+&usb_1 {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5303821..506a8ac 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -82,6 +82,91 @@
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
+		ssphy_1: phy@58000 {
+			compatible = "qcom,ipq8074-qmp-usb3-phy";
+			reg = <0x00058000 0x1c4>;
+			#clock-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB1_AUX_CLK>,
+				<&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				<&xo>;
+			clock-names = "aux", "cfg_ahb", "ref";
+
+			resets =  <&gcc GCC_USB1_PHY_BCR>,
+				<&gcc GCC_USB3PHY_1_PHY_BCR>;
+			reset-names = "phy","common";
+			status = "disabled";
+
+			usb1_ssphy: lane@58200 {
+				reg = <0x00058200 0x130>,       /* Tx */
+				      <0x00058400 0x200>,     /* Rx */
+				      <0x00058800 0x1f8>,     /* PCS  */
+				      <0x00058600 0x044>;     /* PCS misc*/
+				#phy-cells = <0>;
+				clocks = <&gcc GCC_USB1_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "gcc_usb1_pipe_clk_src";
+			};
+		};
+
+		qusb_phy_1: phy@59000 {
+			compatible = "qcom,ipq8074-qusb2-phy";
+			reg = <0x00059000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				 <&xo>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
+			status = "disabled";
+		};
+
+		ssphy_0: phy@78000 {
+			compatible = "qcom,ipq8074-qmp-usb3-phy";
+			reg = <0x00078000 0x1c4>;
+			#clock-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				<&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				<&xo>;
+			clock-names = "aux", "cfg_ahb", "ref";
+
+			resets =  <&gcc GCC_USB0_PHY_BCR>,
+				<&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy","common";
+			status = "disabled";
+
+			usb0_ssphy: lane@78200 {
+				reg = <0x00078200 0x130>,       /* Tx */
+				      <0x00078400 0x200>,     /* Rx */
+				      <0x00078800 0x1f8>,     /* PCS  */
+				      <0x00078600 0x044>;     /* PCS misc*/
+				#phy-cells = <0>;
+				clocks = <&gcc GCC_USB0_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "gcc_usb0_pipe_clk_src";
+			};
+		};
+
+		qusb_phy_0: phy@79000 {
+			compatible = "qcom,ipq8074-qusb2-phy";
+			reg = <0x00079000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&xo>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+		};
+
 		pcie_phy0: phy@86000 {
 			compatible = "qcom,ipq8074-qmp-pcie-phy";
 			reg = <0x00086000 0x1000>;
@@ -294,6 +379,88 @@
 			status = "disabled";
 		};
 
+		usb_0: usb@8af8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x08af8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
+				<&gcc GCC_USB0_MASTER_CLK>,
+				<&gcc GCC_USB0_SLEEP_CLK>,
+				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			clock-names = "sys_noc_axi",
+				"master",
+				"sleep",
+				"mock_utmi";
+
+			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
+					  <&gcc GCC_USB0_MASTER_CLK>,
+					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <133330000>,
+						<133330000>,
+						<19200000>;
+
+			resets = <&gcc GCC_USB0_BCR>;
+			status = "disabled";
+
+			dwc_0: dwc3@8a00000 {
+				compatible = "snps,dwc3";
+				reg = <0x8a00000 0xcd00>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				dr_mode = "host";
+			};
+		};
+
+		usb_1: usb@8cf8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x08cf8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
+				<&gcc GCC_USB1_MASTER_CLK>,
+				<&gcc GCC_USB1_SLEEP_CLK>,
+				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			clock-names = "sys_noc_axi",
+				"master",
+				"sleep",
+				"mock_utmi";
+
+			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
+					  <&gcc GCC_USB1_MASTER_CLK>,
+					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <133330000>,
+						<133330000>,
+						<19200000>;
+
+			resets = <&gcc GCC_USB1_BCR>;
+			status = "disabled";
+
+			dwc_1: dwc3@8c00000 {
+				compatible = "snps,dwc3";
+				reg = <0x8c00000 0xcd00>;
+				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_1>, <&usb1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				dr_mode = "host";
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.7.4

