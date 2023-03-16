Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439E86BD53F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjCPQRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjCPQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:46 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAED0E20E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id by8so1050373ljb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QJD67Z+Qk5ayDzJb23oG+yPox8sjac90az/DJ+fvwE=;
        b=sUhQUVRlZPuEgj2PF2jDpKpfFFhU/WMf+tl3wkWEYiBKTmXgMOJFcKWc12/upFLP9N
         +N49yp8fskCVHLkSHhgYDFegEnE3PFmwvXJfK+aOTxFgJeJagncmu00uIwXQp9BUsJds
         UmpF/c/QoiozveTJ+EvdPhQwADZn+oJtSff0mMos3JLDWR00xVRylS3ZcF5YHJWc4EaH
         aH1kHyV4JdO/yVt0MV+qxDd7Eu1M9SzLA/to4QsVktMP/SDGKPUcLZNS3/IPienGjDMg
         MUmWfVc5mSx8QDGr7KsNzbI29mPWZJBgcDqW+j+g8E6dZ1b5D5veSbajoOQ7FwtbkB+N
         H1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QJD67Z+Qk5ayDzJb23oG+yPox8sjac90az/DJ+fvwE=;
        b=Dfy0aZ9Mr7UdU91tAvJXWRDaSOqDRLwwjz/lVR1ATkjqYPGiKVCrdX/oGdW5twh5LV
         kmA+FPpikfyVJpZaUYvIgBXIWsTpO37hUtXbATMhdI1mkwnevAMAmsMwRj/E23nV8Npp
         7JdC3WqsB1unNiC7rbpIG/z9K+a75CbJAl0l7DQFxyERpMOrR6ZKrujweyeKP79aG9i+
         F75NwjU7SLkq68Mx3j5fpHufEXyfopOpqJn3595W79sL88TuGXwQ/8Yeujon/UT7gtxf
         4vWMuRX0Jt1xWARZwalhVClX7IvpjfxRG9ceGW6GD67HxDL7drzreU2tslDDMBov9PKb
         XPgA==
X-Gm-Message-State: AO0yUKUQqjMK290mWLQmP9yz8Un6wb44HAv/8jgc/E75uiUBI4MYz2A7
        Dfc1wx/pQc1yw9uJm8+9ggD8zA==
X-Google-Smtp-Source: AK7set/w+u9W/lHOCRi8Na0C5iXnFASX41Axa7SHVRi9ErOI6bMmyLtEhRJff4Nppd3gvlKwC54nUw==
X-Received: by 2002:a2e:9b9a:0:b0:299:c2ea:6a52 with SMTP id z26-20020a2e9b9a000000b00299c2ea6a52mr399871lji.27.1678983430296;
        Thu, 16 Mar 2023 09:17:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 17/32] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Thu, 16 Mar 2023 19:16:38 +0300
Message-Id: <20230316161653.4106395-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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

