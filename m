Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C6E79F9C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjINFHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbjINFHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AA998
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:12 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so7814751fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668030; x=1695272830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9suomYc4Vzy5AzZapu1YS94KIOUFW2mKCkcKbShlaQ0=;
        b=OGXB/vqg5sPyeTF3r+f7a+xb1MP2eeohwKPsuhVRSpFUZ26KSe0RwH4KpFHSL6aXHz
         kmLzB8nLIFfCHijfJkLogwlxlJtB34HI42+/26ap/3IIJutlLRxFwrVJUSo7gFyfSB1U
         77I3apgfzYh4rN53np15OnSmM2WnJbnYEcSUvzGE4UUBjcmV7wymf4C4XOdd7AKa6xB+
         8KrPYKsziWdEkRMtyb1hD34HEOp+rMrlX60/xd/2FepC4J8antaBfQu7tflX+jFnEpDy
         icuQczvIqZuIat8ihQ4Kyhv/lyqUsEu0kYkhdtpyWFnjoocphta076qYxjDrXaQzZlX4
         jfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668030; x=1695272830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9suomYc4Vzy5AzZapu1YS94KIOUFW2mKCkcKbShlaQ0=;
        b=aNjDmX6YIs5HwBGfpucXjX6Tc5Vu8XUxTYv9GX3mbXFQrC2ouqpmRjTrjAXjLQqVL2
         CCEyb/Zkphm9RdP5MryPx1KHDSXc0qym7faiA4pLwq7Y8EA+yOgvqTeit2kUezk4MtvQ
         idvh0VAfXtx8dwznYk/QT5D1xwnKId1C3zQomMPa9qDHkhEgspR5kkM3v3x6HGVafIqW
         YUrWv1xx+uVF1rBZvzsbdARJu3OO6ERrwz/Wi6C+PJRKWZqrmp84Mo4Q7ZHgDfX4rs51
         liQYm1NYJH0ZL9H2tvVEjCchbzWvsF9+tVYjPRPBsBbtLOUY/JdGPFfSTEJ+o19Gq0fJ
         KyDA==
X-Gm-Message-State: AOJu0YxU9QVkrxL4/8YJnaN9T3y5EXhNlajOI/aWIecFX1AntE0GOodE
        VZOanlMIZKeWmugYHgMZKKgpqQ==
X-Google-Smtp-Source: AGHT+IFzh7nuOGuYt7kBaOeC/F2AShvtY1dotEATTEeEelVA9Whsa3NrVOS8Dd0XTgDG1CedEoLzcg==
X-Received: by 2002:a2e:9590:0:b0:2bf:b142:bd13 with SMTP id w16-20020a2e9590000000b002bfb142bd13mr4352252ljh.4.1694668030746;
        Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 04/12] drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
Date:   Thu, 14 Sep 2023 08:06:58 +0300
Message-Id: <20230914050706.1058620-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 67f9c2a62a17..3a75c474c4cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -785,6 +785,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -795,13 +796,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -818,7 +828,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1302,7 +1311,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1324,16 +1332,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
-- 
2.39.2

