Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D327362B5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbhDPWlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhDPWl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67421C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:02 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u15so6181503plf.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8RINpPWHxiTiZOGADVp3S7g72V6xqIHgkVIsjUAmfQ=;
        b=oJBxrniAXs6lmZCyc6xW7HPVRtEhpW7VaGwAgJIcfEQTEjW4ZlzWXokNb4cFVu3v0L
         XSBf33CXO8Jcgltx3XvoQhN2cbTJugo76ki6JsWLz9pBCRDVzsg34VTTBMzSGgF96RnY
         H2KZchooV5mLAt/3051TaxNERmU/iDBiwrCEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8RINpPWHxiTiZOGADVp3S7g72V6xqIHgkVIsjUAmfQ=;
        b=e+88c9hM/G7neSMOV2jlcGs62lv7N7RRdnY/wvCpzFWtVD/S8noXQDPDv9/N7U/zNg
         mXI5cFaplmyLWfAPJI6heSGa/Z1qC3KsbbK2UoxICot0Yplx+aiyMO/vqydHerOnlWcW
         4jRTOSypbOK3Hw1r9qxAF/xgtRm5VawF+ghDM9WDGsdspYEP7n9xOqDmRie1GPRJes13
         soGiZJliry8zzqYU8rw8xVuU1I9SYbyYtLA+OxyuE56EkNW4r5L5h+/JyuRPyquk9POt
         acIfWXJsnXb0nb16zt3gsCM6buFcO0ydU3LWyWe4woJwq5RazhopCpTKYlyygPNWPv9s
         hPBA==
X-Gm-Message-State: AOAM532IBIMxcCzzEr1vMP/mqS6YIJ79hQlhfXSsiPj94pKHiFS2evcX
        JVBCcJIlUAonyhAu69GHPJq5rA==
X-Google-Smtp-Source: ABdhPJwfg9th+j/ncvrSxDsByKxXQ1ShSAfynwsyqOp3VRY5CVo67zMNh9xfgPBIP8YMFHb13mddYA==
X-Received: by 2002:a17:902:d911:b029:ea:cc53:5501 with SMTP id c17-20020a170902d911b02900eacc535501mr11516784plz.21.1618612861961;
        Fri, 16 Apr 2021 15:41:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:01 -0700 (PDT)
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
Subject: [PATCH v4 08/27] drm/bridge: ti-sn65dsi86: Rename the main driver data structure
Date:   Fri, 16 Apr 2021 15:39:31 -0700
Message-Id: <20210416153909.v4.8.Ib03e88304a9ea1c503f1b9567be5cbf8b7c5761c@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for splitting this driver into sub-drivers, let's
rename the main data structure so it's clear that it's holding data
for the whole device and not just the MIPI-eDP bridge part.

This is a no-op change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 86 +++++++++++++--------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 51db30d573c1..f00ceb9dda29 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -112,7 +112,7 @@
 #define SN_LINK_TRAINING_TRIES		10
 
 /**
- * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
+ * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @dev:          Pointer to our device.
  * @regmap:       Regmap for accessing i2c.
  * @aux:          Our aux channel.
@@ -140,7 +140,7 @@
  *                lock so concurrent users of our 4 GPIOs don't stomp on
  *                each other's read-modify-write.
  */
