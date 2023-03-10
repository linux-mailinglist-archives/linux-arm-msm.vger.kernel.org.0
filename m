Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1726B3319
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCJA5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCJA5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:31 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58FE104F6D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:21 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id r27so4588572lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
        b=CaFAyksnb4aTVYmTDsi9WknBWgUb9e0lLntjjfhRUNJQncZpdG63EXM3HeJ++t1f/4
         N6EbKkALoI02VePtZ/Dea45wsDLaRf+w2fBThOgArBkHl8yD/YrCdg5Yq8Nqn0bq10uA
         mN6MChtowbBVkIRou976NUdP+4RGPI5IpdS68qIu5Zz/ruQlY1HaPnKXfvU4zkvMLRue
         PJpz6jkoVWY6HNMf4sI1h7O2IsZq09WSf/aTIfKt0dTWr/uz4L0wMOBIb/wI+p4NM6V/
         xKxs1q4c9ResO/h0oJ38FRBVrFSW9MxnbtaW1hMX99T6fhST6yxhMGmxnVwhw6o+WjDu
         V7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBLqAmXU8RzuNTFCSMX95oVYpDr4yOBGu5atcgyyNsY=;
        b=LT+IuvSIaLQH/WlycqSfw4ahGYmwBXcw4/tGyuQ6XoHjLXGcelpY2qNkVPui/kqUaU
         TQVsP7YE2uPBiL/G+2ieNxNImG2kZzM04czQ7s5tvcexTB6YG3NSGeC5LgbILxv82c/0
         LYaFW/E7aw5jg+yCk2yU12nJ8ljTJRRfCj0jS1GwLVKl2lE/Jzqy3+7+vTZGTRfL+ozk
         EZ02N1uGp2lFXmIvjqCK3Yh3WTKp9XUs/Sep6R35K/kJwSgghEp7VBGgt5YTmnpLcCV1
         ckNNWwUUK0JQxt+hLAY6ov/neDsJ5jzm8+gYFo52nVAsxNI/sssPeQpWJ9JaEgE90sJG
         6sCw==
X-Gm-Message-State: AO0yUKW2XzTKMnTulb0tHORIoy1lYc0PUm0t/6R32ycioMt99HBz6jPH
        rmRk+tB29xVo+ETIUMmUjXnmbg==
X-Google-Smtp-Source: AK7set/le58+zbePIqG5gUp3TEawauabxQdBSjERPgQ4IXdzH9ob/VnXNG/ObwBuwQqBAfl5qTcFxg==
X-Received: by 2002:a19:ad46:0:b0:4d5:c96f:f7c7 with SMTP id s6-20020a19ad46000000b004d5c96ff7c7mr6455687lfd.23.1678409841350;
        Thu, 09 Mar 2023 16:57:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 17/32] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Fri, 10 Mar 2023 02:56:49 +0200
Message-Id: <20230310005704.1332368-18-dmitry.baryshkov@linaro.org>
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

