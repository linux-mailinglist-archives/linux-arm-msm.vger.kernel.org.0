Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65FF3B31F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhFXPAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbhFXPAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F936C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d25so8139429lji.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KCaAu4jnvmCU/Mq+LvdhaCaR+6bzwbaah2dceb8YTQg=;
        b=jBBk1j3oGnIGLCHfTVQaUkMQtQUYnnT81R3vgIRx7iKhJbZUEOPYWjFwPegOach714
         6ejdrzs2m5XwCDJc26GJz30+1MLcIEsIRX+4rj4yW1Q6GHUTZcvJjeoZScYkkWijKchu
         dfdm5HCIF8+r2JxOfp7gDvghhlNTaTiGqzxuR+5Dhw3RaZSbQVa0Tp91cZMr+Or1Cf2X
         Eiey30sC1V+xipRaM6rL/qUUdBwFxxe+/UaNahh8wHSMkUgorEjC77NvHjSg+SliMboa
         JfS7RIaZSAIHcSGSAWUjTHE4mPesOINdWubPm6ZKrGE4OoNC1Y9+dJyFKbIGEFILyOKG
         XFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KCaAu4jnvmCU/Mq+LvdhaCaR+6bzwbaah2dceb8YTQg=;
        b=N8U35022M56psKlxvx/FSKuciiuI7Z0iA52rR8yda8HdY3yBqnjItg1N9EMdqmdv4Y
         x2ctMoOgiGn9w6ouzUuxuXwNpVgUg1oelnxCD5D1JYUjt+yME4IbGrrBzjchTwTxuiyb
         nZ2m3Yf4XTf2sCyB7/qCYyfN2AJFGMQCBYycRXqYu94nMC0Gazb45Wm507z0KcCJOBmX
         Vz6dP5CZkFyepgFGWBDwaGRrACN59wLKnkEWNMizjTvN7q81/efpXYZtNU0QVISOpiIL
         MH0e4vd+QAW01SMtMC+Xin4tyHBz5u5OZDTuNbUvWNLME7tcEgIY4DfR3WIC0+4Bz4Mg
         ZKIQ==
X-Gm-Message-State: AOAM533JuXvmw+VF0lhRaOcrfy9fl3c9DVlkCuJvi0H1+TCdaNkytfPt
        U6PpOA0p7s/pV8ZQoT7wAamZNpvE8eLynw==
X-Google-Smtp-Source: ABdhPJykEt+bltLJ7/eY4GqDbp1VEPfP14F5Wyvjl6pwLNdeGoIbPIt//ZlLEzlxMkK8w0LcxKMxyg==
X-Received: by 2002:a2e:bc13:: with SMTP id b19mr4328707ljf.480.1624546666648;
        Thu, 24 Jun 2021 07:57:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 11/17] drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
Date:   Thu, 24 Jun 2021 17:57:27 +0300
Message-Id: <20210624145733.2561992-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Neither source split nor multirect are properly supported at this
moment. Both of these checks depend on zpos being equal for several
planes (which is a clear userspace bug). Drop these checks to simplify
dpu_crtc_atomic_check(). The actual support for either of these features
is not removed from the backend code (sspp, ctl, etc).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 123 +----------------------
 1 file changed, 3 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6fe0af9ffc23..b62e8e4e8d0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -895,12 +895,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
+	int cnt = 0, rc = 0, mixer_width = 0, i;
 
