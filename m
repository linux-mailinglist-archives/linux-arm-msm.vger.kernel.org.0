Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4763A47B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 19:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhFKRUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 13:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhFKRUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 13:20:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DE7C0613A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:18:22 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b12so3153373plg.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FnRhgbzvrNrBAhrrpm4mRSS8nZ4/48rxijSMAVgSnU=;
        b=RrKdUaTvEIdAnFdjJL5/eAsIpXtRpVQnIVM1mIgMX/UCDsQf/TfZZGOF1MYRqs2uRc
         rNDgCsnrNMq7PTmj/Z1KJDoj/Azhm1X0fetF0y9O2EsinynWGsGRM1JYEx42CZ8ONTZL
         o+81bbV0j0mFOtqvlKrO8xn7wEXnFwwhY3bcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FnRhgbzvrNrBAhrrpm4mRSS8nZ4/48rxijSMAVgSnU=;
        b=mCP7oA4bgdZb7YNMP3EOYm162q8DzXhByAqhEEjMWEQs6E/UeuvnMzv84wHCpUeRq6
         94yVBl0lay4rFdN08YF3039/GVsTQU62aH+Y7U4TZQ55MlRQf5BGAG8XoHu4HwFmVKgI
         lAi83Gg5d9M8ABRlF5XZ1gQ8DeNx04nH+CJ1MCbcannqIo7zAZvF3FgG+sDG5oXNSGgR
         BYr8n3nZDisJ8ZXrmQ2Pili6L0NVDi+umwZIm2JN57sfQ8fOcNTre8sp8R7KjwtQJ7Bj
         BVcPX0d89t4UV+tY+aHIT4rWn4SpnwhBb1RoMUP5y26mMt07yzFecSikTEghkFDzVoDI
         DhCA==
X-Gm-Message-State: AOAM533MWePiF4WLiwhifwk0UsElk8VvlFUEVMnIMFdjKyv8CYNXREJr
        HqLmeQw4V2Po/qoj7/FoCwTT0w==
X-Google-Smtp-Source: ABdhPJzZBrXiXq6lBifXIxC1zOkFuo04PFe24xgvIvwOJp1SAjHXiSP+FoqTnalGVZC4w00lsIVz5w==
X-Received: by 2002:a17:90a:8589:: with SMTP id m9mr9913846pjn.168.1623431901584;
        Fri, 11 Jun 2021 10:18:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:4128:5428:5cd0:cfa5])
        by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:18:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/11] drm/bridge: ti-sn65dsi86: Improve probe errors with dev_err_probe()
Date:   Fri, 11 Jun 2021 10:17:46 -0700
Message-Id: <20210611101711.v10.10.I24bba069e63b1eea84443eef0c8535fd032a6311@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As I was testing to make sure that the DEFER path worked well with my
patch series, I got tired of seeing this scary message in my logs just
because the panel needed to defer:
  [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node

Let's use dev_err_probe() which nicely quiets this error and also
simplifies the code a tiny bit. We'll also update other places in the
file which can use dev_err_probe().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- ("Improve probe errors") patch new for v9.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 +++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b544cbce7fdd..5d712c8c3c3b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1305,10 +1305,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&adev->dev, ret,
+				     "could not find any panel node\n");
 
 	ti_sn_bridge_parse_lanes(pdata, np);
 
@@ -1456,27 +1455,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	pdata->regmap = devm_regmap_init_i2c(client,
 					     &ti_sn65dsi86_regmap_config);
-	if (IS_ERR(pdata->regmap)) {
-		DRM_ERROR("regmap i2c init failed\n");
-		return PTR_ERR(pdata->regmap);
-	}
+	if (IS_ERR(pdata->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdata->regmap),
+				     "regmap i2c init failed\n");
 
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(pdata->enable_gpio)) {
-		DRM_ERROR("failed to get enable gpio from DT\n");
-		ret = PTR_ERR(pdata->enable_gpio);
-		return ret;
-	}
+	if (IS_ERR(pdata->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(pdata->enable_gpio),
+				     "failed to get enable gpio from DT\n");
 
 	ret = ti_sn65dsi86_parse_regulators(pdata);
-	if (ret) {
-		DRM_ERROR("failed to parse regulators\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse regulators\n");
 
 	pdata->refclk = devm_clk_get_optional(dev, "refclk");
 	if (IS_ERR(pdata->refclk))
-		return PTR_ERR(pdata->refclk);
+		return dev_err_probe(dev, PTR_ERR(pdata->refclk),
+				     "failed to get reference clock\n");
 
 	pm_runtime_enable(dev);
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
-- 
2.32.0.272.g935e593368-goog

