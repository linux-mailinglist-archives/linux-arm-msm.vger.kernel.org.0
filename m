Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E085E3901DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbhEYNOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbhEYNOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EA6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e2so31727301ljk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gpuqQrkSszYjpRL6dWUYSBVUoBVLpy578W8ZqjiamV8=;
        b=TGTDA0LY6Rac9WrS1gx9qGXob8SCe4/HQn3VIWjT7j3etrTQR28E4ckeXbh9yFwIrT
         uDLR9OvvL1JEQQfKlAd0QD9g1dV1N3oqRg6vfJJiyzdk/ntW2JnJ6RwpDBXZqLdPCMGP
         Cf1schqs1AaxJJ+1CUd1So/GwaYqV4VuAwjBdDAbazMlMNYFXBPqXoG49ZYI3XoNxlbu
         SFw1SornWFEOW76OxnOK+Relb6GWPeqvRIuNVGptgHUqLClVeq2Q+7Q/0p0f+heR+2hW
         4Tkd4DDlPCBItQqr/eRae/SneOrdeZfQEXD4Fnc+XrTSsam4FWUDYxo1qeb5BFLcRznH
         8bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gpuqQrkSszYjpRL6dWUYSBVUoBVLpy578W8ZqjiamV8=;
        b=chqW3W/BwDqNL5hD0rJsQjatuxqdw4uWvhWd+QjVqPMzAaWpw6q2gJ1KRaGfld5HgY
         Ty7mbMbRXJkJTT9XoqQXyZ56hyI8FlhCaf7WT0/NO39ENOYtoEP9SV5Cvy+ruudpDUI5
         MCztOcPb1sJ9mblDX1TlSXdvTJeqJ6Y33KbtuFZ7jodq3pBeF3YgzN+vbWV1Cp5x2UcM
         uworfRiUjoGzBn5qlOK4vfS6ZkBXsMkQ0FrobCjMuA6sujMgioAimSDA4R3oW/a8R/CK
         qj3WZihuN+1EoZYhvibOoODlig0oRC6ZYVn0GlM7L9sf+yp1RABUlyvVgzxtRTCZI/ee
         x6dQ==
X-Gm-Message-State: AOAM530Gc0jNfjdbGZCaMtH+fzqbD+50A/24GR9JF1Ws5RAgCFnGEojH
        b+WcPoT3g/XqkFOXZ9+/TyjVyg==
X-Google-Smtp-Source: ABdhPJylU5OL91/hgVLeXN67BlbSWcIeBx4Ab3nhTByBqSheAPVqNIRxKvzQRct4Owc9YL6cejegbw==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr20270267ljn.23.1621948400405;
        Tue, 25 May 2021 06:13:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/7] drm/msm/mdp5: use drm_plane_state for pixel blend mode
Date:   Tue, 25 May 2021 16:13:12 +0300
Message-Id: <20210525131316.3117809-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use drm_plane_state's 'pixel_blend_mode' field rather than using
'premultiplied' field to mdp5_plane_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 6 ++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 5 +----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index b98d5abafd1f..ed4d91420417 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -301,7 +301,8 @@ static void blend_setup(struct drm_crtc *crtc)
 
 		DBG("Stage %d fg_alpha %x bg_alpha %x", i, fg_alpha, bg_alpha);
 
-		if (format->alpha_enable && pstates[i]->premultiplied) {
+		if (format->alpha_enable &&
+		    pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
 			if (fg_alpha != 0xff) {
@@ -312,7 +313,8 @@ static void blend_setup(struct drm_crtc *crtc)
 			} else {
 				blend_op |= MDP5_LM_BLEND_OP_MODE_BG_INV_ALPHA;
 			}
-		} else if (format->alpha_enable) {
+		} else if (format->alpha_enable &&
+			   pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_PIXEL) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
 			if (fg_alpha != 0xff) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index d7e04e99fb4e..d124c9bcdc60 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -99,7 +99,6 @@ struct mdp5_plane_state {
 	struct mdp5_hw_pipe *r_hwpipe;	/* right hwpipe */
 
 	/* aligned with property */
-	uint8_t premultiplied;
 	uint8_t zpos;
 
 	/* assigned by crtc blender */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 0fd1d10352aa..90cd825df16b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -166,7 +166,7 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 		drm_printf(p, "\tright-hwpipe=%s\n",
 			   pstate->r_hwpipe ? pstate->r_hwpipe->name :
 					      "(null)");
-	drm_printf(p, "\tpremultiplied=%u\n", pstate->premultiplied);
+	drm_printf(p, "\tblend_mode=%u\n", pstate->base.pixel_blend_mode);
 	drm_printf(p, "\tzpos=%u\n", pstate->zpos);
 	drm_printf(p, "\talpha=%u\n", pstate->base.alpha);
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
@@ -182,9 +182,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
-	/* assign default blend parameters */
-	mdp5_state->premultiplied = 0;
-
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		mdp5_state->zpos = STAGE_BASE;
 	else
-- 
2.30.2

