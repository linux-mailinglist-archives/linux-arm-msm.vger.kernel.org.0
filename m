Return-Path: <linux-arm-msm+bounces-33652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC599641D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892DC1C23E47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87237193075;
	Wed,  9 Oct 2024 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7qhB+fx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA918B46B
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463897; cv=none; b=OBirvkLS6gBGElwVYArokBBIkxgd46rI+LP5DkAT3wsOb9tAf3h/EvB+d7DRGPMH3ZZagFIsZ6noFT0BPMsBZdtzFrMrGoMwyfGLG0XCoGySbhGywoRmkhQYBtwW4s4upZLU5EWgbwX6tkDt6sEMyIk42Wzw+o1BuR+XHydUOj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463897; c=relaxed/simple;
	bh=81jK3N0j+q+DAMnsIs+UuOUU0xKWIcMiivwpFJMyey8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NppUUzhfpsy31UP2BCgMCvUmsEcZPAGAnHxs1j6vd5foNKAbWw3Pc2MFYOFyYBH5e67zBW/QIKrHiSES8wF5JzhfKaGQ/bPU8P/eEE/h46zI38vUdx2IV8WXgmukUtlwxOaq2IR7IChgJ/C/AmyMrQ+CjHuiJXQSRJIKv+36bFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7qhB+fx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so475087a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463895; x=1729068695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J50cstReZOAStzssDowtSyHGuYNkBj/m3heNj/5l6AQ=;
        b=L7qhB+fxMCDZ9v7ncKD7ygWpIEZsoBo8i4mtwOYH37VoMLZK4dFFZJOJixhNpwmHed
         3/39rbarqVOspGAGq3cgjyRMHKpOntnGqJI31CpjkGXrBiI6JPTwE4olsV7NdqJKkslk
         Z50v5CaB2UiRB/XswqrJHOFWaD0czCfC6cQmp7iYoVFz5kL4U9nuaU4R5nA91OQoBojg
         Ua+M6NUqrrN0SGQNk1ZMj88rwTZIA7aV09+FDpPsHTMrb84J4AEtE/NHOSss5L/cqca/
         aRS/5WyOIfX4T/l/4d/cjz9RTgvsXI81EDWFsHBPZ1ubBFQTJkzqDgU6QQFYQ8hJHlT2
         +XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463895; x=1729068695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J50cstReZOAStzssDowtSyHGuYNkBj/m3heNj/5l6AQ=;
        b=T7IzTyo3SjgAOwgG/pSKGd0jOTvnfwcSDWy+vSxhDZI9aXVKJjrRktwLno3IyzBDZx
         PyD4xw9QsxkLZJKCfYuAfWJr/IGg44f2XU1xREopfBwWkubIetBj2nVI+GjnMH3FgUAZ
         khny7+UJnLfJUYNVolw1RMowbIQwJEPRgfPrpSCg2Xtql7b8HwEQ6zCKKEjlXHw8sOUo
         z962ORwU7tdW/UFT8ItykN64bfqi92jaEyKoTRrJXyN3JOy3SimTlRpjqTtYjI6xLg0U
         /JXiLdEUx/D4PfgRB89KYRsivP/ynFL7j3Lq0QALMwtHSb3l8HJGz80Baa18ZMVPrw4/
         OOHw==
X-Gm-Message-State: AOJu0Yzo57WbBxojcGxLYnUPETecm5jXzofIGmGc0s81+ALsspIfF/zl
	KFGp6skZHrW4zLwayTEI4Q7fwJ+IBg4hyc8xLWuDSQ/faR8Vm3sSN1gvaoOa1H8=
X-Google-Smtp-Source: AGHT+IGh9hWeUvEBQWoVINgVGvCvhY1wTX7fgeC/PcJue28p3V3B/iyUf2JTyGKo3OaTbJ8zsQLDwA==
X-Received: by 2002:a17:90b:4c12:b0:2da:82d4:c63c with SMTP id 98e67ed59e1d1-2e27dd3c2c0mr9615183a91.4.1728463895250;
        Wed, 09 Oct 2024 01:51:35 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:51:34 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:26 +0800
Subject: [PATCH v2 13/14] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-13-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=5496;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=81jK3N0j+q+DAMnsIs+UuOUU0xKWIcMiivwpFJMyey8=;
 b=T2DDlAeki79IVTctGUrvaj5XGACyxwdgxLwVCSDMiyi7MaCokffcNiEXMdg9z8ampm5Okjoid
 qYQVV0H1p1TBiQAtOoEekEoUnh5BEej73xKINai11HinJq+tccjEGZy
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support SSPP assignment for quad-pipe case with unified method.
The first 2 pipes can share a set of mixer config and enable
multi-rect mode if condition is met. It is also the case for
the later 2 pipes.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 85 +++++++++++++++----------------
 1 file changed, 42 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 480a1b46aba72..23de2ca6fabb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -999,7 +999,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		pipe = &pstate->pipe[i];
 		pipe_cfg = &pstate->pipe_cfg[i];
 		if (!pipe_cfg->valid || !pipe->sspp)
-			break;
+			continue;
 		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
 		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
 						  &crtc_state->adjusted_mode,
@@ -1154,13 +1154,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
 	uint32_t max_linewidth;
-	int i;
+	int i, lm_num, lmcfg_id, lmcfg_num;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1168,12 +1165,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	/* loop below code for another pair later */
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1189,41 +1180,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->sspp = NULL;
-	} else {
-		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
-		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
-		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
-		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
-			r_pipe->sspp = pipe->sspp;
+	lm_num = dpu_crtc_get_lm_num(crtc_state);
+	lmcfg_num = (lm_num + 1) / 2;
+	for (lmcfg_id = 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
+		for (i = lmcfg_id * PIPES_PER_LM_PAIR; i < (lmcfg_id + 1) * PIPES_PER_LM_PAIR; i++) {
+			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
+			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
+			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
+			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
 
-			pipe->multirect_index = DPU_SSPP_RECT_0;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+			if (!pipe_cfg->valid)
+				break;
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_1;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-		} else {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
 				return -ENODEV;
 
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if (!(i % 2) &&
+			    r_pipe_cfg->valid &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
+			    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+			    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
+			     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
+				pipe->multirect_index = DPU_SSPP_RECT_0;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d and set pipe %d as multi-rect\n",
+						pipe->sspp->idx - SSPP_NONE, i, i + 1);
+				r_pipe->sspp = pipe->sspp;
+				r_pipe->multirect_index = DPU_SSPP_RECT_1;
+				r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+				i++;
+			} else {
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
 		}
 	}
 

-- 
2.34.1


