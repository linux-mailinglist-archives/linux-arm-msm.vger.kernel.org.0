Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4519C2B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 15:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388633AbgDBNcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 09:32:07 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:62069 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388579AbgDBNcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 09:32:07 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Apr 2020 19:01:00 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Apr 2020 19:00:44 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 1D7A845BF; Thu,  2 Apr 2020 19:00:43 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v3 3/3] arm64: dts: sc7180: add interconnect bindings for display
Date:   Thu,  2 Apr 2020 19:00:39 +0530
Message-Id: <1585834239-8895-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585834239-8895-1-git-send-email-mkrishn@codeaurora.org>
References: <1585834239-8895-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds the interconnect bindings to the
MDSS node. This will establish Display to DDR path
for bus bandwidth voting.

Changes in v2:
	- Change in commit message(Matthias Kaehlcke)

Changes in v3:
	- Updated commit message to include
	  reviewer's name in v2

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ea1b0cd..31fed6d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1521,6 +1521,9 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
+			interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+			interconnect-names = "mdp0-mem";
+
 			iommus = <&apps_smmu 0x800 0x2>;
 
 			#address-cells = <2>;
-- 
1.9.1

