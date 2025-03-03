Return-Path: <linux-arm-msm+bounces-50024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FAA4C4BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56BF3AC6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A942153C4;
	Mon,  3 Mar 2025 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5BXHI/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF152153CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014969; cv=none; b=KEQdrydK3QHeErqZj3deDYNDszXfwAyFjN980Dlp8jFcgdV0wNsF9yhrYpF3uVzibeUam98vvTi7bZC80MdNu6rEx4HC2vXoQ2BpuLsgHKA5qIQLpHQrinOzChs5PSR8i5BawCsieT5M4+hTjwaaw5Fs2+lpXBKDzChTxA3bTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014969; c=relaxed/simple;
	bh=RyXdfAHci9qpAGI2mxL80K7UTz9IP7S2BGiXmudLDyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ei/+RaQ4vcAVNiN4LNvspiy3h8uz4DPeRjsnbK35PTKH2vYIBOKubIrUqLQB3infNsaOq2DL5u1ryqKpdwo2pMseYEDmy28K4UxMB9eByvh/q7O6e/FbTzm64p4odK+30nWGKwF7PsDfCzMl9mBlPK7WvubkagneeAgwh7mSzU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5BXHI/n; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223594b3c6dso77262575ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014966; x=1741619766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91OyOUTlEzwdEqbt1ybTTwWzdXSJXvJM7iArj/Spgts=;
        b=s5BXHI/nGsb4Xrfzri/jrnSKWbXaQOaZU72UHL/OVhMqc0wB/aLdxVAQ8JPi+ULfmY
         NRBQIN3fjfxZ6357+lSJtSPZgVThG9LlIKxMYHh6+hHt5FjRcmVlzM5DkdfL1bVT3N2Y
         e+VPBpR78xv96khoR342kUpurPnfUZLe4N6d/wNjfqWjRDBC2M5iyg0bvHwbmkgYF73G
         pTlhRj1n3+91xHKuPkH82E1sqPMoLnkspJDToze9wdM2N91OIU2BCTduKmipx31sGg0j
         jfwWPxvRXcinlvgnimv3WXNM8rFM5JAxqkihP5SWrW29YXi/2M1BFcBZC5n2o2CUbq1V
         3EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014966; x=1741619766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91OyOUTlEzwdEqbt1ybTTwWzdXSJXvJM7iArj/Spgts=;
        b=t37J1e6DyQ/SaJUyCwg6fLh/okccH5p7w5YslQ0SFLjz9ut6fJRcXF66VQAQvkjqAa
         8206EVFs1o+UiyagJUGQgrk5movXK1ngZ4lMXmrnC2BEdLVFYpdDfDN5cF4dpucVkfxZ
         waT6uz5fD9y1kkEgHjtnThsA57oy5UOuNjsw2+yHB249NP/oR3O5C7PpxVrYU6UicWM6
         Cl61nKyVJA/vcxTeKl4BrZvR1s89kuGLeYdW6KvHcMvXzlT9dKf7oonijdrQ9HUqv+xR
         TWl+P4j2n5JxPkcSKZjFwWbX6TR59ftgCm/1gz12+eiZ7A9hYLdoQC80ibgMnpbvXbWW
         /zbA==
X-Gm-Message-State: AOJu0YxiRUUez2QOPGEKaW4+z28UNi/M9eRRPrrEASdRWUClku3B+tXn
	j1s2jTiUA8iHQOdlgCi+aY06/tcin4w5XrB2+7wzclSMlPyOU2nEiyN3Sl1VxYAlonwne3t5RV7
	dmgKPfA==
X-Gm-Gg: ASbGncu5z9rCWuag1fWW6FmeRWSd6H3OAz9uzpTC3pkgjcpWStSBCIZ71HhsjOH1gBl
	WLj5oAoqt8ZW1FX6VM3kQFO7zaE5C+Q1A9JinRAzJqidcA0cgl+8Zaz5WIy7hWnktjjQ6V5/5aK
	N+jZaFx2+Cn1nODS6IRgeUt2d9eVcxM5JzCHo+uM9qJ1CWDIqPbofBah9hRssnyMUdcyYdWJK1N
	slPtmxG/42VCx+bN64fXO+EGJYvfZmxyGW0zvSELuOkPltg2xBGwU/vR8tULA68M2rjadvcsS0D
	FBW3zdJEmcZoeQfw+wCizlUdS18xYVBTCMgrdr6Z8g==
X-Google-Smtp-Source: AGHT+IFsNXBeqeLeXKZs2DY2HFLbNclCtNQOF0r38ln6WRDnkLhhDFLabsF9tCSBeetsnjIFIZlrNw==
X-Received: by 2002:a17:903:290:b0:21f:9107:fca3 with SMTP id d9443c01a7336-22368fcd4e7mr215461515ad.30.1741014965931;
        Mon, 03 Mar 2025 07:16:05 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:16:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:40 +0800
Subject: [PATCH v8 11/15] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-11-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=5500;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=RyXdfAHci9qpAGI2mxL80K7UTz9IP7S2BGiXmudLDyE=;
 b=GRguKlrmc6ssErCq8ZgppJgKJHEDUSduX/8fU6agDryb2EM2tBWZAazrOgFkuYgX1adNXH5Ui
 TWIXkcfC/f1C7AYB0NFnazKrLztGqFtN/3mPtF1NYxN5oe2C50of4mi
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 193818b02197d0737c86de7765d98732fa914e8e..81474823e6799132db71c9712046d359e3535d90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ba7bb05efe9b8cac01a908e53121117e130f91ec..74bf3ab9d6cfb8152b32d89a6c66e4d92d5cee1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ef44af5ab681c8f526333fa92531a2225983aa09..1095727d1d9f17407f2b063039bf2efd8733ec70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
@@ -1078,7 +1078,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1129,7 +1129,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1241,7 +1241,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1364,7 +1364,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1378,7 +1378,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1397,7 +1397,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1519,7 +1519,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 052fd046e8463855b16b30389c2efc67c0c15281..18ff5ec2603ed63ce45f530ced3407d3b70c737b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -33,8 +33,8 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1


