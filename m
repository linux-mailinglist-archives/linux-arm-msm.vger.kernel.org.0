Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BAE319DA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBLLxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:53:49 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10229 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhBLLxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:53:06 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 12 Feb 2021 03:52:20 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Feb 2021 03:52:19 -0800
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Feb 2021 17:22:09 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 8C5FC427B; Fri, 12 Feb 2021 03:52:09 -0800 (PST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyant@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org,
        swboyd@chromium.org, Kalyan Thota <kalyan_t@codeaurora.org>
Subject: [v3] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
Date:   Fri, 12 Feb 2021 03:52:07 -0800
Message-Id: <1613130727-18094-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kalyan Thota <kalyant@codeaurora.org>

Set the flag vblank_disable_immediate = true to turn off vblank irqs
immediately as soon as drm_vblank_put is requested so that there are
no irqs triggered during idle state. This will reduce cpu wakeups
and help in power saving.

To enable vblank_disable_immediate flag the underlying KMS driver
needs to support high precision vblank timestamping and also a
reliable way of providing vblank counter which is incrementing
at the leading edge of vblank.

This patch also brings in changes to support vblank_disable_immediate
requirement in dpu driver.

Changes in v1:
 - Specify reason to add vblank timestamp support. (Rob Clark)
 - Add changes to provide vblank counter from dpu driver.

Changes in v2:
 - Fix warn stack reported by Rob Clark with v2 patch

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 80 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 28 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 11 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 ++
 4 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4662e8..9a80981 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
 	kfree(dpu_crtc);
 }
 
+static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, dev)
+		if (encoder->crtc == crtc)
+			return encoder;
+
+	return NULL;
+}
+
+static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
+		return false;
+	}
+
+	return dpu_encoder_get_frame_count(encoder);
+}
+
+static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos, int *hpos,
+					   ktime_t *stime, ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	unsigned int pipe = crtc->index;
+	struct drm_encoder *encoder;
+	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", pipe);
+		return false;
+	}
+
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	/*
+	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
+	 * the end of VFP. Translate the porch values relative to the line
+	 * counter positions.
+	 */
+
+	vactive_start = vsw + vbp + 1;
+	vactive_end = vactive_start + mode->crtc_vdisplay;
+
+	/* last scan line before VSYNC */
+	vfp_end = mode->crtc_vtotal;
+
+	if (stime)
+		*stime = ktime_get();
+
+	line = dpu_encoder_get_linecount(encoder);
+
+	if (line < vactive_start)
+		line -= vactive_start;
+	else if (line > vactive_end)
+		line = line - vfp_end - vactive_start;
+	else
+		line -= vactive_start;
+
+	*vpos = line;
+	*hpos = 0;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, struct dpu_format *format)
 {
@@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.early_unregister = dpu_crtc_early_unregister,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.get_vblank_counter = dpu_crtc_get_vblank_counter,
 };
 
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
@@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
 /* initialize crtc */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c25..fb6546c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -425,6 +425,32 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 	return 0;
 }
 
+int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	struct dpu_encoder_phys *phy_enc;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	phy_enc = dpu_enc ? dpu_enc->cur_master : NULL;
+
+	return phy_enc ? atomic_read(&phy_enc->vsync_cnt) : 0;
+}
+
+int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	struct dpu_encoder_phys *phys;
+	int linecount = 0;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	phys = dpu_enc ? dpu_enc->cur_master : NULL;
+
+	if (phys && phys->ops.get_line_count)
+		linecount = phys->ops.get_line_count(phys);
+
+	return linecount;
+}
+
 void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
 				  struct dpu_encoder_hw_resources *hw_res)
 {
@@ -1296,12 +1322,12 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_BEGIN("encoder_vblank_callback");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	atomic_inc(&phy_enc->vsync_cnt);
 	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
 	if (dpu_enc->crtc)
 		dpu_crtc_vblank_callback(dpu_enc->crtc);
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 
-	atomic_inc(&phy_enc->vsync_cnt);
 	DPU_ATRACE_END("encoder_vblank_callback");
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index b491346..99a5d73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
  */
 void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
 							u32 idle_timeout);
+/**
+ * dpu_encoder_get_linecount - get interface line count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
+
+/**
+ * dpu_encoder_get_frame_count - get interface frame count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
 
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 374b0e8..ed636f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	 */
 	dev->mode_config.allow_fb_modifiers = true;
 
+	dev->max_vblank_count = 0xffffffff;
+	/* Disable vblank irqs aggressively for power-saving */
+	dev->vblank_disable_immediate = true;
+
 	/*
 	 * _dpu_kms_drm_obj_init should create the DRM related objects
 	 * i.e. CRTCs, planes, encoders, connectors and so forth
-- 
2.7.4

