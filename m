Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094D55EEC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 23:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfGCVqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 17:46:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39052 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGCVqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 17:46:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so1927736pls.6;
        Wed, 03 Jul 2019 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zx6p9K9lBYtbVfdxa7E9OnZzYHo7cm8q4NKF1jFk2vQ=;
        b=fj3T9tNJFEWbtVpZXRo+hjywY6BfqlB3kcFaMZt1Bfzs3mV57SVLLVWlo7/ANdnUDn
         Rxpg115anMep/E9qFsA8CtRjKbtzrbfrPKrwHnIR60RCysDKx4JdE5VakjTfI4dmOpYo
         8VzlERbiw/ypU/xXiolpy+oP/lIFtk1PEKTqXXTsSRbwxzMSuGW+gxuCYqyEQjn8mzZO
         mwdI91c/ZFeaZzxGCHTCiGhzRNdMDQhpUbpZYtV9cB74RkZUC1u4UvUfHpgpZXC6chol
         EO6CWBgKnZ8gJy4s0OHWjUy8uur3njDB+5DciKQVUCLanWN5gJ4MzihEkMamYzSdrSni
         zCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zx6p9K9lBYtbVfdxa7E9OnZzYHo7cm8q4NKF1jFk2vQ=;
        b=ouRB92W9cwuF622P1Dm3JtD1InqNS8bD4V4qS61UmN9oAhQSZQCzIoNUokT0/epmB9
         Xd5bYrC/s5H2VUvQTDhMwsJODa8HsBsxcnrui9aR1Hy/eg1O1iKfgAf+pDI1CT7MljDG
         YJoQ4rQD9pgWA2yy/5LQYBhG8txe4O1rJdbPHLUl3Bc1mwzp4CAei6TSyYiLotyaW2Z0
         E/ZtQyXUIO5vDPNQpdT3i8lxE4es1Hlwd4W7f7tMkPCsazv2RAS/MqRUXKUrQMD6A6KH
         Qjzzcu18AEP6/vCB1yqi5QVOh5V3A+moM1W3tDD4vXTYQEi7qFhNnDZ30pHJUML4zDzh
         K7AA==
X-Gm-Message-State: APjAAAVQGXm0PTpQEYcGNGmzas3LoVBpHnCaaFz1nFBFumxwHmUW8rzp
        rbW/bCWZ+/XR7NGw336oAYY=
X-Google-Smtp-Source: APXvYqx16nR2nWAm9waiTKlwYBW1mcVclHa0AJSa1jWJk8KRcugsb0ueWRyGFc0m86URdEj47nYudg==
X-Received: by 2002:a17:902:467:: with SMTP id 94mr44502981ple.131.1562190365060;
        Wed, 03 Jul 2019 14:46:05 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id f72sm3485566pjg.10.2019.07.03.14.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 14:46:04 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     broonie@kernel.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi86: Add support to be a DSI device
Date:   Wed,  3 Jul 2019 14:45:59 -0700
Message-Id: <20190703214559.41368-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ti-sn65dsi86 can be configured in two ways - via i2c or "inband" via
DSI.  The DSI option can be useful on platforms where the i2c link does
not seem to be wired up.

To support configuration via DSI, register as a DSI device, use the
provided DSI device instead of creating our own, and utilize the regmap-dsi
support to abstract away the init differences between i2c and DSI.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 160 +++++++++++++++++++-------
 2 files changed, 117 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index ee777469293a..b74c8ef47cb6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -143,6 +143,7 @@ config DRM_TI_SN65DSI86
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
+	select REGMAP_DSI
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b77a52d05061..45fb91afd01b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -258,18 +258,22 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 	 * will satisfy most of the existing host drivers. Once the host driver
 	 * is fixed we can move the below code to bridge probe safely.
 	 */
-	host = of_find_mipi_dsi_host_by_node(pdata->host_node);
-	if (!host) {
-		DRM_ERROR("failed to find dsi host\n");
-		ret = -ENODEV;
-		goto err_dsi_host;
-	}
-
-	dsi = mipi_dsi_device_register_full(host, &info);
-	if (IS_ERR(dsi)) {
-		DRM_ERROR("failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		goto err_dsi_host;
+	if (!pdata->dsi) {
+		host = of_find_mipi_dsi_host_by_node(pdata->host_node);
+		if (!host) {
+			DRM_ERROR("failed to find dsi host\n");
+			ret = -ENODEV;
+			goto err_dsi_host;
+		}
+
+		dsi = mipi_dsi_device_register_full(host, &info);
+		if (IS_ERR(dsi)) {
+			DRM_ERROR("failed to create dsi device\n");
+			ret = PTR_ERR(dsi);
+			goto err_dsi_host;
+		}
+	} else {
+		dsi = pdata->dsi;
 	}
 
 	/* TODO: setting to 4 lanes always for now */
@@ -290,7 +294,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 		DRM_ERROR("failed to attach dsi to host\n");
 		goto err_dsi_attach;
 	}
-	pdata->dsi = dsi;
+
+	if (!pdata->dsi)
+		pdata->dsi = dsi;
 
 	/* attach panel to bridge */
 	drm_panel_attach(pdata->panel, &pdata->connector);
@@ -298,7 +304,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 	return 0;
 
 err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
+	if (!pdata->dsi)
+		mipi_dsi_device_unregister(dsi);
 err_dsi_host:
 	drm_connector_cleanup(&pdata->connector);
 	return ret;
@@ -656,30 +663,23 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
 	return 0;
 }
 
