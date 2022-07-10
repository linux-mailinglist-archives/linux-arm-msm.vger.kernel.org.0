Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3427B56D0CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 20:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiGJSpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 14:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiGJSpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 14:45:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37152BF60
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d12so5459223lfq.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nnp1mrs/Of0t/9cEF28am0OHlHeknBHuzCICWh/E4/A=;
        b=JuVQrtOCfc62LJj9U6JMkApfcd0dUCLZTiMpMluGxMmSdhb8rgv7G7vTkdtBrkhoDF
         rYy0oAt7LwjaCj0Aisp5GwwzLh71f1HQWMhtnilZoVcqSIicy/SJuvX2i5Riw4I5C0+R
         ntmUN2nixGdz93LwCAS90HMS+GxvkqX51oCiPh9sgCmJWKhLLBtGgE7mYADfFneOL8SD
         O4I9YtRhDkoJOK6nUSloyXWhCqwW6rcRuUFBI+f/g2PBrpHzjPB+tTpGDdAVFYxj0tSl
         wBH5qIa4mqCc3/sXRjKcY3jAqXdo6lpw8UZaJ+IxuG/1b/D2xOVSiJ8SiA5uZyYUyqmC
         eIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nnp1mrs/Of0t/9cEF28am0OHlHeknBHuzCICWh/E4/A=;
        b=BaGJGf6VpWRZ/qNHorTkwnFtvAHj6ucymEYm4HgScZSKivoNgdFH2yfOoXqaTiGPNg
         SB+MSnnrPvgCOwvRx0P+rzBxnM8V8IRlyliKMgOor34JLeDIq4xZDe0o+D1vgy6rvh/2
         tCJQ5LlBkhZnTTB58IsQLvycLc3yOKo7MJ60Z1EyzU7Ddm/NA0XPco4kv48ydT+nJjxU
         5n5NA8XSIGq7GfqsTmjnLOwTsWjHHAIROe9slV7QUof43A5SPetM3p+zNqOlkWxBvv4F
         evneM9lov618krK41OzG18kBkaWslmRF+zcT/WRA81vdOpGIMbVOysiKemg3OrnJ8jAd
         yf5w==
X-Gm-Message-State: AJIora/cPHRT3Dmr0zxNe/IpHaHJwktmGdskcvtW2xqWbDd+NNQvty5i
        ziTw2aBxDLz/dMVY1L9jfS7MGw==
X-Google-Smtp-Source: AGRyM1vUwAt+NGr3Nq0llhahT8pCS5vuJoyhMe3KCbS8MWMSHCV/JlLzwTBY4EoDay0SZrJc10gLhQ==
X-Received: by 2002:a05:6512:ac3:b0:487:f32:90ca with SMTP id n3-20020a0565120ac300b004870f3290camr8952037lfu.360.1657478741523;
        Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
Date:   Sun, 10 Jul 2022 21:45:35 +0300
Message-Id: <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
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

Rather than reading the pdata->connector directly, fetch the connector
using drm_atomic_state. This allows us to make pdata->connector optional
(and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 01171547f638..df08207d6223 100644
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
@@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
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
+	if (!connector)
+		return;
 
 	max_dp_lanes = ti_sn_get_max_lanes(pdata);
 	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
@@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
 			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
 
+	bpp = ti_sn_bridge_get_bpp(connector);
 	/* Set the DP output format (18 bpp or 24 bpp) */
-	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
+	val = (bpp == 18) ? BPP_18_RGB : 0;
 	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
 
 	/* DP lane config */
@@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
-- 
2.35.1

