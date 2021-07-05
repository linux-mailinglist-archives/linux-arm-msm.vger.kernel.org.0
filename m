Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2D33BB4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhGEB1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D46AC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id n14so29505888lfu.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCufV74cVFpYl4htm82Uz1EE39i1hYbo9BTJwhrKLwg=;
        b=OvBcZ6Do7nwdVGMZVuKtGiUeq/7TfbHthDpSGdTmuG/cD0v8YWHL3+8FwhulnvLZuJ
         5xAlP20TjriDk30bLWu4zz6qdBbHcp8NyUbC9mQnvZVEqqNG9H5PmoQVh3HdMVztDVez
         /YyvlsWrbpGaW1EbLIxOBK4ZNYAAEDFmbaSrcafhRJG+IW0815BzGvYsbVgmqPtqPwvq
         TaT5v8SbIG95vAdi5y3jvaJbgO7lAqaBig6Mv2RrJY7C+6OxNkttO8VepO5nX/eDOAc7
         VnVt2lWeTHnW5XmAmYQhlXwrTA2ZXJf+KuOfV52MlXBmestJth0uUe+mULcrf2Id91Bn
         jfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCufV74cVFpYl4htm82Uz1EE39i1hYbo9BTJwhrKLwg=;
        b=WqnOWMnkwcGWzTpTu7weWGy5+axyHCFlTbA/4tClY+VpNNaHl8KABqVMf80/dcFAVI
         j1+SzWfIG8FBB1UZQJHDO78F7tAgVT6InnbSi2KTlH1ndktR6OX9fE0zk/Ka0f9jliNk
         jvD6+HcdaCshgybaCiXRbzvha9Lxl8/41lWAi/Wtg87a/QXjxMzU5dz8ObmaZ2TPfvvo
         KHGK+kGgasL/UDFxdu9qMT37RIHeDcPr1IjHatoMR7OYXJ6IUwhXB0dxmMxt0b1KRlQ4
         9j/kwqT0BJFE+BSoBvQNT1VzTKvIuc46ywv9Bszt+kPyp07x5jI2BZaV6ZocLF+QUp2y
         vrTA==
X-Gm-Message-State: AOAM532kZSTOC1DEjKjzNrsxx/VkNFW/iob0iv4YgxzqpiSPwpxLOCW3
        FpR2nN19xsXr9/KVRexEy7Dnwg==
X-Google-Smtp-Source: ABdhPJyZhGYx6fZck6AKm28q8H3l8mLrs3I+HdT6ROdfkLL4LpyQmGRO9KR/g0fayp0mEdku8zwUOQ==
X-Received: by 2002:ac2:4475:: with SMTP id y21mr6861692lfl.133.1625448316857;
        Sun, 04 Jul 2021 18:25:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 13/22] drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
Date:   Mon,  5 Jul 2021 04:21:06 +0300
Message-Id: <20210705012115.4179824-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 128 +----------------------
 1 file changed, 4 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6fe0af9ffc23..f311cdbfe7d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -895,12 +895,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
+	int cnt = 0, rc = 0, i;
 
-	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
-	int multirect_count = 0;
-	const struct drm_plane_state *pipe_staged[SSPP_MAX];
-	int left_zpos_cnt = 0, right_zpos_cnt = 0;
 	struct drm_rect crtc_rect = { 0 };
 
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
@@ -920,13 +916,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	memset(pipe_staged, 0, sizeof(pipe_staged));
-
-	if (cstate->num_mixers) {
-		mixer_width = mode->hdisplay / cstate->num_mixers;
-
+	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
-	}
 
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
@@ -947,18 +938,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
 
-		if (pipe_staged[pstates[cnt].pipe_id]) {
-			multirect_plane[multirect_count].r0 =
-				pipe_staged[pstates[cnt].pipe_id];
-			multirect_plane[multirect_count].r1 = pstate;
-			multirect_count++;
-
-			pipe_staged[pstates[cnt].pipe_id] = NULL;
-		} else {
-			pipe_staged[pstates[cnt].pipe_id] = pstate;
-		}
+		dpu_plane_clear_multirect(pstate);
 
 		cnt++;
 
@@ -973,19 +954,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -993,40 +963,12 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1036,68 +978,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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

