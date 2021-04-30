Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF53370145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 21:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhD3TcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 15:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhD3TcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 15:32:04 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAF6C061344
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:13 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id e15so12393067pfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Urj1XE+1F6yAFNCUDgU91r4ZNGlYqjnW6rnubxUZ/yE=;
        b=RIbofK/CTF1RYM7BcxB1/evEUuxa07mCe9q9YrTdpdXTJbT2jlUG+xyoSRjmn3KfEm
         Ac0EoK0+CbY1WeJos6+fh7cey4GVJifNnmFxHV7jQBmvhQF+CfxruNTy3oa8pm699CLf
         7ElmSed3V0/YzDBh7D55C79BfNYfEnd914Ybc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Urj1XE+1F6yAFNCUDgU91r4ZNGlYqjnW6rnubxUZ/yE=;
        b=bJTM6HdMok/cR1kBMV318KvUvte1X4qLw9gUwOugM1Z0nID21sTYfVvB3AUEHmDfCp
         10aRa9AxgkFVNuO+mzgq02Dj4RjO0ly3dNceNILxrJwJExtbBr5jELURXviPUXtr1Yah
         SY5qFy45vPmlZkcr2WawABj+9TQSYENhHIaBQoI/NMbIgwH6fRb2nVAj/z2gQsL5A4y3
         zfGhsR67L3UAEKdttX6UWwqinhR2saR3nMNN+cQfrLX55tC/v/WXv9ZSX24x3WhQWu5I
         faSIPBmUNM4h7XfZTJ6rQf72N2aMQCORoZW/POFyhGMimvJlWRItAPjOAfV24R7EnoFG
         RBAw==
X-Gm-Message-State: AOAM533IG9EhmXTy07fmzQ12wjTkJZDbqDJ0FJIUdAGqBkR4gJRWjoMU
        hfmfRGzG1ywPJW/A5l67ulFBjQ==
X-Google-Smtp-Source: ABdhPJzTG27OclHXpsrA9pzx9fwtSBaSynh85Rw/qBOYXiO9dM2I+2dHRiWFcZ6AvyyMiL+2a0HYjw==
X-Received: by 2002:aa7:824e:0:b029:20a:3a1:eeda with SMTP id e14-20020aa7824e0000b029020a03a1eedamr6104381pfn.71.1619811073296;
        Fri, 30 Apr 2021 12:31:13 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
        by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:31:12 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 6/6] drm/msm/disp: Move various debug logs to atomic bucket
Date:   Fri, 30 Apr 2021 12:31:04 -0700
Message-Id: <20210430193104.1770538-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These prints flood the logs with drm debugging set to enable kms and
driver logging (DRM_UT_KMS and DRM_UT_DRIVER). Let's move these prints
to the atomic bucket (DRM_UT_ATOMIC) as they're related to the atomic
paths.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 22 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 38 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 10 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 14 +++----
 6 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index b6b3bbab0333..8bbba5a44d82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -132,7 +132,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 	}
 
-	DPU_DEBUG(
+	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
 			perf->max_per_pipe_ib, perf->bw_ctl);
@@ -178,7 +178,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
-			DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
+			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
 				tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
 				tmp_cstate->bw_control);
 
@@ -187,11 +187,11 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 		/* convert bandwidth to kb */
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
-		DPU_DEBUG("calculated bandwidth=%uk\n", bw);
+		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
 		threshold = kms->catalog->perf.max_bw_high;
 
-		DPU_DEBUG("final threshold bw limit = %d\n", threshold);
+		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
 		if (!threshold) {
 			DPU_ERROR("no bandwidth limits specified\n");
@@ -228,7 +228,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DPU_DEBUG("crtc=%d bw=%llu paths:%d\n",
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
 				  tmp_crtc->base.id,
 				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
 		}
@@ -278,7 +278,7 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	/* Release the bandwidth */
 	if (kms->perf.enable_bw_release) {
 		trace_dpu_cmd_release_bw(crtc->base.id);
-		DPU_DEBUG("Release BW crtc=%d\n", crtc->base.id);
+		DRM_DEBUG_ATOMIC("Release BW crtc=%d\n", crtc->base.id);
 		dpu_crtc->cur_perf.bw_ctl = 0;
 		_dpu_core_perf_crtc_update_bus(kms, crtc);
 	}
@@ -314,7 +314,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
 		clk_rate = kms->perf.fix_core_clk_rate;
 
-	DPU_DEBUG("clk:%llu\n", clk_rate);
+	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
 
 	return clk_rate;
 }
