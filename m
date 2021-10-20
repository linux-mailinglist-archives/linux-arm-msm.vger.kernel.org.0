Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65749434CE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 15:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhJTOBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:01:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62668 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbhJTOBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634738359; x=1666274359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U0rU8Gb+Lpc3YPKHJrfuFjPuZQBxa9UuLlsXyP+hDIk=;
  b=eJvnbd+GhY7o0KLNGxdNETes97PTxRYVxZL1IOhhBcLRpoSC2Pj73Lwf
   hAv2kdvdvVZASu9EXDM3s2eaTs2raZwWmyUOcRgg9Ae1OjplzQZsnvgOJ
   cKd/b8bFLzXyMwziQwmV5hTwT6OaGVYpt4yhuNAD2RC9D9QxNcXohnPJb
   M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 06:59:19 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Oct 2021 06:59:17 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Oct 2021 19:29:00 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 24F6522266; Wed, 20 Oct 2021 19:28:59 +0530 (IST)
From:   Krishna Manikandan <quic_mkrishn@quicinc.com>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Date:   Wed, 20 Oct 2021 19:28:53 +0530
Message-Id: <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Add edp controller and phy DT nodes for sc7280.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>

Changes in v2:
    - Move regulator definitions to board file (Matthias Kaehlcke)
    - Move the gpio definitions to board file (Matthias Kaehlcke)
    - Move the pinconf to board file (Matthias Kaehlcke)
    - Move status property (Stephen Boyd)
    - Drop flags from interrupts (Stephen Boyd)
    - Add clock names one per line for readability (Stephen Boyd)
    - Rename edp-opp-table (Stephen Boyd)
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index dd35882..4450277 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2575,7 +2575,7 @@
 			reg = <0 0xaf00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <0>, <0>, <0>, <0>, <0>, <0>;
+				 <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
@@ -2662,6 +2662,13 @@
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf5_out: endpoint {
+							remote-endpoint = <&edp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2777,6 +2784,103 @@
 
 				status = "disabled";
 			};
+
+			msm_edp: edp@aea0000 {
+				compatible = "qcom,sc7280-edp";
+
+				reg = <0 0xaea0000 0 0x200>,
+				      <0 0xaea0200 0 0x200>,
+				      <0 0xaea0400 0 0xc00>,
+				      <0 0xaea1000 0 0x400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <14>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
+				clock-names = "core_xo",
+					      "core_ref",
+					      "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
+
+				phys = <&edp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&edp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
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
+				edp_opp_table: opp-table {
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
+				compatible = "qcom,sc7280-edp-phy";
+
+				reg = <0 0xaec2a00 0 0x19c>,
+				      <0 0xaec2200 0 0xa0>,
+				      <0 0xaec2600 0 0xa0>,
+				      <0 0xaec2000 0 0x1c0>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -3932,6 +4036,7 @@
 							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
+
 		};
 
 		cpu1-thermal {
-- 
2.7.4

