Return-Path: <linux-arm-msm+bounces-63884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A13AFABBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F0E188E476
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65637279918;
	Mon,  7 Jul 2025 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGx6HzKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E1279783
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869129; cv=none; b=N/dgOOHMuj7Iu3sh0NRthd6ur2MrBHG/oFvRzJ6LOKa91KgkGgFvOl5EOQauhC+fRP0K6/MQNrhG/VJm4QTUzkHO1Lo5AUpOFqxz7N4k9EtLJ6e7aDegQe+3DrzMW+DU+krrRm7Kdd2qXEmChu62g4mh1r3svP9n7MULw8rQvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869129; c=relaxed/simple;
	bh=62ZTReWl6OjScp6LnOzsAv+T3uHAVV5/XzEC+wHKmS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECOcDoSJdIZL50fjbyVfQwYpxWSIt1E8u3TkF2vsovFjSfRsX36rlrBBDg0LuR5u5A7zadUp2uYu279kTW0hnIBX+WlyUg0eBtV4C04ErWQ82VJHWHPpY/yGfM/yugaAvhCHOlRynyH7THwh65Iuk+Exm72cwVUrNCO80N6W3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGx6HzKC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2318110b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869127; x=1752473927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVzSDkejmNCMt9uxf52gBe1nAejDHptLtY79UxbACuo=;
        b=zGx6HzKCki210zvRFXBJ9fEld8ipGbWSD9V1I7j+FuQN9MH5zoSOcSN5rTo+ZYVh7m
         D1UbXZj7kkPPNLgS9lcupsxDC9NSxjrMEKLNIpjxrnK1wNqpGRheUzdsYqubxqL5Goqs
         JXF6l5LAlyGHIpmTdDasO6YGi5Z87MiRNd9gHj5RopQIC2X2tanFU53q5RLfNgH42M1Z
         hbGZK9CVT70wNeLY4ooxNp/6dPVs302UrfeXkgc6u6Gf3haEKbXrTWdKuztL3BOvEBk5
         nQwv6jMrjZOYYK3a1b3yxPYW81+6mgfDKPbTzJvyPMnaBhodje+kxTd5iGDBqpNf55ms
         08lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869127; x=1752473927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVzSDkejmNCMt9uxf52gBe1nAejDHptLtY79UxbACuo=;
        b=bYGQVsuQqnNjh0j5/HIYpmcS329Vufv+KPgCFMNigqEzvAWPvtBE/gqjwVbMY9SYm3
         kfrtrl/c/2aiONwXbFlB9U2SI4O+zbIiCF4fLc37KGfcVr2TzGHipsApCW86gsp/lqgN
         B6TMF+gsvxvEiegMufC0JiP2iUuA4YaPA8sRHkZd7uW1bdtVHESxbEP06mb9rAqRDhQa
         xE5NIjJOboasYV8ylMl3LROtFMlpYVt2k6bZJNGlbTyji3ZnZcDglxNpjgFZmgpFL+Fb
         bKUZLfKsMYAynJeQIGjBBoTn2du/WA4adUBlJ3WJE4YWuuzhw4lz1Bbgz3IenJiXfBoH
         wPUA==
X-Gm-Message-State: AOJu0YygaSF/nYnjaQlkVfiqI7PEchprco/AzUEXuCVL9Z+Wbh7J21ua
	lB3wC+c3B7g0tfw1aURuCJ6fPSsxEgWVcYVJe4xmNLH6Znv5CsFRaHMEv4jFaQleGvc=
X-Gm-Gg: ASbGncvFcnewrudmpEc35ADohj2nGlvJNqNg5nZ33swz51mtR0RTyuiedOtp7fUgYR3
	AJjjvEcy7mNLWHDA93rnnEudaXC9QnJLZ4xXtha3HyxdFqd8NeSXvrwRNMtWqn52aTGv17NvKjg
	5yECR2WI60u5iiiOrakPBqemZePVOmGCpei8TN87K5DJJ89QvqNeEU0B8aPMfTFPLLwp6QHpHOc
	rHurQbhWDEhpXTo1mPhlJJ4zT4cc8cH63CbxkaZDDPgnUiC5cVYhqpTM29gvD9LhRPQ5xmDghEN
	KPBBoZoyPQFfA4V4WqMWVb6WrOfM+Os5YtpdIuTJnHvXx+7nZOLASM56lEo=
X-Google-Smtp-Source: AGHT+IGzqPXpZJXAcvMLx/LftEWjyJz7Ld737/vkTct82R96OQw0jXA+eQD2NuVkKdjjAgaWipesHQ==
X-Received: by 2002:a05:6a21:6d98:b0:220:3252:bb7b with SMTP id adf61e73a8af0-22720fc508bmr11668955637.31.1751869126612;
        Sun, 06 Jul 2025 23:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:46 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:01 +0800