@@ -344,7 +344,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
-	DPU_DEBUG("crtc:%d stop_req:%d core_clk:%llu\n",
+	DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
 			crtc->base.id, stop_req, kms->perf.core_clk_rate);
 
 	old = &dpu_crtc->cur_perf;
@@ -362,7 +362,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
 			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
 			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
-			DPU_DEBUG("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
+			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
 				crtc->base.id, params_changed,
 				new->bw_ctl, old->bw_ctl);
 			old->bw_ctl = new->bw_ctl;
@@ -378,7 +378,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_clk = true;
 		}
 	} else {
-		DPU_DEBUG("crtc=%d disable\n", crtc->base.id);
+		DRM_DEBUG_ATOMIC("crtc=%d disable\n", crtc->base.id);
 		memset(old, 0, sizeof(*old));
 		memset(new, 0, sizeof(*new));
 		update_bus = true;
@@ -414,7 +414,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		}
 
 		kms->perf.core_clk_rate = clk_rate;
-		DPU_DEBUG("update clk rate = %lld HZ\n", clk_rate);
+		DRM_DEBUG_ATOMIC("update clk rate = %lld HZ\n", clk_rate);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 56eb22554197..2bce1e9a3cda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -57,8 +57,6 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 
-	DPU_DEBUG("\n");
-
 	if (!crtc)
 		return;
 
@@ -87,7 +85,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	lm->ops.setup_blend_config(lm, pstate->stage,
 				0xFF, 0, blend_op);
 
-	DPU_DEBUG("format:%s, alpha_en:%u blend_op:0x%x\n",
+	DRM_DEBUG_ATOMIC("format:%s, alpha_en:%u blend_op:0x%x\n",
 		drm_get_format_name(format->base.pixel_format, &format_name),
 		format->alpha_enable, blend_op);
 }
@@ -143,7 +141,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
 
