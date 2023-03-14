Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651666B99D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjCNPht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjCNPh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:28 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74838125B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:29 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id t14so16447806ljd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ty36EYQivSy5QOOAsCbmesDE/+6+5HX1O/RWf+0CDQ=;
        b=nITvLikkhBe0h6rbWe5FzJd+/VXEpKqautc6HMoD+by1VMEB1A56hMA6h48w504K7O
         X1bzG4f7vnzTekfR5Qf2WHVCGSSY3rmLzGDb9IhrjNgNKD6fkUWm4zMPPPfIkKrIK/yK
         syJBFW/UGsQ65RL615SwCCMZPaHJ/dnH1mgmyTR7csdDsQSFx10qHpULlyFbyUk/fREt
         FFp6ZqNvaMtB8v82azeG8eKGxhQ1cwgidMqM/70sN1LAK5txq3MfFi0NeEVl1PBAHNug
         Gf+dr7ryShaysFdgnzirApxN0lge41XXWXRNc2FpaIo4cXuG2/EGIg91znGEtbH3IYsY
         60qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ty36EYQivSy5QOOAsCbmesDE/+6+5HX1O/RWf+0CDQ=;
        b=xZEsRmPpcOjWWw9Hp0u2mI75W6MLiq/x3eMywxOUzL8u8uIXhQK/bhQou8qZ89TuRe
         u1L4elWb6XYjwcW5OCO90BmcZJ33P4kx3RSX2fvhgPAHFIWRyHaIAIyBnQapXysB+Diy
         B9OtAaOuI7upECuMgb8NWQmwWpNlVIe326KXChD/WvFV2nWPeIO8940O/qwZPN5BeHn8
         ZtMUN/dcdcJf+PTPQdKhgxUwbHy8HveE0mb8nCWSyYigINDYVUiQ6yRSxnu5legwIF92
         tB4YNt0aCUFUdQhYT8AnEUtgQRuxOrU7TAyIzFufmPBOsEzNPjCbq4+pjveGecv+CsbI
         1l+A==
X-Gm-Message-State: AO0yUKWow36MnPvNFRidGIrrBIteWHhtRwNwxKl7VqJ1zN9VKmNkjlpk
        aJcQCwOKRKbcHM9shYk0nCVXDA==
X-Google-Smtp-Source: AK7set8mc0PHdKQTBYAN6ivdsGyBJoSy+im7YYFzyyVBOA4E4tIvgMghtzbRRKMHZCbDxbnZtlxm6Q==
X-Received: by 2002:a05:651c:115:b0:294:7427:4ec4 with SMTP id a21-20020a05651c011500b0029474274ec4mr11282035ljb.41.1678808158450;
        Tue, 14 Mar 2023 08:35:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 17/32] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Tue, 14 Mar 2023 18:35:30 +0300
Message-Id: <20230314153545.3442879-18-dmitry.baryshkov@linaro.org>
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

The helper drm_atomic_helper_check_plane_state() already checks whether
the scaled and clipped plane falls into the CRTC visible region (and
clears plane_state->visible if it doesn't). Drop the redundant check
from dpu_crtc_atomic_check().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 37e6e5750bdd..89d2c4735001 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1157,11 +1157,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1172,7 +1170,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1182,13 +1179,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1201,15 +1194,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.30.2

