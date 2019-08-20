Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73B196D03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 01:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfHTXPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 19:15:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35276 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfHTXPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 19:15:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id d85so111780pfd.2;
        Tue, 20 Aug 2019 16:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4DqP7QEK94+1Gku+4oxR+UEtdt6lfhW9qrWkYTmrm0=;
        b=l1Jlh9v8yFIh1I4x00eju6HVusBfXMpANMF0wTStBschH9ne2Lx8J8F4XSW9uNfAJl
         SyzPyL/7vxXH3JiNV4z/mZVZsdH273B6gE3q7efnj/UJl8QNktzpktZ26K5OlOc5zJuv
         NS/JU7P8RDey83Z6UPYXlzDAWyFJvlJVb15OcxzffkAEjQLpJwN9GAoudWtxYtVPab8j
         lQwwnn/7H7tB3kMx8ntEIJn7HPr6ko0pFu7nn5fOoKfk4w9PuFw4Th0Byj5Gpds0+0Bh
         R9apU5q6EszwqxtXghPjdW2JvHY38mkPhU9gVVsBNnDx9P8rAhF7q5fPtc1rdKzuaF9B
         U6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4DqP7QEK94+1Gku+4oxR+UEtdt6lfhW9qrWkYTmrm0=;
        b=qPaDFt+tbg9GeXWElRwXynYG3Ni6z2qL54jv5eUIi3AIbmUpsd4N1aMfmfYpBsylFx
         ERSuVpf2Xes7bWIUBeTYnQur6FUjcmIAUAyp2RSt8gbO0+mdPKJ52oGXjgYQdbGkuDfz
         MPfxbEjs/M1SnUYapnspbxX02DYCbyC97zS7f5TXn2bjdGK6eIDhelMSmraRW0vM/7Ml
         88ePnOKSa3u0bq36B6SPJh3p2xNL8elkdTojsglU9NLJhXVFuZhEsfss+56hae4rUGCk
         LxqdfQu/cDAUpUBw91vy78gJ/U4sWsruAOrhzGxjfayUzM6aj0sLk9/XFdLcockU90ri
         9Mzg==
X-Gm-Message-State: APjAAAW2FEF5QB6K/mji9EcoMhm2l7eyc8UEmcuihTQS7E/uGLMZmYKO
        z4XPJvYn8GZzMVCTtu5rUYs=
X-Google-Smtp-Source: APXvYqw3byR+E/rFXK0tamYcHiDaVtGc/wXLE5AD1XLZECK+RZL9p3RB4bJ/1eDgmu+NgWnNYPZpWg==
X-Received: by 2002:a63:5648:: with SMTP id g8mr26329980pgm.81.1566342919199;
        Tue, 20 Aug 2019 16:15:19 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id k22sm21887604pfk.157.2019.08.20.16.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 16:15:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: fix "frame done" timeouts
Date:   Tue, 20 Aug 2019 16:12:28 -0700
Message-Id: <20190820231301.28445-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Previously, dpu_crtc_frame_event_work() would try to aquire all the
modeset locks in order to check whether it can release bandwidth.  (If
we only have cmd-mode display, bandwidth can be released at frame-done
time.)

The problem with this is that it is also responsible for signalling
frame_done_comp, which dpu_crtc_commit_kickoff() waits on if there is
already a frame pending.  This is called in the msm_atomic_commit_tail()
path.. which means that for non-nonblock commits, at least some of the
modeset locks are already held.

