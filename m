Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E9356D6EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiGKHhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGKHhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:37:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B631B78E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 19so5203126ljz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dc4rotN4lsGihoKvx42bgACRBbWX/9esGWqGMpo4noo=;
        b=fYNK42UcQvk8G2IF6qbCNf8x7eIqibPMaTQb8N55COpoyAclNkWsLDID8UvtSeN2S+
         lJlJKbtmdMHa9gGdHr6D/kzfaM/7lZyaPlx27JDC2WwVfzEW33pDpQNp1m3DSMjEf3nb
         AefNRP7YDFmju9eWA0W8b71jCerSRaEyH2lyuduoPvtoP2aM+U9zoFylnuBg3YtZ6ccO
         eqqlpIRvTn5IhLV2kJHvlj91PfKTsExg4oZkWIeNEb+ACzEDgY+9xSxPPsgxDXAH6QYn
         fzbIwDR4o+t5lj/QxOrhiovW13zQIFRECKaQpD/fepidWwJ/TE1qGDfp9fYDi2RAZ/+9
         hnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dc4rotN4lsGihoKvx42bgACRBbWX/9esGWqGMpo4noo=;
        b=CVr2F5veUnyl7qMZCLCZJUfCWyO+utO4huaO6c3p6vxKEAzn3XZEEC7BbyN6FiXbaz
         7UWAThxgAwBM+1daWrgzMt3+Lco1stfW7MJgHRvcfJG5bYKabfsBpCLiKB9+sI76qS8O
         rJ4XS2m0+kXtPrLCUQEl7lmN48NVZfOeR7ldoYPrDbI0LE342HqQEz0y96CRWCrIMYG5
         GElifbOkq3LC9utdCzUBjIpBslXcbchKRdBCR5kbTgiDqVCZEBij4PKNHO9PxiEunvQU
         0YeBaz6BBPEHlIlPZMmu6JJe3GS1E4eqpu+HJMH0uu7vK63dptPegDMIORS1YoVvb8ob
         HsJg==
X-Gm-Message-State: AJIora+NpxwziaLacmgYRBrGg/DAUgTsnt1SZae+Roglh3fKW2Adl/xo
        X/lDZuhoCgVuaJJLqqeTNdZuXA==
X-Google-Smtp-Source: AGRyM1vkRPiWM1uAzQxDdmEkxv3Xrh8JvIQKC9SSrOPz4+1O/UBwI03NkivvvQgyjkp2xp6PB/nBvg==
X-Received: by 2002:a2e:bc27:0:b0:25b:c3b8:dada with SMTP id b39-20020a2ebc27000000b0025bc3b8dadamr9969163ljf.356.1657525055695;
        Mon, 11 Jul 2022 00:37:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:37:35 -0700 (PDT)
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
Subject: [RFC PATCH v2 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
Date:   Mon, 11 Jul 2022 10:37:32 +0300
Message-Id: <20220711073733.312266-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
References: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
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
index d6dd4d99a229..b1b6ed3a8acc 100644
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
+		DRM_DEV_ERROR_RATELIMITED(pdata->dev, "Could not get the connector\n");
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

