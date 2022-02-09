Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F44B4AF80F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238036AbiBIRZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238148AbiBIRZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:27 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D09C05CB86
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id k13so5522534lfg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GzF+RzV2hotypA6X3hFw6Qw5d48CTFinwJESYBrfrQc=;
        b=kvcvcw3m3FIOUOPpC3ZEqDThxzInJ40mQzHsKhbqntRXfcwshHXoo5bvkr5FfJOKGr
         MnCqiBhbkPtbYPCuvWGIim/3orFO9t95lTDPLdK0Yf+GC4ktaZIkjuMjtwnJ9f3EovHH
         vYSh8f3K3jE88dc8W9OForTDc82zVtSm10elriJem5G2E+X5TJgwx/Xugop3MbpE5670
         wYsfPwdxeMCe0W5KEARch/kERN57WgPWH1usB2FyMcyJotRsx4BynLoMHF3jue5adZck
         6GVny2LAVYi4pslIvpxFi0sJoz2UynIeRV1IcH6aGYUrMU/0OB++dmAdkiGS3AIIi/1H
         36zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GzF+RzV2hotypA6X3hFw6Qw5d48CTFinwJESYBrfrQc=;
        b=2LxoXCC09LEna7TRMVLLwm/WqcQ30i1Pu3NyVBjy2nh0RDXnWlNo+sGv4Yo+46FuuM
         BkhiChlxlXXwPQ+xEud/X7SJZ0ojO/CvC8hI7TtCCwxi5iikEEBhn1MJxwoc+qHHY73y
         5yIB/H3NrcQiris1HutfFu0BoB3+CtqHqpaKsP5zH6KTIEyPDWQSDTISsfZBjxpT/oIH
         KO5g8tRQcRT+WTv0cZaYyHBdvI5ZjR8J/pwBizS9lKl2WgS9OhsM1+OF75dQ5dQActFh
         dP5lN4eoKp0u3raFkPFrstkPfJUbJ5BZuQ+7SOx8pWw6MSWtlYnRVGqyvwDCw/a9Gwal
         f4vA==
X-Gm-Message-State: AOAM5336/MPo3pw8Q/mq6fJoONzIxuUAXEknUZY1kewLyptb5nyrLeRE
        bcGjRjvmmHLwLvnHIpohMtJkCA==
X-Google-Smtp-Source: ABdhPJz0QMpz5Bvvcvt4RYWRsTP2JzNueOx1h1aqiX1fzPZUqnjuusvDOzrSKfZEa/n5BwFTUX+iWA==
X-Received: by 2002:a05:6512:70a:: with SMTP id b10mr2235444lfs.672.1644427529072;
        Wed, 09 Feb 2022 09:25:29 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/25] drm/msm/dpu: drop dpu_plane_pipe function
Date:   Wed,  9 Feb 2022 20:25:02 +0300
Message-Id: <20220209172520.3719906-8-dmitry.baryshkov@linaro.org>
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

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5fc338ef3460..d21791db6ab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -364,7 +364,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->pipe_hw->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1112,7 +1112,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe_hw->idx;
 
 		if (pipe_staged[pstates[cnt].pipe_id]) {
 			multirect_plane[multirect_count].r0 =
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca194cd83cd0..d1f9b4bc10ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1391,11 +1391,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
index aa9478b475d4..d745cde4ea77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -54,13 +54,6 @@ struct dpu_multirect_plane_states {
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
2.34.1

