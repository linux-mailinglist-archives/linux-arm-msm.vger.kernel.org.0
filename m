Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737AB3F0197
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 12:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhHRK2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 06:28:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20348 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhHRK2O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 06:28:14 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Aug 2021 03:27:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Aug 2021 03:27:38 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Aug 2021 15:57:10 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id EC86C21FCF; Wed, 18 Aug 2021 15:57:08 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Subject: [PATCH v1 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Date:   Wed, 18 Aug 2021 15:57:04 +0530
Message-Id: <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

Add edp controller and phy DT nodes for sc7280.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 127 ++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index aadf55d..5be318e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1412,7 +1412,7 @@
 			reg = <0 0xaf00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <0>, <0>, <0>, <0>, <0>, <0>;
+				 <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
@@ -1493,6 +1493,12 @@
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+					port@1 {
+						reg = <1>;
+						dpu_intf5_out: endpoint {
+							remote-endpoint = <&edp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: mdp-opp-table {
@@ -1608,6 +1614,101 @@
 
 				status = "disabled";
 			};
+
+			msm_edp: edp@aea0000 {
+				status = "disabled";
+				compatible = "qcom,sc7280-edp";
+				reg = <0 0xaea0000 0 0x200>,
+				      <0 0xaea0200 0 0x200>,
+				      <0 0xaea0400 0 0xc00>,
+				      <0 0xaea1000 0 0x400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <14 IRQ_TYPE_NONE>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
+				clock-names = "core_xo", "core_ref",
+					      "core_iface", "core_aux", "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
+
+				phys = <&edp_phy>;
+				phy-names = "dp";
+
+				vdda-1p2-supply = <&vreg_l6b_1p2>;
+				vdda-0p9-supply = <&vreg_l10c_0p8>;
+				operating-points-v2 = <&edp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&edp_hot_plug_det>, <&edp_panel_power_on>;
+
+				panel-bklt-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+				panel-pwm-gpio = <&pm8350c_gpios 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						edp_in: endpoint {
+							remote-endpoint = <&dpu_intf5_out>;
+						};
+					};
+				};
+
+				edp_opp_table: edp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			edp_phy: phy@aec2000 {
+				status = "disabled";
+				compatible = "qcom,sc7280-edp-phy";
+				reg = <0 0xaec2a00 0 0x19c>,
+				      <0 0xaec2200 0 0xa0>,
+				      <0 0xaec2600 0 0xa0>,
+				      <0 0xaec2000 0 0x1c0>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>;
+				clock-names = "aux", "cfg_ahb";
+
+				vdda-pll-supply = <&vreg_l6b_1p2>;
+				vdda-phy-supply = <&vreg_l10c_0p8>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -1704,6 +1805,30 @@
 				function = "qup13";
 			};
 
+			edp_hot_plug_det: edp-hot-plug-det {
+				pinmux {
+					pins = "gpio60";
+					function = "edp_hot";
+				};
+				pinconf {
+					pins = "gpio60";
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			edp_panel_power_on: edp-panel-power-on {
+				pinmux {
+					pins = "gpio80";
+					function = "gpio";
+				};
+				pinconf {
+					pins = "gpio80";
+					bias-disable;
+					output-high;
+				};
+			};
+
 			sdc1_on: sdc1-on {
 				clk {
 					pins = "sdc1_clk";
-- 
2.7.4

