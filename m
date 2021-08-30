Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B511A3FB9BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 18:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhH3QF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 12:05:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45600 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237659AbhH3QFz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 12:05:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630339501; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AhYDa4UTLC4jIGO17fGnHbzpCStT+TLgkWbSA//0TlQ=; b=ILeLN+P5jggGQikviUNDAPdcMN+PtUJiL7nm2ML0eJo+puClsw703yHc6OjsnoCMzScktEWW
 IrFEPdO/ip8IP47p9sjX7tEFyhfOc25vfufTL8yvu15LvnpfX+aKYkMojGHNcry0ghJ7u/6u
 FeIkrwwv+Qc2lmrVBgRGOuSDJKE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 612d01abc603a0154fa6d3bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 16:04:59
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D80DC43619; Mon, 30 Aug 2021 16:04:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83DEDC43460;
        Mon, 30 Aug 2021 16:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 83DEDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add Display Port node
Date:   Mon, 30 Aug 2021 09:04:49 -0700
Message-Id: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
-- break this patch into 3 patches

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 88 +++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c29226b..f224029 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3202,6 +3202,13 @@
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
 
 				mdp_opp_table: mdp-opp-table {
@@ -3389,6 +3396,78 @@
 					};
 				};
 			};
+
+			msm_dp: displayport-controller@ae90000 {
+				status = "disabled";
+				compatible = "qcom,sc7180-dp", "qcom,sc7280-dp";
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
+					     	"ctrl_link_iface",
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
 
 		dispcc: clock-controller@af00000 {
@@ -3398,7 +3477,8 @@
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>, <0>,
+			  	 <&dp_phy 0>,
+			  	 <&dp_phy 1>,
 				 <&msm_edp 0>,
 				 <&msm_edp 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
@@ -3525,6 +3605,12 @@
                                 };
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

