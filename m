Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E52362B6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhDPWlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbhDPWlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:40 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E89C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:15 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id w8so15798562pfn.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPMsVDj+4YKTnON7a1KtMaowFA2keLlUTvk2F9riiB4=;
        b=f0HkhQBnInfn7G8aHry9gNS/5JowFl4+yK3TH9A/F0KsoJyuwEXDmxo32aezEm9xLo
         ked0qm1grf0PsK7Eb2/Y+8OcEAaPK9iZ5QlLtvNKvaATX8W1r8k/vtKKfZ5Nk6iF2zgA
         Q+q229YpiJ74tQjgKbDWwlG2uXA8WRSnRn02k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPMsVDj+4YKTnON7a1KtMaowFA2keLlUTvk2F9riiB4=;
        b=teQW3r4Fd4vWlDY0lw2ubf5zQu9j8S3DUaKaEcEV4uCWK7LvEIAqCgBoyp1hDaqWqL
         pl1a1Ksb3TRRr93VFiLm0Gt+0KoL60c0aZ7p1WZNLX2kCo5NSncFJdvLMXQv6B3snPL/
         5sHzWbpaq9KIc3aTEa3L5IVGXVczwhK6VQ5IFkjsKQkyeyoCjiQiGJpKrlnDVMvl7K2c
         18pPD1pnY7WY5PvPm6/kyAWcFgWL3ikzbLyQ7yUv80CATfpPEFM+dCrTu1fnbuG0aHri
         32r8fhDxfJgDVUrFo/NJc7I7UKgyNIHrQR5mIS8Wl4caR68c+tWDWCzsheHiyeva3pqF
         sdDg==
X-Gm-Message-State: AOAM531IpeYahXtUMz316jgEfHDnOcXMX4RfXGy0F0cir0SeErPkGmXK
        VKK1PMmaQ1ahyLqrkJCXKCykfQ==
X-Google-Smtp-Source: ABdhPJzERbU1GArhvZgQnO9hZsPzSxEvRKDlEAnuacWfUbimUdtH/2dMGxiwiE3ddFPq/pVcGmH6HQ==
X-Received: by 2002:a63:3245:: with SMTP id y66mr1115064pgy.435.1618612875101;
        Fri, 16 Apr 2021 15:41:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:14 -0700 (PDT)
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
Subject: [PATCH v4 20/27] drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
Date:   Fri, 16 Apr 2021 15:39:43 -0700
Message-Id: <20210416153909.v4.20.Ie9daa320d907fff73f893f74b898197e399cce59@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We'd like to be able to expose the DDC-over-AUX channel bus to our
panel. This gets into a chicken-and-egg problem because:
- The panel wants to get its DDC at probe time.
- The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
  bus, wants to get the panel at probe time.

By using a sub device we can fully create the AUX channel bits so that
the panel can get them. Then the panel can finish probing and the
bridge can probe.

To accomplish this, we also move registering the AUX channel out of
the bridge's attach code and do it right at probe time. We use devm to
manage cleanup.

NOTE: there's a little bit of a trick here. Though the AUX channel can
run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
can't run without the AUX channel. We could come up a complicated
signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
while or wait on some sort of completion), but it seems simple enough
to just not even bother creating the bridge device until the AUX
channel probes. That's what we'll do.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 875e5dbe6594..8253098bcdbf 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -116,6 +116,7 @@
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
+ * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -148,6 +149,7 @@
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
+	struct auxiliary_device		aux_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -483,18 +485,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	ret = drm_dp_aux_register(&pdata->aux);
-	if (ret < 0) {
-		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
-		return ret;
-	}
-
 	ret = drm_connector_init(bridge->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
-		goto err_conn_init;
+		return ret;
 	}
 
 	drm_connector_helper_add(&pdata->connector,
@@ -551,8 +547,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
 	drm_connector_cleanup(&pdata->connector);
-err_conn_init:
-	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
 }
 
@@ -1316,11 +1310,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
-	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
-	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
-
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
 
@@ -1419,6 +1408,54 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	return ret;
 }
 
+static void ti_sn65dsi86_unregister_dp_aux(void *data)
+{
+	drm_dp_aux_unregister(data);
+}
+
+static int ti_sn_aux_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	int ret;
+
+	pdata->aux.name = "ti-sn65dsi86-aux";
+	pdata->aux.dev = pdata->dev;
+	pdata->aux.transfer = ti_sn_aux_transfer;
+	drm_dp_aux_init(&pdata->aux);
+
+	ret = drm_dp_aux_register(&pdata->aux);
+	if (ret < 0) {
+		drm_err(pdata, "Failed to register DP AUX channel: %d\n", ret);
+		return ret;
+	}
+	ret = devm_add_action_or_reset(&adev->dev,
+				       ti_sn65dsi86_unregister_dp_aux, &pdata->aux);
+	if (ret)
+		return ret;
+
+	/*
+	 * The eDP to MIPI bridge parts don't work until the AUX channel is
+	 * setup so we don't add it in the main driver probe, we add it now.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+}
+
+static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
+	{ .name = "ti_sn65dsi86.aux", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, ti_sn_aux_id_table);
+
+static struct auxiliary_driver ti_sn_aux_driver = {
+	.name = "aux",
+	.probe = ti_sn_aux_probe,
+	.id_table = ti_sn_aux_id_table,
+};
+
+module_auxiliary_driver(ti_sn_aux_driver);
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1477,10 +1514,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	 * motiviation here is to solve the chicken-and-egg problem of probe
 	 * ordering. The bridge wants the panel to be there when it probes.
 	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
-	 * when it probes. There will soon be other devices (DDC I2C bus, PWM)
-	 * that have the same problem. Having sub-devices allows the some sub
-	 * devices to finish probing even if others return -EPROBE_DEFER and
-	 * gets us around the problems.
+	 * when it probes. The panel and maybe backlight might want the DDC
+	 * bus. Soon the PWM provided by the bridge chip will have the same
+	 * problem. Having sub-devices allows the some sub devices to finish
+	 * probing even if others return -EPROBE_DEFER and gets us around the
+	 * problems.
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
@@ -1489,7 +1527,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	/*
+	 * NOTE: At the end of the AUX channel probe we'll add the aux device
+	 * for the bridge. This is because the bridge can't be used until the
+	 * AUX channel is there and this is a very simple solution to the
+	 * dependency problem.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
 }
 
 static struct i2c_device_id ti_sn65dsi86_id[] = {
-- 
2.31.1.368.gbe11c130af-goog

