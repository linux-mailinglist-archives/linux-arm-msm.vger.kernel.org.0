Return-Path: <linux-arm-msm+bounces-29978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32E9641B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AE428C5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA582197A6A;
	Thu, 29 Aug 2024 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbyfoORT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A118F2F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926875; cv=none; b=KJ0b3XHI57nHhnKGuvPZfa52cjPpYBGYul2Lkqw7DBuqpHLQd1KDhOTcjqaeMzX3faiQLdIG1/wvu5dzSTs8tlJ+gRVitKzf3QDhB2lWPK+eeCfKAAIWjzlAzIJCSVDrGX4/HeKVJTVuE75cZg4LTbEnCRblo6xkdlyrLdJsXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926875; c=relaxed/simple;
	bh=+fFwh3BlU4QdHqwiqSk74UYJcpu2jT8QOrSJGdZFo6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGEWD37yM2y+OoVm8vWfLO5pQaq0TP+73iyqVQEbxDv8IwO23ilZoPc4ei2Br1JPy6+ThcPtoXt6GTMte4i2jJFkDC/mq8mn5DhZal2A3C0TbPdDR0Z7LPesi9ZTTWVeGFeXTjQ3idLIvBgOCm/+aBPpJsIiZeaL0EP+JRusQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbyfoORT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7148912a1ebso280222b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926874; x=1725531674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UujAM0ppALmP+CiZ+Yvmk6WlfqztN9lMTwPiJPvAki8=;
        b=kbyfoORT3fYwH9S3aK/okxjlxwkBGuALf5vfTLQdg1yjiOgI8i6D0UVYrG8HAf97Vm
         AX5fBKLblDFTUnIlfeZ/s3AH58glzAuATbL60eUOPcf6G6lIpKfHNGeg56AySLX0sOpz
         SSKa6f/DXGxPXNeYzBbKR2WfW7vBn3/jsTZJVRw6o0C6SrDY39iebkGSxZiWnYJWzvaE
         PeQjYya0sdLv8ZUhmqzQu2F4SbcadDUNuOJxMNVMP62nVAYwwLAC/rD5jJLSXswN3UeW
         lOT6+mz27BcZTQ2SZYBoSrxfCCtIHFJe/Oxo09sKCkFkb3K5/Opz/hp4KJHaTd9VT5dp
         D+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926874; x=1725531674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UujAM0ppALmP+CiZ+Yvmk6WlfqztN9lMTwPiJPvAki8=;
        b=TEtebuCZF4wxoFe2uIjXb3tbwLSJrvJ3QcvBCA7MpGk2e6f9p4NH2cbhyU45CDYshI
         5MJWLOWiASybuJUAJK8PvHsDiL/Lr8g4A6CCMI0fp46JYBMP7JFBix+DjKexfn6/YTQU
         9TN54fWLteoT+42MCUvvUp8k7oaU54FPGaWdWKf6zwrnoNrWsYhnjWG7g113IwpBAB53
         q4oEmulsnNQBAkpxSp7cHYzeTq2ayzaY7uDeMybQxUiUuucgFMfcIT1ryCbcZ6OYBWUp
         5Uno2QsLvIpWrn0keSyNTNR8Q7V/RwkPwcRMLhQZpvt7PZT9vMEM7vkNn6mJ33J6Wovf
         VQrA==
X-Gm-Message-State: AOJu0YyhOKxiP1ay7UZpsiUkE1KVZpOGx3jfmC/qgFfGXl2zAp8yLyne
	TcqyOJlPckMSr31uOnzEsQuJhrGi4xA+Zy0xwGOlBx343zhmlVBjAAR0RNT21+A=
X-Google-Smtp-Source: AGHT+IEZO2t8671x5VEXsSyb6biZG0ZXztl+IufggNceUR20goIfPI5Pkilp1q+yrz7uk8QdNHHulg==
X-Received: by 2002:a05:6a21:513:b0:1cc:d7aa:fba4 with SMTP id adf61e73a8af0-1cce10aed99mr2453015637.42.1724926873547;
        Thu, 29 Aug 2024 03:21:13 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:12 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:44 +0800
