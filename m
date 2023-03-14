Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0C46B99D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjCNPhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbjCNPh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C83CB0BAC
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a32so16444883ljq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
        b=TtGRPNrw6Zwf3wfCLxcsiXUwS3op2Cd83HM0p2C9zMCJG9sV1pvbW0pBg29pT3MGN2
         i9dassk1ApnhltvbZ2Vlis3Gr0luWmSC9j/BulPAqYaZFJpKSt0JDmjiYr8RyaBvi3sT
         OreVUyIbSQDjtpXgk4G15tky9JCBjXYaKQt1LfmskGORKshUyYGh4KpCu0D6PpUitGT5
         ifBmAvbRqahPde2/ZIoeKQccdDVEP7/hbXXk8ibIVlvoz24bVU2Lbp1RKcNE5L6RlvpF
         wAPihqFJ04TIxA62vrp6BBcPCKkjcWsmSui789fQbdY3gkoHlA6jwwOpBfR+dTtcS8LX
         /KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
        b=MP7BkaAW9a9q2nzaPcZBBp5gadJK9vU1jXAbeOcSyxPjFaprOlS/y3B0GoC7beDHms
         8bDLeIeHXgx3X811vGuQgBSrWIiVIFZ/wpwzwsXOf94v2/ce8KYEDvnS/dH+OjN57Tg+
         1n497PkPPcMswqWUYW0lgIa18Ifo9ByVF4Z+8fs/OOwB5XDT8nLsUdepOU9jWLRBCkPL
         OJq4+tGciJ0ZwW3R3C/linEIE7WPLogM9dEhR1hKY/1ZVpzbFKrt3kmu1NUmRAGtlblq
         5BDQRkbfXpQ/6K289QxVrooQcy6SqS5WIPqXZZEtMlS0pz2Cz0Bcg0u8jY+bQPX6tEr2
         OIXg==
X-Gm-Message-State: AO0yUKUqJ5vydCgQsj1ik7NnZ+WuNsNTlVaNyLptXRRjKMdzpbv2pjAp
        58VqfNr6MrsRZuJyxbI7P9l0Qg==
X-Google-Smtp-Source: AK7set/wNp5wMTbWY1n0W9X9/90hGF4rYjK9WfWxStkhKJbUvEJ/pzE57xzXQQGe7TxGtHRpRj2hpA==
X-Received: by 2002:a05:651c:544:b0:298:4424:aea9 with SMTP id q4-20020a05651c054400b002984424aea9mr12748087ljp.21.1678808156878;
        Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 15/32] drm/msm/dpu: don't use unsupported blend stages
Date:   Tue, 14 Mar 2023 18:35:28 +0300
Message-Id: <20230314153545.3442879-16-dmitry.baryshkov@linaro.org>
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
index ca7a9f58a97f..3ff9c6018a5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1154,6 +1154,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1189,7 +1190,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1214,17 +1215,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.30.2

