Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCD16BD538
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCPQRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjCPQRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA0CE20DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a32so2250764ljr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKMFiHujlXkmqBoFD3IXfZxOlw3yqsNG1GqkjdXCNlE=;
        b=tbk+2tH7BwLRdzKFgE2YS8ocwEOhoiTfxjdGdCtvF/UHHct0x8/JwCMYQ2VpQBwr2p
         lEmRQngweelRw9YTe2/62Pkr2s0IqwChS/wlk3KoBvS6hT6W+bprfi0wsFXOKTlAWXU3
         +I+CLPSEk0x8iAB5RfLBa0kiAaRPrTrKXIa8zGFyG6Es3Ls6i997eiQK3/UZ+bjdOe0K
         hmec6Afi0rFv2iw0YDqenDVKHb89UQWXqSkqib16XIcM9Xcxo8XofLbTKMaWeMJKJsnG
         vAHWE9ftUXPA1O92+cv3cWmTn9K9ivaqHQFACG7MvmoLUUFlEPiBFg9cIhHewYT4BzKJ
         FbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKMFiHujlXkmqBoFD3IXfZxOlw3yqsNG1GqkjdXCNlE=;
        b=jhh9XL86q+gIA+3x7W+bZLBFwOmF9aqed7YXKY5wnUZ5JylA6MoTa7VoumX3NvbfL8
         9MvE0+lnJzgNqx+Oi0fHtjDe7rCbBefCn22JxoWXHov7vGQri9zTR0qZcZNSintIRHUK
         72BFoA1+guaQzDh9IokP7IuMYqtnSlnrtrCTKeiTWdAUUQXLTz9Dtrk7n5rsR6h853yu
         hV3qYwFYdbCinY42K/Job6pJEUPPzBWMj/JI7L4UUpnXIJSsTZWxwwO2K0TPjc5ZJg7e
         EFjVVdM+i540rhDtC9Wjbv48BqRFtSuZ98d1H78WKVVxxLAEUXCWnxfuUjbCOMBydyJy
         vJ0A==
X-Gm-Message-State: AO0yUKXKyWh6REpaEnFwqu8hC8tjfzLDF/JH7hS5mutyFYKz6sVo9l3O
        /szF/yjR848tSGJkNeJeiWuCrQ==
X-Google-Smtp-Source: AK7set/7fLWAkMwZnKsdv8NRTW5FBY9MJaWmtdHDeC0x3xUNazcz7M+iKboWPHSBgMaBXgFvUbG8Rg==
X-Received: by 2002:a2e:8e22:0:b0:295:a75b:4df4 with SMTP id r2-20020a2e8e22000000b00295a75b4df4mr2139689ljk.47.1678983429453;
        Thu, 16 Mar 2023 09:17:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 16/32] drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
Date:   Thu, 16 Mar 2023 19:16:37 +0300
Message-Id: <20230316161653.4106395-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3ff9c6018a5b..37e6e5750bdd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1154,7 +1154,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1186,11 +1185,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1204,8 +1202,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
-		dpu_plane_clear_multirect(pstate);
-
 		dst = drm_plane_state_dest(pstate);
 		if (!drm_rect_intersect(&clip, &dst)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
@@ -1214,18 +1210,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 				  DRM_RECT_ARG(&dst));
 			return -E2BIG;
 		}
-
-		/* verify stage setting before using it */
-		stage = DPU_STAGE_0 + pstate->normalized_zpos;
-		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
-			DPU_ERROR("> %d plane stages assigned\n",
-				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = stage;
-		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
-
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ce01a602cbc9..3fba63fbbd78 100644
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
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 228db401e905..a08b0539513b 100644
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
2.30.2

