Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23476590EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbiL2TTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234008AbiL2TTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:16 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9A51409F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:15 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p36so28726825lfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdZLMkPyoLeNxJVHJbrTVSigCSp0P0cAJW4bpHwfM+c=;
        b=vuchaLraHeOEvUwjDb0Z/SpXaCZMRGlVs2s90u+tR0DjnqJi3w4bFH9tI9WdZ4UHbG
         CgydYf898ckjU2IJmfT6fGXdcuAQYtzgH1AeW5htzYXog//qRvRxe9iCNU+5ZTWVsA6Y
         hi/Rq09Gg+x1LNtYNJFDZG4RxuhqLV7Nlbl6v97unXFkKPFXV2JDy4m9kcqwVOJLDQwD
         xAuBZ7lsccmBaMELtL8elp8y0soyVpPaU8zp6KpYiUTqc6RnLQBG+IACHLKwkt+CtTl/
         s4ORhITqsDtdATD4k0XHlq7ftu43kTjc4cRn4zjxJY9PXJT6iEIK9ZChEJggCydvHOwg
         MNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdZLMkPyoLeNxJVHJbrTVSigCSp0P0cAJW4bpHwfM+c=;
        b=7udNWw03EZYM34w76AJRwWD6wwor0TsdaaGIk57pF1sh8wjhBzd4ueZs4OM6rk8QVr
         f0+gK4rUr6sndP42VFkjW1WO1102brBwzZCgJkPIyJEXWg/0GE8IIfMD/H7kOvW4by2a
         Pm5WIc1hCKllKfcmU8ekZpjFKnQjrstzUKgpnY6Fhed0+wtcyFcv6AQ3k/HIZuzCoA2q
         PoZ+cP4Z5xxQwOSCUzPmzjtDOHi3TSsMxMWZvIbD4bnLOl2vC8imb48Z5L//IsqEzkuK
         4t/C2Sy+9Cfqlfn7TUwe4oTJK49OfWQvB0ukpSRFnIdybwfVKH+jS6qyNcazZybf9UWB
         vJXA==
X-Gm-Message-State: AFqh2kqtcRaDpZ1EdZkgPdsie28UnGLJ9yftj7r3EJG/ubCW4zVuR2RD
        TofM/Wvu8EhPkSW8ACnDYQyCWA==
X-Google-Smtp-Source: AMrXdXvq0sBBiKzgjiPzS0bfiMEjm555fTwkVs7ryeWQDMpUvJ3E17ujQXEE+rg4PJgKP/UvEAlBBg==
X-Received: by 2002:ac2:53a3:0:b0:4bc:4ad0:4142 with SMTP id j3-20020ac253a3000000b004bc4ad04142mr9733202lfh.58.1672341553471;
        Thu, 29 Dec 2022 11:19:13 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 15/27] drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
Date:   Thu, 29 Dec 2022 21:18:44 +0200
Message-Id: <20221229191856.3508092-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move plane state updates from dpu_crtc_atomic_check() to the function
where they belong: to dpu_plane_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cf7be1427298..3c33bb4dfaf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1126,7 +1126,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1158,11 +1157,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
 
-	 /* get plane state for all drm planes associated with crtc state */
+	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1176,8 +1174,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
-		dpu_plane_clear_multirect(pstate);
-
 		dst = drm_plane_state_dest(pstate);
 		if (!drm_rect_intersect(&clip, &dst)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
@@ -1186,18 +1182,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 				  DRM_RECT_ARG(&dst));
 			return -E2BIG;
 		}
-
-		/* verify stage setting before using it */
-		stage = DPU_STAGE_0 + pstate->normalized_zpos;
-		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
-			DPU_ERROR("> %d plane stages assigned\n",
-					dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = stage;
-		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
-
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0d2a7170e0ab..50ce4653bbba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
@@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+				pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 55ea221e8488..36a82c06ab7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
2.39.0

