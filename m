Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FF823B994
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 13:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgHDLc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 07:32:59 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43527 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgHDLc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 07:32:59 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Aug 2020 04:32:58 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Aug 2020 04:32:56 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Aug 2020 17:02:29 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id F05E44BA0; Tue,  4 Aug 2020 17:02:26 +0530 (IST)
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
Subject: [v1] drm/msm/dpu: update reservations in commit path
Date:   Tue,  4 Aug 2020 17:02:24 +0530
Message-Id: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU resources reserved in the atomic_check path gets unwinded
during modeset operation before commit happens in a non seamless
transition.

Update the reservations in the commit path to avoid resource
failures. Secondly have dummy reservations in atomic_check path
so that we can gracefully fail the composition if resources are
not available.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..c6b8254 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -565,7 +565,7 @@ static int dpu_encoder_virt_atomic_check(
 	const struct drm_display_mode *mode;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct dpu_global_state *global_state;
+	struct dpu_global_state tmp_resv_state;
 	int i = 0;
 	int ret = 0;
 
@@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	memset(&tmp_resv_state, 0, sizeof(tmp_resv_state));
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -621,7 +621,7 @@ static int dpu_encoder_virt_atomic_check(
 		 * info may not be available to complete reservation.
 		 */
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			ret = dpu_rm_reserve(&dpu_kms->rm, &tmp_resv_state,
 					drm_enc, crtc_state, topology);
 		}
 	}
@@ -966,7 +966,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp, num_dspp;
-	int i, j;
+	int i, j, rc;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1006,6 +1006,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
 
+	rc = dpu_rm_reserve(&dpu_kms->rm, global_state, drm_enc,
+		drm_crtc->state, topology);
+	if (rc) {
+		DPU_ERROR_ENC(dpu_enc, "Failed to reserve resources\n");
+		return;
+	}
+
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
-- 
1.9.1

