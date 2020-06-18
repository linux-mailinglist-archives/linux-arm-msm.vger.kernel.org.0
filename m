Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3B61FFE93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 01:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgFRXWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 19:22:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13887 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgFRXWM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 19:22:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592522531; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=uxcHy6A4lpfudbGIOzAULZVoTBqGZXltcTorJ7R9H/M=; b=suommdOwuVTHCBb7G90B16HUfbqSuaTl08iPx4qFGbdRWKxAsORWZ1hUkhW+iesVSKF+ccJ7
 C9A/brM9G7TfiWC3tx/auPdpb6oUe9i9c3Ytps1b4Ab/LOoTrNbDWNmPJXQkwvim/hc1Qvi7
 lqc0JLV/TZR4p0DbtW/3XQgWVJc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5eebf70f6f2ee827da895a85 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 23:21:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A250C433A0; Thu, 18 Jun 2020 23:21:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07B1FC433C8;
        Thu, 18 Jun 2020 23:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07B1FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     swboyd@chromium.org, agross@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, dianders@chromium.org,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
Date:   Thu, 18 Jun 2020 16:21:13 -0700
Message-Id: <20200618232113.22687-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable DP driver for sc7180.

This change depends-on following series:
https://patchwork.freedesktop.org/series/78583/
and https://patchwork.freedesktop.org/patch/351990/

Changes in v2:

- Add assigned-clocks and assigned-clock-parents
- Remove cell-index and pixel_rcg
- Change compatible to qcom,sc7180-dp

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 916401f7e87c..26fe623e3b0f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2216,10 +2216,19 @@ ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint =
+								 <&dsi0_in>;
+						};
+					};
+
 					port@0 {
 						reg = <0>;
-						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint =
+								 <&dp_in>;
 						};
 					};
 				};
@@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
 			};
 		};
 
+		msm_dp: displayport-controller@ae90000{
+			status = "ok";
+			compatible = "qcom,sc7180-dp";
+
+			reg = <0 0xae90000 0 0x1400>;
+			reg-names = "dp_controller";
+
+			interrupt-parent = <&mdss>;
+			interrupts = <12 0>;
+
+			clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+				 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+				 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+				 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+			clock-names = "core_aux", "ctrl_link",
+				      "ctrl_link_iface", "stream_pixel";
+			#clock-cells = <1>;
+			assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+			assigned-clock-parents = <&msm_dp 1>;
+
+			data-lanes = <0 1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dp_in: endpoint {
+						remote-endpoint =
+							 <&dpu_intf0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dp_out: endpoint { };
+				};
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc7180-dispcc";
 			reg = <0 0x0af00000 0 0x200000>;
@@ -2300,8 +2349,8 @@ dispcc: clock-controller@af00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>,
-				 <0>;
+				 <&msm_dp 0>,
+				 <&msm_dp 1>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