Subject: [PATCH v12 06/12] drm/msm/dpu: handle pipes as array
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-6-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=18175;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=62ZTReWl6OjScp6LnOzsAv+T3uHAVV5/XzEC+wHKmS4=;
 b=0qb8upRwKzcryiHjsrb037mrX1JllITNcRNH7S/AhsjB4FXOA4UJlCH+KrIBRC/7wSxuk/RNZ
 IpDKK9HKfhxAp6tV9pFDS/3ZiQ6dZXk49hMfyE5rJ3leL0E7XFklui9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 pipes in a drm plane at most currently, while 4 pipes are
required for quad-pipe case. Generalize the handling to pipe pair and
ease handling to another pipe pair later. Store pipes in array with
removing dedicated r_pipe.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  39 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 181 +++++++++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +-
 3 files changed, 121 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cd0ec3edfe2fa8132e114bc1544c389141d1c1ec..121bd0d304b308bcd7226784eda14d7c7f5a46f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -449,7 +449,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	u32 lm_idx;
+	u32 lm_idx, i;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 	DECLARE_BITMAP(active_pipes, SSPP_MAX);
@@ -472,22 +472,17 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, active_fetch);
-		set_bit(pstate->pipe.sspp->idx, active_pipes);
-		_dpu_crtc_blend_setup_pipe(crtc, plane,
-					   mixer, cstate->num_mixers,
-					   pstate->stage,
-					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
-
-		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
-			set_bit(pstate->r_pipe.sspp->idx, active_pipes);
+
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			if (!pstate->pipe[i].sspp)
+				continue;
+			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
+			set_bit(pstate->pipe[i].sspp->idx, active_pipes);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
 						   format, fb ? fb->modifier : 0,
-						   &pstate->r_pipe, 1, stage_cfg);
+						   &pstate->pipe[i], i, stage_cfg);
 		}
 
 		/* blend config update */
@@ -1667,15 +1662,15 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tsspp[0]:%s\n",
-			   pstate->pipe.sspp->cap->name);
-		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
-			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
-		if (pstate->r_pipe.sspp) {
-			seq_printf(s, "\tsspp[1]:%s\n",
-				   pstate->r_pipe.sspp->cap->name);
-			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
-				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			if (!pstate->pipe[i].sspp)
+				continue;
+			seq_printf(s, "\tsspp[%d]:%s\n",
+				   i, pstate->pipe[i].sspp->cap->name);
+			seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
+				   i, pstate->pipe[i].multirect_mode,
+				   pstate->pipe[i].multirect_index);
 		}
 
 		seq_puts(s, "\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..6263d74e5cfa7acd5b4e2156b73b6fa26f5ddd77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -620,6 +620,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
+	int i;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -633,12 +634,13 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
-				   fill_color, fmt);
-
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe[i].sspp)
+			continue;
+		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
+					   &pstate->pipe_cfg[i].dst_rect,
 					   fill_color, fmt);
+	}
 }
 
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
@@ -820,8 +822,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
 
@@ -846,6 +848,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
 	/* state->src is 16.16, src_rect is not */
 	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
@@ -958,10 +963,10 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
 	int ret = 0;
 
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
@@ -1016,15 +1021,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  const struct msm_format *fmt,
 					  uint32_t max_linewidth)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe;
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg;
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->r_pipe.sspp != NULL ||
+	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
@@ -1083,10 +1088,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
 	const struct drm_crtc_state *crtc_state = NULL;
 	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
@@ -1130,7 +1135,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		drm_atomic_get_old_plane_state(state, plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
 	struct drm_crtc_state *crtc_state;
-	int ret;
+	int ret, i;
 
 	if (IS_ERR(plane_state))
 		return PTR_ERR(plane_state);
@@ -1148,8 +1153,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		pstate->pipe.sspp = NULL;
-		pstate->r_pipe.sspp = NULL;
+		for (i = 0; i < PIPES_PER_STAGE; i++)
+			pstate->pipe[i].sspp = NULL;
 
 		return 0;
 	}
@@ -1187,6 +1192,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
+	int i;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1195,13 +1201,14 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	prev_adjacent_pstate = prev_adjacent_plane_state ?
 		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
-	pipe = &pstate->pipe;
-	r_pipe = &pstate->r_pipe;
-	pipe_cfg = &pstate->pipe_cfg;
-	r_pipe_cfg = &pstate->r_pipe_cfg;
 
-	pipe->sspp = NULL;
-	r_pipe->sspp = NULL;
+	pipe = &pstate->pipe[0];
+	r_pipe = &pstate->pipe[1];
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
+
+	for (i = 0; i < PIPES_PER_STAGE; i++)
+		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
 		return -EINVAL;
