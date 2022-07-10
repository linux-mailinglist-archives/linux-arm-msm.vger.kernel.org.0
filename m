Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8CC56D0CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 20:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiGJSpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 14:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGJSpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 14:45:45 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121B3BC3E
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r9so3945933ljp.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
        b=VM59dWdakzh5XQwNICK6kXEEo+YWwiCVy9JGbP2JY5W6Y0kvU1OHuBZJBMFg2Hvce5
         c7FxYxH1HATW4UfDyk5KLRqgWx94ckF7ge1rihrl/atMrsUo2R4q8tEwC2JgOXgiGw2Z
         cuOTpgg1JRo8fStkzOMwcl1mLNHkR2YFO/yhiD0ZsyVxv/xeWD3bcge4mpFZ91SLib2V
         5tDd8W6ESihmQKkDYyxw4GERoPV4u5L+0njRB0htab1ioKOLxk8SsvwhACYGXyA8vBFs
         WqS+PcxOp2Z4LMD4tY4a7vqlMcHwa28YyNeLPuJsHuxPrqPjj9unesNAyZQrWJjG+y4S
         OXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
        b=eENmD/KM9/79v2FrPf1jQf5DTf4Biqg9j0LY1Syt4bph1Vkc+FH7ytuGEK1KDMLhuP
         Z4+VdEagFhjfwXWN5i/UOQ37C9Vb/lNSjH0UfCZ2mPr+RWT8bsj2Q1V9F2NnYkgnKinq
         6gRFDwQ5NCiRaUm0mBDys09PKpIaubrUaAbdnlxgkJsCegeJMVi8ipe4mjZZ6UgGVwSr
         AYi9j8vOEDwJmshDMYQYzpRt4E5eQfJGLEW7V2yxPfN3+L9vWaYmY40SUS70dXrehdX1
         t/5HL6FzVge2Osg4FCL80iMOgWB/UO25nr3Kl+xxymkvHBh2zBl6NUiYsn0NlvibbKf0
         LLNw==
X-Gm-Message-State: AJIora/VAsYfFDYcSuTVl7wpZHBVQfD5/yjlv8QVgAgIhRipY8bU7+4f
        8/+znhfvfb04/CmioHnCxurtzQ==
X-Google-Smtp-Source: AGRyM1vc2XvQcEV3NW4pR+bqJctZPGBZRBAOO5hfwQBC6CMtGP22NXTaB+XZ0SdndD67zQAcAfdasw==
X-Received: by 2002:a05:651c:508:b0:25b:b0e4:8a0f with SMTP id o8-20020a05651c050800b0025bb0e48a0fmr8063260ljp.72.1657478740219;
        Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 11:45:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
Date:   Sun, 10 Jul 2022 21:45:34 +0300
Message-Id: <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
/ atomic_post_disable rather than their non-atomic versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8cad662de9bb..01171547f638 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void ti_sn_bridge_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	return ret;
 }
 
-static void ti_sn_bridge_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	const char *last_err_str = "No supported DP rate";
@@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   VSTREAM_ENABLE);
 }
 
-static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(100, 110);
 }
 
-static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.pre_enable = ti_sn_bridge_pre_enable,
-	.enable = ti_sn_bridge_enable,
-	.disable = ti_sn_bridge_disable,
-	.post_disable = ti_sn_bridge_post_disable,
+	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
+	.atomic_enable = ti_sn_bridge_atomic_enable,
+	.atomic_disable = ti_sn_bridge_atomic_disable,
+	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-- 
2.35.1