Subject: [PATCH 15/21] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-15-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=6300;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+fFwh3BlU4QdHqwiqSk74UYJcpu2jT8QOrSJGdZFo6o=;
 b=ptq+UtRC5kpvJuEzJqB3XQdb1yGUc94lYYAbpcvYcm6FG7s2TQg28lLefqCfZW0+5jyd45wVO
 +lBt83BvFqtCS2k+y812D6DNo9akxkRtatC7uowxmVa62u2KtEIXel8
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Clip plane into SSPPs per left and right half screen per ROI if topology
is quad pipe. Then split the split rectangle by half if the clip
width still exceed limit.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 97 ++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 78bf8f0292f62..95cb2575c63b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -836,10 +836,12 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 lm_num;
+	int cfg_idx = 0, cfg_id, mixercfg_num;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -862,10 +864,10 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+	lm_num = dpu_crtc_get_lm_num(crtc_state);
 
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -880,34 +882,77 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
+	drm_rect_rotate(&pipe_cfg.src_rect,
 			new_plane_state->fb->width, new_plane_state->fb->height,
 			new_plane_state->rotation);
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
+	/*
+	 * We have 1 mixer cfg for 1:1:1 and 2:2:1 topology, 2 mixer configs
+	 * for left and right half screen in case of 4:4:2 topology.
+	 * But we may have 2 SSPP to split plane with 1 mixer config for 2:2:1.
+	 * So need to handle super wide plane splitting, and plane on right half
+	 * for dual-DSI case. Check dest rectangle left/right splitting
+	 * first, then check super wide rectangle splitting next.
+	 */
+	mixercfg_num = lm_num / 2;
+	mixercfg_num = mixercfg_num == 0 ? 1 : mixercfg_num;
+	/* iterate mixer configs for this plane, to separate left/right with the id */
+	for (cfg_id = 0; cfg_id < mixercfg_num; cfg_id++) {
+		struct drm_rect mixer_rect = {cfg_id * mode->hdisplay / mixercfg_num, 0,
+					(cfg_id + 1) * mode->hdisplay / mixercfg_num, mode->vdisplay};
+		struct dpu_sw_pipe_cfg *cur_cfg = &pstate->pipe_cfg[cfg_idx];
+
+		drm_rect_fp_to_int(&cur_cfg->src_rect, &new_plane_state->src);
+		cur_cfg->dst_rect = new_plane_state->dst;
+
+		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT " vs clip " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&cur_cfg->src_rect), DRM_RECT_ARG(&mixer_rect));
+
+		/* If this plane does not fall into mixer rect, check next mixer rect */
+		if (!drm_rect_clip_scaled(&cur_cfg->src_rect, &cur_cfg->dst_rect, &mixer_rect))
+			continue;
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	} else {
-		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
-	}
+		cur_cfg->visible = true;
+		cur_cfg->mxcfg_id = cfg_id;
+		cur_cfg->dst_rect.x1 -= mixer_rect.x1;
+		cur_cfg->dst_rect.x2 -= mixer_rect.x1;
+
+		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&cur_cfg->src_rect), DRM_RECT_ARG(&cur_cfg->dst_rect));
+
+		/* Split super wide rect into 2 rect */
+		if ((drm_rect_width(&cur_cfg->src_rect) > max_linewidth) ||
+		     _dpu_plane_calc_clk(mode, cur_cfg) > max_mdp_clk_rate) {
+			struct dpu_sw_pipe_cfg *next_cfg = &pstate->pipe_cfg[cfg_idx + 1];
+
+			if (drm_rect_width(&cur_cfg->src_rect) > 2 * max_linewidth) {
+				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+						DRM_RECT_ARG(&cur_cfg->src_rect), max_linewidth);
+				return -E2BIG;
+			}
+
+			memcpy(next_cfg, cur_cfg, sizeof(struct dpu_sw_pipe_cfg));
+			cur_cfg->src_rect.x2 = (cur_cfg->src_rect.x1 + cur_cfg->src_rect.x2) >> 1;
+			cur_cfg->dst_rect.x2 = (cur_cfg->dst_rect.x1 + cur_cfg->dst_rect.x2) >> 1;
+			next_cfg->src_rect.x1 = cur_cfg->src_rect.x2;
+			next_cfg->dst_rect.x1 = cur_cfg->dst_rect.x2;
+			next_cfg->visible = true;
+			next_cfg->mxcfg_id = cfg_id;
+			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:" DRM_RECT_FMT "and" DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&cur_cfg->src_rect), DRM_RECT_ARG(&next_cfg->src_rect));
+			cfg_idx++;
+		}
 
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+		drm_rect_rotate_inv(&cur_cfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
+		cfg_idx++;
+	}
+
+	for (; cfg_idx < MIX_CFGS_IN_CRTC; cfg_idx++) {
+		memset(&pstate->pipe_cfg[cfg_idx], 0, sizeof(struct dpu_sw_pipe_cfg));
+		memset(&pstate->pipe[cfg_idx], 0, sizeof(struct dpu_sw_pipe));
+	}
 
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 

-- 
2.34.1