-struct ti_sn_bridge {
+struct ti_sn65dsi86 {
 	struct device			*dev;
 	struct regmap			*regmap;
 	struct drm_dp_aux		aux;
@@ -180,7 +180,7 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
+static void ti_sn_bridge_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
 	regmap_write(pdata->regmap, reg, val & 0xFF);
@@ -189,7 +189,7 @@ static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
 
 static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
 {
-	struct ti_sn_bridge *pdata = dev_get_drvdata(dev);
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
@@ -205,7 +205,7 @@ static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
 
 static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
 {
-	struct ti_sn_bridge *pdata = dev_get_drvdata(dev);
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
 	gpiod_set_value(pdata->enable_gpio, 0);
@@ -225,7 +225,7 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
 
 static int status_show(struct seq_file *s, void *data)
 {
-	struct ti_sn_bridge *pdata = s->private;
+	struct ti_sn65dsi86 *pdata = s->private;
 	unsigned int reg, val;
 
 	seq_puts(s, "STATUS REGISTERS:\n");
@@ -245,7 +245,7 @@ static int status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
+static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
 {
 	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
 
@@ -253,22 +253,22 @@ static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
 			&status_fops);
 }
 
-static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
+static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
 {
 	debugfs_remove_recursive(pdata->debugfs);
 	pdata->debugfs = NULL;
 }
 
 /* Connector funcs */
-static struct ti_sn_bridge *
+static struct ti_sn65dsi86 *
 connector_to_ti_sn_bridge(struct drm_connector *connector)
 {
-	return container_of(connector, struct ti_sn_bridge, connector);
+	return container_of(connector, struct ti_sn65dsi86, connector);
 }
 
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
-	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
+	struct ti_sn65dsi86 *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid = pdata->edid;
 	int num, ret;
 
@@ -314,12 +314,12 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static struct ti_sn_bridge *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
+static struct ti_sn65dsi86 *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
 {
-	return container_of(bridge, struct ti_sn_bridge, bridge);
+	return container_of(bridge, struct ti_sn65dsi86, bridge);
 }
 
-static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
+static int ti_sn_bridge_parse_regulators(struct ti_sn65dsi86 *pdata)
 {
 	unsigned int i;
 	const char * const ti_sn_bridge_supply_names[] = {
@@ -337,7 +337,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
 	int ret, val;
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
@@ -430,7 +430,7 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
 
 	drm_panel_disable(pdata->panel);
 
@@ -442,7 +442,7 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
 }
 
-static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
+static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
 {
 	u32 bit_rate_khz, clk_freq_khz;
 	struct drm_display_mode *mode =
@@ -473,7 +473,7 @@ static const u32 ti_sn_bridge_dsiclk_lut[] = {
 	460800000,
 };
 
-static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 {
 	int i;
 	u32 refclk_rate;
@@ -500,7 +500,7 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
 			   REFCLK_FREQ(i));
 }
 
-static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 {
 	unsigned int bit_rate_mhz, clk_freq_mhz;
 	unsigned int val;
@@ -518,7 +518,7 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
-static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
+static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
 {
 	if (pdata->connector.display_info.bpc <= 6)
 		return 18;
@@ -535,7 +535,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
@@ -556,7 +556,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 	return i;
 }
 
-static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
+static void ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata,
 					  bool rate_valid[])
 {
 	unsigned int rate_per_200khz;
@@ -637,7 +637,7 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
 	}
 }
 
-static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
+static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
 {
 	struct drm_display_mode *mode =
 		&pdata->bridge.encoder->crtc->state->adjusted_mode;
@@ -676,7 +676,7 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
 	usleep_range(10000, 10500); /* 10ms delay recommended by spec */
 }
 
-static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
+static unsigned int ti_sn_get_max_lanes(struct ti_sn65dsi86 *pdata)
 {
 	u8 data;
 	int ret;
@@ -691,7 +691,7 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
 	return data & DP_LANE_COUNT_MASK;
 }
 
-static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
+static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 			       const char **last_err_str)
 {
 	unsigned int val;
@@ -751,7 +751,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
 	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
 	const char *last_err_str = "No supported DP rate";
 	int dp_rate_idx;
@@ -822,7 +822,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 {
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
@@ -853,7 +853,7 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
-	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
 
 	drm_panel_unprepare(pdata->panel);
 
@@ -871,15 +871,15 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.post_disable = ti_sn_bridge_post_disable,
 };
 
-static struct ti_sn_bridge *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
+static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
 {
-	return container_of(aux, struct ti_sn_bridge, aux);
+	return container_of(aux, struct ti_sn65dsi86, aux);
 }
 
 static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 				  struct drm_dp_aux_msg *msg)
 {
-	struct ti_sn_bridge *pdata = aux_to_ti_sn_bridge(aux);
+	struct ti_sn65dsi86 *pdata = aux_to_ti_sn_bridge(aux);
 	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
 	u32 request_val = AUX_CMD_REQ(msg->request);
 	u8 *buf = msg->buffer;
@@ -969,7 +969,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	return len;
 }
 
-static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
+static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 {
 	struct device_node *np = pdata->dev->of_node;
 
@@ -1004,7 +1004,7 @@ static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
 static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
 					   unsigned int offset)
 {
-	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 
 	/*
 	 * We already have to keep track of the direction because we use
@@ -1018,7 +1018,7 @@ static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
 
 static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 	unsigned int val;
 	int ret;
 
@@ -1043,7 +1043,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 				  int val)
 {
-	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 	int ret;
 
 	if (!test_bit(offset, pdata->gchip_output)) {
@@ -1063,7 +1063,7 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 					     unsigned int offset)
 {
-	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 	int shift = offset * 2;
 	int ret;
 
@@ -1091,7 +1091,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 					      unsigned int offset, int val)
 {
-	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 	int shift = offset * 2;
 	int ret;
 
@@ -1125,7 +1125,7 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
 	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
 };
 
-static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
+static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
 {
 	int ret;
 
@@ -1157,14 +1157,14 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 
 #else
 
-static inline int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
+static inline int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
 {
 	return 0;
 }
 
 #endif
 
-static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
+static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 				     struct device_node *np)
 {
 	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
@@ -1216,7 +1216,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
-	struct ti_sn_bridge *pdata;
+	struct ti_sn65dsi86 *pdata;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -1224,7 +1224,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn_bridge),
+	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
 			     GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
@@ -1298,7 +1298,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 static int ti_sn_bridge_remove(struct i2c_client *client)
 {
-	struct ti_sn_bridge *pdata = i2c_get_clientdata(client);
+	struct ti_sn65dsi86 *pdata = i2c_get_clientdata(client);
 
 	if (!pdata)
 		return -EINVAL;
-- 
2.31.1.368.gbe11c130af-goog

