Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47986B99C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjCNPhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjCNPhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:16 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A64AFB8E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:09 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id i20so16423474lja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV/iGylTDgxxWCB5fJRWseJZRf6m0M+kKVRnwgr+IlI=;
        b=DcG8c90lQLDUIz0rXptmL+CnlWOXW6NnjM+Kr5M2PMVP4NG0G5wIgt5BsXJAWb5GB+
         AKky90qWiDT0Blb0QBfwLjd81/2y6AsZKcCzoQUDr4S15Cpiw0s+GQBRuOU1x+RE1+Ib
         A78NaqZ45axWFEyk125LfffgwjY/NcdzYGOKUl4eDUBlGx/iTtyJuYxMRKweAEEi3NVv
         mZqUrFWmC8+aZ2QI2P0UMyPz+Y/SbIropukMKcd5iqrywazK9MvTkyIX0sWn/p3HJMWz
         S7eG09M8HeJlm1B6q7WnumPHIMAmKZrmsSUgg+u2uhVy4y4WJhOZNdNRdg78zdna2dwM
         mn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV/iGylTDgxxWCB5fJRWseJZRf6m0M+kKVRnwgr+IlI=;
        b=Yal+AJpE9TfuL6+EVxKGgPtFzkPIRzWb3yJXGWUDVAR0IuWrVVqS5mZ9qMtXdLtpQp
         5eqUbO/5lo89/J/g3s6RNkjYsQT2DECb4eSsuYsMNCEKZ8hMOd7Bl7/aRPR1DCNsrprx
         gX50630tX2306kEZaZcGXEuyH+HFoxaDbIXUAtxle1nM77kB8BOEqoSFfoDd421Lf5eO
         6nc6FsCcPRpwfTjy5uzgws8uVVeR8hK+WBA2akq6EoUQ3bI8n6BrTbz2tYQ2MNLzbKcp
         7DxJVTke0Qemhn/lXDbNVBp4inYVQVEdIl4jUKBhOyQ2qgMWdfUFoR87NxNdTEWhCSJ3
         H/ag==
X-Gm-Message-State: AO0yUKVCjl6h+deRXMCx2KgBBDcuyi3DmpPcx0u0aYARcQIH05mB8Zo9
        qtP9ciaaD7XiMz8bPDZd4JAFWA==
X-Google-Smtp-Source: AK7set8yOOyLwqDw8jk7L0u0X5+xqfHu71OyQbZvn2oygU+zrCKVnBOudN8J9aTl+/hUVulXmFiBjA==
X-Received: by 2002:a2e:990f:0:b0:294:669a:6adc with SMTP id v15-20020a2e990f000000b00294669a6adcmr10739373lji.3.1678808150630;
        Tue, 14 Mar 2023 08:35:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 06/32] drm/msm/dpu: drop dpu_plane_pipe function
Date:   Tue, 14 Mar 2023 18:35:19 +0300
Message-Id: <20230314153545.3442879-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
index b1ec0c35947b..c059090e9479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -432,7 +432,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->hw_sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1227,7 +1227,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->hw_sspp->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 546629232e3d..10678f6502a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1442,11 +1442,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
index 08a4b6a99f51..25e261cabadc 100644
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
2.30.2