-static int ti_sn_bridge_probe(struct i2c_client *client,
-			      const struct i2c_device_id *id)
+static int ti_sn_bridge_common_probe(struct device *dev, struct regmap *regmap,
+				     struct mipi_dsi_device *dsi)
 {
 	struct ti_sn_bridge *pdata;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		DRM_ERROR("device doesn't support I2C\n");
-		return -ENODEV;
-	}
-
-	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn_bridge),
+	pdata = devm_kzalloc(dev, sizeof(struct ti_sn_bridge),
 			     GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->regmap = devm_regmap_init_i2c(client,
-					     &ti_sn_bridge_regmap_config);
-	if (IS_ERR(pdata->regmap)) {
-		DRM_ERROR("regmap i2c init failed\n");
-		return PTR_ERR(pdata->regmap);
-	}
+	pdata->regmap = regmap;
 
-	pdata->dev = &client->dev;
+	pdata->dev = dev;
+
+	if (dsi)
+		pdata->dsi = dsi;
 
 	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
 					  &pdata->panel, NULL);
@@ -688,7 +688,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	dev_set_drvdata(&client->dev, pdata);
+	dev_set_drvdata(dev, pdata);
 
 	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
 					    GPIOD_OUT_LOW);
@@ -719,25 +719,21 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pm_runtime_enable(pdata->dev);
 
-	i2c_set_clientdata(client, pdata);
-
 	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
+	pdata->aux.dev = dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_register(&pdata->aux);
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = client->dev.of_node;
+	pdata->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&pdata->bridge);
 
 	return 0;
 }
 
-static int ti_sn_bridge_remove(struct i2c_client *client)
+static int ti_sn_bridge_common_remove(struct ti_sn_bridge *pdata)
 {
-	struct ti_sn_bridge *pdata = i2c_get_clientdata(client);
-
 	if (!pdata)
 		return -EINVAL;
 
@@ -755,11 +751,53 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	return 0;
 }
 
-static struct i2c_device_id ti_sn_bridge_id[] = {
+static int ti_sn_bridge_i2c_remove(struct i2c_client *client)
+{
+	return ti_sn_bridge_common_remove(i2c_get_clientdata(client));
+}
+
+static int ti_sn_bridge_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *id)
+{
+	struct regmap *regmap;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		DRM_ERROR("device doesn't support I2C\n");
+		return -ENODEV;
+	}
+
+	regmap = devm_regmap_init_i2c(client, &ti_sn_bridge_regmap_config);
+	if (IS_ERR(regmap)) {
+		DRM_ERROR("regmap i2c init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	return ti_sn_bridge_common_probe(&client->dev, regmap, NULL);
+}
+
+static int ti_sn_bridge_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_dsi(dsi, &ti_sn_bridge_regmap_config);
+	if (IS_ERR(regmap)) {
+		DRM_ERROR("regmap dsi init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	return ti_sn_bridge_common_probe(&dsi->dev, regmap, dsi);
+}
+
+static int ti_sn_bridge_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	return ti_sn_bridge_common_remove(mipi_dsi_get_drvdata(dsi));
+}
+
+static struct i2c_device_id ti_sn_bridge_i2c_id[] = {
 	{ "ti,sn65dsi86", 0},
 	{},
 };
-MODULE_DEVICE_TABLE(i2c, ti_sn_bridge_id);
+MODULE_DEVICE_TABLE(i2c, ti_sn_bridge_i2c_id);
 
 static const struct of_device_id ti_sn_bridge_match_table[] = {
 	{.compatible = "ti,sn65dsi86"},
@@ -767,17 +805,51 @@ static const struct of_device_id ti_sn_bridge_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ti_sn_bridge_match_table);
 
-static struct i2c_driver ti_sn_bridge_driver = {
+static struct i2c_driver ti_sn_bridge_i2c_driver = {
 	.driver = {
 		.name = "ti_sn65dsi86",
 		.of_match_table = ti_sn_bridge_match_table,
 		.pm = &ti_sn_bridge_pm_ops,
 	},
-	.probe = ti_sn_bridge_probe,
-	.remove = ti_sn_bridge_remove,
-	.id_table = ti_sn_bridge_id,
+	.probe = ti_sn_bridge_i2c_probe,
+	.remove = ti_sn_bridge_i2c_remove,
+	.id_table = ti_sn_bridge_i2c_id,
 };
-module_i2c_driver(ti_sn_bridge_driver);
+
+static struct mipi_dsi_driver ti_sn_bridge_dsi_driver = {
+	.driver = {
+		.name = "ti_sn65dsi86",
+		.of_match_table = ti_sn_bridge_match_table,
+		.pm = &ti_sn_bridge_pm_ops,
+	},
+	.probe = ti_sn_bridge_dsi_probe,
+	.remove = ti_sn_bridge_dsi_remove,
+};
+
+static int __init tisn65dsi86_init(void)
+{
+	int ret;
+
+	ret = i2c_add_driver(&ti_sn_bridge_i2c_driver);
+
+	if (ret)
+		return ret;
+
+	ret = mipi_dsi_driver_register(&ti_sn_bridge_dsi_driver);
+
+	if (ret)
+		i2c_del_driver(&ti_sn_bridge_i2c_driver);
+
+	return ret;
+}
+module_init(tisn65dsi86_init);
+
+static void __exit tisn65dsi86_exit(void)
+{
+	i2c_del_driver(&ti_sn_bridge_i2c_driver);
+	mipi_dsi_driver_unregister(&ti_sn_bridge_dsi_driver);
+}
+module_exit(tisn65dsi86_exit);
 
 MODULE_AUTHOR("Sandeep Panda <spanda@codeaurora.org>");
 MODULE_DESCRIPTION("sn65dsi86 DSI to eDP bridge driver");
-- 
2.17.1

