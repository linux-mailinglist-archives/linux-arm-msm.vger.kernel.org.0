Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D8468A1BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbjBCSWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjBCSWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:22:07 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7674ADBA0
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:22:04 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw12so17742906ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/ETmX8YwRAY6t0csNCJysL4LrXwHsg+bYFFKurLXWg=;
        b=Vsk6/kuqaeRKnLW8lsgdakZ6vw/jmpVdKmY1xCH19DbkRaPVRLrndw08pijWox4PDk
         E9sJZrQUPKn5eHr3dLjYvkZ3Tt7poGQgJ5qPjurYdpnuhTZCwC01ubZPmTII+RACuu0m
         ZM3W7w4AyERZAGe4BHLDFB7eL0hr4rwL8Cah4/LKedQDP2lFCcMOUcJ8e8bQvLI7Bjp6
         9AYQlLJ6oWTabb7EStheyktSZBzBoYzMusPh0ARjbaoRC4YEWrvdnzUZpBaIrs+Ehr4/
         jC1AgSL2vEOshFZUmHfI9n4C3bWGpNxuFyg1SjkULhpcgcXbo+Z4Tv/mKadeeOxxU0kR
         uQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/ETmX8YwRAY6t0csNCJysL4LrXwHsg+bYFFKurLXWg=;
        b=NjvY8dGjGwOdf9idZwSZvQzFh1ieVXhYKKjpV6hyRBdW4q+mUfUbRpTV+vPxNRu7zL
         NFyd7FMiRLclmWJrUfANUmXO5JLPasKMYLOwCL99gcNo6Lnu1FkmUcCYTCRyEPBcFXGa
         OjyI7rBZrry7kCv+SYSRXrdypU3bHgldyFAfDANV7Y/E+n/bPtUYO1kQdHogQ2h1ok2l
         8/VRtKfh5gjTSqlGYSwrWK0RdDNa9zO2ltS9Soog5tfyf7dKDtvZQqprgO+c2q7bQUEg
         Evkps1OYhs84y5XHYHl7qqVHEvdeBc8y231+jKzCAY3YnBSIH+q9LnPJRz1z2R17i8xz
         Zucw==
X-Gm-Message-State: AO0yUKWHAiphw1oTJ3Skwz5AekCHG79D2Mwp6WgXRpCX5XuBZlaNQGAy
        Zdz8v878XmpcETNsNBubS4pXCw==
X-Google-Smtp-Source: AK7set//IE3Jo+gVDQsLisdfnMeVeJOAj/MotazPDBQWIPKqkfMt8wgmOfocCMJbWY/rtTIJUqDvMA==
X-Received: by 2002:a17:907:e8f:b0:877:a3c4:807b with SMTP id ho15-20020a1709070e8f00b00877a3c4807bmr12925539ejc.68.1675448523323;
        Fri, 03 Feb 2023 10:22:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:22:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 26/27] drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
Date:   Fri,  3 Feb 2023 20:21:31 +0200
Message-Id: <20230203182132.1307834-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
separate functon. This is a preparation for the r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 86 ++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 ++-
 2 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 73e1a8c69ef0..0ca3bc38ff7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -400,6 +400,47 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 	}
 }
 
+static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
+				       struct drm_plane *plane,
+				       struct dpu_crtc_mixer *mixer,
+				       u32 num_mixers,
+				       struct dpu_hw_stage_cfg *stage_cfg,
+				       enum dpu_stage stage,
+				       unsigned int stage_idx,
+				       unsigned long *fetch_active,
+				       struct dpu_sw_pipe *pipe
+				      )
+{
+	uint32_t lm_idx;
+	enum dpu_sspp sspp_idx;
+	struct drm_plane_state *state;
+
+	if (!pipe->sspp)
+		return;
+
+	sspp_idx = pipe->sspp->idx;
+
+	state = plane->state;
+
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+			 crtc->base.id,
+			 stage,
+			 plane->base.id,
+			 sspp_idx - SSPP_NONE,
+			 state->fb ? state->fb->base.id : -1);
+
+	set_bit(sspp_idx, fetch_active);
+
+	stage_cfg->stage[stage][stage_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][stage_idx] =
+				pipe->multirect_index;
+
+	/* blend config update */
+	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
+								    sspp_idx);
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -412,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t stage_idx, lm_idx;
-	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
+	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		enum dpu_sspp sspp_idx;
-
 		state = plane->state;
 		if (!state)
 			continue;
@@ -431,39 +469,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = pstate->pipe.sspp->idx;
-		set_bit(sspp_idx, fetch_active);
-
-		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
-				crtc->base.id,
-				pstate->stage,
-				plane->base.id,
-				sspp_idx - SSPP_VIG0,
-				state->fb ? state->fb->base.id : -1);
-
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		stage_idx = zpos_cnt[pstate->stage]++;
-		stage_cfg->stage[pstate->stage][stage_idx] =
-					sspp_idx;
-		stage_cfg->multirect_index[pstate->stage][stage_idx] =
-					pstate->pipe.multirect_index;
-
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-					   state, pstate, stage_idx,
+					   state, pstate,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
+		_dpu_crtc_blend_setup_pipe(crtc, plane,
+					   mixer, cstate->num_mixers,
+					   stage_cfg, pstate->stage, 0,
+					   fetch_active,
+					   &pstate->pipe);
+
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
-						pstate, format);
-
-			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
-									    sspp_idx);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
@@ -1297,8 +1321,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
+		seq_printf(s, "\tsspp[0]:%d\n",
+			   pstate->pipe.sspp->idx - SSPP_NONE);
+		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
+		if (pstate->r_pipe.sspp) {
+			seq_printf(s, "\tsspp[1]:%d\n",
+				   pstate->r_pipe.sspp->idx - SSPP_NONE);
+			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
+				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		}
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 0ad148cc2fb8..5ec4f89e8814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
 TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
-		 uint32_t stage_idx, uint32_t pixel_format,
+		 uint32_t pixel_format,
 		 uint64_t modifier),
-	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
+	TP_ARGS(crtc_id, plane_id, state, pstate,
 		pixel_format, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
@@ -643,7 +643,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__field(	uint32_t,		fb_id		)
 		__field_struct(	struct drm_rect,	src_rect	)
 		__field_struct(	struct drm_rect,	dst_rect	)
-		__field(	uint32_t,		stage_idx	)
 		__field(	enum dpu_stage,		stage		)
 		__field(	enum dpu_sspp,		sspp		)
 		__field(	uint32_t,		multirect_idx	)
@@ -657,7 +656,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->fb_id = state ? state->fb->base.id : 0;
 		__entry->src_rect = drm_plane_state_src(state);
 		__entry->dst_rect = drm_plane_state_dest(state);
-		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
 		__entry->sspp = pstate->pipe.sspp->idx;
 		__entry->multirect_idx = pstate->pipe.multirect_index;
@@ -666,13 +664,13 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->modifier = modifier;
 	),
 	TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
-		  " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
+		  " dst:" DRM_RECT_FMT " stage:%d, sspp:%d "
 		  "multirect_index:%d multirect_mode:%u pix_format:%u "
 		  "modifier:%llu",
 		  __entry->crtc_id, __entry->plane_id, __entry->fb_id,
 		  DRM_RECT_FP_ARG(&__entry->src_rect),
 		  DRM_RECT_ARG(&__entry->dst_rect),
-		  __entry->stage_idx, __entry->stage, __entry->sspp,
+		  __entry->stage, __entry->sspp,
 		  __entry->multirect_idx, __entry->multirect_mode,
 		  __entry->pixel_format, __entry->modifier)
 );
-- 
2.39.1

