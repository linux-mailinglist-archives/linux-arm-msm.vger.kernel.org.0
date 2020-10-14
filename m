Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B3D28E0E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 14:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgJNM6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 08:58:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15486 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730495AbgJNM6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 08:58:47 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Oct 2020 05:58:43 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Oct 2020 05:58:41 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Oct 2020 18:28:21 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 5D0242141F; Wed, 14 Oct 2020 18:28:20 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [v1] drm/msm: Fix race condition in msm driver with async layer updates
Date:   Wed, 14 Oct 2020 18:28:16 +0530
Message-Id: <1602680296-8965-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When there are back to back commits with async cursor update,
there is a case where second commit can program the DPU hw
blocks while first didn't complete flushing config to HW.

Synchronize the compositions such that second commit waits
until first commit flushes the composition.

This change also introduces per crtc commit lock, such that
commits on different crtcs are not blocked by each other.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c         | 35 ++++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_kms.h            |  5 +++++
 5 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c2729f7..9024719 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1383,6 +1383,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	/* initialize event handling */
 	spin_lock_init(&dpu_crtc->event_lock);
+	mutex_init(&dpu_crtc->commit_lock);
 
 	DPU_DEBUG("%s: successfully initialized crtc\n", dpu_crtc->name);
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474..1eeb73d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -169,6 +169,7 @@ struct dpu_crtc {
 
 	/* for handling internal event thread */
 	spinlock_t event_lock;
+	struct mutex commit_lock;
 
 	struct dpu_core_perf_params cur_perf;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e..f99ae7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -445,6 +445,30 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+static void dpu_kms_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+	struct dpu_crtc *dpu_crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
+		dpu_crtc = to_dpu_crtc(crtc);
+		mutex_lock(&dpu_crtc->commit_lock);
+	}
+}
+
+static void dpu_kms_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+	struct dpu_crtc *dpu_crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
+		dpu_crtc = to_dpu_crtc(crtc);
+		mutex_unlock(&dpu_crtc->commit_lock);
+	}
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -738,6 +762,8 @@ static const struct msm_kms_funcs kms_funcs = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
+	.commit_lock     = dpu_kms_commit_lock,
+	.commit_unlock   = dpu_kms_commit_unlock,
 };
 
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 561bfa4..d33253f 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
+static void msm_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	if (kms->funcs->commit_lock)
+		kms->funcs->commit_lock(kms, crtc_mask);
+	else
+		mutex_lock(&kms->commit_lock);
+}
+
+static void msm_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	if (kms->funcs->commit_unlock)
+		kms->funcs->commit_unlock(kms, crtc_mask);
+	else
+		mutex_unlock(&kms->commit_lock);
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
 
 	trace_msm_atomic_async_commit_start(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	msm_commit_lock(kms, crtc_mask);
 
 	if (!(kms->pending_crtc_mask & crtc_mask)) {
-		mutex_unlock(&kms->commit_lock);
+		msm_commit_unlock(kms, crtc_mask);
 		goto out;
 	}
 
@@ -79,7 +95,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	 */
 	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
 
 	/*
 	 * Wait for flush to complete:
@@ -90,9 +105,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 
 	vblank_put(kms, crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	msm_commit_unlock(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 out:
@@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 * Ensure any previous (potentially async) commit has
 	 * completed:
 	 */
+	msm_commit_lock(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
-
 	/*
 	 * Now that there is no in-progress flush, prepare the
 	 * current update:
@@ -232,7 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 
 		kms->funcs->disable_commit(kms);
-		mutex_unlock(&kms->commit_lock);
+		msm_commit_unlock(kms, crtc_mask);
 
 		/*
 		 * At this point, from drm core's perspective, we
@@ -260,7 +273,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	msm_commit_unlock(kms, crtc_mask);
 
 	/*
 	 * Wait for flush to complete:
@@ -271,9 +284,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	vblank_put(kms, crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	msm_commit_lock(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	msm_commit_unlock(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 	drm_atomic_helper_commit_hw_done(state);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b..f02e73e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -126,6 +126,11 @@ struct msm_kms_funcs {
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
 #endif
+	/* commit lock for crtc */
+	void (*commit_lock)(struct msm_kms *kms, unsigned int crtc_mask);
+
+	/* commit unlock for crtc */
+	void (*commit_unlock)(struct msm_kms *kms, unsigned int crtc_mask);
 };
 
 struct msm_kms;
-- 
2.7.4

