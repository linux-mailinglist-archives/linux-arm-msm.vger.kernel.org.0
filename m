Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032196590E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbiL2TTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbiL2TTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:15 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5FF8FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:14 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so28762859lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FobwD5sQvqefW0anWOBg/FR0LKON5OAk6+WYCx9JwxE=;
        b=B6PJ1qXGVKRcbM0/UWvdsnYjBWbVoM1cqOG/2rpsTJykpkFPVNCth6qGofoIFgLpG8
         khMdJNwV5n8BGmTbMXUl/uGAMROa/6xtU2xdlC39jaNx2BDIdV4/ZNnb8lDWOAp4NOc4
         JmcFfBQbAludeoAlfjluxF5GBHHC3EU6/5RSv3AwNolZQR4dZPN2q9cQXLbJhttAMDhe
         FVA8eMMVKaKaKnzhBjGWfNr8pkuEUl0fWdIUzM3WG8bJM7Xv0gxBp/s+q8+gw+ww7jyx
         memTmF8eHap6Tsz6dfoYe13ZNpbHc8a8GnBFioTEGVyLy6WZ8GuacMHukM91BaxG4D8A
         wCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FobwD5sQvqefW0anWOBg/FR0LKON5OAk6+WYCx9JwxE=;
        b=S3hdQIKCuy9L6IM6xVKQmRmzdW2wOtYPP1GkEp46Pn48TZ4sYrlz/uwWIJa6ZV0G1D
         CB6+RpWWUiBW+PAv26hXWqkaW00QOT6zJBGu+34v8yNMKeezou2FoRJuYbCrPrVH8UQj
         89tQWDMMAwlonWsq8LfKGTU7DvxtH8jXakR/MtQ6phQWCdaktrqLXYvpPIqiVN2sx8NB
         KMeCuEcURkLuCPOwmCnS/ZdcZWEEYND3zr0lOhw/uJIno07YVbXDOlcR3Jglp4ufxFOk
         yDheSp0Urx7CP6PGKBQdKhGcOMdAyUibCZ/Uc2vznNoMIXCx6TDS6vFhi7EkaiWSJ5J+
         timQ==
X-Gm-Message-State: AFqh2kqV6pPE9dZGZKSx4mA3SoKDdTWlga1RKQdX/vCxXpyjcCZfS9zF
        ybMqnC3T7w2Vn57gCe4A37yfWw==
X-Google-Smtp-Source: AMrXdXsa5Oey2ed+1blTFA8tzsPIvb9RWbg2rWPIFN/2XDTo20qI9Ugu0Gckb3QJPbwVASB+pV/U8A==
X-Received: by 2002:a05:6512:2805:b0:4b5:a53f:ac18 with SMTP id cf5-20020a056512280500b004b5a53fac18mr9803236lfb.69.1672341554487;
        Thu, 29 Dec 2022 11:19:14 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 16/27] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Thu, 29 Dec 2022 21:18:45 +0200
Message-Id: <20221229191856.3508092-17-dmitry.baryshkov@linaro.org>
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

The helper drm_atomic_helper_check_plane_state() already checks whether
the scaled and clipped plane falls into the CRTC visible region (and
clears plane_state->visible if it doesn't). Drop the redundant check
from dpu_crtc_atomic_check().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3c33bb4dfaf9..78981271b28a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,11 +1129,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1144,7 +1142,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1154,13 +1151,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 
-	crtc_rect.x2 = mode->hdisplay;
-	crtc_rect.y2 = mode->vdisplay;
-
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
-		struct drm_rect dst, clip = crtc_rect;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1173,15 +1166,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			continue;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
-
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
-			DPU_ERROR("invalid vertical/horizontal destination\n");
-			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
-				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
-				  DRM_RECT_ARG(&dst));
-			return -E2BIG;
-		}
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
-- 
2.39.0

