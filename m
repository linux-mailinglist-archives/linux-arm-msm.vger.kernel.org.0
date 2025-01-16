Return-Path: <linux-arm-msm+bounces-45205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31DA133DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25DE01881B67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7141D90C5;
	Thu, 16 Jan 2025 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pE1rtfep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C31D8E07
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012440; cv=none; b=SzU0jxCjyXWXP6mVhqsyaudizMymrPKZbVeaGWdgrAevjntXSaoHMJn/kHhGokt5ppX5NXi2CAPns44K83PiLXWIilh59YJiDli0UWC+ORZekxOPJh/fJGKbT1n9qZ8Bw9glGALF4Y1I6VYjvI1CrjcUeSc+XfDf+ouYspQ29aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012440; c=relaxed/simple;
	bh=hpYCe/XCVtb0UQP8TQNXQlAWg4QOmZoJfeMu08ZyRfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qS9qRw3zVWzZn5Uj4MJeWTrlXT6MPQbu2k2UX5zvceE6CHCnWTPWmDFX0hqlxygU+tLYmUSclDarups29W7M7N3Cx+jl6favZ3Hiz7YtBKXPjxoQudVSxLnElcbTEb+Dl5KiiBRKS7OGJ6UCC07TI6fx8Sa2g/NUcv4aKwSdRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pE1rtfep; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165448243fso12663865ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012437; x=1737617237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R52t6o9dorLPhQ4jVc23FJiIOdmbh5mYyXpgiwIVuMQ=;
        b=pE1rtfepDEaECucmrRlKpapYjx5ZClYczwAT2RWmUPUsGAHDSb/sxxVYTjvKRN1tFE
         2vb9Y5dhkvBmwAXNnoerLltO/FoHPADhI0vjpPGOHNVrBPvG67WorjRyuQbkvsqK/7mD
         Aw090sCEbsmlyNcxImfS/MwXJGLLhkicagRq6U/3oBCCJWZ39RT6sn0M3TsiI0ja+iW0
         NmNViEoR5OijNGqU58sxYh/Vx3ZuXqm+XMo14oyt2GuiSAliYRQW1FSMijmHZpuPGMK1
         Qwc5eHuw0LCPdYDrFpCe0vW9xtFwntf18wpoWNsVjhdu8lmSbEn3BQE0XvmK8j8glalJ
         m/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012437; x=1737617237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R52t6o9dorLPhQ4jVc23FJiIOdmbh5mYyXpgiwIVuMQ=;
        b=crr3dre7Yk473BZ36RyUSVrJkaQkOhOxtDAXxofR2DAqyOTv47HCo9Kr0l/+EyqLps
         01Fr0tSM33jSOxDEXVqTVciyEjgtzJNNwPqvkEY7J7Lzs34DxeyPz3G8gKnfP/MlFyEn
         FlHPNGH0NTE266Mqeo8SZvyRl15kgZ35kLp8PghGtzNUhdiE/t4K4ARzowX1WvvD3X0L
         zjvQSmWT/ZZHP+4s8LC5EJBVgHSUnGdARYgKQECKjbR2cm9nGZrH/rHjXs1snlmH+CiX
         GbNbiWW2L/wDXnoRYkwdFL2sonnYrYBbR2p7PU2+avo3hPcbgDBIgLGMJACwn6vpeiJF
         EI8g==
X-Gm-Message-State: AOJu0YzPqtvDBsSpnomWGHYvZELOlyPv8W+0j4jlA52XHX3Hro0nf4jI
	lT4RLcUvMmpDCEHxMjJKbeepkfDIDeCaOKPzayIfcY5KKtARCKnrbellJ7EgFbc=
X-Gm-Gg: ASbGncvRddx+TB1O6qTRiPglpOP1WHrwntgJ4iTfpgyVj5yCE9eljHURwqI012fT55L
	boYsrtosJolG4I6LzUFQNXO5BoMJ/oIVRnYq/uX7v00odRaFJxpydLGiwYK3YoFtulMeSzFN1/0
	PCcac6Vc1qHDFsKIf+NUduZ5fe7gv1HYEI+BWC3b6H1arJGcyEnCmdt/ulifpVcqYdTwG9HahMn
	nE0/h0qUDlP7sBhPEM/r8iMt219DRdqBmh/5cqV45DFLgYbFRbfGw==
X-Google-Smtp-Source: AGHT+IF37HVepLl+4wLeS42BXWkdFxR9LXs0jbHR4iVTfuhb3PIgRRo0nb42NYuG16HFyWrzDKOXpg==
X-Received: by 2002:a05:6a21:6004:b0:1e1:bf3d:a18a with SMTP id adf61e73a8af0-1e88d361a65mr56998429637.32.1737012436650;
        Wed, 15 Jan 2025 23:27:16 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:27:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:00 +0800
Subject: [PATCH v4 11/16] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4966;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hpYCe/XCVtb0UQP8TQNXQlAWg4QOmZoJfeMu08ZyRfM=;
 b=tP2rNaeIYDLttAUrECK2rhfmFVhGz8f2XHWDnNZ2Asa0Z/RYtTbNM3mvRZ4gXQJY5SoRzaVR2
 UgldrMfj6SNCy9NOC8qzFlYkmMko/3+swUAR4+E/KXo9i4Wgq201fQr
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Split the PIPES_PER_STAGE definition per plane and mixer pair.
Currently, 2 pipes are supported for a plane at most. A stage struct
contains configuration for a mixer pair, so pipes per stage are
identical to pipes per plane in this case. More pipes will be required
for the quad-pipe case in the future, and pipes per stage will be
different from pipes per plane in this case. So pipes per plane is
split out as PIPES_PER_PLANE.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 14 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 193818b02197d..81474823e6799 100644
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
index ba7bb05efe9b8..5f010d36672cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1adbf91be850f..3795576e2eedd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
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
@@ -1516,7 +1516,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 052fd046e8463..18ff5ec2603ed 100644
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


