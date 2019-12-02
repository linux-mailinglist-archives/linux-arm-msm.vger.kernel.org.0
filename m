Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0536C10EB10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 14:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfLBNrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 08:47:46 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:40814
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727364AbfLBNrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 08:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575294465;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=JSTCODDV4fZkPKmL8vcXxAelTBPKLHzN7Xez7g7rwRQ=;
        b=jNtTfeaXaDFHXY9nW3Lp+7mwyqyHTYtoF8W/hyw7vMbq0ou3ilslo13Nz5a0DUHF
        g3bOi25Lx2cJv9N4MpuNWZnnD3R2zqb2Cvd0HTClOXSNUGMScp+jOas6bXpUCNcEGEG
        uE+dPzaw9ZPsxAuOO3YY7cIb8PWbYEHmvAbcC64A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575294465;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=JSTCODDV4fZkPKmL8vcXxAelTBPKLHzN7Xez7g7rwRQ=;
        b=g0gIRYMeq1MqZZUae4tn0jCcE5Rup+H6wUVFvq+53/K2VJtq2LmL/s5u1Vn1ykVS
        uyllK8QkECOpixFdq4FVsLhpYj8AWZsGBeB6hd+fcRcIn92qdXqoBrLV30dewHSAbvz
        mZ1M1DvG2TH6n6KZAd+/9yk46MPpreKOKV/etJS4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF23DC774A7
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=chandanu@codeaurora.org
From:   Chandan Uddaraju <chandanu@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: [DPU PATCH v3 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon 845
Date:   Mon, 2 Dec 2019 13:47:45 +0000
Message-ID: <0101016ec6ddf4fc-cbe2c43a-6b6c-4035-846a-038fac788c62-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
X-SES-Outgoing: 2019.12.02-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for Snapdragon 845 DisplayPort and
display-port PLL driver.

Changes in V2:
Provide details about sel-gpio

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
---
 .../devicetree/bindings/display/msm/dp.txt         | 249 +++++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
 2 files changed, 261 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
new file mode 100644
index 0000000..38be36d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp.txt
@@ -0,0 +1,249 @@
+Qualcomm Technologies, Inc.
+DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
+DP Controller: Required properties:
+- compatible:           Should be "qcom,dp-display".
+- reg:                  Base address and length of DP hardware's memory mapped regions.
+- cell-index:           Specifies the controller instance.
+- reg-names:            A list of strings that name the list of regs.
+			"dp_ahb" - DP controller memory region.
+			"dp_aux" - DP AUX memory region.
+			"dp_link" - DP link layer memory region.
+			"dp_p0" - DP pixel clock domain memory region.
+			"dp_phy" - DP PHY memory region.
+			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
+			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
+			"dp_mmss_cc" - Display Clock Control memory region.
+			"qfprom_physical" - QFPROM Phys memory region.
+			"dp_pll" - USB3 DP combo PLL memory region.
+			"usb3_dp_com" - USB3 DP PHY combo memory region.
+			"hdcp_physical" - DP HDCP memory region.
+- interrupt-parent	phandle to the interrupt parent device node.
+- interrupts:		The interrupt signal from the DP block.
+- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
+- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
+			"core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
+			"core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
+			"ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".
+- pll-node:		phandle to DP PLL node.
+- vdda-1p2-supply:		phandle to vdda 1.2V regulator node.
+- vdda-0p9-supply:		phandle to vdda 0.9V regulator node.
+- qcom,aux-cfg0-settings:		Specifies the DP AUX configuration 0 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg1-settings:		Specifies the DP AUX configuration 1 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg2-settings:		Specifies the DP AUX configuration 2 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg3-settings:		Specifies the DP AUX configuration 3 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg4-settings:		Specifies the DP AUX configuration 4 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg5-settings:		Specifies the DP AUX configuration 5 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg6-settings:		Specifies the DP AUX configuration 6 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg7-settings:		Specifies the DP AUX configuration 7 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg8-settings:		Specifies the DP AUX configuration 8 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg9-settings:		Specifies the DP AUX configuration 9 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,max-pclk-frequency-khz:	An integer specifying the maximum. pixel clock in KHz supported by Display Port.
+- extcon:				Phandle for the external connector class interface.
+- qcom,<type>-supply-entries:		A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
+					can be "core", "ctrl", and "phy". Within the same type,
+					there can be more than one instance of this binding,
+					in which case the entry would be appended with the
+					supply entry index.
+					e.g. qcom,ctrl-supply-entry@0
+					-- qcom,supply-name: name of the supply (vdd/vdda/vddio)
+					-- qcom,supply-min-voltage: minimum voltage level (uV)
+					-- qcom,supply-max-voltage: maximum voltage level (uV)
+					-- qcom,supply-enable-load: load drawn (uA) from enabled supply
+					-- qcom,supply-disable-load: load drawn (uA) from disabled supply
+					-- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
+					-- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
+					-- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
+					-- qcom,supply-post-off-sleep: time to sleep (ms) after turning off
+- pinctrl-names:	List of names to assign mdss pin states defined in pinctrl device node
+					Refer to pinctrl-bindings.txt
+- pinctrl-<0..n>:	Lists phandles each pointing to the pin configuration node within a pin
+					controller. These pin configurations are installed in the pinctrl
+					device node. Refer to pinctrl-bindings.txt
+DP Endpoint properties:
+  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
+    input endpoint. For port@1, set to the DPU interface output. See [2] for
+    device graph info.
+
+Optional properties:
+- qcom,aux-en-gpio:		Specifies the aux-channel enable gpio.
+- qcom,aux-sel-gpio:		Specifies the mux-selection that might be needed for aux interface.
+
+
+DP PLL: Required properties:
+- compatible:           Should be "qcom,dp-pll-10nm".
+- reg:                  Base address and length of DP hardware's memory mapped regions.
+- cell-index:           Specifies the PLL instance.
+- reg-names:            A list of strings that name the list of regs.
+			"pll_base" - DP PLL memory region.
+			"phy_base" - DP PHY memory region.
+			"ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
+			"ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.
+			"gdsc_base" - gdsc memory region.
+- interrupt-parent	phandle to the interrupt parent device node.
+- interrupts:		The interrupt signal from the DP block.
+- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
+- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
+			"iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
+- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value			     is set to zero so that minimum clock value is configured. Non-zero clock
+			value can be used to configure DP pixel clock.
+
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/graph.txt
+
+Example:
+	msm_dp: dp_display@ae90000{
+		cell-index = <0>;
+		compatible = "qcom,dp-display";
+
+		reg =   <0 0x90000 0x0dc>,
+			<0 0x90200 0x0c0>,
+			<0 0x90400 0x508>,
+			<0 0x90a00 0x094>,
+			<1 0xeaa00 0x200>,
+			<1 0xea200 0x200>,
+			<1 0xea600 0x200>,
+			<2 0x02000 0x1a0>,
+			<3 0x00000 0x621c>,
+			<1 0xea000 0x180>,
+			<1 0xe8000 0x20>,
+			<4 0xe1000 0x034>;
+		reg-names = "dp_ahb", "dp_aux", "dp_link",
+			"dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
+			"dp_mmss_cc", "qfprom_physical", "dp_pll",
+			"usb3_dp_com", "hdcp_physical";
+
+		interrupt-parent = <&mdss>;
+		interrupts = <12 0>;
+
+		extcon = <&usb_1_ssphy>;
+		clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+			<&rpmhcc RPMH_CXO_CLK>,
+			<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+			<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			<&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+		clock-names = "core_aux_clk", "core_ref_clk_src",
+			"core_usb_ref_clk", "core_usb_cfg_ahb_clk",
+			"core_usb_pipe_clk", "ctrl_link_clk",
+			"ctrl_link_iface_clk", "ctrl_pixel_clk",
+			"crypto_clk", "pixel_clk_rcg";
+
+		pll-node = <&dp_pll>;
+		qcom,aux-cfg0-settings = [20 00];
+		qcom,aux-cfg1-settings = [24 13 23 1d];
+		qcom,aux-cfg2-settings = [28 24];
+		qcom,aux-cfg3-settings = [2c 00];
+		qcom,aux-cfg4-settings = [30 0a];
+		qcom,aux-cfg5-settings = [34 26];
+		qcom,aux-cfg6-settings = [38 0a];
+		qcom,aux-cfg7-settings = [3c 03];
+		qcom,aux-cfg8-settings = [40 bb];
+		qcom,aux-cfg9-settings = [44 03];
+
+		qcom,max-pclk-frequency-khz = <675000>;
+
+		qcom,ctrl-supply-entries {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			qcom,ctrl-supply-entry@0 {
+				reg = <0>;
+				qcom,supply-name = "vdda-1p2";
+				qcom,supply-min-voltage = <1200000>;
+				qcom,supply-max-voltage = <1200000>;
+				qcom,supply-enable-load = <21800>;
+				qcom,supply-disable-load = <4>;
+			};
+		};
+
+		qcom,phy-supply-entries {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			qcom,phy-supply-entry@0 {
+				reg = <0>;
+				qcom,supply-name = "vdda-0p9";
+				qcom,supply-min-voltage = <880000>;
+				qcom,supply-max-voltage = <880000>;
+				qcom,supply-enable-load = <36000>;
+				qcom,supply-disable-load = <32>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp_in: endpoint {
+					remote-endpoint = <&dpu_intf0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dp_out: endpoint {
+				};
+			};
+		};
+	};
+
+	dp_pll: dp-pll@c011000 {
+		compatible = "qcom,dp-pll-10nm";
+		label = "DP PLL";
+		cell-index = <0>;
+		#clock-cells = <1>;
+
+		reg = <1 0xea000 0x200>,
+		      <1 0xeaa00 0x200>,
+		      <1 0xea200 0x200>,
+		      <1 0xea600 0x200>,
+		      <2 0x03000 0x8>;
+		reg-names = "pll_base", "phy_base", "ln_tx0_base",
+			"ln_tx1_base", "gdsc_base";
+
+		clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "iface_clk", "ref_clk",
+			"cfg_ahb_clk", "pipe_clk";
+		clock-rate = <0>;
+
+	};
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index a61dd40..eac6e1c 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -63,8 +63,9 @@ Required properties:
 	Documentation/devicetree/bindings/graph.txt
 	Documentation/devicetree/bindings/media/video-interfaces.txt
 
-	Port 0 -> DPU_INTF1 (DSI1)
-	Port 1 -> DPU_INTF2 (DSI2)
+	Port 0 -> DPU_INTF0 (DP)
+	Port 1 -> DPU_INTF1 (DSI1)
+	Port 2 -> DPU_INTF2 (DSI2)
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -125,13 +126,20 @@ Example:
 
 				port@0 {
 					reg = <0>;
-					dpu_intf1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
+					dpu_intf0_out: endpoint {
+						remote-endpoint = <&dp_in>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
+					dpu_intf1_out: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
 					dpu_intf2_out: endpoint {
 						remote-endpoint = <&dsi1_in>;
 					};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

