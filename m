Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78C068A1AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbjBCSWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:22:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbjBCSV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:21:59 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511F7ADB86
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cw4so5963706edb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLjB4fe2WH6m4QlIgHE+KTmJ7zI/7W9ZvUxPoBOneF8=;
        b=Yr/3M1vu/8VBeqErydiYMk24+I81IzaVZ96eO+y3BeFbv5L9sGobhfVJC3wR3t7mfA
         DMU91TjsUjnYLVjgeuBoghNV5zC7pwLnq776crpu7HlLoPgj/25IRFP3g97c3RRmHSqC
         jchUxJEUJhawYGFOFcPyILUae9Kp3ufI5kIr+R+J6PLOrXVKgdViNBaVn9tdjf4YwOpe
         o8aMZwmQB8fI87KHTLVARf5zs0gHVIMkJQ+e9Qoq20ONvrsYOdbIKYVYuQJXfbo4Ka6H
         BtUs5ZAROXOWOY4K02WQMf7j962AHnOMyF2R5Wtoe9G1KSc+H7pm8nYKG9wkyYhYf9am
         MqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLjB4fe2WH6m4QlIgHE+KTmJ7zI/7W9ZvUxPoBOneF8=;
        b=LMwC1HYbMQlRZJu/K38nNHaWOHSHMNlnY89S4UKgYUX0jMosb5iVaKjVKmXJ5YZ4Wb
         5OyK+yYjDw5/KGi8pm/84n0FBQZLVauGTMP5QPsLVw36HjUGchtpEtP1fl8XxWLks0wv
         M7bqE7aHRsk6YIf6D9GbSQRszq3Zrerjxy3JHngQRULwCm4F2JKgTo/w5AtTB9pUEsw8
         ptZaD0toCc+4dpUAYXgfPM2E8Xi7OeooPi/tawcCdifWtbchjV3id8CCSr1c7t4CMAu8
         8r/E+P/bOcGtB65OaKjY/kS05SE/fDmCwKooWaumU684TtoIuL4uyjH8jhFjeT7u2z+4
         9hyg==
X-Gm-Message-State: AO0yUKUPg3c1ZYFO2zLjjg/hLtKsQBWdrKnULwt/2YPRLvJl5j8WZey5
        kAW0MfTtzkWLYAwW/OO2b466Ug==
X-Google-Smtp-Source: AK7set+pvqs++yjPKPLcQ4c2mRwP93ue2xaxfyiOH8Ly9OcR0kjoz80K59fb6du8M+CPwHhT5YBFPw==
X-Received: by 2002:aa7:d857:0:b0:4a2:71eb:b1e6 with SMTP id f23-20020aa7d857000000b004a271ebb1e6mr10240831eds.30.1675448512955;
        Fri, 03 Feb 2023 10:21:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 16/27] drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_check()
Date:   Fri,  3 Feb 2023 20:21:21 +0200
Message-Id: <20230203182132.1307834-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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
2.39.1

