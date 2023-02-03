Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8984B68A198
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjBCSVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbjBCSVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:21:49 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2687A9D4D
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:42 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id k4so17740144eje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdAjZqjdCk8IsJ8MvPndY+/TqkEcmwAepofIV5H7WHE=;
        b=lj8E+6EDP4r2gDg10oCwr61RHidXl3wgi6jNtdPFYRVO9PhP95a4klhhK+9auIjRwt
         E5qzA8DX4BlsfZCj/Sq/v0hfAKgTxZI+UL3zvN0MqLI1SCfACRODdMkWyh0vQFW8gUDd
         tJBoJCUPKjywinYLmCB4v8pTUfsnqUNoD70CrxnVgZHPhH0UqERq/6V7W4b7n/2oZef3
         lkhKXpTacq7X2RuG2DjJBuhdXELI453uvKVb/I96V0rKj24hOCDAkCzDHEYH//dV3HhG
         mZPmCnQDTPaMw+k+m1F2D4DvSdfHHLdthdTQt9FPwaQLqs28JKv2Jn6SjLP1fOuIsrDL
         j6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdAjZqjdCk8IsJ8MvPndY+/TqkEcmwAepofIV5H7WHE=;
        b=lDOpH3kiKV68j2JQO2NCY0sb0FSfRn7clsA2PvgUnrtGQ9llYFhGBgTeVwhImSCPOi
         AnZTaw35NHa7tRGmDITmWpl9eM8qmZ/4xj/NBaRGevWnqP8WBLU8Qn1rddx3StlsLyMA
         FVschvJlRVkr+g+25t9iafEgadmzpO1JE0kBUbXPTjvy7H+drorkEg31/AewTd6xiJGH
         sXn5K9qZN1ZW5/mB1YywH/Jhn8qvj3GKGy25yzd8/HoATo5ytb8G4MuAjTJIgA4c6UtY
         y+Y8k43NJQuNkG8CutDW0+c8R+wwcDWBwDWlSpgtK+JmnBCkSlTam2V3x49GAd9gMIi2
         0+pw==
X-Gm-Message-State: AO0yUKXc+u1es7nJmQgYazK5Kpldj/rwMj4aQZ7aRPDzDRlw6EEj6LHg
        heGZh2LkKeCv6KpX6jIA5mEkWA==
X-Google-Smtp-Source: AK7set9W4+AKVTeF5PU2JXLGWKFhy8+iTWpR9Rmja84paXqvElQrYAYorj4oj2DB02D9uxpVG78BYQ==
X-Received: by 2002:a17:906:9610:b0:878:68e5:e52b with SMTP id s16-20020a170906961000b0087868e5e52bmr12353192ejx.66.1675448501323;
        Fri, 03 Feb 2023 10:21:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 06/27] drm/msm/dpu: drop dpu_plane_pipe function
Date:   Fri,  3 Feb 2023 20:21:11 +0200
Message-Id: <20230203182132.1307834-7-dmitry.baryshkov@linaro.org>
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
index 9eac02f53fc1..c2b34d97e065 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1441,11 +1441,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
2.39.1