Re-work this scheme to use a reference count to track our need to have
clocks enabled.  It is incremented for each atomic commit, and
decremented in the corresponding frame-done.  Additionally, any crtc
used in video mode hold an extra reference while they are enabled.  The
net effect is that we can determine in frame-done whether it is safe to
drop bandwidth without needing to aquire any modeset locks.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 16 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 45 +++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  8 ++++
 4 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 5cda96875e03..09a49b59bb5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -214,7 +214,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
  */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 {
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc *dpu_crtc;
 	struct dpu_crtc_state *dpu_cstate;
 	struct dpu_kms *kms;
@@ -233,22 +232,9 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
-	/* only do this for command mode rt client */
-	if (dpu_crtc_get_intf_mode(crtc) != INTF_MODE_CMD)
+	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
 		return;
 
-	/*
-	 * If video interface present, cmd panel bandwidth cannot be
-	 * released.
-	 */
-	if (dpu_crtc_get_intf_mode(crtc) == INTF_MODE_CMD)
-		drm_for_each_crtc(tmp_crtc, crtc->dev) {
-			if (tmp_crtc->enabled &&
-				dpu_crtc_get_intf_mode(tmp_crtc) ==
-						INTF_MODE_VIDEO)
-				return;
-		}
-
 	/* Release the bandwidth */
 	if (kms->perf.enable_bw_release) {
 		trace_dpu_cmd_release_bw(crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b3417d56032d..4e54550c4a80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -292,19 +292,6 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 	trace_dpu_crtc_vblank_cb(DRMID(crtc));
 }
 
-static void dpu_crtc_release_bw_unlocked(struct drm_crtc *crtc)
-{
-	int ret = 0;
-	struct drm_modeset_acquire_ctx ctx;
-
-	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
-	dpu_core_perf_crtc_release_bw(crtc);
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
-	if (ret)
-		DRM_ERROR("Failed to acquire modeset locks to release bw, %d\n",
-			  ret);
-}
-
 static void dpu_crtc_frame_event_work(struct kthread_work *work)
 {
 	struct dpu_crtc_frame_event *fevent = container_of(work,
@@ -334,7 +321,7 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 			/* release bandwidth and other resources */
 			trace_dpu_crtc_frame_event_done(DRMID(crtc),
 							fevent->event);
-			dpu_crtc_release_bw_unlocked(crtc);
+			dpu_core_perf_crtc_release_bw(crtc);
 		} else {
 			trace_dpu_crtc_frame_event_more_pending(DRMID(crtc),
 								fevent->event);
@@ -650,7 +637,7 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc, bool async)
 		dpu_encoder_prepare_for_kickoff(encoder, async);
 
 	if (!async) {
-		/* wait for frame_event_done completion */
+		/* wait for previous frame_event_done completion */
 		DPU_ATRACE_BEGIN("wait_for_frame_done_event");
 		ret = _dpu_crtc_wait_for_frame_done(crtc);
 		DPU_ATRACE_END("wait_for_frame_done_event");
@@ -729,6 +716,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder;
 	struct msm_drm_private *priv;
 	unsigned long flags;
+	bool release_bandwidth = false;
 
 	if (!crtc || !crtc->dev || !crtc->dev->dev_private || !crtc->state) {
 		DPU_ERROR("invalid crtc\n");
@@ -745,8 +733,15 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev,
-				  old_crtc_state->encoder_mask)
+				  old_crtc_state->encoder_mask) {
+		/* in video mode, we hold an extra bandwidth reference
+		 * as we cannot drop bandwidth at frame-done if any
+		 * crtc is being used in video mode.
+		 */
+		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
+			release_bandwidth = true;
 		dpu_encoder_assign_crtc(encoder, NULL);
+	}
 
 	/* wait for frame_event_done completion */
 	if (_dpu_crtc_wait_for_frame_done(crtc))
@@ -760,7 +755,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	if (atomic_read(&dpu_crtc->frame_pending)) {
 		trace_dpu_crtc_disable_frame_pending(DRMID(crtc),
 				     atomic_read(&dpu_crtc->frame_pending));
-		dpu_core_perf_crtc_release_bw(crtc);
+		if (release_bandwidth)
+			dpu_core_perf_crtc_release_bw(crtc);
 		atomic_set(&dpu_crtc->frame_pending, 0);
 	}
 
@@ -792,6 +788,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc;
 	struct drm_encoder *encoder;
 	struct msm_drm_private *priv;
+	bool request_bandwidth;
 
 	if (!crtc || !crtc->dev || !crtc->dev->dev_private) {
 		DPU_ERROR("invalid crtc\n");
@@ -804,9 +801,19 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
 	dpu_crtc = to_dpu_crtc(crtc);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
+		/* in video mode, we hold an extra bandwidth reference
+		 * as we cannot drop bandwidth at frame-done if any
+		 * crtc is being used in video mode.
+		 */
+		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
+			request_bandwidth = true;
 		dpu_encoder_register_frame_event_callback(encoder,
 				dpu_crtc_frame_event_cb, (void *)crtc);
+	}
+
+	if (request_bandwidth)
+		atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
 
 	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
 	dpu_crtc->enabled = true;
@@ -981,6 +988,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
+	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
+
 	rc = dpu_core_perf_crtc_check(crtc, state);
 	if (rc) {
 		DPU_ERROR("crtc%d failed performance check %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 99d0bd569c38..681955eb286f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -800,6 +800,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		return rc;
 	}
 
+	atomic_set(&dpu_kms->bandwidth_ref, 0);
+
 	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp", "mdp");
 	if (IS_ERR(dpu_kms->mmio)) {
 		rc = PTR_ERR(dpu_kms->mmio);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 9e40f559c51f..fdef016f5ca3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -120,6 +120,14 @@ struct dpu_kms {
 	struct platform_device *pdev;
 	bool rpm_enabled;
 	struct dss_module_power mp;
+
+	/* reference count bandwidth requests, so we know when we can
+	 * release bandwidth.  Each atomic update increments, and frame-
+	 * done event decrements.  Additionally, for video mode, the
+	 * reference is incremented when crtc is enabled, and decremented
+	 * when disabled.
+	 */
+	atomic_t bandwidth_ref;
 };
 
 struct vsync_info {
-- 
2.21.0

