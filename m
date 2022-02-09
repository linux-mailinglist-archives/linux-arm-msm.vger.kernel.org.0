Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724D04AF814
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbiBIRZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbiBIRZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:29 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1D5C0613C9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 13so5538866lfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FNHwzq3mUVYP9tvZ3dHFWJj6Yx53lVE16yT9fgLyUdc=;
        b=cPkfXS+SabaJuhxGlv2FUVwvEJPajwr4uq7teEv8LtZ7me8XKOPRINtthA297vf5Oo
         Y4VscEzldGo9B5K31Ghq/uD/LrKsuI+QiqPD3SttvFj4rCgAp7YP9ENvav46dQO8yw5p
         4svA6K4deH6Tfks14qDiAiPETakY/dHKl8hhs+ijKwmkRXvZw9MwXB5UZUbkc41kMjRW
         ELO93VedtaaEQQHV4ltNN/E+u1zhamQxcSaANCZySP2s5PML/2McUl/mwglM9Oacj3Kp
         HlwpT4bD33k/6VR1immriUej8Io0qgZR+fz4scFGzUHZ6lTVPSqGUYGQLJhj7DUXK7x5
         31+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FNHwzq3mUVYP9tvZ3dHFWJj6Yx53lVE16yT9fgLyUdc=;
        b=lroEDH1+0BHj3EnZekZfk8eSd63nOgcmdb4yb40BUyWkxO1XEHI56pmly456yOHmJr
         JhO0TXHv6YmpP+fZ7xCI+OYC0g3OwO86nONm1Pv77eodzOhj6XqWFwZC1VI+YxWiKIhp
         kxs/1tEqGtwm2AQzWkhf+CrDHEwiK+7wWKEXPIn6p+a2oGu+EVmi6b1JZeLtfmYVz62l
         0F4s1baD/SQh9G46jGLzzWDsiQw1rtz/LRHRGUuRrNf8k8ANtU0JwDZu84FozUhoglYQ
         vB58uW39b7RfesbYF4A1Ksd95ppC6NWIrdufDsoZieBm6y/YloagQVt42dmLnwdcv4q9
         ymyQ==
X-Gm-Message-State: AOAM533/1ee5bjFZxCqKMhNpvXzdYT9hjpzHJUO9dRoQhy2k2nBJFzPN
        Sr8/+WSQPi8wNsk3Gh67QGUpeA==
X-Google-Smtp-Source: ABdhPJyxbvJ7tFbQEGokz1hb7i2JQEwpOnXmrZQSoCS5bPnXLX7G8hfO4YC/f4St6JXU/uLxzlzNTA==
X-Received: by 2002:a05:6512:1083:: with SMTP id j3mr981562lfg.94.1644427528173;
        Wed, 09 Feb 2022 09:25:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 06/25] drm/msm/dpu: inline dpu_plane_get_ctl_flush
Date:   Wed,  9 Feb 2022 20:25:01 +0300
Message-Id: <20220209172520.3719906-7-dmitry.baryshkov@linaro.org>
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

There is no need to keep a separate function for calling into the ctl if
we already know all the details. Inline this function in the dpu_crtc.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 15 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  9 ---------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7318bd45637a..5fc338ef3460 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -348,7 +348,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	u32 flush_mask;
 	uint32_t stage_idx, lm_idx;
 	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
@@ -356,6 +355,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		enum dpu_sspp sspp_idx;
+
 		state = plane->state;
 		if (!state)
 			continue;
@@ -363,14 +364,14 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
-		set_bit(dpu_plane_pipe(plane), fetch_active);
+		sspp_idx = dpu_plane_pipe(plane);
+		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
 				plane->base.id,
-				dpu_plane_pipe(plane) - SSPP_VIG0,
+				sspp_idx - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
@@ -380,13 +381,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		stage_idx = zpos_cnt[pstate->stage]++;
 		stage_cfg->stage[pstate->stage][stage_idx] =
-					dpu_plane_pipe(plane);
+					sspp_idx;
 		stage_cfg->multirect_index[pstate->stage][stage_idx] =
 					pstate->multirect_index;
 
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 					   state, pstate, stage_idx,
-					   dpu_plane_pipe(plane) - SSPP_VIG0,
+					   sspp_idx - SSPP_VIG0,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
@@ -395,7 +396,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
 						pstate, format);
 
-			mixer[lm_idx].flush_mask |= flush_mask;
+			mixer[lm_idx].flush_mask |= ctl->ops.get_bitmask_sspp(ctl, sspp_idx);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0247ff8a67a2..ca194cd83cd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -849,18 +849,6 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	return 0;
 }
 
-/**
- * dpu_plane_get_ctl_flush - get control flush for the given plane
- * @plane: Pointer to drm plane structure
- * @ctl: Pointer to hardware control driver
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp)
-{
-	*flush_sspp = ctl->ops.get_bitmask_sspp(ctl, dpu_plane_pipe(plane));
-}
-
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		struct drm_plane_state *new_state)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 42b88b6bc9c2..aa9478b475d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -61,15 +61,6 @@ struct dpu_multirect_plane_states {
  */
 enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
 
-/**
- * dpu_plane_get_ctl_flush - get control flush mask
- * @plane:   Pointer to DRM plane object
- * @ctl: Pointer to control hardware
- * @flush_sspp: Pointer to sspp flush control word
- */
-void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
-		u32 *flush_sspp);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.34.1

