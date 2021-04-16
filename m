Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F092F362B60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbhDPWld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbhDPWla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82209C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so10535176pja.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUkVh6YlKhqCrpWPR4nxPcQbGce7cyZvjvJEJc4CNv0=;
        b=VAjgHyDg7Ok092Sk6jGkVS9K2L9fyr0LQ1RFvNiryEof9IDf5QhnLasz+XBqLBlAs5
         GxoIbaOvObS0oQZbyjz7NBB77tEOAvBtILRc9rFkMOyr8F3TvafVb9+hvri6rfqz27kh
         y9goXUgim8tt8psq6U3rsNJKJ/4ZddTfrIn2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUkVh6YlKhqCrpWPR4nxPcQbGce7cyZvjvJEJc4CNv0=;
        b=kjnr/lBI02vQI5yHjjv3J9Wr/kqfB3V0NcFc9RCWA0abyesTAN6Y/ESo4eIn36tBS8
         7qNsg27EFv+bfPEvyolxG1k96an1k4ex826X0ijeyknsTHr5s/gU+AIgU2mEbCz1oV5d
         MavOd6qdM8PaDByzwgdBO8LfS3naaGGfBKusGoHBdRTbkFKcCXFJr4dxLbriug5EdycI
         wEs5c67kLINw5e2DYDCWQti3XkRAYPihntSctnQgnxosdG8oqiDuZN7qcj7ubi9ELTNp
         sk9kRY4mM2/G1CDc4rQYx/FQ8PeLX6ddLPVRv43JoR0iewB442no2sbOpVXVEoZbIZ1o
         vpAg==
X-Gm-Message-State: AOAM530otEdu2lIIeNQvJMvgeYYl5vQ7itwRxOz04klLyzbJrZSGlAiK
        4C1zetmNYrVgGD+sIVmtjn2ECQ==
X-Google-Smtp-Source: ABdhPJypGP1SLnNqvOI9vb7lZxxhOZ7iv5HUgEzDh/NogNS6oajKmMrGdWd2W025a0WcrUjbqKUy+g==
X-Received: by 2002:a17:902:a5c1:b029:e7:3ee0:a1e9 with SMTP id t1-20020a170902a5c1b02900e73ee0a1e9mr11835040plq.82.1618612863041;
        Fri, 16 Apr 2021 15:41:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:02 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/27] drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
Date:   Fri, 16 Apr 2021 15:39:32 -0700
Message-Id: <20210416153909.v4.9.I4b28c737933a44548662df42ccd37db89ec739c1@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like the previous patch ("drm/bridge: ti-sn65dsi86: Rename the main
driver data structure") this is just a no-op rename in preparation for
splitting the driver up a bit.

Here I've attempted to rename functions / structures making sure that
anything applicable to the whole chip (instead of just the MIPI to eDP
bridge part) included "sn65dsi86" somewhere in the name instead of
just "ti_sn_bridge".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++++++--------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f00ceb9dda29..57574132e200 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -164,30 +164,30 @@ struct ti_sn65dsi86 {
 #endif
 };
 
-static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
+static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
 	{ .range_min = 0, .range_max = 0xFF },
 };
 
 static const struct regmap_access_table ti_sn_bridge_volatile_table = {
-	.yes_ranges = ti_sn_bridge_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(ti_sn_bridge_volatile_ranges),
+	.yes_ranges = ti_sn65dsi86_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(ti_sn65dsi86_volatile_ranges),
 };
 
-static const struct regmap_config ti_sn_bridge_regmap_config = {
+static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_table = &ti_sn_bridge_volatile_table,
 	.cache_type = REGCACHE_NONE,
 };
 
-static void ti_sn_bridge_write_u16(struct ti_sn65dsi86 *pdata,
+static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
 	regmap_write(pdata->regmap, reg, val & 0xFF);
 	regmap_write(pdata->regmap, reg + 1, val >> 8);
 }
 
-static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
+static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
@@ -203,7 +203,7 @@ static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
+static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
@@ -217,8 +217,8 @@ static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
 	return ret;
 }
 
-static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
-	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
+static const struct dev_pm_ops ti_sn65dsi86_pm_ops = {
+	SET_RUNTIME_PM_OPS(ti_sn65dsi86_suspend, ti_sn65dsi86_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -245,7 +245,7 @@ static int status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 {
 	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
 
@@ -253,7 +253,7 @@ static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
 			&status_fops);
 }
 
-static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
 {
 	debugfs_remove_recursive(pdata->debugfs);
 	pdata->debugfs = NULL;
@@ -261,14 +261,14 @@ static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
 
 /* Connector funcs */
 static struct ti_sn65dsi86 *
-connector_to_ti_sn_bridge(struct drm_connector *connector)
+connector_to_ti_sn65dsi86(struct drm_connector *connector)
 {
 	return container_of(connector, struct ti_sn65dsi86, connector);
 }
 
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
-	struct ti_sn65dsi86 *pdata = connector_to_ti_sn_bridge(connector);
+	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
 	struct edid *edid = pdata->edid;
 	int num, ret;
 
@@ -314,12 +314,12 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static struct ti_sn65dsi86 *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
+static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct ti_sn65dsi86, bridge);
 }
 
