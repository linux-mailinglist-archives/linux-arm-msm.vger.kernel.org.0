Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36FC354C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 07:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243710AbhDFFKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 01:10:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26087 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243689AbhDFFK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 01:10:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:22 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 22:10:21 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:40:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 90E7C21B31; Tue,  6 Apr 2021 10:40:05 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 2/4] drm/msm/disp/dpu1: add intf offsets for SC7280 target
Date:   Tue,  6 Apr 2021 10:39:50 +0530
Message-Id: <1617685792-14376-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
References: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Interface block offsets are different for SC7280 family
when compared to existing targets. These offset values
are used to access the interface irq registers. This
change adds proper interface offsets for SC7280 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5c521de..c289b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -25,6 +25,9 @@
 #define MDP_AD4_INTR_EN_OFF		0x41c
 #define MDP_AD4_INTR_CLEAR_OFF		0x424
 #define MDP_AD4_INTR_STATUS_OFF		0x420
+#define MDP_INTF_0_OFF_REV_7xxx             0x34000
+#define MDP_INTF_1_OFF_REV_7xxx             0x35000
+#define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
 /**
  * WB interrupt status bit definitions
@@ -242,7 +245,22 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
-	}
+	},
+	{
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
 };
 
 /*
-- 
2.7.4

