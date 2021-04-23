Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE46436979A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243292AbhDWRA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243287AbhDWRAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:00:25 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E87AC061345
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:47 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id o16so11907061plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWSTk8yjg8c/25DOgu081XQS3tOSDuzAXjHB+ct/NxQ=;
        b=N29k47+cjV+TNWpPVYMflFNf2uGyR+2NC30H/ixMKHLiWu+nyWoke9hNvE5lEOAHA9
         9cPbbigqGvYOC7tcPiOxdGfDlunl/1V1Jos/fWqqlvF8XCYHdTgFG2IjIiKr1g+i8mo0
         2BB4NjUQfvJwilJeFrHhxB3qJClCjuUNy3zII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWSTk8yjg8c/25DOgu081XQS3tOSDuzAXjHB+ct/NxQ=;
        b=VfU4mHuHIkJhF31F7YblmIO639sHsAN6qS7ceEkekMKLNOYGxtSVBzvHde1jPECZTX
         PwgYz5uWmh1ls2UlXeL2zKztLOk0nvg2PXqcoPgR1jLBp81f3oGkwWkbmLlB+aFiaPA2
         usqGbNAQ/rmRk2Xw1C1Wed99P93dOUozAlf88pdBESnUCbgYPGNE+JzExBKaE7CDm+OK
         //A3tj1UPsSGim+17Wwsuz3sI/oAP6auyG6/dGaaAzgBSwrjbS0geMvdl44LOtzCAeJ6
         795hgFlegzp8mYfSwNO8TLdJpNlKaJqbVIQX0TxZCSlYaywfLxR1Z4og3KAP8c3E7mtR
         8ZWg==
X-Gm-Message-State: AOAM531cHGMip+i+Gexw5WupGSuJDpWbfoRwgThVHkxLq6lRn7iKqLVX
        PSHOli7gEaOFC5tPSN+JO5q7xA==
X-Google-Smtp-Source: ABdhPJwO0k3uruj4cWw+nLQcqrGKZkyz0aXhJ9udAibha281Xy9iWM1aDlUx1M8xnJ35es7+zxrvbw==
X-Received: by 2002:a17:902:361:b029:e9:8392:7abd with SMTP id 88-20020a1709020361b02900e983927abdmr4692725pld.8.1619197186901;
        Fri, 23 Apr 2021 09:59:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/20] drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
Date:   Fri, 23 Apr 2021 09:58:52 -0700
Message-Id: <20210423095743.v5.6.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tiny cleanup for probe so we don't keep having to specify
"&client->dev" or "pdata->dev". No functional changes intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v5:
- Rebased atop the pm_runtime patch, which got reordered.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8aa36074aab9..c868193f5b8f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1232,6 +1232,7 @@ static void ti_sn65dsi86_runtime_disable(void *data)
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct ti_sn65dsi86 *pdata;
 	int ret;
 
@@ -1240,8 +1241,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
-			     GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
@@ -1252,26 +1252,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
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
@@ -1279,7 +1277,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	pdata->refclk = devm_clk_get_optional(dev, "refclk");
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
@@ -1287,8 +1285,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(pdata->dev);
-	ret = devm_add_action_or_reset(pdata->dev, ti_sn65dsi86_runtime_disable, pdata->dev);
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
 
@@ -1299,12 +1297,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
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
2.31.1.498.g6c1eba8ee3d-goog

