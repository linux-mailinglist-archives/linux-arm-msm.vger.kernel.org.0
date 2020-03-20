Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61AE918CE79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 14:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgCTNMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 09:12:20 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:28294 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726902AbgCTNMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 09:12:20 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Mar 2020 18:41:25 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Mar 2020 18:41:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id C1C1A4509; Fri, 20 Mar 2020 18:41:06 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v3] arm64: dts: sc7180: modify assigned clocks for sc7180 target
Date:   Fri, 20 Mar 2020 18:41:04 +0530
Message-Id: <1584709864-5587-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DISP_CC_MDSS_ROT_CLK and DISP_CC_MDSS_AHB_CLK
in the assigned clocks list as these are display
specific clocks and needs to be initialized from
the client side. Adding the default rate of
19.2 mhz for these clocks for sc7180 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v3:
	- Change in commit message
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101..e3b60f1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1544,8 +1544,12 @@
 				clock-names = "iface", "rot", "lut", "core",
 					      "vsync";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+						  <&dispcc DISP_CC_MDSS_ROT_CLK>,
+						  <&dispcc DISP_CC_MDSS_AHB_CLK>;
 				assigned-clock-rates = <300000000>,
+						       <19200000>,
+						       <19200000>,
 						       <19200000>;
 
 				interrupt-parent = <&mdss>;
-- 
1.9.1

