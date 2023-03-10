Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CF06B3318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjCJA5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCJA5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:30 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F37FAED3
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:21 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bi9so4628566lfb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
        b=h7clikgF0RXkODZNzHz1hMVISn9JW0FnPnvLgsB4jlNE0fwtytpQQjCMu9A5F+nRf4
         wbLiIlUwJBFzPSEFqTA2wjXbamdEO+UTj9z4ho0cFDrzsHkFz2eM6/hjUBLvOZamatws
         mnSMULAqEN4Bx8f5s6+xyctyFY3kCcEt3thWwEPQuf8jQTnETOEN29G6Mwb/kyyErHkh
         q6BbzKrz64zW4YRKhwQ4zWA1XtpIDkLl0qP9d7nWJPRbh7+aDUyTjI3wv22s1t0TfU15
         E+ZhB1PzWqrsv/zQT31IOOA5LgxlGB6yDIILiZHmNbNH1mX+dfUafbZ309jjsTNKiXba
         uXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
        b=lK9TgD4cZM1NsXFX+scAhKJ2aeHqVm6xDccIqLogEr9hfCtEritcPles6kEVvYOZ8p
         32VAsN4Y/vH4ZVW37tnyJq/V5KMUaay4HvIzU+Ds4nfvfW2FSq5At2o70EehrB1nJhQ7
         hPG4Q4koqG8Y2G7jG3z+9/kE0GsdsuS8kLUFHy4ishPvP5Jt4JcnTLhDDWyluznKgvBO
         r7EaqiRLkhMmLji3eXYKFT05rKQQ/OinSt64vIWN/WJbbf+D4zR95NL2tS3ra1iqnj6O
         cnO1nYcL2HVSPRlBDfMz4ISHEcJ/h/Q0L+cje4c2WvS8rQA40HNLFWv+UOFC3gKN3b2q
         w8vQ==
X-Gm-Message-State: AO0yUKWIQBjV7IA3u9TjeHqgxekQM8gniq4iMn0NhVFmJSMzLsn7Qte4
        OQZYoyrXuo81sRhdxU4D1DYgjw==
X-Google-Smtp-Source: AK7set8I/eZYUGBKl6TftSAhkKytjV3vLBKBs19ZG9SyOMXVqE3+yTERgW5jfIAcsONux/n/NmTjvw==
X-Received: by 2002:ac2:55a9:0:b0:4dd:9f4d:7459 with SMTP id y9-20020ac255a9000000b004dd9f4d7459mr6761930lfg.67.1678409839504;
        Thu, 09 Mar 2023 16:57:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 15/32] drm/msm/dpu: don't use unsupported blend stages
Date:   Fri, 10 Mar 2023 02:56:47 +0200
Message-Id: <20230310005704.1332368-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

