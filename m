Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1923B3E02C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238548AbhHDOGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:06:43 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:60997 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238518AbhHDOGm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:06:42 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 2005C440EBC;
        Wed,  4 Aug 2021 17:06:07 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: qcom: ipq6018: add usb3 DT description
Date:   Wed,  4 Aug 2021 17:05:10 +0300
Message-Id: <436c458546b2a783af36a190ed72ebc5c74de44e.1628085910.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kathiravan T <kathirav@codeaurora.org>

Based on downstream codeaurora code.

Tested (USB2 only) on IPQ6010 based hardware.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 83 +++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9fa5b028e4f3..ab701da582e5 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -524,6 +524,89 @@ qrtr_requests {
 			};
 		};
 
+		ssphy_0: ssphy@78000 {
+			compatible = "qcom,ipq6018-qmp-usb3-phy";
+			reg = <0x0 0x78000 0x0 0x1C4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#clock-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>, <&xo>;
+			clock-names = "aux", "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_USB0_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy","common";
+			status = "disabled";
+
+			usb0_ssphy: lane@78200 {
+				reg = <0x0 0x00078200 0x0 0x130>, /* Tx */
+				      <0x0 0x00078400 0x0 0x200>, /* Rx */
+				      <0x0 0x00078800 0x0 0x1F8>, /* PCS */
+				      <0x0 0x00078600 0x0 0x044>; /* PCS misc */
+				#phy-cells = <0>;
+				clocks = <&gcc GCC_USB0_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "gcc_usb0_pipe_clk_src";
+			};
+		};
+
+		qusb_phy_0: qusb@79000 {
+			compatible = "qcom,ipq6018-qusb2-phy";
+			reg = <0x0 0x079000 0x0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				<&xo>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+			status = "disabled";
+		};
+
+		usb3: usb3@8A00000 {
+			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
+			reg = <0x0 0x8AF8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
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
+					       <133330000>,
+					       <20000000>;
+
+			resets = <&gcc GCC_USB0_BCR>;
+			status = "disabled";
+
+			dwc_0: dwc3@8A00000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x8A00000 0x0 0xcd00>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,ref-clock-period = <0x32>;
+				dr_mode = "host";
+			};
+		};
 	};
 
 	wcss: wcss-smp2p {
-- 
2.30.2

