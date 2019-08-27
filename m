Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E279F5AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfH0V5R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:57:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35060 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfH0V5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:57:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so217133pgv.2;
        Tue, 27 Aug 2019 14:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lu+dgyU+uL4vnyCGblRQjsuwttEqbZ012MXEJ+zZ9eE=;
        b=T/mkd4pNvs/FTOOeVG3FIz4/9Z0VFW3UoYOEakFFfnThh4V6fLrI9MU0oSslZBYp1G
         zSsGlT3pJYSwUPRsc7bIZXB2/1kTa/pM94MoVaPBII4Pe/k8B/9Yvb3qWXT4m2hq3O78
         S9Z9ZPmv926mRPOSt4ei4yLOsce1+1HNbGhcYjKxpy3eeziPOa+P7ktgTedhROZkaebA
         wkeqBu4fZ7HzJuoyijUzqCkB77KsrsGgJEW3rx/DQ55F6GP5yOz9DeI1/w7+8SSDlRti
         aYwRrRSyIXcbsU9K63hstQ2hc1RncyyGks5tHhlz8govQO9+LvCcsoN/hddsSXvCwwI9
         zO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lu+dgyU+uL4vnyCGblRQjsuwttEqbZ012MXEJ+zZ9eE=;
        b=D5rSE/IawBbEwpiSvi03iHHbjqA4cprwMFnk0ljhsLgmOOpWgbg0AZPnD1PsYdbkpP
         igsLgNZIXYGY+bAhhS+61zrqMelHeWjPBI4Z45G3xG3bsSFRMC23BtaYm7dlcmp6DrmY
         nlAcsJbhoF4DzsYuPvvh0nl9uESkXWfZ50pRae8IcvCvD+SQnUgje+GClPmt1tYnarxr
         3Us+pgASFn/Hr3/RwZDFcrWHQZyqjvOg1XdFeUl9zQlR9rk9ocd1ewgudoMzKL2qJl6l
         +VO/fSQUZc/gLFkMyuRU0ey4xBhfw9uoX60tr/wU51MiU46ds0yfPrw5SDBmNdgtTe0V
         eqHw==
X-Gm-Message-State: APjAAAWoFjSVgzzEdHyjKU3zLk9bAK8FAOIRGK/aaHKgMVPWv/EmIKSs
        BE6pmHfa9ztQ2/fZV1GS0TY=
X-Google-Smtp-Source: APXvYqyzhtNn+QaLqNhkXToZp2ZkAmKjVCCHW0VJX+c/ublFoYb7mnS2kbxN1ZrZwzuTi2wblDHvtA==
X-Received: by 2002:a17:90a:3b04:: with SMTP id d4mr944359pjc.80.1566943036326;
        Tue, 27 Aug 2019 14:57:16 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id u16sm300869pgm.83.2019.08.27.14.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:57:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 9/9] drm/msm/dpu: async commit support
Date:   Tue, 27 Aug 2019 14:33:39 -0700
Message-Id: <20190827213421.21917-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827213421.21917-1-robdclark@gmail.com>
References: <20190827213421.21917-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In addition, moving to kms->flush_commit() lets us drop the only user
of kms->commit().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 46 +++++++++++----------
 drivers/gpu/drm/msm/msm_atomic.c            |  5 +--
 drivers/gpu/drm/msm/msm_kms.h               |  3 --
 6 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 31debd31ab8c..f38a7d27a1c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -606,7 +606,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
-	int ret;
 
 	/*
 	 * If no mixers has been allocated in dpu_crtc_atomic_check(),
@@ -626,17 +625,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 				  crtc->state->encoder_mask)
 		dpu_encoder_prepare_for_kickoff(encoder);
 
-	/* wait for previous frame_event_done completion */
-	DPU_ATRACE_BEGIN("wait_for_frame_done_event");
-	ret = _dpu_crtc_wait_for_frame_done(crtc);
-	DPU_ATRACE_END("wait_for_frame_done_event");
-	if (ret) {
-		DPU_ERROR("crtc%d wait for frame done failed;frame_pending%d\n",
-				crtc->base.id,
-				atomic_read(&dpu_crtc->frame_pending));
-		goto end;
-	}
-
 	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
 		/* acquire bandwidth and other resources */
 		DPU_DEBUG("crtc%d first commit\n", crtc->base.id);
