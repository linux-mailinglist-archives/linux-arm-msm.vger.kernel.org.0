Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB60C6A97C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjCCM5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjCCM5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:37 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E0E5D75C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:36 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id k14so3447833lfj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
        b=LF1zNVZaHKLhkXCj0Ra9Y3ZqhtJPt7KYobahj0LMbeH7bYNlmRi/0mmqFnp14PQDNT
         KRM6VPFvNX0yFu4wQW+q2gQZp6jkk78ehyQAsKDXSAKYfUHI6jMDoCBf5PCTmol+CZar
         c8iT12qb+0xqkNFQyUTDdES4Pt/cKEvdjO7SyIcGfQ+KmX90yUteIjtLwrdVBEDQfmRL
         1s/csnrqeopOa2KgxSU+xSpCuArFFkEzd78neyMSXLS9FODLLADj+KdA8ZUiqqaN+bTp
         G8EkcBG8WDf7siPdguhhlNBoAZpK3U9mMm8QIIPI9Kp6+dUzAlqmouSBehPG1W1rVRCT
         SC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
        b=3hvtAeBMHygFtQrpOa5n8T9HpI6qUnhIUaAFraRHI1vzBSoJyekvNjWFwjGUi2S4UG
         d2/84Y6PZCiN3soB+q/uHVRR5NW7Fh9E4bJnvDYABNGdmbab7UQ4Q5Ebr2PrKDhYnwa1
         9n2owMvllSkq3eSpuCAXtKMAZdiJb/kuWkxKgdqBkYqOgYDjVzW9vda6mU5+cePWg/Ta
         DvaXTvpS6DNZSRXz8U05OxsbRWnflp3y4WvBRjF4XoUg8P9WbH/VB7sDAeFiF+fJylJ8
         O5JYABUtaLvBLEa7Yc4QHLm9Nx9QehRN6kdRb/S5FtkBmea6XZffKP7S1GN2z86xtobA
         HIaA==
X-Gm-Message-State: AO0yUKXkPRVA5zD6iM/iNuwEZpLBSkbI/xqU9zCB6sW+Jk/yGnZzsAzb
        NQSPdTh8Ullaqsee7nLPS54XbA==
X-Google-Smtp-Source: AK7set8/CWuO+Cf9zlJ6m26qgkTSaGYJgh41e4BTi1ebq5vhMVeg6Uk7j5h5ByLx8wtc9AWh6wBsQw==
X-Received: by 2002:a05:6512:2254:b0:4db:787:e43b with SMTP id i20-20020a056512225400b004db0787e43bmr1380899lfu.8.1677848256246;
        Fri, 03 Mar 2023 04:57:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 15/30] drm/msm/dpu: don't use unsupported blend stages
Date:   Fri,  3 Mar 2023 14:57:10 +0200
Message-Id: <20230303125725.3695011-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

The dpu_crtc_atomic_check() compares blending stage with DPU_STAGE_MAX
(maximum amount of blending stages supported by the driver), however we
should compare it against .max_mixer_blendstages, the maximum blend
stage supported by the mixer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c1579d6f5060..0260c4d6ded7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,6 +1129,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1164,7 +1165,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1189,17 +1190,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return -E2BIG;
 		}
 
-		z_pos = pstate->normalized_zpos;
-
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
+		/* verify stage setting before using it */
+		stage = DPU_STAGE_0 + pstate->normalized_zpos;
+		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
 			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
+				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 			return -EINVAL;
 		}
 
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		to_dpu_plane_state(pstate)->stage = stage;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 
 	}
 
-- 
2.39.2

