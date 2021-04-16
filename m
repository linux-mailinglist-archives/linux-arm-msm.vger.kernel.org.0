Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68F4362B62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbhDPWle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhDPWla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:30 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90D8C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:05 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id m18so12520892plc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32p094LtRE8x040PHsq/D9b0lJvFmgmtHOiczhPHLkI=;
        b=mbCuYJdiKgPkF/CPplBgMnb3Krv4cGbiF3vuaKImMCZXEQsuoXJ957LjtXuzS1bi05
         F+HzOIBlOMxl4xnus1oxHjlZK4oJ4sD1DyuQTPEJ5JQNlSFAi3kYTMX+1QjdU9F0/KtK
         sHTlRc7eN8ZHvBzO2zC7F0nWCbhwG50zX1Z60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32p094LtRE8x040PHsq/D9b0lJvFmgmtHOiczhPHLkI=;
        b=B9OTjACdxhhWYUHpk0yCYpSMMLPihb2aGSm7yN/B1Pz9OXN+riZxmKmVROGbRbOolM
         Y34K9i2bC/9pIYd5i/xreWhmTx/A9eFkUhWgASXx/cRdMm+WZvVhvORa9GQJAziKPpZ0
         pJNMnGnynyorM19GQpuAinwxu9Vf2PwwrAGx55Z13QbWD89krrzJw7HwSLpiDK5FHnS+
         n/SpBYDYE4GAAN9ekMZ0siQ5HaIHptEC7WWGgA5aQSbLI6b6Qy5j/qGZjVjyCFNlaaIz
         RIodHAsqlj9g28smErNpq0qN+sAbNhDLurL2DwRah6KJM/pk8gECe9xuwJD+TLmuEYqV
         ruCg==
X-Gm-Message-State: AOAM53127Xa3nu7niWMeQlOZEMcM/kHFYesELnGDXYy0YTXbr+91l50C
        4AfQ4ZSqasN8IxXjxHbIf26Fyw==
X-Google-Smtp-Source: ABdhPJxMbXAapu0TxRByFMq7luqQ62DNwvt6G+J0rYjukq/QqPSwlVzXLxZIrHIHCidO1WejrhKd3Q==
X-Received: by 2002:a17:90a:a789:: with SMTP id f9mr12416874pjq.192.1618612865378;
        Fri, 16 Apr 2021 15:41:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:04 -0700 (PDT)
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
Subject: [PATCH v4 11/27] drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
Date:   Fri, 16 Apr 2021 15:39:34 -0700
Message-Id: <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tiny cleanup for probe so we don't keep having to specify
"&client->dev" or "pdata->dev". No functional changes intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0c6aa99ddc99..2cbf619fbd27 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1226,6 +1226,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct ti_sn65dsi86 *pdata;
 	int ret;
 
@@ -1234,8 +1235,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
-			     GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
@@ -1246,26 +1246,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	pdata->dev = &client->dev;
+	pdata->dev = dev;
 
-	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
-					  &pdata->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
-	dev_set_drvdata(&client->dev, pdata);
+	dev_set_drvdata(dev, pdata);
 
-	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
-					    GPIOD_OUT_LOW);
+	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
 		ret = PTR_ERR(pdata->enable_gpio);
 		return ret;
 	}
 
-	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
 
 	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
@@ -1273,7 +1271,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	pdata->refclk = devm_clk_get_optional(dev, "refclk");
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
@@ -1281,23 +1279,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(pdata->dev);
+	pm_runtime_enable(dev);
 
 	ret = ti_sn_setup_gpio_controller(pdata);
 	if (ret) {
-		pm_runtime_disable(pdata->dev);
+		pm_runtime_disable(dev);
 		return ret;
 	}
 
 	i2c_set_clientdata(client, pdata);
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
+	pdata->aux.dev = dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = client->dev.of_node;
+	pdata->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.31.1.368.gbe11c130af-goog

