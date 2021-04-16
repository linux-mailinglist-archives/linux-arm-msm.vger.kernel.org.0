Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AE7362B67
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbhDPWli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbhDPWlg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEADC06138E
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:08 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h20so14738368plr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e0QEnKfzihSwkUCUDGgWB7m6oBMdGB/Jg6G+CQJIJ/k=;
        b=BJEXFVrJglXTtCKWO5BcKDAJ8HiyFKWqH+mvRCmMjCmnkd3DLzlWhTn1fdIg5HQv3S
         3Gql/hN0ZaLFfrfDU/TNvKV68ACKKuWZz2aooKWej1qeZNp5/NZar2/du0JSb+CBRiAk
         G6z9GF+1B8SzhuORPXDFry43kuky8nLzbIT2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e0QEnKfzihSwkUCUDGgWB7m6oBMdGB/Jg6G+CQJIJ/k=;
        b=F7jTNOSv54a46YrcPMWEdv1z6KU1Q727rgzs7/jBGzLu7DKgn+DeMAjUpSJDkk97y7
         lLWeiA+flEbA4LV6OVVi3w4Iv/t4HW/8ndDzP+fn8wAdIEWhodG1uXSqY6tEIWPcXgYz
         EYlLWdlkgBsOL2CGGAwxXpia+/OJz1zwBSlGECZiwiACCZVuTEDegp5824YLKxAuY40z
         265a7ouOsZWJioPgSqzrAhVxIFKDbWlwmk8VxotkAUBeXvub2fRbAhcFyflaZD65TrYF
         kbn+/DBmlYz1unMD58SK7ji8JaucDVpvWADuuiZIUolePIT+luyA9mL7tUtgHdeoHu5N
         2QKg==
X-Gm-Message-State: AOAM531qdpGPSDI7Eo8FxQkDp20LUgAe7qpi+Y0Ac81XF5WwWqsGGmqe
        Hl7Q1itdT/8mMdlyYVFh0wjn9w==
X-Google-Smtp-Source: ABdhPJxVcP4GeB0Q80asqybNMgUJp0GMle4/sAyPnAkbN5/yDiouXth2EZvymAtPSU+eTKLwJl/oew==
X-Received: by 2002:a17:90a:4381:: with SMTP id r1mr12486696pjg.214.1618612868578;
        Fri, 16 Apr 2021 15:41:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:08 -0700 (PDT)
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
Subject: [PATCH v4 14/27] drm/bridge: ti-sn65dsi86: Move all the chip-related init to the start
Date:   Fri, 16 Apr 2021 15:39:37 -0700
Message-Id: <20210416153909.v4.14.Ide8ba40feb2e43bc98a11edbb08d696d62dcd83e@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just code motion of the probe routine to move all the things
that are for the "whole chip" (instead of the GPIO parts or the
MIPI-to-eDP parts) together at the start of probe. This is in
preparation for breaking the driver into sub-drivers.

Since we're using devm for all of the "whole chip" stuff this is
actually quite easy now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 53f1f7b3022f..57bc489a0412 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1253,12 +1253,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
-
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
@@ -1266,8 +1260,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
-
 	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
@@ -1278,12 +1270,22 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
-	ret = ti_sn_bridge_parse_dsi_host(pdata);
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
+	ti_sn65dsi86_debugfs_init(pdata);
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
+	if (ret) {
+		DRM_ERROR("could not find any panel node\n");
+		return ret;
+	}
+
+	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
+
+	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
 		return ret;
 
@@ -1301,8 +1303,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ti_sn65dsi86_debugfs_init(pdata);
-
 	return 0;
 }
 
-- 
2.31.1.368.gbe11c130af-goog

