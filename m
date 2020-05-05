Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A591C4D51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 06:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEEEgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 00:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725298AbgEEEgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 00:36:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D25FC061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 21:36:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id y6so473472pjc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 21:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SV7znDZj2vF4BeN0SiN5TJYiEnDS4XivioQXZuhPh4=;
        b=ZEc0NLi+aIin3AkXRZkeRQiRk+TDNUOj+x0/5O8flev1STCDQPJJkGggnbnTCqvmzS
         JlVjr/g8Fqe4TQk4cKCwLIYXy9a+52E1PDvnarr4WIv3og9DnjkNJF2UIRJolwh8LdMV
         6mwlQLx9M9+pGlIvYSi8HhGifl9O7pNlhtzus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SV7znDZj2vF4BeN0SiN5TJYiEnDS4XivioQXZuhPh4=;
        b=XB5d3CeQa+lyVDe6u0PqB7zaTnfrgldZMtp2xxtNPFFTNyCQEiLjQDFBJueIIhRX05
         2meZg8wouA2/RB5x4YXxbrrKAfA/zjEmcrBGAI3V1gxrg8UXxoj93SnVPjgwTzLW+DgC
         BA2v8ZTFS7TBBMdKluoujkexfv8gKkAqZtKSl6zvSz67kAbK3VIqome8hlS6aOzNNY3N
         SB39BzSbEObxR8lwdxyXTy85ZrF+wyP/AdLpsPpAIBYcxdYV7wK6TEwRr2bnWAeU0hLf
         8weUfwMMPkKbPQ8tqKHTBF4EzPmC/eTrEVJXqzZggfCBWHkzUAj68pmgYd+80icl+1M9
         LqNg==
X-Gm-Message-State: AGi0PuYPrE1tcIKz4z+Y09VjztA57Vz8yUXa4oSXCA2tLmpsuKu2gxQ1
        kU89rzfjYr6ZVOHuHcKU8ihMoQ==
X-Google-Smtp-Source: APiQypK7/7dCJWi/+VDQPv2P2H8cAIhUXPt/t/i3OjRNUYr04IY9RxCToT3JAyvI4LekDwb/sBvkCQ==
X-Received: by 2002:a17:90a:d0c3:: with SMTP id y3mr593880pjw.133.1588653409714;
        Mon, 04 May 2020 21:36:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p189sm658871pfp.135.2020.05.04.21.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 21:36:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     robdclark@chromium.org, seanpaul@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
Date:   Mon,  4 May 2020 21:36:31 -0700
Message-Id: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
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
---
This patch is based upon my my outstanding series[1] not because there
is any real requirement but simply to avoid merge conflicts.  I
believe that my previous series is ready to land.  If, however, you'd
prefer that I rebase this patch somewhere atop something else then
please shout.

[1] https://lore.kernel.org/r/20200430194617.197510-1-dianders@chromium.org

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 ++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1a125423eb07..52cca54b525f 100644
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
 
 /**
@@ -115,6 +120,8 @@
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
+ * @ln_assign:    Value to program to the LN_ASSIGN register.
+ * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -140,6 +147,8 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	u8				ln_assign;
+	u8				ln_polrs;
 
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
@@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
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
 	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
+	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
+	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
+			   pdata->ln_polrs << LN_POLRS_OFFSET);
+
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
@@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
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
+	 */
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
+	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (dp_lanes > 0) {
+		of_property_read_u32_array(endpoint, "data-lanes",
+					   lane_assignments, dp_lanes);
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, dp_lanes);
+	} else {
+		dp_lanes = SN_MAX_DP_LANES;
+	}
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
@@ -1105,6 +1152,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.2.526.g744177e7f7-goog

