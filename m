Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1B06590E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbiL2TTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbiL2TTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C100D1409F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:12 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so28744083lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HZvAhIcCvTuY1772qgTfDmlfw3PveCe2fLJ0nn71tE=;
        b=PSd+ik6NLa/0+70GkPEfL3ZceykxEx9i+s6QpWxeG73sn1Ls8hHObhvLKiqGNCJR5O
         X7pdk76/98rASjRgDSDn7YKqT1l5BSIQ0Z1sbF/J3ewDG6kASOcXVAVsfxmU8hKxBfq7
         P27YnCx/3z4qkyExERlZpNzXjp1Ztxlua77uF8cod4FdYH8YqMeQte79MfTz+vuTYK2L
         OZJaWOIHK+EHuJ/QCt1QYQusF81zCNcJ87H00QgtaPz/KtsWGJ8Zm3qIpTnDNWqGxSlL
         9k3qMrFOWLwl9BIyzvdKfw450Bi68rsEP8NsdTqNMQSJsvEWKP366y27laF06zLm0Nl+
         hJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HZvAhIcCvTuY1772qgTfDmlfw3PveCe2fLJ0nn71tE=;
        b=bn6DdglM86f+CGYLVHlEWREUH5vUCcGHN00KOs+j8XNNGTMYWd1GXLVzA39v2Iwbcq
         mxr+vhIDOipzrQA2AnpiGWd6t536AGKWnuGO6HBipSEpg7UyDg9hjN8lbUNUx7RUFnWI
         tUkxbcT4cjNxjzR9anJQT5DMrN9hSKdW+MmJuQWOmvR8FEsN3JNSA9M1EEx0dP3AgWBN
         QtQuZT6yQfebRsM4jXakF9k25rn1/Q3K2xFH7CYnouJLJcm/xl8ctMigrX7xv0+37fzR
         w3CPZdL75dN/OlXjZGzR05wFY0jWuZsuel8KrnvE/nDM7RwyxAcwj4ACZi6eVrPVQuWd
         k5rQ==
X-Gm-Message-State: AFqh2kr9nwWAcXFvFqEOB8N29rOZWVPkQ3r3fIkbYH+jP5Gb2ppfViv/
        jPuv7feqmuLJeASR71d5bhBhtA==
X-Google-Smtp-Source: AMrXdXuxSJIBJfGd95s/40x4VOAGFVnKBueWyZP/daYzQJPUOVpCLFq/S/bda9FwxCnxH5s2L5dcIg==
X-Received: by 2002:a05:6512:3b87:b0:4a4:68b7:d623 with SMTP id g7-20020a0565123b8700b004a468b7d623mr9549025lfv.10.1672341552388;
        Thu, 29 Dec 2022 11:19:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 14/27] drm/msm/dpu: don't use unsupported blend stages
Date:   Thu, 29 Dec 2022 21:18:43 +0200
Message-Id: <20221229191856.3508092-15-dmitry.baryshkov@linaro.org>
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

The dpu_crtc_atomic_check() compares blending stage with DPU_STAGE_MAX
(maximum amount of blending stages supported by the driver), however we
should compare it against .max_mixer_blendstages, the maximum blend
stage supported by the mixer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cdaf48a849bc..cf7be1427298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1126,6 +1126,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1161,7 +1162,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1186,17 +1187,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
+					dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 			return -EINVAL;
 		}
 
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		to_dpu_plane_state(pstate)->stage = stage;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 
 	}
 
-- 
2.39.0

