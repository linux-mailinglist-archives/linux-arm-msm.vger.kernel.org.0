Return-Path: <linux-arm-msm+bounces-48229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A98A3863A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0F93B7735
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB1921D590;
	Mon, 17 Feb 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tj8TLfXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99C22331F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801885; cv=none; b=F9RrBCk1PrC4XdiJ/Q+pCdShhgjSHB8QKhyWgq9/mGctv6aIVbp6lTQPRNpDCtkDMZSg+eL2/jTuRq/Dm5wXMPkUIlgppa0EkaFzHbSw3UM6ZhG3KUuvAXORUdCCozMWemccYH7czuXlLyra39pKGM1WYREOBPtdkGNRnABBqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801885; c=relaxed/simple;
	bh=za/TOFi8Ltkq/gvZgJJVaOFS39iYDTLgxFY68FFY8wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScIubwHm7/38dbNs3iwusuwEjELFV55UFh3LC6wG+Z6mcq6+fGbS82FweFX8/vKbhmgAa6KETiExUASEbDf+U+Q6/Eo8fXQiL0gStrMq0EW3AxMnenwV+ypVza5KtOFETMovnqehLjtFDPDfCAFouHPtBngnkPKn6T8Eu8gqYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tj8TLfXB; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc737aeeb1so1437345a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801883; x=1740406683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bsnor74CQhC3dm1vS3cAkcfQD0HtQ2hwGtKG/dYKq8=;
        b=Tj8TLfXBQ8ar3GWosl95KHeX+To7VYj9ugwAk1/AYko3A5n1azsI640FNXyz0tLUDg
         2HRqLdWt87HSjegG5eOm6zMFemu757RXXIbxSmQcLEj+53q1mT4V/sZnLAV+ObLiI5+S
         0/oWCWwlR3FxbhTzSLoR2HYkqM8bKECpkpD72PVkDMHnlvelzk5thmBYjPysATVx9If0
         HWissOHLjEwl7rmMnL/zdO3I14i6nw4RiStex6xpsStkOPMYneyf9xTJ2jjYNCIy5iPt
         mOL92atrY/7+NMXVrdiaAOo67jYtDAn7H0S1nLBmDYD1fNRPryuI7Lm67DTsPVJOgxP+
         BzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801883; x=1740406683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bsnor74CQhC3dm1vS3cAkcfQD0HtQ2hwGtKG/dYKq8=;
        b=VOkpj31lzO8Vu3iWFUp0Ik7XgTkZCKJkjBIZhNVllQ7WhzynMwAsxfYrXwbH5c3vfS
         7nlyowt/TkFikXPlFryRjIUgj8xHxJwAwUOFZRGj0ubEVKNGeaEMEEKKYz25f83tMRaW
         o7rUjs3m4HfIp2Xg7nrfJI1DQHQh4Bxv8PP3NI39HaeoeLzp0sPR3OYBtn+QUsgDNZl+
         hNQJnSmbg8FuWP+hZniHCRa32HENQGAITzmVfUmPTo0sh+sV4C5oxYGclK0U1+Jra2zw
         OARq0AAgws1z/l9o78hAAJf8gs98z50LNGflfk/3+ccOWed0yKseHP2izUHVHlmMMuLI
         VssA==
X-Gm-Message-State: AOJu0Yzk9NMPIv+hk8qU4QDGkcF6rchd+zFcNqWsTclKxA8B5+uYbcNp
	IOAhyY8i1gttpvRrroA6jg5TjSRwcKuAKjtS83VEot79f8hZCu5UCguebtckInQ=
X-Gm-Gg: ASbGnct3YQU7q/pqDaxfqIhZXU9/VpqIxPkJguMj57OYzR6ld5wxtD3Ma0MaFSxz0jW
	RhZRXAxJP6DDwetLbBXrpqOzugpVmJYpz0bCeg9CqrBKUYYxTqPeePkp6PoOPqUQfKQMWtrtHKx
	w7Hy8VJfLB+u5TZ+hW01lsMjCQ7ntl99ULvAmGyFtPs+vzvtxnlZm0fuA++8Y/ZQ7EkTqOoNtUf
	jyqP87pbOnlZXBzrHJBzj49ILfWAyu4/HWPP+651mh1r6gnPhKvWsxfUWuPwAxU7SUI00u3Q59d
	rqzW6zbntJz0
X-Google-Smtp-Source: AGHT+IFJ/9Ln4TwrSqudr9CAmOr3hLNQnzqL5uAlkzh70visApKWFl7N8wdmJkJczYPFDyU6ThqvZw==
X-Received: by 2002:a17:90b:2d8d:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-2fc40f23484mr15503162a91.20.1739801882505;
        Mon, 17 Feb 2025 06:18:02 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:18:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:16:01 +0800
Subject: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=4912;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=za/TOFi8Ltkq/gvZgJJVaOFS39iYDTLgxFY68FFY8wE=;
 b=C7E1sah3ieMMpeE1ANh60+/IurCFbYXHxwXfnJio68TiqyBOEpkITeLJFFx3ibfd5qr2sGquR
 UPyVMlAY0NOAoNWEAg9Ts/VZNhW0IImF1gtu5l8rZnjKy6zclvOlabG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array size
STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa816fe74566784844c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	uint32_t lm_idx, lm_in_pair;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	lm_in_pair = num_mixers > 1 ? 2 : 1;
+	for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +443,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +464,22 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   cstate->num_mixers - (stage * PIPES_PER_STAGE),
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +511,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +524,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There are 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d02074505c5474a547a814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1


