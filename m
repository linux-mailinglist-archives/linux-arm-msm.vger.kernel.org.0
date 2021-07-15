Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAD93C991C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 08:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbhGOGz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 02:55:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236412AbhGOGzx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 02:55:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FBA661362;
        Thu, 15 Jul 2021 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626331981;
        bh=CDDjlRWbVZRE4NnRUPDsU2UDqaddBsl69oBwoC4xRSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W5P9JpboF9bpba3cEqGWx5BcIwUD6QGq4x/N4C5kfcWDiORE07QMLIN0dw4w2FMZs
         /cGyA7rWLYX0FJ7dd5XFVl+EOtUnP2qM7FQeXqIa/wYdQfXtd5G6yLz+zNn6+A/YuE
         cwCAFZ/vW4bbD6aXlWoC+WutBsjbzcMPm84J59JO6DWnMnm+poNJ9I5l42UZJFhtRK
         dJpCiYfvcQpcmnUTm8tRPWuQTB7izk5tYTh2fFT+DyuGiCKzTSDbL0uyPf0SloQEMU
         HJOBCeDJ6QU8MwPGIFWVHnbDu78V/yp/2r4ccMS2r/JfiQ2T7ll5PyqQ3xGTuEWwXv
         N4RG/mvatuMuA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 07/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
Date:   Thu, 15 Jul 2021 12:21:59 +0530
Message-Id: <20210715065203.709914-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We cannot enable mode_3d when we are using the DSC. So pass
configuration to detect DSC is enabled and not enable mode_3d
when we are using DSC

We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
enabled and pass this to .setup_intf_cfg()

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index ecbc4be98980..d43b804528eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -336,6 +336,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 	return BLEND_3D_NONE;
 }
 
+static inline bool dpu_encoder_helper_get_dsc_mode(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc = phys_enc->parent;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+
+	if (priv->dsc)
+		return true;
+
+	return false;
+}
+
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
  *	This helper function may be used by physical encoders to configure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e..5fe87881c30c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -69,6 +69,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
+
 	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index aeea6add61ee..f059416311ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -121,7 +121,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 	return ctx->pending_flush_mask;
 }
 
-static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
+static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
 	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));
 
@@ -522,7 +522,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 
 	intf_cfg |= (cfg->intf & 0xF) << 4;
 
-	if (cfg->mode_3d) {
+	/* In DSC we can't set merge, so check for dsc too */
+	if (cfg->mode_3d && !cfg->dsc) {
 		intf_cfg |= BIT(19);
 		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..347a653c1e01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
+ * @dsc:                   DSC is enabled
  * @stream_sel:            Stream selection for multi-stream interfaces
  */
 struct dpu_hw_intf_cfg {
@@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
+	bool dsc;
 	int stream_sel;
 };
 
-- 
2.31.1

