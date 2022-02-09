Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49C84AF812
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238152AbiBIRZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238164AbiBIRZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDADC05CB86
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:32 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h8so2343871lfj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmo2wPnY5HTFpsxubtvW/eo0MVHY2voG44tPmmwtCqA=;
        b=JUxk5Fumxguc64Cde9mcrbU92rzMSWSa52DdMXZ+Eo+xrG5Gn8x/nAmf1KT+Qiyt97
         uCIJwv627OHvf+8EyY8ybV+Nuni5d1biVJVJ3+vAVwaM/HRB8kPD+Mq/Lqo18hLBqnuf
         mFXqNMLbb2QL9rKWZofDBvnWHcQLEcLpq/vH0gCYZVveuD8t8jkkt9z1GIdynnSkC3+A
         NvKydyRULkGuX/WrxOyGok+/BXFAtlbscricujyYKZR4flxD64Y2sKZK22ZhNI8eB+KW
         fJEJCc88mdqzwdPJI8fRSna0vzcIi8XHrCYY4ZaFj1lsgSU5WfdBv383hX7mhstXiB7k
         JgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmo2wPnY5HTFpsxubtvW/eo0MVHY2voG44tPmmwtCqA=;
        b=OHh/dBs902FuPqaWdw5kSKaZpgW/1w9MQ1B87wzFc5MmoqrWJ7EGm9yJx6MUU/7/XD
         AXPTaD+UrK4iboHDz6rQVcsb9U5HO03ILmepNWQQPzFZlkySj5uP08jaFC7QAKIXWUZ7
         WMjH2CIT837XpNHMtN3qCcWr7LO7sQsU2hB2JYW1msmlqcN2rPMFEiG1lBcH532yMkem
         Qaf63hmDwEFmzSktL+oef8WvbNZF8ZNhWZ6hxxEt+g/UA7+XgMYCkPyO1t5jt3Hfkqvl
         sywuZ3g+YeZ9KbtC+r+WeM+6vvHVxGe4YYAcLrCECCMDNZrFFJswuSVy6IkYsTQNYfpe
         wIeg==
X-Gm-Message-State: AOAM533NEKPcxn6LNDKnls1t2N3ljEntU5wwfDGAhwCn5ilWH4tg00ht
        fhyL9WUof89a+gpEu7SztkvE+g==
X-Google-Smtp-Source: ABdhPJzoW4KCDSvMqsFsIRCMp6ppLaHz55UAr72PXLLxReyVbZmboylNQNghTcLo3GpoQhamnMSNkg==
X-Received: by 2002:a05:6512:2fb:: with SMTP id m27mr2307891lfq.140.1644427530695;
        Wed, 09 Feb 2022 09:25:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 09/25] drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
Date:   Wed,  9 Feb 2022 20:25:04 +0300
Message-Id: <20220209172520.3719906-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The funcitons _dpu_crtc_blend_setup() and _dpu_crtc_blend_setup_mixer()
have an intertwined mixture of CTL and LM-related code. Split these two
functions into LM-specific and CTL-specific parts, making both code
paths clean and observable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 101 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h |  10 +--
 2 files changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e6c33022d560..ada7d5750536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -336,27 +336,23 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 	}
 }
 
-static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
-	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
-	struct dpu_hw_stage_cfg *stage_cfg)
+static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc)
 {
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
+	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct drm_plane *plane;
 	struct drm_framebuffer *fb;
 	struct drm_plane_state *state;
-	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
 	struct dpu_format *format;
-	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-
+	int i;
 	uint32_t stage_idx, lm_idx;
-	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		enum dpu_sspp sspp_idx;
+	for (i = 0; i < cstate->num_mixers; i++)
+		mixer[i].mixer_op_mode = 0;
 
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
 			continue;
@@ -364,14 +360,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = pstate->pipe_hw->idx;
-		set_bit(sspp_idx, fetch_active);
-
-		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
-				sspp_idx - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
@@ -379,15 +371,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		stage_idx = zpos_cnt[pstate->stage]++;
-		stage_cfg->stage[pstate->stage][stage_idx] =
-					sspp_idx;
-		stage_cfg->multirect_index[pstate->stage][stage_idx] =
-					pstate->multirect_index;
-
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   sspp_idx - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -396,8 +381,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
 						pstate, format);
 
