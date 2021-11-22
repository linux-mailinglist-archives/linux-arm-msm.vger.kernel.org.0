Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDC3458D6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 12:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhKVLcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 06:32:41 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:17899 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233849AbhKVLck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 06:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637580574; x=1669116574;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=nSu5tgaREMa9CS+SE9DuIqXG3zrVziZoM1K1+YEFTlM=;
  b=b/SPkKs+NV+Q37ArRlpN2sA+no97KZbUF1l8fWNi5Ol5byUL8ZdwRyFr
   1JcHYGQ96fhWxlEDkuZqdM5sKtZFkQ3r/62aF9sXGdMloMjE/b1WTcCa1
   x1DEnSolNP5QkUXC3Qkr4VHW13ZGVQ/KfANSJRCwByeEQFP7+NzpN8eh/
   k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Nov 2021 03:29:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 03:29:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 03:29:33 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 22 Nov 2021 03:29:27 -0800
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
CC:     Kuogee Hsieh <khsieh@codeaurora.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_kalyant@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <dianders@chromium.org>, <quic_khsieh@quicinc.com>,
        <quic_mkrishn@quicinc.com>, <quic_sbillaka@quicinc.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sc7280: Add Display Port node
Date:   Mon, 22 Nov 2021 16:59:15 +0530
Message-ID: <1637580555-1079-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kuogee Hsieh <khsieh@codeaurora.org>

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v4:
    - Add the patch to display DT change series (Bjorn Andersson)
    - Remove the trailing whitespaces

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5ad500e..0b2ffd5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2693,8 +2693,8 @@
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>,
-				 <0>,
+				 <&dp_phy 0>,
+				 <&dp_phy 1>,
 				 <&edp_phy 0>,
 				 <&edp_phy 1>;
 			clock-names = "bi_tcxo",
@@ -2791,6 +2791,13 @@
 							remote-endpoint = <&edp_in>;
 						};
 					};
+
+					port@2 {
+                                                reg = <2>;
+                                                dpu_intf0_out: endpoint {
+                                                        remote-endpoint = <&dp_in>;
+                                                };
+                                        };
 				};
 
 				mdp_opp_table: opp-table {
@@ -3002,6 +3009,79 @@
 
 				status = "disabled";
 			};
+
+			msm_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sc7280-dp";
+
+				reg = <0 0x0ae90000 0 0x1400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names =	"core_iface",
+						"core_aux",
+						"ctrl_link",
+						"ctrl_link_iface",
+						"stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+				phys = <&dp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dp_out: endpoint { };
+					};
+				};
+
+				dp_opp_table: opp-table {
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
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -3104,6 +3184,12 @@
 				bias-pull-up;
 			};
 
+			dp_hot_plug_det: dp-hot-plug-det {
+				pins = "gpio47";
+				function = "dp_hot";
+				bias-disable;
+                        };
+
 			qspi_clk: qspi-clk {
 				pins = "gpio14";
 				function = "qspi_clk";
-- 
2.7.4

