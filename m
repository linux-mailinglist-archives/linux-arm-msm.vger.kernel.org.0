Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB37C43E308
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 16:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhJ1OHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 10:07:49 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16612 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJ1OHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 10:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635429922; x=1666965922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/Z5PQUKKMjzWeSU9bmE98K9hFHikgVsh9PZzWEEOrx8=;
  b=panOJuzKXWTEijdAZljLBEJy6CAz7+xWrK1RMolqytH4e8Rh0gIsynrT
   tfEjb+GcUiozCVNexxGrGeO+wGFXwpzYRi65X6xFslYMFOUUQxPREf6CM
   xI4pJHKpAHkSrfwqFdF7jc7epaBRfIJ3oGDP5T+8BUE6orcyZCeSlyhAG
   Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 07:05:21 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Oct 2021 07:05:20 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Oct 2021 19:35:04 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 0FA084E6A; Thu, 28 Oct 2021 07:05:02 -0700 (PDT)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org, swboyd@chromium.org,
        abhinavk@codeaurora.org, Kalyan Thota <quic_kalyant@quicinc.com>
Subject: [v1] drm/msm/disp/dpu1: set default group ID for CTL.
Date:   Thu, 28 Oct 2021 07:05:01 -0700
Message-Id: <1635429901-5734-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kalyan Thota <kalyan_t@codeaurora.org>

New required programming in CTL for SC7280. Group ID informs
HW of which VM owns that CTL. Force this group ID to
default/disabled until virtualization support is enabled in SW.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 3 +++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ce6f32a..283605c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -45,7 +45,7 @@
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE))
+	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
 
 #define MERGE_3D_SM8150_MASK (0)
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4ade44b..57b9be1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -179,13 +179,16 @@ enum {
 
 /**
  * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
+ * @DPU_CTL_SPLIT_DISPLAY,	CTL supports video mode split display
+ * @DPU_CTL_FETCH_ACTIVE,	Active CTL for fetch HW (SSPPs).
+ * @DPU_CTL_VM_CFG,		CTL supports multiple VMs.
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
+	DPU_CTL_VM_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 64740ddb..455b06a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -498,6 +498,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 mode_sel = 0;
 
+	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+		mode_sel = 0xf0000000;
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
-- 
2.7.4