-	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
-	int multirect_count = 0;
-	const struct drm_plane_state *pipe_staged[SSPP_MAX];
-	int left_zpos_cnt = 0, right_zpos_cnt = 0;
 	struct drm_rect crtc_rect = { 0 };
 
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
@@ -920,8 +916,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	memset(pipe_staged, 0, sizeof(pipe_staged));
-
 	if (cstate->num_mixers) {
 		mixer_width = mode->hdisplay / cstate->num_mixers;
 
@@ -947,18 +941,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
-
-		if (pipe_staged[pstates[cnt].pipe_id]) {
-			multirect_plane[multirect_count].r0 =
-				pipe_staged[pstates[cnt].pipe_id];
-			multirect_plane[multirect_count].r1 = pstate;
-			multirect_count++;
 
-			pipe_staged[pstates[cnt].pipe_id] = NULL;
-		} else {
-			pipe_staged[pstates[cnt].pipe_id] = pstate;
-		}
+		dpu_plane_clear_multirect(pstate);
 
 		cnt++;
 
@@ -973,19 +957,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
-	for (i = 1; i < SSPP_MAX; i++) {
-		if (pipe_staged[i])
-			dpu_plane_clear_multirect(pipe_staged[i]);
-	}
-
-	z_pos = -1;
 	for (i = 0; i < cnt; i++) {
-		/* reset counts at every new blend stage */
-		if (pstates[i].stage != z_pos) {
-			left_zpos_cnt = 0;
-			right_zpos_cnt = 0;
-			z_pos = pstates[i].stage;
-		}
+		int z_pos = pstates[i].stage;
 
 		/* verify z_pos setting before using it */
 		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
@@ -993,40 +966,12 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 					DPU_STAGE_MAX - DPU_STAGE_0);
 			rc = -EINVAL;
 			goto end;
-		} else if (pstates[i].drm_pstate->crtc_x < mixer_width) {
-			if (left_zpos_cnt == 2) {
-				DPU_ERROR("> 2 planes @ stage %d on left\n",
-					z_pos);
-				rc = -EINVAL;
-				goto end;
-			}
-			left_zpos_cnt++;
-
-		} else {
-			if (right_zpos_cnt == 2) {
-				DPU_ERROR("> 2 planes @ stage %d on right\n",
-					z_pos);
-				rc = -EINVAL;
-				goto end;
-			}
-			right_zpos_cnt++;
 		}
 
 		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
 		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
-	for (i = 0; i < multirect_count; i++) {
-		if (dpu_plane_validate_multirect_v2(&multirect_plane[i])) {
-			DPU_ERROR(
-			"multirect validation failed for planes (%d - %d)\n",
-					multirect_plane[i].r0->plane->base.id,
-					multirect_plane[i].r1->plane->base.id);
-			rc = -EINVAL;
-			goto end;
-		}
-	}
-
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
 
 	rc = dpu_core_perf_crtc_check(crtc, crtc_state);
@@ -1036,68 +981,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		goto end;
 	}
 
-	/* validate source split:
-	 * use pstates sorted by stage to check planes on same stage
-	 * we assume that all pipes are in source split so its valid to compare
-	 * without taking into account left/right mixer placement
-	 */
-	for (i = 1; i < cnt; i++) {
-		struct plane_state *prv_pstate, *cur_pstate;
-		struct drm_rect left_rect, right_rect;
-		int32_t left_pid, right_pid;
-		int32_t stage;
-
-		prv_pstate = &pstates[i - 1];
-		cur_pstate = &pstates[i];
-		if (prv_pstate->stage != cur_pstate->stage)
-			continue;
-
-		stage = cur_pstate->stage;
-
-		left_pid = prv_pstate->dpu_pstate->base.plane->base.id;
-		left_rect = drm_plane_state_dest(prv_pstate->drm_pstate);
-
-		right_pid = cur_pstate->dpu_pstate->base.plane->base.id;
-		right_rect = drm_plane_state_dest(cur_pstate->drm_pstate);
-
-		if (right_rect.x1 < left_rect.x1) {
-			swap(left_pid, right_pid);
-			swap(left_rect, right_rect);
-		}
-
-		/**
-		 * - planes are enumerated in pipe-priority order such that
-		 *   planes with lower drm_id must be left-most in a shared
-		 *   blend-stage when using source split.
-		 * - planes in source split must be contiguous in width
-		 * - planes in source split must have same dest yoff and height
-		 */
-		if (right_pid < left_pid) {
-			DPU_ERROR(
-				"invalid src split cfg. priority mismatch. stage: %d left: %d right: %d\n",
-				stage, left_pid, right_pid);
-			rc = -EINVAL;
-			goto end;
-		} else if (right_rect.x1 != drm_rect_width(&left_rect)) {
-			DPU_ERROR("non-contiguous coordinates for src split. "
-				  "stage: %d left: " DRM_RECT_FMT " right: "
-				  DRM_RECT_FMT "\n", stage,
-				  DRM_RECT_ARG(&left_rect),
-				  DRM_RECT_ARG(&right_rect));
-			rc = -EINVAL;
-			goto end;
-		} else if (left_rect.y1 != right_rect.y1 ||
-			   drm_rect_height(&left_rect) != drm_rect_height(&right_rect)) {
-			DPU_ERROR("source split at stage: %d. invalid "
-				  "yoff/height: left: " DRM_RECT_FMT " right: "
-				  DRM_RECT_FMT "\n", stage,
-				  DRM_RECT_ARG(&left_rect),
-				  DRM_RECT_ARG(&right_rect));
-			rc = -EINVAL;
-			goto end;
-		}
-	}
-
 end:
 	kfree(pstates);
 	return rc;
-- 
2.30.2

