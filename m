Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73E91D877B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgERSrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgERSri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:47:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C55BC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:47:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k22so4592926pls.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fI9/Coy2jHU24hv3APejJ/BFCoipYPisETaqwXZO4ww=;
        b=Wx0bS0ptDbThH06HCY0b1DBY2CcuHMoNlOElrVm8xW7XiC+ldEXxJH8tuZKYr9nHut
         XrzWPXrLPMmTRrsYhiO6C97bnWtz5QJubocZPZmSynQkozHiwSQJ9u8CcWZcho2f8V2M
         NncIB27kIHIR7LNvbIuihEXs2fQgdx8pnEYlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fI9/Coy2jHU24hv3APejJ/BFCoipYPisETaqwXZO4ww=;
        b=EcMovjZ3OgKNS3L3RaDEBOOzvAFH+4uEgrG8713HYLHA+Q9Z6FKQO5QvsdGytmLqT0
         2q7K3PtbwPyQ2Qc9/6Asu0nE+dtyQYB2992k46eL1bataQQmoaLzXWUIk1yoWrLW1a7J
         AERCOYqw4Chxcx9lIT91pCmvppXOwPs4jQSGiSM7GLBdaFiMaz8Cxbuq0j+G3bJgMduj
         gU0Cck25y4gjORJPGSb5jlnlZjJFxPtGrLi9nao3oUvXsbadjdk+O5yPGc0qDi0h0lRr
         eF7iQW2h3Fe9bfDYFbToL6+s0bZVMwHOyOlTl0FrrdB3anKsz+xNVlhOIHOsJ4nmnP13
         Y4xA==
X-Gm-Message-State: AOAM531wwlKRelXG0mR9xxruwsu5swr2kJi04jIJ8Sg2XKEDu7JRuNoZ
        BxPh/lvBXf+KMmSKUZYsxrCc0w==
X-Google-Smtp-Source: ABdhPJzq4lauJpJkoub5/jaKiCGMylfupnMDHNkDWGZnlKDqbU8PYXnVGgLx0sxltYZyEvgnmNutQQ==
X-Received: by 2002:a17:90a:ee85:: with SMTP id i5mr767777pjz.165.1589827658054;
        Mon, 18 May 2020 11:47:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s136sm9302719pfc.29.2020.05.18.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:47:37 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Sam Ravnborg <sam@ravnborg.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, seanpaul@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [REPOST PATCH v2] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
Date:   Mon, 18 May 2020 11:47:17 -0700
Message-Id: <20200518114656.REPOST.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
remapping of eDP lanes and also polarity inversion.  Both of these
features have been described in the device tree bindings for the
device since the beginning but were never implemented in the driver.
Implement both of them.

Part of this change also allows you to (via the same device tree
bindings) specify to use fewer than the max number of DP lanes that
the panel reports.  This could be useful if your display supports more
lanes but only a few are hooked up on your board.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
Re-posting patch v2, patch #1.  I added tags and put Sam in the "To"
list.  Patch #2 was dropped since it was squashed elsewhere.  This now
applies to the top of drm-misc-next.

Changes in v2:
- Use SN_MAX_DP_LANES instead of 4 in one place.
- Comment that we aren't doing full validation of dts params.
- Check dp_lanes <= SN_MAX_DP_LANES to avoid buffer overrun.
- Add missing of_node_put()

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1855fb9f09f2..2240e9973178 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -50,8 +50,12 @@
 #define SN_CHA_VERTICAL_BACK_PORCH_REG		0x36
 #define SN_CHA_HORIZONTAL_FRONT_PORCH_REG	0x38
 #define SN_CHA_VERTICAL_FRONT_PORCH_REG		0x3A
+#define SN_LN_ASSIGN_REG			0x59
+#define  LN_ASSIGN_WIDTH			2
 #define SN_ENH_FRAME_REG			0x5A
 #define  VSTREAM_ENABLE				BIT(3)
+#define  LN_POLRS_OFFSET			4
+#define  LN_POLRS_MASK				0xf0
 #define SN_DATA_FORMAT_REG			0x5B
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
@@ -98,6 +102,7 @@
 
 #define SN_REGULATOR_SUPPLY_NUM		4
 
+#define SN_MAX_DP_LANES			4
 #define SN_NUM_GPIOS			4
 #define SN_GPIO_PHYSICAL_OFFSET		1
 
@@ -116,6 +121,8 @@
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
+ * @ln_assign:    Value to program to the LN_ASSIGN register.
+ * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -141,6 +148,8 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	u8				ln_assign;
+	u8				ln_polrs;
 
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
@@ -708,26 +717,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
+	int max_dp_lanes;
 
-	/*
-	 * Run with the maximum number of lanes that the DP sink supports.
-	 *
-	 * Depending use cases, we might want to revisit this later because:
-	 * - It's plausible that someone may have run fewer lines to the
-	 *   sink than the sink actually supports, assuming that the lines
-	 *   will just be driven at a higher rate.
-	 * - The DP spec seems to indicate that it's more important to minimize
-	 *   the number of lanes than the link rate.
-	 *
-	 * If we do revisit, it would be important to measure the power impact.
-	 */
-	pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
+	max_dp_lanes = ti_sn_get_max_lanes(pdata);
+	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
 
 	/* DSI_A lane config */
-	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
+	val = CHA_DSI_LANES(SN_MAX_DP_LANES - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
+	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
+			   pdata->ln_polrs << LN_POLRS_OFFSET);
+
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
@@ -1089,6 +1092,55 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 	return ret;
 }
 
+static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
+				     struct device_node *np)
+{
+	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
+	u32 lane_polarities[SN_MAX_DP_LANES] = { };
+	struct device_node *endpoint;
+	u8 ln_assign = 0;
+	u8 ln_polrs = 0;
+	int dp_lanes;
+	int i;
+
+	/*
+	 * Read config from the device tree about lane remapping and lane
+	 * polarities.  These are optional and we assume identity map and
+	 * normal polarity if nothing is specified.  It's OK to specify just
+	 * data-lanes but not lane-polarities but not vice versa.
+	 *
+	 * Error checking is light (we just make sure we don't crash or
+	 * buffer overrun) and we assume dts is well formed and specifying
+	 * mappings that the hardware supports.
+	 */
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
+	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
+		of_property_read_u32_array(endpoint, "data-lanes",
+					   lane_assignments, dp_lanes);
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, dp_lanes);
+	} else {
+		dp_lanes = SN_MAX_DP_LANES;
+	}
+	of_node_put(endpoint);
+
+	/*
+	 * Convert into register format.  Loop over all lanes even if
+	 * data-lanes had fewer elements so that we nicely initialize
+	 * the LN_ASSIGN register.
+	 */
+	for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
+		ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
+		ln_polrs = ln_polrs << 1 | lane_polarities[i];
+	}
+
+	/* Stash in our struct for when we power on */
+	pdata->dp_lanes = dp_lanes;
+	pdata->ln_assign = ln_assign;
+	pdata->ln_polrs = ln_polrs;
+}
+
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1131,6 +1183,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.2.761.g0e0b3e54be-goog

