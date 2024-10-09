Return-Path: <linux-arm-msm+bounces-33644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F69963F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0F09B276A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05398190676;
	Wed,  9 Oct 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkGo6+wW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EF18F2E3
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463858; cv=none; b=FoFS7tbJJSOqTh0nOIxW9gUjxzBwOGtMm3PA1ob5GQQaebA954EpirDTmIat/8rSint22QxX3RX74GdeUAgSDoKJtd5+bD9xrufo47FZS2V+ZKPgouu289VQiSe8xu6O22gmRi0o5l2QEW+RhzLFrOhWtOWeZvqt3M8PdWOTB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463858; c=relaxed/simple;
	bh=ovrZzR71sqoQXwvbNAWE38q7w2iPdZWZ4+becN2ufi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkRQVN2J7mcA7T++SIGybx7k6YoguT2sW9ChoSMPUYbTswv4jS6E39WqLQszffElO/LamegX5BtxSfmteLxPHlzN5fR+kYN4S+E1WzYDwBzL9F0pViuwaWJ5FUSzR2rXl0Qx3plvgClFbknL/dsyDH7OoLJu9gVWDGJPuDh3jWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkGo6+wW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2916a92ffso1115490a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463856; x=1729068656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVj8AtzhXJ6vFkOcgklF/XoM8iIzrnBxQKfkQbnsapY=;
        b=LkGo6+wWcI1jWDK42mpCxJ9AyDTy2CA0X94fCq30wBD9lo1rd7o7+sknQ7QSS3YDsC
         L/yErZgoiK9P7otwUFdsScW8H/bAqkMFCgrJkKWtccMwjtKusJmkxN4wRrTWiAs4veyd
         MzTx2/BD8BDiaNi90JUzuphAJb4x1nZuIy6KSxdpGDcOOCQ/PuDZcXmp1QCjQFEwwdUn
         aNgGm70H+duXDmfbH1edG7+ZPVhhGmqC0d70xjyfdgo9lo7z6gDHIoQ/PjgZp5neUFPY
         EKiyWn/7nINKHRIKgN9RBoCK9U+cyY6bGKUHSpC4TtC5wIqZ3EBtt9FYmnBgWLM7FdEU
         S4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463856; x=1729068656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVj8AtzhXJ6vFkOcgklF/XoM8iIzrnBxQKfkQbnsapY=;
        b=mAbO8EkIZ/ZeR9uxC6E9Rm6G4MEMHTy3aP9ZpdUsdunCsVEtxMGlJfEWaXFs1W9jgf
         taOEYLmRmosJ8Jmnl4SLvGNUxa07JVYNBEWLMlGxtdPjwbY3Sa604bcl+JQQiIO+y0Ob
         gcsgdKpIce78I4h3zUZbcmEGtQZaD68ACe2EfiZeeaaZsGZwkT5kDXPjsM4R4r5hjvYk
         FDbDNbAxEYd3Utvx24RDuYe2cNW43EB8V/HTLezoShDqToCm4usj8B0H7UBsknGzqVgi
         g9wK3yXL3BWlGKUQlVHm3wwAoMpw0qhWiounLaqg+rZ4yhw0uPngShseKhLL+3z0r+EQ
         Az2w==
X-Gm-Message-State: AOJu0YzLo9FkJXgfAmAcTQ4ojc+H4zJ5EmjapwPur/2P+CC49iU623sT
	USHViX38wwrBsq69A4BZ51aqLOiCsfcPHShREixG9EVbkWh4eB9Sp1yOWHjz5Qc=
X-Google-Smtp-Source: AGHT+IEnEA+z9bRuIkWot3brQ2ilEwLd/yjDCjTrK0Iel1blGAiCM+EGqb8DDhJHM9w7m1IUfCusbw==
X-Received: by 2002:a17:90a:3f87:b0:2d9:dd4a:6a95 with SMTP id 98e67ed59e1d1-2e2a2525ff5mr2151987a91.25.1728463856505;
        Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:50:56 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:19 +0800
Subject: [PATCH v2 06/14] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-6-76d4f5d413bf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=6669;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ovrZzR71sqoQXwvbNAWE38q7w2iPdZWZ4+becN2ufi8=;
 b=ZM+3VwG25eltKqRvgmaKTxC2WylhQoCWcvNm0tMhI8u/6sa+5cYA1ch23F9Upi+dT/uH8cxvV
 Xh905twqT3zDZgwes1P+TA6CI7BFNj3W3PU6iL0pAQHFcYeH8sngfM8
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Split PIPES_PER_STAGE definition per plane and mixer pair. Because
there are more than 2 pipes in quad pipe case, while 2 pipes at most
per mixer pair.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9656b1df0f122..43d9817cd858f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 602dfad127c2a..2e38f4db00c1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -493,7 +493,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 
 	if (test_bit(DPU_MIXER_SOURCESPLIT,
 		&ctx->mixer_hw_caps->features))
-		pipes_per_stage = PIPES_PER_STAGE;
+		pipes_per_stage = PIPES_PER_LM_PAIR;
 	else
 		pipes_per_stage = 1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 557ec9a924f81..e6e169094462f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -28,9 +28,9 @@ struct dpu_hw_ctl;
  * @multirect_index: index of the rectangle of SSPP.
  */
 struct dpu_hw_stage_cfg {
-	enum dpu_sspp stage[DPU_STAGE_MAX][PIPES_PER_STAGE];
+	enum dpu_sspp stage[DPU_STAGE_MAX][PIPES_PER_LM_PAIR];
 	enum dpu_sspp_multirect_index multirect_index
-					[DPU_STAGE_MAX][PIPES_PER_STAGE];
+					[DPU_STAGE_MAX][PIPES_PER_LM_PAIR];
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224c..3277debe11689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,7 +32,8 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			2
+#define PIPES_PER_LM_PAIR		2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e7006fb8c7734..9a8fbeec2e1e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
 						   &pstate->pipe_cfg[i].dst_rect,
@@ -1075,7 +1075,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1128,7 +1128,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1256,7 +1256,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1386,7 +1386,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1400,7 +1400,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1419,7 +1419,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1534,7 +1534,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1591,7 +1591,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 39945e0d1b851..5c1b3775dce55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -32,8 +32,8 @@
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


