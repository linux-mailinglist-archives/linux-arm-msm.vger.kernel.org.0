Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073CA79F9CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbjINFHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234443AbjINFHW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22BE98
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bfc8c02e82so3897121fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668036; x=1695272836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ng3rBeSQ/W+G7uWpNI7jELlTn6jgRfXd01MrnHQQlow=;
        b=MG7h6rPVTR/yx+mT3qiSNsvCI3zrLfMUlSdib21nZ90BBMRcsbcTmizgg2D1IeGSNe
         P9p7K8qcRglPhEIM0N9lPQSSvYyKhJ3vLAB/Utc+vs3FfVq+lFZvyLUZV7nEKN/uf2KZ
         QL5YNEpbw74lfE/aFTYz6WmnWXyAvFnW73XqJ7SdO+cxegR5MS0TuzqAyY+CFb8QDvBT
         C/RYAdQtI7HYdRgeMGXkE/GnuzSMJiaZuIdD7E1X4y/1VgSsOTT+ZiebXgPnh2qebNvs
         ICNp3fXQJ3NbXkGS1mO6wMMLZGUnOxseKUSMgI6H89GIHM0nps7MUDJQfWNkk1KBVW8S
         T2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668036; x=1695272836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng3rBeSQ/W+G7uWpNI7jELlTn6jgRfXd01MrnHQQlow=;
        b=XcLae1t18F97BA40a5GWk03NKftIm475GGojwaatW6S9MhqiTZvgsU1dhQIUHUDU/V
         uciwmi/g7TXwdi0hAlNSE4QmGS6jboh/LJdwRNAu2Syqgt7e8BoZa32U1tYMmyO20NZD
         Yv4ebhqo69iH1rBzKP9mBhBQQQHiS2b9iXqflQGii6uw/KPYUEJKG/jKotZYzgJji0cg
         ydsRG0cvk4bBnZEMXA7Dbt8qOBDcbIJjNklenDqI5IHSJXdnkXumIszIB6N9FicKCxk8
         ACeWob3c8VA9EQRhcwPDbkUojENB2K/nZW4VlXBO8ggu01tuD5tblIHCoNC2QnlWQ/+r
         AVvg==
X-Gm-Message-State: AOJu0Yzxl5SJvPYOG0R9Ge2SNeIhu+RqGkJguFo3WLxPyblL8oEw2aC+
        ckSsMMk1LEUqcJq1stkUldBZaA==
X-Google-Smtp-Source: AGHT+IGaNLvdD/ESWuuLXBV0BWRXSIv6/PYuDxqDQWUJCk5sLLdobUXlj3d01Q6c3DqHwTqQgtqoyg==
X-Received: by 2002:a05:651c:451:b0:2bc:b8f5:aaf1 with SMTP id g17-20020a05651c045100b002bcb8f5aaf1mr3724104ljg.35.1694668036226;
        Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 11/12] drm/msm/dpu: allow sharing of blending stages
Date:   Thu, 14 Sep 2023 08:07:05 +0300
Message-Id: <20230914050706.1058620-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
index df4c2e503fa5..4b5b2b7ed494 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -456,6 +456,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
+	unsigned int stage_indices[DPU_STAGE_MAX] = {};
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
@@ -480,7 +481,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
 					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
+					   &pstate->pipe,
+					   stage_indices[pstate->stage]++,
+					   stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
@@ -488,7 +491,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
index 61afd1cf033d..e7a157feab22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -809,13 +809,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-		return -EINVAL;
-	}
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -952,6 +945,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
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
 
@@ -1054,6 +1059,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1189,6 +1201,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
+	if (prev_pstate)
+		pstate->stage = prev_pstate->stage + 1;
+	else
+		pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
 		if (!prev_pstate ||
 		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
@@ -1235,6 +1252,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 		}
 	}
 
+	if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	return dpu_plane_atomic_check_pipes(plane, state);
 }
 
-- 
2.39.2

