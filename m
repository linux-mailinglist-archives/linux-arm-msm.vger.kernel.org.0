Return-Path: <linux-arm-msm+bounces-42759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 546929F7658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8CA7A4941
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1321A445;
	Thu, 19 Dec 2024 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9GniXtQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED178217672
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594667; cv=none; b=jJQWQbBJu+SeF7d9PDrsQ6xYLXJw6OKEEbp5bUVdEjDtcUNAKdjAJctiaJpqFsJFR1O7GwpkMiPvGgkdmydKwhRAGBqfM3JkxZwgEwn7ngRMIbWLZ5yatWNiAP7zg34cAlB7KUCmePsEb/+TqtACehPNugwCSW0R0FPVr8cj8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594667; c=relaxed/simple;
	bh=tA3alNV9otTl28ZQS8OwFjLP2xaRsfRU08APLwodDys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSzkhFttE+DU4lJ7Puako/yKP/wmpiTK3d0rhdkx9Z1taDN1B+M7V9k56SJlW2bsrK65/3MsBHnmkFaE1/o0J6hDrjGKusk5g5L0KOmzxntrFAp0Iqq906Y3/dvsGYGj6mEwTuX3VonJG+hIta5idaLMu6PCAfweosdUM6EgMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9GniXtQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21680814d42so4642865ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594664; x=1735199464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgvnOTs2uY1dsly9HgOib3tl/7lDapvkf4uxsPWHol0=;
        b=A9GniXtQQ5Juzi9gDqXQqv2xvm8FhKhV92ac5gsLv6lxg+gp20jukqmUKk2tbzM91E
         Sp8aitX00cYivxWUw0Ll+stM7Q3Nq4zFK5eb8bla94v1MqCnDq2DXLymUWT0tRr3nSsF
         zlY3FyIxogWFboNe7YBMOrFA/YmSSHvh3E2JBYOvtz0Qplet3APlBugLshwzPpsUYctI
         qFs3llrMRjptn8LH5nm0yFtBvIRG4TfKDPEZ3y5upIsbfqaX48uhEgBOGVGz7mljAuxA
         0baj8Iw9w5BaonkLaRTz9/ATymPEAM038djUqyEMAbVspFRliFvPerAIU04Fa1bRrBBq
         a0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594664; x=1735199464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgvnOTs2uY1dsly9HgOib3tl/7lDapvkf4uxsPWHol0=;
        b=EuMXMJLvkSjdYNJwQ8uH5jpq1CdGe4GvNGe3nL+NBOT8S0obfjeVOvQAdEDPSXPtiA
         XpZ0HipBjQi/WbmOfyS0nQt49CujnbzWaK00C53RzKoS7yPyh4Ob5cz60WHe/SQvN7Q6
         igNBwXL+wbdLe3JiuND9iDYv0pq6od91Hr2uHP7UwkuqGeTVZmm4GNgXdcbjhawUSnJr
         OrsH+7IXAGn74neC0vMEHZ4y7K4JBVJAUl91ALkH/KeSRS6tgxLKNgkxdKLMaK08CSv6
         dD3Vt2IZcjjHN/uN0AwYCV9DXBbx/ySmUdYOPu8js3WcNY+MucV/S1dFs4AvOStZPr7x
         88MQ==
X-Gm-Message-State: AOJu0Yy4ZxFIRfrY0sBDx0NbSE35aEYHKSrYB2T0n9ZA3NcQ5ge05tG9
	cs6Yh76z5MHhguvKmBeJzzLgGMBmrAiATYPgbemPOsPESBzO0VYkJLce9BxyzI/LeNM04lmg9m5
	desFEMA==
X-Gm-Gg: ASbGncsQy+HhHV19UKJ6h5xLQEVfm/5Gb8REn5BV+Qupd5TXqEetp5UQhF05/Q6NmPQ
	9kUpCqNKF/SAc7oyrq6cTBKIfmEhho+X0tniW0dWsThIRGM/BCvixl9C1+Z4O+wd15DS3qcXeYt
	976MUOKk07CXdJSvNu2Trpy6zgSP//Df81hA5OyRRqqh6EXx8Py4HQAU2yGj+zj35rsKzeRf6ff
	qEZxCoBIpRnEifcqCVfxmnaU29pe6x3kONq2sq43ERLNZ9DXrwrsQ==
X-Google-Smtp-Source: AGHT+IGwaAxcVSn4iX1XZOIX8Wg+snyJY0Kv6ikKPptCVVAmPgXHQ4NSJbP4uqVO2uhW3137qBScNw==
X-Received: by 2002:a17:902:e5c1:b0:216:5b8b:9062 with SMTP id d9443c01a7336-218d726cd69mr84265435ad.54.1734594663939;
        Wed, 18 Dec 2024 23:51:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:51:03 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:32 +0800
Subject: [PATCH v3 14/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=4031;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=tA3alNV9otTl28ZQS8OwFjLP2xaRsfRU08APLwodDys=;
 b=E7WIJ2rZG+R3RNiWLgSS7yjJEJ5MHTpRWMKhf43PADnxUFgiPrrcgzCtHR5I67K90C0yTqiER
 GBEgH4QJZApBXDJ6YlXZWb0DFe69Iolhya8bCW7D3hDvn2JNRgXvL07
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support SSPP assignment for quad-pipe case with unified method.
The first 2 pipes can share a set of mixer config and enable
multi-rect mode if condition is met. It is also the case for
the later 2 pipes.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 67 ++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1cd98892898a4..57ccb73c45683 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1163,12 +1163,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1176,12 +1173,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	/* TODO: loop below code for another pair later */
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1195,24 +1186,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
+			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
+			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
+			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			if (!pipe_cfg->valid)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    r_pipe_cfg->valid &&
+			    !dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1


