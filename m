Return-Path: <linux-arm-msm+bounces-14062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D742887B5A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE53B22EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5278F55;
	Thu, 14 Mar 2024 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIeDXIFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860FB5CBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374553; cv=none; b=KlFzDIjYuOqiP7MesCZ1TJ9CB+0pCZzPdsymNp3bPEKPE4p9hpwPwL2Mc0zt/Amo3+Sbd6H7ZdGfocDC1pnUaoCal/DwjTMSIwrSaSYia3QTjpG9h8pDv+uSVWcq60dol5+ddzXEnZ5f6Uy85C+YuS8QhC/WsrI+M1oFiVC+9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374553; c=relaxed/simple;
	bh=nnnDM+qoR3qJPNpNVPRWSJgz922JczbdcF0MsCeaFAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H7EOWK7dJsZhTANOgijkP455yBscRRlgLz+aRr9hjjGJJ8IyJ6zKV//TyXU4Eee0TFIOin01aF6+K796T82jCHE+DXFjqYeNGxTxuSnYNPtAjgHFEt3eX2yta1UqB8jLv5dg0I9xkNlSnPDh5L32f5zN9+yGRj8GpcRN5o3BZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIeDXIFX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso611922e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374549; x=1710979349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NyH70gBQ0VtdOLbmQIMNFH5hau07nRJ94ccmDkurCw=;
        b=mIeDXIFXDge11BSk5QRl0YHxCeMz4xQcKrgb3rgRvzGwbP/HkXmWnU1I+ITKrTkte2
         owdcomt/l5Dpjxwuj++MBx+IlGs6uTNduxLEzjR0AriMxxq1yHejkWj5QGZmHqUjG+dL
         0yJM/iwFy/NSkABywIMEgFlZSzBt3H1T/YC3iC45skViSlXi6LdlE5yfWoy2yW7SXMUf
         opXV/CO/J/hP/AeRkT5ZS2L5Teb2p9QmvcyP5ZtsxdKvJbeyWrNusZuJqjJkKPb6flsi
         3Am19+6znsHGAfUiz6tqOYg8V1TKRc3ghZZzF1tQl4h+6x4UkPtGtdM2TX6vOTawadUh
         dtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374549; x=1710979349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NyH70gBQ0VtdOLbmQIMNFH5hau07nRJ94ccmDkurCw=;
        b=ijNwdi0AmZrLYB5UIXvZbuJk4CNZ0l1b1BD/8MX9Sky3C0p/gF4V/undAuNxN0Tz52
         1P4DY5BUzf2EZDSFdWxO9PGt0OXOLuBiUsxFqk5EfndaGuwb1DdFfGoCH8QwIclTcjhV
         Ma3UoyxQIwrfbpjjWvlJAdqw+VUp19MUNktRNQj2IRabJZeYJnKEEPPJ7kbOEWl7dmur
         oSyGCkcmwJQiPs3LT9/dJG4sjs7hzS+dv4d3WSMwSsS48dLUEoXK+L+OlBX3w8jctiyR
         78yjEG2L1yT5pd+3CK1B6jpNNYUR/LrPz32ftECbojjwhyjB4ZumQNC4EnyYzmY5c9VI
         eOeg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzuVbPcEnM/NwnWJikkCvErQuq/cBKctljKIJAgXfC2TalTm+8FVqB1N2P0y+fk1Zmn730rBeTmPwwqCkR7W1qXg/AJwlsbVj4/r2fw==
X-Gm-Message-State: AOJu0YyR7++TpatcpirE2czn2RkyT0c6FvddolXdCN2fVjFunCT8iG7I
	Kjc68e19R5r+TATS7KwLxjX70/pVDYtaike4ZGkpDXwZPFYcjmbQ9aZDzb0h4uQ=
X-Google-Smtp-Source: AGHT+IFA3Dx5ozpGCZSWbfbx6oCBjyOBUbhWSz/XnE08IlR2N2DP/AnfA6vuDd6fnf0H52M4mNbo3A==
X-Received: by 2002:a19:8c13:0:b0:513:c2e3:226e with SMTP id o19-20020a198c13000000b00513c2e3226emr57801lfd.8.1710374548954;
        Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 12/13] drm/msm/dpu: allow sharing of blending stages
Date: Thu, 14 Mar 2024 02:02:15 +0200
Message-Id: <20240314000216.392549-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible to slightly bend the limitations of the HW blender. If
two rectangles are contiguous (like two rectangles of a single plane)
they can be blended using a single LM blending stage, allowing one to
blend more planes via a single LM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 ++++++++++++++++++-----
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 794c5643584f..fbbd7f635d04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,6 +445,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
+	unsigned int stage_indices[DPU_STAGE_MAX] = {};
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
@@ -469,7 +470,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
 					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
+					   &pstate->pipe,
+					   stage_indices[pstate->stage]++,
+					   stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
@@ -477,7 +480,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
 						   format, fb ? fb->modifier : 0,
-						   &pstate->r_pipe, 1, stage_cfg);
+						   &pstate->r_pipe,
+						   stage_indices[pstate->stage]++,
+						   stage_cfg);
 		}
 
 		/* blend config update */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2e1c544efc4a..43dfe13eb298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -827,13 +827,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-		return -EINVAL;
-	}
-
 	/* state->src is 16.16, src_rect is not */
 	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
@@ -971,6 +964,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
 		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
 		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+		if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
+		    pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
+		    pipe_cfg->dst_rect.x1 == prev_pipe_cfg->dst_rect.x2) {
+			pstate->stage = prev_pstate->stage;
+		} else if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
+			   pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
+			   pipe_cfg->dst_rect.x2 == prev_pipe_cfg->dst_rect.x1) {
+			pstate->stage = prev_pstate->stage;
+			pipe->multirect_index = DPU_SSPP_RECT_0;
+			prev_pipe->multirect_index = DPU_SSPP_RECT_1;
+		}
+
 		return true;
 	}
 
@@ -1080,6 +1085,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
@@ -1221,6 +1233,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
+	if (prev_pstate)
+		pstate->stage = prev_pstate->stage + 1;
+	else
+		pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
 		if (!prev_pstate ||
 		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
@@ -1267,6 +1284,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 		}
 	}
 
+	if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
 }
 
-- 
2.39.2


