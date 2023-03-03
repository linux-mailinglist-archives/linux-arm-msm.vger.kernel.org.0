Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C4E6A97C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjCCM5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjCCM5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:41 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FB75FE8D
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:39 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id i9so3463878lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
        b=RGqKWZZueTLN7nkXECplHGdN/ztb2r6aIiHQJvne+B9ZRjY7gpKsRxBJIeBRNomdpO
         NXftUxxnUNu2O+KS/Kt+c7/5VHjiF/kvBViG5u9bIyy5Ga/ZhB/TxbO2114TyGohdo4N
         u0P/l4AkJxt47ZzYNjgDzlttVaJlUbp4euIkysxtXsQhjDeIG1rX1+j2pAAoAS523uZ3
         79gvg+JaZ6PVtJkrqAkDixaNeqmka6kAIJjBZq18siDtbs2Hd16CwunsTqYvkD6uT5F/
         bjOOfJYgtpNU8pJUZJ7UszlBBcD4d3xYvry/SwGtAjJ3qvziXH4KP0VVVedxbwdwSrcU
         GEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
        b=MoOTPDKBM09YE63ImmkqUy98kgwbIIQj77BzGOSikqnxsASqlF/R8Kx/XfCxf81LzS
         KeeUB8g1VwZe623acPrbY9Syl6Ctp8qAuYnaoZfo1i09oQUthC4KOQLzKmRO1dudzVVo
         G4CZ5K2kor9c0SK0awQGh8CD0AOO/ClKFYuvWnEWj2bLBkIVxJ7uklM8xD9ONHfVnNle
         QiII8B3gU+fYz/mPYnsV6/7xq8NSgssnCAAcKrUXY2rdyyp4S25kJLwn4pejRvOvD52x
         a1yIkVTmyqDwGgOCeL0ehYrpbhITdNFhGuspSR3C/Qg26kyUz26KBvM/gCFjxqO4CTr6
         e06w==
X-Gm-Message-State: AO0yUKV6YiVDqFDMEGCScbBLVCRr0aBrqcphxxNQ/T9sGVLOzmDY8OX/
        goBb6nLVthJJxLMnIgGTUBKy5w==
X-Google-Smtp-Source: AK7set/Lwi2oRtEhoyh0s/pn3Ir/pDDlrC9uHQ3mKp/cOEYua7CbBrrd8ScfVeHuVX+8SXEqEvUyDw==
X-Received: by 2002:ac2:5238:0:b0:4de:7a23:23e2 with SMTP id i24-20020ac25238000000b004de7a2323e2mr497618lfl.21.1677848257487;
        Fri, 03 Mar 2023 04:57:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 17/30] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Fri,  3 Mar 2023 14:57:12 +0200
Message-Id: <20230303125725.3695011-18-dmitry.baryshkov@linaro.org>
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
index bd09bb319a58..73e1a8c69ef0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1132,11 +1132,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1147,7 +1145,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1157,13 +1154,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -1176,15 +1169,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.39.2

