Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5536590DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbiL2TTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbiL2TTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:08 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9914C14D21
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:07 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j17so19246989lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss0HkvEiP7gxydmqp93caBI153pBe6rBOY2wrUpnjK0=;
        b=Sk633oUpDcJ3FVdnX++v59R3JWPawtWMmGv35/fbhUaoTA4dufIHwnuhNhetFq+Fy0
         8Ftr8fFrW7Ia3BOq6vuaGI4HXM5Ap2csqHEk+ex8QGKOfePCngy7O/kM7iq4c9Wnc4dA
         sE/Rw3vVAcX31Vw9Fc6JopM65xBLiHsTW9g2D4I3cj17P6JRJSkKEU+zneADAyHXMLuD
         TRarkmqice3l/uGh3b2cXCOKlf339iMKfmDo6cPCkc87s+TkpPPY4OhelltEtYEhm47g
         +KtIuI9PPKC7siqT6Ro1Iaqb2zHO1AAP/j3f15IHpmm/gSoVvHwgY5JekNNhoRrXpUD/
         2RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss0HkvEiP7gxydmqp93caBI153pBe6rBOY2wrUpnjK0=;
        b=r8ldX2j2gBGjDjWJ2txEblhTO1fiTmUYLFC9tG9ZopRD/sAJsn8mNrs/b3llUPuFPF
         8uWu/izhiOdN766CCzMtwRgAAum2QT6FIBvLljgUBP/LPXnxcbRuU82eU6Sg5QpofpQ+
         1HDKCy4MuBgMrNSX4Cyglm7CzpqOKwqcyfcfwAx0xid2UHBxGqDxjYTmG7dha+yPW4k+
         DUN/h0r3EEB13ZGtxnIXzL961hAMdVM44pMGgj9Ck06cU7Vdt/haDYJR3+be8Go6bCfc
         ucaBPIuw/1trke24Y/wPJqBJ0hvq1aSlGSxDB1asb8sJfJh0lGvX3VZCPqaM2yCXOHv/
         dHaQ==
X-Gm-Message-State: AFqh2kox5C5MIcQ6gleGaBhHLKccBuUeIp9uVYutmgT0LN6gH8a4/p+w
        KDePOyW8oDeKJzTcdzTT/6tDnA==
X-Google-Smtp-Source: AMrXdXt7gEcdGSAoymb/5PNlAonqSOtLxW+p0aif8ejC4/ZJJIaQDq0OSYTD0Sv1qIfj/5hCzYmajw==
X-Received: by 2002:a19:760f:0:b0:4b6:eaa5:4347 with SMTP id c15-20020a19760f000000b004b6eaa54347mr7695536lff.62.1672341546030;
        Thu, 29 Dec 2022 11:19:06 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 07/27] drm/msm/dpu: drop dpu_plane_pipe function
Date:   Thu, 29 Dec 2022 21:18:36 +0200
Message-Id: <20221229191856.3508092-8-dmitry.baryshkov@linaro.org>
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

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..78c21a976bad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -431,7 +431,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->pipe_hw->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1197,7 +1197,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe_hw->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ba954c7b3e0..493dcf04fa6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1437,11 +1437,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 0d268729ce81..8786359a191c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -59,13 +59,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.39.0

