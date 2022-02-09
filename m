Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1F74AF834
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbiBIRZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbiBIRZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:37 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DF3C05CB89
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m18so5558799lfq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d78NmTZxF3lIUQQ6J9uVt2AAFNRK9vuPInuNHE0VCs0=;
        b=aoZs4GfhJHliytiNP7wiOnoc2GYXr7zygfHwEr0jTtiEM65wwLeJ3ffrqaIwpzQvv6
         ATD2MnpH7tSbb+r/HuStWNngK/yZITfqzAZ1RhHMKOlMlbfKgkZTbYbNok6sqbMa4UuM
         ZeIgURQX8FP/IEpxw+4Il0SxoCyZbCk1Pw2pREl4mwx0zyXU9cugP8MS8E23o+kXV7z0
         1e9wuD0ror8h9F766MpgWYq+y/UGYSNEwUf6S6dHUX7nxk3xqa/UfaMSF9Tay0mYmg8n
         DDBZf0Nj2Tp35F1qyRBIvxZojQ+cvlHcabNOKj0hiyi/ErBoE0SoFMs9gi+T8GGPxfa2
         HR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d78NmTZxF3lIUQQ6J9uVt2AAFNRK9vuPInuNHE0VCs0=;
        b=FgddrqInkSanwEhOfdS5r5dOOQivddIukhjTbDX7vFznv8rt5IY8pxxfT84kBbiN62
         95xmn4pSB/B1LrcMxKp1ZEnQQ2C31L746vh49c1z3pE73y4mT6nB1A+yIfVz0/ad+RSO
         xFpPaq9aYgDgup+DEGhY+N8ukKpSGEfD3WSg3sgB7zBXvWc6O/L2y7lF+Xv1u6FeGDzt
         Y689AIq1QXlRPra//hQvM0ffO8lp54c6Tzz2p7/rSyiDfPjL8ou5fGHF3Jc1Qq39YRDU
         5R+ZmmsMgtIDRNfmxRK1b61SjGS7SASMJbCh50ExUF/6xTtTTtwxRKvIChO3/RMyZuj7
         17UA==
X-Gm-Message-State: AOAM530NKXsI+wJRZPHAtloqKUVM3ML3KCbryLu5lUW29n4ZCL2BiGue
        B1UpToLOn/FCz+UeeTFGxMJ5oA==
X-Google-Smtp-Source: ABdhPJyzWBiuRvysqviEsBy95NOS3Mxq5bWOXWv8TWNHQM5cQoPHJHuFZRgeqN5ks3Umd6C7fKewvQ==
X-Received: by 2002:a19:7604:: with SMTP id c4mr2231111lff.65.1644427538802;
        Wed, 09 Feb 2022 09:25:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 18/25] drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
Date:   Wed,  9 Feb 2022 20:25:13 +0300
Message-Id: <20220209172520.3719906-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove plane checks/state updates from dpu_crtc_atomic_check(). The
belong to dpu_plane_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 44 -----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ----
 3 files changed, 10 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cbd0e50c2bd3..fa279f0358d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1054,14 +1054,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
 
-	const struct drm_plane_state *pstate;
-	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
-
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
@@ -1080,46 +1076,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 
-	crtc_rect.x2 = mode->hdisplay;
-	crtc_rect.y2 = mode->vdisplay;
-
-	 /* get plane state for all drm planes associated with crtc state */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
-		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
-
-		if (IS_ERR_OR_NULL(pstate)) {
-			rc = PTR_ERR(pstate);
-			DPU_ERROR("%s: failed to get plane%d state, %d\n",
-					dpu_crtc->name, plane->base.id, rc);
-			return rc;
-		}
-
-		dpu_plane_clear_multirect(pstate);
-
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
-			DPU_ERROR("invalid vertical/horizontal destination\n");
-			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
-				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
-				  DRM_RECT_ARG(&dst));
-			return -E2BIG;
-		}
-
-		z_pos = pstate->normalized_zpos;
-
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
-			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
-
-	}
-
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
 
 	rc = dpu_core_perf_crtc_check(crtc, crtc_state);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b2395f02f6d3..637d164667e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -702,14 +702,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	return 0;
 }
 
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
-{
-	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
-
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-}
-
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 {
 	struct dpu_plane_state *pstate[R_MAX];
@@ -931,6 +923,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= DPU_STAGE_MAX) {
+		DPU_ERROR("> %d plane stages assigned\n",
+				DPU_STAGE_MAX - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index b6fd6f856d6a..e61c57b045ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -83,12 +83,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
  */
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
 
-/**
- * dpu_plane_clear_multirect - clear multirect bits for the given pipe
- * @drm_state: Pointer to DRM plane state
- */
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
-
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
-- 
2.34.1

