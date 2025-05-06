Return-Path: <linux-arm-msm+bounces-56980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC0AACA13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8E15258C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F29A284B35;
	Tue,  6 May 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFKIPrhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021A283FE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546562; cv=none; b=fF5PJwqHuQOy3rBVnfwfyCBw25OAHP/fZYb+eRxz6KqKNykU/pgIFRKqniMzqnZ+KGkk6UBzXBFkLb/sI12cpBZTdszhoyhYj9Ei3tGdzYhiYeVYlr7lWuMqhdS9Q7du0qDVcLJ1BkJrdBatt7Miqe0aYCuJoj+KEkx29AwU3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546562; c=relaxed/simple;
	bh=2mKqRS34Z84UH7CQAO59n/IZlDeuxLXIr1MCB9xV8r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlWPL2tXhQGyJ5yLNkKXXpLJktmksoPaBxfOdVQpuVg0Plq+EUPS7xORh1i6qIpP5HaFlhw4VA2yR9NQw81UG8g0P359bfaGzPgHmCFAuyVsbR3+kg1oq+48MTh6fuZ0nQck3a3wBU7S41TdLzt/DGBrhzztcXYjcJ3vilc7Zv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFKIPrhZ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30a8c929220so863606a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546559; x=1747151359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4adXkuA0Ut1yoGju9UZ6d3zlzbJKQf/iksrtQL/Cz4=;
        b=rFKIPrhZl6dmnC/WQmrnbIxjOkUI5+pVFAgEhY4oCwdCAI5i8vH328mrnfkNFlcdJF
         A2JR5KMOFYVisRfgqdJkRxlXk9ofi9O3OtGos+vnbLeViv3ZqC1KhTmm/B7QB6y/2a+X
         0fRYORtofameHpNr9Gg12v4vWqQ4wGmx9Xyq9UrnxgeqlGNiO4pez6DWWAjKcflaqOZV
         XflH2GAOd4UglZCZ9XZeN2KFO1YDRKNuwFYBbMn/Qi787xlDP+npxrLRIUhBlGTsvdbo
         DYHNqmVPC11+VPnCxzLAiZsz00PaFpqMT+8Vdit5EQ32KJjac0ZlPMsmDi3d/1q7XNI/
         Q9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546559; x=1747151359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4adXkuA0Ut1yoGju9UZ6d3zlzbJKQf/iksrtQL/Cz4=;
        b=pIbAYjVmTYeBcrUMBHLC6+pPUxBpMLcoJNdW15UEIgfK1Ocu8ko7iJj7kBUBQE6sNO
         M016NtFlWmbdoICE+rgNqDCy/O89ZBhEuRD4El4Z3RfdN7ShMEt/0jkyJ6BR/FfxmFrc
         /e4k5J3VV2Swkm/ySLUR2LudT8q7sCXPgi2MSp5wZCeRDfQAtzKrdfOAscEkEc4qf5hI
         Ag6sEEJarzLY5aOGr+AssYIliTBHAtck0kLm4Q/p9sbFMiyttMduV0SrUqGZur0fAt3v
         GHeTM2NTuVBrF5ySlalAIWiqz6a++Xbl0f3FhMA7aLCTxGxiWebhm9KqV5Ay4jyFziM4
         vXVQ==
X-Gm-Message-State: AOJu0YyjgYuN8nsxCe9fSg9zUT+tptMGxMy1ZZkkGERfRALRiV/Skazz
	F06DpfZsM1l4sEb8uMriKZg33Rxz+0zaaeRixoM8pexdiHn3RzV/2mY7z8cDwQqyWN9RUY8rk8R
	MqFtPHg==
X-Gm-Gg: ASbGnctx0/GC5YBVxPOopmIl4eTBOUNY2hxW3ca3T1PBOkdNSGssh2XJI3Yf/hVubMZ
	JXXtp/3u3Vrdq/zDYQZdt/7IhKYpPna+9SUXbu6BeA/d5kGft6cBn738h38kzMibZ6Yk+WMYEmP
	ShZBNdjm0I58NHHSIMOAwjDiwBkam3zeRaJx8zHh3+Nk6nNvJKu6igzzsjym/GCB7PhO8UHBc6a
	duosMVVjmPTmirsj+k4NmTKmGZeTV+qQWEn2vogtmh1j874BBsDn+gv7qk3KHWSB2Gf8mSisZnF
	TPKktDmOZxIu1Em53Frw0Ogh8xTYTwTC5vt22w==
X-Google-Smtp-Source: AGHT+IFzsDNJefDFD1dPV6NizI/CiNwMisjKagajmP84vghYxSNrs3kBlttCjBT8EkKabBGKqjyB6g==
X-Received: by 2002:a17:90b:2f10:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-30a6197d927mr17191166a91.13.1746546559235;
        Tue, 06 May 2025 08:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:42 +0800
Subject: [PATCH v9 12/14] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-12-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=4243;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2mKqRS34Z84UH7CQAO59n/IZlDeuxLXIr1MCB9xV8r0=;
 b=0SPMajJzrRWad99g1YRN0moRSfl4vZYh0dg2S/muHYhxTVT9WoMSc+kI8XigzmmnNnPMy00Oa
 COT8yBYUlUnBnmFBGlNKKqEufLkFcHSCK6g1NhYPHll7bdujEQS2P41
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 68 +++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ea7e3fdf52f726737941ad33218a843dca17280b..de3f52d743e1d1f11ae8721a316b9872d4139069 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1136,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
+			struct dpu_sw_pipe *r_pipe;
+			struct dpu_sw_pipe_cfg *r_pipe_cfg;
+
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
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