@@ -1312,6 +1319,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
+	int i;
 
 	if (!plane || !plane->state) {
 		DPU_ERROR("invalid plane\n");
@@ -1332,8 +1340,8 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		dpu_plane_flush_csc(pdpu, &pstate->pipe);
-		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
+		for (i = 0; i < PIPES_PER_STAGE; i++)
+			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
 	/* flag h/w flush complete */
@@ -1434,15 +1442,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct msm_format *fmt =
 		msm_framebuffer_format(fb);
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	int i;
 
 	pstate->pending = true;
 
@@ -1457,12 +1462,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
-	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
-				   drm_mode_vrefresh(&crtc->mode),
-				   &pstate->layout);
-
-	if (r_pipe->sspp) {
-		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
+	/* move the assignment here, to ease handling to another pairs later */
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe[i].sspp)
+			continue;
+		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
+					   &pstate->pipe_cfg[i], fmt,
 					   drm_mode_vrefresh(&crtc->mode),
 					   &pstate->layout);
 	}
@@ -1470,15 +1475,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	if (pstate->needs_qos_remap)
 		pstate->needs_qos_remap = false;
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
-						    &crtc->mode, pipe_cfg);
-
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
-
-	if (r_pipe->sspp) {
-		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+	pstate->plane_fetch_bw = 0;
+	pstate->plane_clk = 0;
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe[i].sspp)
+			continue;
+		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
+							     &crtc->mode, &pstate->pipe_cfg[i]);
 
-		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+		pstate->plane_clk = max(pstate->plane_clk,
+					_dpu_plane_calc_clk(&crtc->mode,
+							    &pstate->pipe_cfg[i]));
 	}
 }
 
@@ -1486,17 +1493,31 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe *pipe;
+	int i;
 
-	trace_dpu_plane_disable(DRMID(plane), false,
-				pstate->pipe.multirect_mode);
+	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+		pipe = &pstate->pipe[i];
+		if (!pipe->sspp)
+			continue;
 
-	if (r_pipe->sspp) {
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		trace_dpu_plane_disable(DRMID(plane), false,
+					pstate->pipe[i].multirect_mode);
 
-		if (r_pipe->sspp->ops.setup_multirect)
-			r_pipe->sspp->ops.setup_multirect(r_pipe);
+		if (!pipe->sspp)
+			continue;
+
+		if (i % PIPES_PER_STAGE == 0)
+			continue;
+
+		/*
+		 * clear multirect for the right pipe so that the SSPP
+		 * can be further reused in the solo mode
+		 */
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (pipe->sspp->ops.setup_multirect)
+			pipe->sspp->ops.setup_multirect(pipe);
 	}
 
 	pstate->pending = true;
@@ -1591,31 +1612,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	const struct dpu_sw_pipe *pipe = &pstate->pipe;
-	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	const struct dpu_sw_pipe *pipe;
+	const struct dpu_sw_pipe_cfg *pipe_cfg;
+	int i;
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	if (pipe->sspp) {
-		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-		drm_printf(p, "\tmultirect_mode[0]=%s\n",
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe = &pstate->pipe[i];
+		if (!pipe->sspp)
+			continue;
+		pipe_cfg = &pstate->pipe_cfg[i];
+		drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[%d]=%s\n", i,
 			   dpu_get_multirect_mode(pipe->multirect_mode));
-		drm_printf(p, "\tmultirect_index[0]=%s\n",
+		drm_printf(p, "\tmultirect_index[%d]=%s\n", i,
 			   dpu_get_multirect_index(pipe->multirect_index));
-		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
-	}
-
-	if (r_pipe->sspp) {
-		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
-		drm_printf(p, "\tmultirect_mode[1]=%s\n",
-			   dpu_get_multirect_mode(r_pipe->multirect_mode));
-		drm_printf(p, "\tmultirect_index[1]=%s\n",
-			   dpu_get_multirect_index(r_pipe->multirect_index));
-		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
-		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
+		drm_printf(p, "\tsrc[%d]=" DRM_RECT_FMT "\n", i,
+			   DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i,
+			   DRM_RECT_ARG(&pipe_cfg->dst_rect));
 	}
 }
 
@@ -1653,14 +1669,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	int i;
 
 	if (!pdpu->is_rt_pipe)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe[i].sspp)
+			continue;
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
+	}
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index a3a6e9028333052cbaa92830c68e2315c664c239..007f044499b99ac9c2e4b58e98e6add013a986de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -17,10 +17,8 @@
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
- * @pipe:	software pipe description
- * @r_pipe:	software pipe description of the second pipe
- * @pipe_cfg:	software pipe configuration
- * @r_pipe_cfg:	software pipe configuration for the second pipe
+ * @pipe:	software pipe description array
+ * @pipe_cfg:	software pipe configuration array
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -33,10 +31,8 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct dpu_sw_pipe pipe;
-	struct dpu_sw_pipe r_pipe;
-	struct dpu_sw_pipe_cfg pipe_cfg;
-	struct dpu_sw_pipe_cfg r_pipe_cfg;
+	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1


