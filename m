Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6DB56FC64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 11:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiGKJnH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 05:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbiGKJme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 05:42:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA3E9CE11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o7so7664890lfq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lEoHF2v0PX/fIfTfKOqb0NXLZqpW7zXe7d29Ck/4+hU=;
        b=a4cm5xJTZysLnWxzCO8MARIg/kld2UYU2RdsR5SY/D4cMWV8wbDxMgWT0F2ljj4bK6
         vht9uDS820ctNseWbo2eGPY108KJIb0SeOyRj/2UZF/rd6W21wUVHDrMF/KImzcnYwYK
         Uc+Ir2iXkM31SK7Skukt0Sc8umgjITXFjbe+OD5/82XavvsT+iRUrUxrCI3geXPsTgHt
         CeNVM24Fvau2I3soPxfnWSAdIdf9uEpnA71MHA6e1ek7a8rv9zoGXhcZ0yByX2/MvIX6
         j1h5/XKgt/dwzNHLtLwgrBXg+NI9fX+NxQR3p20w7DUY6R8RZ8vy7o0Hq7UTdKAG2JQ0
         mfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lEoHF2v0PX/fIfTfKOqb0NXLZqpW7zXe7d29Ck/4+hU=;
        b=w1fO/H0I0lheH8tUoY1f09Pv+jfbJng0ds3+lvmw3xM60I8y9OIi0/FIgPSuQntXrj
         iW1LV92iiywu/nMcbMZFN9ejgoalR3DpLXFg1np310bjK9dF8MMfSM4HRZgPu+HTJN7D
         1QMwgitvuQ0oXVYqVqGf2Vp2JSechyp7vEoFqiXkuBbz4Qi+elvdAXQkraBVzzZLvM14
         tXMODyjvc1d29d6lEcADo7oUfbnrEfs42CgfqmLsIRqrSpMIOmHVwZfx47YM5eQpeYq+
         qYem71jnhy+V7Zv87U9hGeUOGsGprNbxV/+la6ob8c3aI7gjIsdW5Qr7j04oYR5xwwMd
         pvnQ==
X-Gm-Message-State: AJIora8JPFiH706FZyyZfboFwRB78NeGaJ+unKNidUOmiPMQQVsHZHsc
        UN9nCdQ63SSU4yMHx6Gk3UKyCQ==
X-Google-Smtp-Source: AGRyM1vnfARdYDwEG4AiyBLBkhhymEiY5akfVrHZCklBDpFrgciS0YmfHmTCCm6kL+RqejcaUtV4Og==
X-Received: by 2002:a05:6512:2302:b0:489:da47:6a90 with SMTP id o2-20020a056512230200b00489da476a90mr3967483lfu.12.1657531279199;
        Mon, 11 Jul 2022 02:21:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c30-20020a05651200de00b00473c87152bcsm1434195lfp.127.2022.07.11.02.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:21:18 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
Date:   Mon, 11 Jul 2022 12:21:16 +0300
Message-Id: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
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

Rather than reading the pdata->connector directly, fetch the connector
using drm_atomic_state. This allows us to make pdata->connector optional
(and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d6dd4d99a229..b362a7bf4d97 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
-static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
+static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
 {
-	if (pdata->connector->display_info.bpc <= 6)
+	if (connector->display_info.bpc <= 6)
 		return 18;
 	else
 		return 24;
@@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
@@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
 
 	/* Calculate minimum bit rate based on our pixel clock. */
-	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
+	bit_rate_khz = mode->clock * bpp;
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
 	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
@@ -1016,12 +1016,21 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct drm_connector *connector;
 	const char *last_err_str = "No supported DP rate";
 	unsigned int valid_rates;
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
 	int max_dp_lanes;
+	unsigned int bpp;
+
+	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
+							     bridge->encoder);
+	if (!connector) {
+		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
+		return;
+	}
 
 	max_dp_lanes = ti_sn_get_max_lanes(pdata);
 	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
@@ -1047,8 +1056,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
 			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
 
+	bpp = ti_sn_bridge_get_bpp(connector);
 	/* Set the DP output format (18 bpp or 24 bpp) */
-	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	val = bpp == 18 ? BPP_18_RGB : 0;
 	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
 
 	/* DP lane config */
@@ -1059,7 +1069,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
-- 
2.35.1