-static int ti_sn_bridge_parse_regulators(struct ti_sn65dsi86 *pdata)
+static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
 {
 	unsigned int i;
 	const char * const ti_sn_bridge_supply_names[] = {
@@ -337,7 +337,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
 	int ret, val;
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
@@ -425,12 +425,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 
 static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 {
-	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
+	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
 }
 
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	drm_panel_disable(pdata->panel);
 
@@ -648,9 +648,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		vsync_polarity = CHA_VSYNC_POLARITY;
 
-	ti_sn_bridge_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
+	ti_sn65dsi86_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
 			       mode->hdisplay);
-	ti_sn_bridge_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
+	ti_sn65dsi86_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
 			       mode->vdisplay);
 	regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG,
 		     (mode->hsync_end - mode->hsync_start) & 0xFF);
@@ -751,7 +751,7 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
 	const char *last_err_str = "No supported DP rate";
 	int dp_rate_idx;
@@ -822,7 +822,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 {
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
@@ -853,7 +853,7 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	drm_panel_unprepare(pdata->panel);
 
@@ -871,7 +871,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.post_disable = ti_sn_bridge_post_disable,
 };
 
-static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
+static struct ti_sn65dsi86 *aux_to_ti_sn65dsi86(struct drm_dp_aux *aux)
 {
 	return container_of(aux, struct ti_sn65dsi86, aux);
 }
@@ -879,7 +879,7 @@ static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
 static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 				  struct drm_dp_aux_msg *msg)
 {
-	struct ti_sn65dsi86 *pdata = aux_to_ti_sn_bridge(aux);
+	struct ti_sn65dsi86 *pdata = aux_to_ti_sn65dsi86(aux);
 	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
 	u32 request_val = AUX_CMD_REQ(msg->request);
 	u8 *buf = msg->buffer;
@@ -1213,7 +1213,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	pdata->ln_polrs = ln_polrs;
 }
 
-static int ti_sn_bridge_probe(struct i2c_client *client,
+static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn65dsi86 *pdata;
@@ -1230,7 +1230,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	pdata->regmap = devm_regmap_init_i2c(client,
-					     &ti_sn_bridge_regmap_config);
+					     &ti_sn65dsi86_regmap_config);
 	if (IS_ERR(pdata->regmap)) {
 		DRM_ERROR("regmap i2c init failed\n");
 		return PTR_ERR(pdata->regmap);
@@ -1257,7 +1257,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
 
-	ret = ti_sn_bridge_parse_regulators(pdata);
+	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
 		return ret;
@@ -1291,12 +1291,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ti_sn_debugfs_init(pdata);
+	ti_sn65dsi86_debugfs_init(pdata);
 
 	return 0;
 }
 
-static int ti_sn_bridge_remove(struct i2c_client *client)
+static int ti_sn65dsi86_remove(struct i2c_client *client)
 {
 	struct ti_sn65dsi86 *pdata = i2c_get_clientdata(client);
 
@@ -1310,7 +1310,7 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 
 	kfree(pdata->edid);
 
-	ti_sn_debugfs_remove(pdata);
+	ti_sn65dsi86_debugfs_remove(pdata);
 
 	drm_bridge_remove(&pdata->bridge);
 
@@ -1321,29 +1321,29 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	return 0;
 }
 
-static struct i2c_device_id ti_sn_bridge_id[] = {
+static struct i2c_device_id ti_sn65dsi86_id[] = {
 	{ "ti,sn65dsi86", 0},
 	{},
 };
-MODULE_DEVICE_TABLE(i2c, ti_sn_bridge_id);
+MODULE_DEVICE_TABLE(i2c, ti_sn65dsi86_id);
 
-static const struct of_device_id ti_sn_bridge_match_table[] = {
+static const struct of_device_id ti_sn65dsi86_match_table[] = {
 	{.compatible = "ti,sn65dsi86"},
 	{},
 };
-MODULE_DEVICE_TABLE(of, ti_sn_bridge_match_table);
+MODULE_DEVICE_TABLE(of, ti_sn65dsi86_match_table);
 
-static struct i2c_driver ti_sn_bridge_driver = {
+static struct i2c_driver ti_sn65dsi86_driver = {
 	.driver = {
 		.name = "ti_sn65dsi86",
-		.of_match_table = ti_sn_bridge_match_table,
-		.pm = &ti_sn_bridge_pm_ops,
+		.of_match_table = ti_sn65dsi86_match_table,
+		.pm = &ti_sn65dsi86_pm_ops,
 	},
-	.probe = ti_sn_bridge_probe,
-	.remove = ti_sn_bridge_remove,
-	.id_table = ti_sn_bridge_id,
+	.probe = ti_sn65dsi86_probe,
+	.remove = ti_sn65dsi86_remove,
+	.id_table = ti_sn65dsi86_id,
 };
-module_i2c_driver(ti_sn_bridge_driver);
+module_i2c_driver(ti_sn65dsi86_driver);
 
 MODULE_AUTHOR("Sandeep Panda <spanda@codeaurora.org>");
 MODULE_DESCRIPTION("sn65dsi86 DSI to eDP bridge driver");
-- 
2.31.1.368.gbe11c130af-goog

