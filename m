Return-Path: <linux-arm-msm+bounces-29985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAEA9641CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858C328CF9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723381A3BC3;
	Thu, 29 Aug 2024 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X82kJWvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964418FDAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926926; cv=none; b=GEyB5N93g6qb4LmcfQaEOxFVoc/alTKVW1yYy0NQpSLHhY9EmzCP95aUHGuGAfahjHvZ9r5kzeZSXEIVnzCMlPG9zOa9z2b2QU92W6igyyii8T/NzwGEOLup1Db44PqsKAOv+6wbI8mTt7jJcaV+lSZ6nGDzWRGrMKLoaOgPHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926926; c=relaxed/simple;
	bh=nVktgxY+Y22iglpT7aElSF7x0cz/c6cqG4U2dR19+fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSWseSB5nCYDuin1GOuG437PBZbcHQPTz5t3Zv8gpY1kM0y6ReOQ4iJpgFyo3IyKCv4Y7dG31JEe631WDNxJBu7JXdtGIDvRbhnYukBXTzkCDutJjOBh6OI2p8JIBEeaSdZKT4WU56SEzySHpPbeQ0ZJ4NGdCdTvgV6lAdX2UIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X82kJWvu; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70b3b62025dso343735a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926924; x=1725531724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoL1g7/icKaoeTVszo+C7O0+4g1QDi21vNC01sKJZ+U=;
        b=X82kJWvuPlJxTlkCTJugXJBL4V6oMX7v2ZqIaASSXy+UIAWgeA4vDItL4HUoF7ffP+
         D1R1sGrqUwbZd9VLc0g4vh/7HouC0kKC1Nm+UbotHjQ1OGPvuMQ1CBHIlIGgvLOFLJkU
         iEc+s9aNqGP10H6gpom+t1PBEqKHZwj8AkA44kK8Qiifv+9AULp++3B0EA3D+kx0SrW3
         YGL3xlr1kh+hjWIT7U+ZDzN4d5j239N6Yf4FYRz3v6H+RRy4MohjRS5TjL3oK47QaaAB
         PF7Iewl1zlvZyzmiNqlw0AY3j9WdTxe4lbHeRikB6MBA3G+tCGnCiDLaNjnYNZ4GY/Dz
         VDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926924; x=1725531724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoL1g7/icKaoeTVszo+C7O0+4g1QDi21vNC01sKJZ+U=;
        b=AhNKuR6AcoaL9b+Q4jWcTwmZ+j/K2GX5E7OCOzO69R53+qcKq+9XAufuSw3lNXNPIv
         p+LlfNFZp2rSrjeW0JElc3j5pdtf2OaU8RmqepU/tCckAXyy9JUBrssJcoz7OU9LRGQx
         6cOWD79JxWNEo28KRqalRE8Z6BVN8TnoXHp2gCjjU/30aCVIuewm5IoEIBIrXnF6AEKQ
         /x5MBIDzEDfj9N41r7sWL7BaGrqM9Rri8AZ0AoCb8qxRqh+dyzijcgIcy4MJ7Gax1/YS
         fcADWhoPmx+LLSfKkBlohtYze3EngQHmLbWhzMiyyoZUHNG2pACxmDpX08gmsEzenx7n
         cqEw==
X-Gm-Message-State: AOJu0YzSwdrYP2Zq9abzFySWKyBIo+8r+Ajk8UDa8b8aNfhTujYzhAqx
	QNr5/Wmi+xUG3iu6Jo3VxC/iLLrmEZQBnZ9874IZu3EwzUVsyfrrahpbcswkBJk=
X-Google-Smtp-Source: AGHT+IGeTVY5NXa21IFreOo7cUd0AF9nsb1AdXB76rapR4PU7ulwY3JN4O81zXAJhD39YeE/gmu+nA==
X-Received: by 2002:a05:6358:3128:b0:1a6:7e01:e4f4 with SMTP id e5c5f4694b2df-1b603cce66emr313159955d.28.1724926923856;
        Thu, 29 Aug 2024 03:22:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:22:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:50 +0800
Subject: [PATCH 21/21] drm/msm/dpu: revise debug info to support quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-21-bdb05b4b5a2e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=3921;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=nVktgxY+Y22iglpT7aElSF7x0cz/c6cqG4U2dR19+fc=;
 b=ps+qzD7mgTydu3jMaADiSxfJjhNUZjxeZGWz5mhRkEH5L6u1lEgMUtgsZS8PogIIhHvYDdUCr
 5HJfsvYAO6ZCG37w8uuEos6cFcsZ8wmsgOcKJVAZ5ki84E6rwKZoQC7
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Unify debug info to support dual pipe and quad pipe

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 35 +++++++++++++------------------
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8fd56f8f2851f..9e8c5225c8dca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1437,15 +1437,13 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
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
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			if (!pstate->pipe_cfg[i].visible)
+				break;
+			seq_printf(s, "\tsspp[%d]:%s\n",
+					i, pstate->pipe[i].sspp->cap->name);
+			seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
+					i, pstate->pipe[i].multirect_mode, pstate->pipe[i].multirect_index);
 		}
 
 		seq_puts(s, "\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c3ea97b4ce439..12f7b510eb5e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1550,30 +1550,23 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
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
-		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-		drm_printf(p, "\tmultirect_index[0]=%s\n",
-			   dpu_get_multirect_index(pipe->multirect_index));
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
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe_cfg = &pstate->pipe_cfg[i];
+		pipe = &pstate->pipe[i];
+		if (pipe->sspp) {
+			drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
+			drm_printf(p, "\tmultirect_mode[%d]=%s\n", i, dpu_get_multirect_mode(pipe->multirect_mode));
+			drm_printf(p, "\tmultirect_index[%d]=%s\n",
+				   i, dpu_get_multirect_index(pipe->multirect_index));
+			drm_printf(p, "\tsrc[%d]=" DRM_RECT_FMT "\n", i, DRM_RECT_ARG(&pipe_cfg->src_rect));
+			drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i, DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		}
 	}
 }
 

-- 
2.34.1


