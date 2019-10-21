Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2C1DF4CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 20:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfJUSFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 14:05:39 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35673 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfJUSFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 14:05:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so8905322pfw.2;
        Mon, 21 Oct 2019 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tcCpwL0onfR06sWsqvX6mF6jQdr+eQVyW0yto6K7hG4=;
        b=JYurzqC/VqEbhO/X3sS6Q14PnepMCPoiZ5ZXdzu6bk5bYu5tB0nwyEFf3Zya4K1jp5
         RqpNk7QJQQvThq3Utlro5P6uUs2R2uWwYRFPDlFmtgqmboFh9oo1noVBDxfk0vAjNLNC
         HsIAaGynDWSXQWeBRwtBQQaIJGc8TdmbzmFxNO867q5hrGPNUB6Of6PqbX1etW1fzW3L
         qojXAc9r70oZX68lQsvFBoS03JHH6WQBaMEl1IoPX2BhpyEX2+Uayv0gUbJc0iwWZkr0
         LZ4jDN6ChgAt29dhn7RVuetRAsNkEzSlYpgJfIrUpiCIee45Y4mvku80XdPSGOQKArr0
         w4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tcCpwL0onfR06sWsqvX6mF6jQdr+eQVyW0yto6K7hG4=;
        b=TSjSpA/99peGINwZbh1tIY/Sj0PmUD+sQjRWSIm4ZJmgAT/lCnGOhlvUBDrUFoznus
         b04EHvmM9aitnOoEIZKP1Bk/Ap2qfD4h0x4XtJfEhfJTVbbPU5FNyIroDgHyqSEm+48j
         o7y3MqdF5WwDtuXzGxgYXIx5Uuku+3mBkfaYM2jbvl/JPSvKE4uv/eZdHcBrWSNnl9Y8
         S+KnJs/hcQT7Y18CHTcgQzCHllAIbB9tQ1vlqhTx7/Cf8/m76ZqJeL90fxBxNRJVMPs9
         WOY5FVb/5PHJC7DydgVrQ+A2XU5qE8qKDuKj194C96xEtl4WuqC2GFaUAv8sZxLdBV77
         qILw==
X-Gm-Message-State: APjAAAVAlmPj7qJT1N5PcZF/8bi5hqbptzH5wTonODCUOJt3+gpyBskb
        rK0KkEsMeFq6UwFSH1Xaizg=
X-Google-Smtp-Source: APXvYqwShECGrMgtkCZNkbBpxSyUczjEot2rIP9v1Pq9qwXKdamaT6TFjN9i9tI8xzvwNdYjP+hFIA==
X-Received: by 2002:a62:ae06:: with SMTP id q6mr24352444pff.96.1571681138284;
        Mon, 21 Oct 2019 11:05:38 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b4sm13929276pju.16.2019.10.21.11.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 11:05:37 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Decouple DP output lanes from DSI input lanes
Date:   Mon, 21 Oct 2019 11:05:32 -0700
Message-Id: <20191021180532.31210-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>

The bridge can be configured to use 1, 2, or 4 DP lanes.  This
configuration is independent of the input DSI lanes.  Right now, the
driver assumes that there is 1:1 mapping of input lanes to output lanes
which is not correct and does not work for manu devices such as the
Lenovo Miix 630 and Lenovo Yoga C630 laptops.

Instead, configure the DP output lanes based on the connection information
to the panel, if available.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 43abf01ebd4c..1afdc3d5d541 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -100,6 +100,7 @@ struct ti_sn_bridge {
 	struct drm_panel		*panel;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
+	int				dp_lanes;
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -444,7 +445,7 @@ static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 
 	/* set DP data rate */
-	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
+	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
 	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
@@ -504,8 +505,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
 			   CHA_DSI_LANES_MASK, val);
 
-	/* DP lane config */
-	val = DP_NUM_LANES(pdata->dsi->lanes - 1);
+	/* DP lane config - 4 lanes are encoded with the value "3" */
+	val = DP_NUM_LANES(pdata->dp_lanes == 4 ? 3 : pdata->dp_lanes);
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
@@ -699,7 +700,10 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn_bridge *pdata;
-	int ret;
+	int ret, len;
+	struct device_node *endpoint;
+	struct property *prop;
+
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		DRM_ERROR("device doesn't support I2C\n");
@@ -727,6 +731,21 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	endpoint = of_graph_get_endpoint_by_regs(pdata->dev->of_node, 1, -1);
+	prop = of_find_property(endpoint, "data-lanes", &len);
+	if (!prop) {
+		DRM_DEBUG("failed to find dp lane mapping, using default\n");
+		pdata->dp_lanes = 1;
+	} else {
+		pdata->dp_lanes = len / sizeof(u32);
+		if (pdata->dp_lanes < 1 || pdata->dp_lanes > 4 ||
+		    pdata->dp_lanes == 3) {
+			DRM_ERROR("bad number of dp lanes: %d\n",
+				  pdata->dp_lanes);
+			return -EINVAL;
+		}
+	}
+
 	dev_set_drvdata(&client->dev, pdata);
 
 	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
-- 
2.17.1

