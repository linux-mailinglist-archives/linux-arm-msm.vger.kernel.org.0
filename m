Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507CF19C2AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 15:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388584AbgDBNcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 09:32:04 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:52202 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387752AbgDBNcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 09:32:04 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Apr 2020 19:01:00 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Apr 2020 19:00:43 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 02C9445CD; Thu,  2 Apr 2020 19:00:41 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v3 2/3] arm64: dts: sc7180: add bus clock to mdp node for sc7180 target
Date:   Thu,  2 Apr 2020 19:00:38 +0530
Message-Id: <1585834239-8895-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585834239-8895-1-git-send-email-mkrishn@codeaurora.org>
References: <1585834239-8895-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the bus clock to mdp device node,in order
to facilitate bus band width scaling on sc7180
target.

The parent device MDSS will not vote for bus bw,
instead the vote will be triggered by mdp device
node. Since a minimum vote is required to turn
on bus clock, move the clock node to mdp device
from where the votes are requested.

This patch has dependency on the below series
https://patchwork.kernel.org/patch/11468783/

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101..ea1b0cd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1510,10 +1510,9 @@
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "ahb", "core";
+			clock-names = "iface", "ahb", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <300000000>;
@@ -1536,12 +1535,13 @@
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
 					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
 					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
 					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "iface", "rot", "lut", "core",
+				clock-names = "bus", "iface", "rot", "lut", "core",
 					      "vsync";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
 						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-- 
1.9.1

