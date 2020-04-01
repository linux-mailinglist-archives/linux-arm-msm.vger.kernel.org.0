Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462FF19A877
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 11:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbgDAJSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 05:18:10 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:23785 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726974AbgDAJSK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 05:18:10 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Apr 2020 14:48:07 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 01 Apr 2020 14:47:52 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 3118145C0; Wed,  1 Apr 2020 14:47:51 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v1 3/3] arm64: dts: sc7180: define interconnects for sc7180 target
Date:   Wed,  1 Apr 2020 14:47:45 +0530
Message-Id: <1585732665-29492-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585732665-29492-1-git-send-email-mkrishn@codeaurora.org>
References: <1585732665-29492-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define interconnects for display driver for
sc7180 target.

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

