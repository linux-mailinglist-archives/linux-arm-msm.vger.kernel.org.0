Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22C022218C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 13:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGPLgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 07:36:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35028 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgGPLgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 07:36:05 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Jul 2020 04:36:04 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Jul 2020 04:36:02 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Jul 2020 17:05:41 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 78F0A4B0D; Thu, 16 Jul 2020 17:05:40 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, jsanka@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for sc7180 target
Date:   Thu, 16 Jul 2020 17:05:33 +0530
Message-Id: <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Krishna Manikandan <mkrishn@codeaurora.org>

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
index 4f2c0d1..31fed6d 100644
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
@@ -1539,12 +1538,13 @@
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