-		DPU_DEBUG("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
@@ -198,7 +196,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_hw_mixer *lm;
 	int i;
 
-	DPU_DEBUG("%s\n", dpu_crtc->name);
+	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		mixer[i].mixer_op_mode = 0;
@@ -225,7 +223,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
 
-		DPU_DEBUG("lm %d, op_mode 0x%X, ctl %d, flush mask 0x%x\n",
+		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d, flush mask 0x%x\n",
 			mixer[i].hw_lm->idx - LM_0,
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0,
@@ -308,7 +306,7 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 
 	DPU_ATRACE_BEGIN("crtc_frame_event");
 
-	DRM_DEBUG_KMS("crtc%d event:%u ts:%lld\n", crtc->base.id, fevent->event,
+	DRM_DEBUG_ATOMIC("crtc%d event:%u ts:%lld\n", crtc->base.id, fevent->event,
 			ktime_to_ns(fevent->ts));
 
 	if (fevent->event & (DPU_ENCODER_FRAME_EVENT_DONE
@@ -478,7 +476,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
 
-		DPU_DEBUG("lm %d, ctl %d, flush mask 0x%x\n",
+		DRM_DEBUG_ATOMIC("lm %d, ctl %d, flush mask 0x%x\n",
 			mixer[i].hw_lm->idx - DSPP_0,
 			ctl->idx - CTL_0,
 			mixer[i].flush_mask);
@@ -492,12 +490,12 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct drm_encoder *encoder;
 
 	if (!crtc->state->enable) {
-		DPU_DEBUG("crtc%d -> enable %d, skip atomic_begin\n",
+		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, skip atomic_begin\n",
 				crtc->base.id, crtc->state->enable);
 		return;
 	}
 
-	DPU_DEBUG("crtc%d\n", crtc->base.id);
+	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
 	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
 
@@ -537,12 +535,12 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct dpu_crtc_state *cstate;
 
 	if (!crtc->state->enable) {
-		DPU_DEBUG("crtc%d -> enable %d, skip atomic_flush\n",
+		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, skip atomic_flush\n",
 				crtc->base.id, crtc->state->enable);
 		return;
 	}
 
-	DPU_DEBUG("crtc%d\n", crtc->base.id);
+	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	cstate = to_dpu_crtc_state(crtc->state);
@@ -605,7 +603,7 @@ static void dpu_crtc_destroy_state(struct drm_crtc *crtc,
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 
-	DPU_DEBUG("crtc%d\n", crtc->base.id);
+	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
 	__drm_atomic_helper_crtc_destroy_state(state);
 
@@ -618,7 +616,7 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 	int ret, rc = 0;
 
 	if (!atomic_read(&dpu_crtc->frame_pending)) {
-		DPU_DEBUG("no frames pending\n");
+		DRM_DEBUG_ATOMIC("no frames pending\n");
 		return 0;
 	}
 
@@ -661,9 +659,9 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
 		/* acquire bandwidth and other resources */
-		DPU_DEBUG("crtc%d first commit\n", crtc->base.id);
+		DRM_DEBUG_ATOMIC("crtc%d first commit\n", crtc->base.id);
 	} else
-		DPU_DEBUG("crtc%d commit\n", crtc->base.id);
+		DRM_DEBUG_ATOMIC("crtc%d commit\n", crtc->base.id);
 
 	dpu_crtc->play_count++;
 
@@ -838,14 +836,14 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
 
 	if (!crtc_state->enable || !crtc_state->active) {
-		DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
+		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
 				crtc_state->active);
 		goto end;
 	}
 
 	mode = &crtc_state->adjusted_mode;
-	DPU_DEBUG("%s: check\n", dpu_crtc->name);
+	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
 	if (crtc_state->active_changed)
@@ -953,7 +951,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 
 		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
-		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
 	for (i = 0; i < multirect_count; i++) {
@@ -1302,6 +1300,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	/* initialize event handling */
 	spin_lock_init(&dpu_crtc->event_lock);
 
-	DPU_DEBUG("%s: successfully initialized crtc\n", dpu_crtc->name);
+	DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc->name);
 	return crtc;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 288e95ee8e1d..4f8bc7a3dde3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -27,13 +27,13 @@
 #include "dpu_trace.h"
 #include "dpu_core_irq.h"
 
-#define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
+#define DPU_DEBUG_ENC(e, fmt, ...) DRM_DEBUG_ATOMIC("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
 
 #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
 
-#define DPU_DEBUG_PHYS(p, fmt, ...) DPU_DEBUG("enc%d intf%d pp%d " fmt,\
+#define DPU_DEBUG_PHYS(p, fmt, ...) DRM_DEBUG_ATOMIC("enc%d intf%d pp%d " fmt,\
 		(p) ? (p)->parent->base.id : -1, \
 		(p) ? (p)->intf_idx - INTF_0 : -1, \
 		(p) ? ((p)->hw_pp ? (p)->hw_pp->idx - PINGPONG_0 : -1) : -1, \
@@ -790,13 +790,13 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		/* return if the resource control is already in ON state */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_ON) {
-			DRM_DEBUG_KMS("id;%u, sw_event:%d, rc in ON state\n",
+			DRM_DEBUG_ATOMIC("id;%u, sw_event:%d, rc in ON state\n",
 				      DRMID(drm_enc), sw_event);
 			mutex_unlock(&dpu_enc->rc_lock);
 			return 0;
 		} else if (dpu_enc->rc_state != DPU_ENC_RC_STATE_OFF &&
 				dpu_enc->rc_state != DPU_ENC_RC_STATE_IDLE) {
-			DRM_DEBUG_KMS("id;%u, sw_event:%d, rc in state %d\n",
+			DRM_DEBUG_ATOMIC("id;%u, sw_event:%d, rc in state %d\n",
 				      DRMID(drm_enc), sw_event,
 				      dpu_enc->rc_state);
 			mutex_unlock(&dpu_enc->rc_lock);
@@ -2038,8 +2038,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	phys_params.parent_ops = &dpu_encoder_parent_ops;
 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
 
-	DPU_DEBUG("\n");
-
 	switch (disp_info->intf_type) {
 	case DRM_MODE_ENCODER_DSI:
 		intf_type = INTF_DSI;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 21ff8f9e5dfd..440ae93d7bd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -992,7 +992,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 	 * Currently only support exactly zero or one modifier.
 	 * All planes use the same modifier.
 	 */
-	DPU_DEBUG("plane format modifier 0x%llX\n", modifier);
+	DRM_DEBUG_ATOMIC("plane format modifier 0x%llX\n", modifier);
 
 	switch (modifier) {
 	case 0:
@@ -1002,7 +1002,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 	case DRM_FORMAT_MOD_QCOM_COMPRESSED:
 		map = dpu_format_map_ubwc;
 		map_size = ARRAY_SIZE(dpu_format_map_ubwc);
-		DPU_DEBUG("found fmt: %4.4s  DRM_FORMAT_MOD_QCOM_COMPRESSED\n",
+		DRM_DEBUG_ATOMIC("found fmt: %4.4s  DRM_FORMAT_MOD_QCOM_COMPRESSED\n",
 				(char *)&format);
 		break;
 	default:
@@ -1021,7 +1021,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 		DPU_ERROR("unsupported fmt: %4.4s modifier 0x%llX\n",
 			(char *)&format, modifier);
 	else
-		DPU_DEBUG("fmt %4.4s mod 0x%llX ubwc %d yuv %d\n",
+		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %d\n",
 				(char *)&format, modifier,
 				DPU_FORMAT_IS_UBWC(fmt),
 				DPU_FORMAT_IS_YUV(fmt));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3f5626832c9e..e7b75cf414ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -24,7 +24,7 @@
 #include "dpu_vbif.h"
 #include "dpu_plane.h"
 
-#define DPU_DEBUG_PLANE(pl, fmt, ...) DPU_DEBUG("plane%d " fmt,\
+#define DPU_DEBUG_PLANE(pl, fmt, ...) DRM_DEBUG_ATOMIC("plane%d " fmt,\
 		(pl) ? (pl)->base.base.id : -1, ##__VA_ARGS__)
 
 #define DPU_ERROR_PLANE(pl, fmt, ...) DPU_ERROR("plane%d " fmt,\
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 7e08f40e7e6f..21d20373eb8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -46,7 +46,7 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 				vbif->idx - VBIF_0, xin_id);
 	} else {
 		rc = 0;
-		DPU_DEBUG("VBIF %d client %d is halted\n",
+		DRM_DEBUG_ATOMIC("VBIF %d client %d is halted\n",
 				vbif->idx - VBIF_0, xin_id);
 	}
 
@@ -87,7 +87,7 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DPU_DEBUG("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+	DRM_DEBUG_ATOMIC("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
 			vbif->idx - VBIF_0, params->xin_id,
 			params->width, params->height, params->frame_rate,
 			pps, *ot_lim);
@@ -133,7 +133,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DPU_DEBUG("vbif:%d xin:%d ot_lim:%d\n",
+	DRM_DEBUG_ATOMIC("vbif:%d xin:%d ot_lim:%d\n",
 			vbif->idx - VBIF_0, params->xin_id, ot_lim);
 	return ot_lim;
 }
@@ -163,7 +163,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	}
 
 	if (!vbif || !mdp) {
-		DPU_DEBUG("invalid arguments vbif %d mdp %d\n",
+		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
 				vbif != NULL, mdp != NULL);
 		return;
 	}
@@ -230,7 +230,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 
 	if (!vbif->ops.set_qos_remap || !mdp->ops.setup_clk_force_ctrl) {
-		DPU_DEBUG("qos remap not supported\n");
+		DRM_DEBUG_ATOMIC("qos remap not supported\n");
 		return;
 	}
 
@@ -238,14 +238,14 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 			&vbif->cap->qos_nrt_tbl;
 
 	if (!qos_tbl->npriority_lvl || !qos_tbl->priority_lvl) {
-		DPU_DEBUG("qos tbl not defined\n");
+		DRM_DEBUG_ATOMIC("qos tbl not defined\n");
 		return;
 	}
 
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
+		DRM_DEBUG_ATOMIC("vbif:%d xin:%d lvl:%d/%d\n",
 				params->vbif_idx, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
-- 
https://chromeos.dev

