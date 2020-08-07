Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8E23EDB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 15:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHGNKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 09:10:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59639 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgHGNKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 09:10:02 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Aug 2020 06:10:00 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Aug 2020 06:09:59 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Aug 2020 18:39:30 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 1689349FA; Fri,  7 Aug 2020 18:39:29 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org,
        swboyd@chromium.org, abhinavk@codeaurora.org,
        ddavenport@chromium.org
Subject: [v2] drm/msm/dpu: Fix reservation failures in modeset
Date:   Fri,  7 Aug 2020 18:39:27 +0530
Message-Id: <1596805767-29339-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In TEST_ONLY commit, rm global_state will duplicate the
object and request for new reservations, once they pass
then the new state will be swapped with the old and will
be available for the Atomic Commit.

This patch fixes some of missing links in the resource
reservation sequence mentioned above.

1) Creation of duplicate state in test_only commit (Rob)
2) Allocate and release the resources on every modeset.
3) Avoid allocation only when active is false.

In a modeset operation, swap state happens well before
disable. Hence clearing reservations in disable will
cause failures in modeset enable.

Allow reservations to be cleared/allocated before swap,
such that only newly committed resources are pushed to HW.

Changes in v1:
 - Move the rm release to atomic_check.
 - Ensure resource allocation and free happens when active
   is not changed i.e only when mode is changed.(Rob)

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..50a98d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	global_state = dpu_kms_get_global_state(crtc_state->state);
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -617,12 +617,15 @@ static int dpu_encoder_virt_atomic_check(
 	/* Reserve dynamic resources now. */
 	if (!ret) {
 		/*
-		 * Avoid reserving resources when mode set is pending. Topology
-		 * info may not be available to complete reservation.
+		 * Release and Allocate resources on every modeset
+		 * Dont allocate when active is false.
 		 */
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+			dpu_rm_release(global_state, drm_enc);
+
+			if (!crtc_state->active_changed || crtc_state->active)
+				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+						drm_enc, crtc_state, topology);
 		}
 	}
 
@@ -1171,7 +1174,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_global_state *global_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1190,7 +1192,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1220,8 +1221,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	dpu_rm_release(global_state, drm_enc);
-
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-- 
1.9.1