-			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
-
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
 			else
@@ -406,17 +389,22 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
-
 	 _dpu_crtc_program_lm_output_roi(crtc);
+
+	for (i = 0; i < cstate->num_mixers; i++) {
+		struct dpu_hw_mixer *lm;
+
+		lm = mixer[i].hw_lm;
+
+		lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
+
+		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X\n",
+			mixer[i].hw_lm->idx - LM_0,
+			mixer[i].mixer_op_mode);
+	}
 }
 
-/**
- * _dpu_crtc_blend_setup - configure crtc mixers
- * @crtc: Pointer to drm crtc structure
- */
-static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
+static void _dpu_crtc_blend_setup_ctl(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
@@ -425,34 +413,62 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_hw_mixer *lm;
 	struct dpu_hw_stage_cfg stage_cfg;
 	int i;
+	struct drm_plane *plane;
+	struct drm_plane_state *state;
+	struct dpu_plane_state *pstate = NULL;
+
+	uint32_t stage_idx, lm_idx;
+	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
+	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
 
-	for (i = 0; i < cstate->num_mixers; i++) {
-		mixer[i].mixer_op_mode = 0;
+	for (i = 0; i < cstate->num_mixers; i++)
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
-	}
 
 	/* initialize stage cfg */
 	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	memset(fetch_active, 0, sizeof(fetch_active));
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		enum dpu_sspp sspp_idx;
+
+		state = plane->state;
+		if (!state)
+			continue;
+
+		pstate = to_dpu_plane_state(state);
+
+		sspp_idx = pstate->pipe_hw->idx;
+		set_bit(sspp_idx, fetch_active);
+
+		stage_idx = zpos_cnt[pstate->stage]++;
+		stage_cfg.stage[pstate->stage][stage_idx] =
+					sspp_idx;
+		stage_cfg.multirect_index[pstate->stage][stage_idx] =
+					pstate->multirect_index;
+
+		/* blend config update */
+		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++)
+			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+	}
+
+	ctl = mixer->lm_ctl;
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, fetch_active);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
 		lm = mixer[i].hw_lm;
 
-		lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
-
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush_mixer(ctl,
 			mixer[i].hw_lm->idx);
 
-		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d\n",
+		DRM_DEBUG_ATOMIC("lm %d, ctl %d\n",
 			mixer[i].hw_lm->idx - LM_0,
-			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
@@ -731,7 +747,8 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 	if (unlikely(!cstate->num_mixers))
 		return;
 
-	_dpu_crtc_blend_setup(crtc);
+	_dpu_crtc_blend_setup_mixer(crtc);
+	_dpu_crtc_blend_setup_ctl(crtc);
 
 	_dpu_crtc_setup_cp_blocks(crtc);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 54d74341e690..ecd2f371374d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -632,9 +632,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
 TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
-		 uint32_t stage_idx, enum dpu_sspp sspp, uint32_t pixel_format,
+		 uint32_t stage_idx, uint32_t pixel_format,
 		 uint64_t modifier),
-	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx, sspp,
+	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
 		pixel_format, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
@@ -644,7 +644,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__field_struct(	struct drm_rect,	dst_rect	)
 		__field(	uint32_t,		stage_idx	)
 		__field(	enum dpu_stage,		stage		)
-		__field(	enum dpu_sspp,		sspp		)
 		__field(	uint32_t,		multirect_idx	)
 		__field(	uint32_t,		multirect_mode	)
 		__field(	uint32_t,		pixel_format	)
@@ -658,20 +657,19 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = sspp;
 		__entry->multirect_idx = pstate->multirect_index;
 		__entry->multirect_mode = pstate->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),
 	TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
-		  " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
+		  " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, "
 		  "multirect_index:%d multirect_mode:%u pix_format:%u "
 		  "modifier:%llu",
 		  __entry->crtc_id, __entry->plane_id, __entry->fb_id,
 		  DRM_RECT_FP_ARG(&__entry->src_rect),
 		  DRM_RECT_ARG(&__entry->dst_rect),
-		  __entry->stage_idx, __entry->stage, __entry->sspp,
+		  __entry->stage_idx, __entry->stage,
 		  __entry->multirect_idx, __entry->multirect_mode,
 		  __entry->pixel_format, __entry->modifier)
 );
-- 
2.34.1

