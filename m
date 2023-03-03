Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4AC46A97BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjCCM5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjCCM5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:34 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09EF5F508
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:31 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id s20so3417871lfb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWF5ZM6PaVPWATZwb/4bc8LqWxYGoR6BESuDzLzJXaI=;
        b=ileqTMPoX8GUOZIB4MquD0YcxWL0/sYT80/+5sl15kn0yRR19AXT5yKV5T0lFjDgIV
         vL8HnoYL1BMZQ1h1sd314dS2ZhK4pftfiEgxV4HqVDDBFEHXpsFiXiEaLogI1ZtXZam5
         IYVZAR931r6/SG3so3XicYUIRGez3at1C/gG5dyxp9QP2Y+8aSSzSe6KLhQ7VaBbNO+Z
         xXJnDWN9u1hEWTlQVIJYdGHXph31MiJW4jPeKORZp3jgpzFQHL9dBDLN74mue2Bujg25
         MKepcCFdu+ENgdHSFe534B13dkHfwZ57cMao4YR30uP/g1/mlJ8cSPs3BytTZM0gqtHV
         Bg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWF5ZM6PaVPWATZwb/4bc8LqWxYGoR6BESuDzLzJXaI=;
        b=UruT05ZAggyfqGtt3JNX7C+F2XOx/440tfdf/zXRmD+2UUW56O6MHo4fyg1/0KjPbl
         sVl0CpaJg4GY/OKpMqtVXaoS7+kOqX5Vu/oJ+Qt2n1U6/5mFao3S3zm/lYttnt/R0gcS
         m1aKqMqy+XkogaK9maudu5pBvnYcm9Ip1jR4+VW3/4D/yHtf/NgTHjzlMhGIwWYCojWV
         eopCE8PcjkWBNqRofVYqDP5/DUoSwn/UF7gTmKBCMjLeUno5UCFTbaqUvG0zUwp6GKY3
         0KfGlIY/pLYuAshRfpKpnNu4Zl7cLxjMc++emoJoZKBUOGk3S5HoW5SPccOmd7+pp9Xb
         SM0w==
X-Gm-Message-State: AO0yUKWJMZC4CqmwakXV4Q3bnSeX0KyF5natBeIKvhpXT3/0ehJopHJH
        6JisXaqtDhHYB3xK7Unp+Z+3Yg==
X-Google-Smtp-Source: AK7set/dUVWRS/xsRHnmqafxrp0axBurleYnzNMKyD9qByFdAHfsL9P7barVBK9Pz4PeO6lpgJbTcA==
X-Received: by 2002:ac2:51ac:0:b0:4db:6a0f:176d with SMTP id f12-20020ac251ac000000b004db6a0f176dmr582833lfk.35.1677848250080;
        Fri, 03 Mar 2023 04:57:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 06/30] drm/msm/dpu: drop dpu_plane_pipe function
Date:   Fri,  3 Mar 2023 14:57:01 +0200
Message-Id: <20230303125725.3695011-7-dmitry.baryshkov@linaro.org>
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

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f29a339a3705..eff1a3cc1cec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -431,7 +431,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->hw_sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1202,7 +1202,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->hw_sspp->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 546629232e3d..10678f6502a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1442,11 +1442,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 08a4b6a99f51..25e261cabadc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -59,13 +59,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.39.2

