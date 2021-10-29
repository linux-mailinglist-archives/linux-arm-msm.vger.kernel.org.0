Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EF743FC58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 14:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhJ2MdH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 08:33:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17184 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhJ2MdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 08:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635510638; x=1667046638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WX6+oirQgO/61V41wJZp+jdW5MNtOfx/cOe7FPtKI0k=;
  b=DPSyIGUUFBd5OSTpUMA5zIjHON5HryYFIBX+WQYnqjWRuwW+sOF2stTN
   /Q2bXp4Dd4fttusVvi+0mOaupBfI8j1oyQXaZqkjwMasvP0UW1d+S/Llt
   MxctR/nsy9+GAf6py4boFMSEZMetFEa18lnuoqFLEI0FQSw8jTDOQtDSF
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 05:30:38 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Oct 2021 05:30:35 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Oct 2021 18:00:22 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id E01DE4D8B; Fri, 29 Oct 2021 05:30:21 -0700 (PDT)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org, swboyd@chromium.org,
        abhinavk@codeaurora.org
Subject: [v2] drm/msm/disp/dpu1: set default group ID for CTL.
Date:   Fri, 29 Oct 2021 05:30:19 -0700
Message-Id: <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New required programming in CTL for SC7280. Group ID informs
HW of which VM owns that CTL. Force this group ID to
default/disabled until virtualization support is enabled in SW.

Changes in v1:
 - Fix documentation and add descritpion for the change (Stephen)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 8 ++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

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
index 4ade44b..31af04a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -179,13 +179,16 @@ enum {
 
 /**
  * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
+ * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
+ * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
+ * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
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
index 64740ddb..02da9ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -36,6 +36,7 @@
 #define  MERGE_3D_IDX   23
 #define  INTF_IDX       31
 #define CTL_INVALID_BIT                 0xffff
+#define CTL_DEFAULT_GROUP_ID		0xf
 
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
@@ -498,6 +499,13 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 mode_sel = 0;
 
+	/* CTL_TOP[31:28] carries group_id to collate CTL paths
+	 * per VM. Explicitly disable it until VM support is
+	 * added in SW. Power on reset value is not disable.
+	 */
+	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
-- 
2.7.4

