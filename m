Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D5E23D23E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgHEUKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:10:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5112 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgHEQ1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 12:27:43 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 05 Aug 2020 06:34:40 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 05 Aug 2020 06:34:38 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Aug 2020 19:04:07 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id D31433EBB; Wed,  5 Aug 2020 19:04:07 +0530 (IST)
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
Subject: [v1] drm/msm/dpu: Fix reservation failures in modeset
Date:   Wed,  5 Aug 2020 19:04:06 +0530
Message-Id: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
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

1) Creation of a duplicate state in test_only commit (Rob)
2) Allow resource release only during crtc_active false.

For #2
In a modeset operation, swap state happens well before disable.
Hence clearing reservations in disable will cause failures
in modeset enable.

Sequence:
    Swap state --> old, new
    modeset disables --> virt disable
    modeset enable --> virt modeset

Allow reservations to be cleared only when crtc active is false
as in that case there wont be any modeset enable after disable.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..b85a576 100644
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
@@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
 	struct dpu_global_state *global_state;
+	struct drm_crtc_state *crtc_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	crtc_state = drm_enc->crtc->state;
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	dpu_rm_release(global_state, drm_enc);
+	if (crtc_state->active_changed && !crtc_state->active)
+		dpu_rm_release(global_state, drm_enc);
 
 	mutex_unlock(&dpu_enc->enc_lock);
 }
-- 
1.9.1