@@ -650,7 +638,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_kickoff(encoder);
 
-end:
 	reinit_completion(&dpu_crtc->frame_done_comp);
 	DPU_ATRACE_END("crtc_commit");
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ac2d534bf59e..3a69b93d8fb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1678,8 +1678,7 @@ static u32 _dpu_encoder_calculate_linetime(struct dpu_encoder_virt *dpu_enc,
 	return line_time;
 }
 
-static int _dpu_encoder_wakeup_time(struct drm_encoder *drm_enc,
-		ktime_t *wakeup_time)
+int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time)
 {
 	struct drm_display_mode *mode;
 	struct dpu_encoder_virt *dpu_enc;
@@ -1766,7 +1765,7 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 		return;
 	}
 
-	if (_dpu_encoder_wakeup_time(&dpu_enc->base, &wakeup_time))
+	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
 		return;
 
 	trace_dpu_enc_vsync_event_work(DRMID(&dpu_enc->base), wakeup_time);
@@ -1840,7 +1839,7 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 	}
 
 	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
-			!_dpu_encoder_wakeup_time(drm_enc, &wakeup_time)) {
+			!dpu_encoder_vsync_time(drm_enc, &wakeup_time)) {
 		trace_dpu_enc_early_kickoff(DRMID(drm_enc),
 					    ktime_to_ms(wakeup_time));
 		mod_timer(&dpu_enc->vsync_event_timer,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 8465b37adf3b..b4913465e602 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -85,6 +85,11 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *encoder);
  */
 void dpu_encoder_kickoff(struct drm_encoder *encoder);
 
+/**
+ * dpu_encoder_wakeup_time - get the time of the next vsync
+ */
+int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
+
 /**
  * dpu_encoder_wait_for_event - Waits for encoder events
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d54741f3ad9f..af41af1731c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -260,6 +260,20 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
+static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
+		ktime_t vsync_time;
+
+		if (dpu_encoder_vsync_time(encoder, &vsync_time) == 0)
+			return vsync_time;
+	}
+
+	return ktime_get();
+}
+
 static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		struct drm_atomic_state *state)
 {
@@ -291,7 +305,16 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
-	/* TODO */
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+
+		trace_dpu_kms_commit(DRMID(crtc));
+		dpu_crtc_commit_kickoff(crtc);
+	}
 }
 
 /*
@@ -314,25 +337,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
 			continue;
 
 		trace_dpu_kms_enc_enable(DRMID(crtc));
-		dpu_crtc_commit_kickoff(crtc);
-	}
-}
-
-static void dpu_kms_commit(struct msm_kms *kms, struct drm_atomic_state *state)
-{
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-	int i;
-
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		/* If modeset is required, kickoff is run in encoder_enable */
-		if (drm_atomic_crtc_needs_modeset(crtc_state))
-			continue;
-
-		if (crtc->state->active) {
-			trace_dpu_kms_commit(DRMID(crtc));
-			dpu_crtc_commit_kickoff(crtc);
-		}
 	}
 }
 
@@ -693,9 +697,9 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
+	.vsync_time      = dpu_kms_vsync_time,
 	.prepare_commit  = dpu_kms_prepare_commit,
 	.flush_commit    = dpu_kms_flush_commit,
-	.commit          = dpu_kms_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index de767a19e193..de167f0ddca5 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -212,10 +212,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	/*
 	 * Flush hardware updates:
 	 */
-	if (kms->funcs->commit) {
-		DRM_DEBUG_ATOMIC("triggering commit\n");
-		kms->funcs->commit(kms, state);
-	}
+	DRM_DEBUG_ATOMIC("triggering commit\n");
 	kms->funcs->flush_commit(kms, crtc_mask);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 9a0236eb6487..c8cdf5763dd6 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -80,9 +80,6 @@ struct msm_kms_funcs {
 	 */
 	void (*flush_commit)(struct msm_kms *kms, unsigned crtc_mask);
 
-	/* TODO remove ->commit(), use ->flush_commit() instead: */
-	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
-
 	/**
 	 * Wait for any in-progress flush to complete on the specified
 	 * crtcs.  This should not block if there is no in-progress
-- 
2.21.0

