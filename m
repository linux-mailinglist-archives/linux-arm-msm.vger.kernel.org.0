Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B826D3A47A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 19:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhFKRUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 13:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhFKRUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 13:20:12 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB10C0617AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:18:14 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id h12so3162162plf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q1AdllfUeFYcG22hQtR0CggshBPO4Bwf8Sf1fag38lI=;
        b=N6T5BynuflwZy9XSNh31MU0ysCj9hBPfHjACoH3VI3AzLcXV1JJLLDpBc/CYr65vTY
         jjHNVOx5TaFjdeEdqPnrb0tYIk5S4dVhAOt/wo9kk06A6iB4G5MIXWixvKdiTjUtQsiS
         lmE0kU3PpFefnE7FtKLytCfybg7U+nvFfeSt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1AdllfUeFYcG22hQtR0CggshBPO4Bwf8Sf1fag38lI=;
        b=na2g8p42wW6xRXWqFacifjID1wyrJgriKlCiz7yHE9MuE9f8Rgo3AZFJzPNLQdl/Fs
         xjdjp6wSPmUxUCfUQu6APW+K3B/3WyC39F/ZoR0pZ+T4VEwkNK/IqpvQR4cVXTOqlF+q
         sXJFY3GE2apLEgv/C2aI6iJp28ZpgStby7zzl68HpF+ftxWqlQSIYy49+HmbYOpLuGgb
         t+2Ci1bIufbFMowV7llPS0x43iNpDpCsg7qdWfwdorapndPQdqEEw1fbDJsUYKafrQsK
         axgpUClhhknwZyQUJka6I0GVccyLlOJEKQXRJ0JNpe+EcHotv7VhkLvm4JEzVhco8PEK
         Y0YA==
X-Gm-Message-State: AOAM532L1jidrdvbFadLXQDvyHk9F41ei78PjQ6SO65YCy3jBXYmRsXu
        0ZdYXXlBhz3489iQDEScHwVQQA==
X-Google-Smtp-Source: ABdhPJzwCzRzmWYz4JgbwGDn73HZfVLcK3Xv8TD71lYkOtgvEj9Ci3ZFbHTrA2UDKjgZ/7G88tYUOw==
X-Received: by 2002:a17:90a:4282:: with SMTP id p2mr5453505pjg.21.1623431893954;
        Fri, 11 Jun 2021 10:18:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:4128:5428:5cd0:cfa5])
        by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:18:13 -0700 (PDT)
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
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 06/11] drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
Date:   Fri, 11 Jun 2021 10:17:42 -0700
Message-Id: <20210611101711.v10.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If panel-simple is instantiated as a DP AUX bus endpoint then we have
access to the DP AUX bus. Let's stash it in the panel-simple
structure, leaving it NULL for the cases where the panel is
instantiated in other ways.

If we happen to have access to the DP AUX bus and we weren't provided
the ddc-i2c-bus in some other manner, let's use the DP AUX bus for it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- Fix error handling / remove case when using AUX bus for DDC.

Changes in v7:
- Patch using the DP AUX for DDC new for v7.

 drivers/gpu/drm/panel/panel-simple.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3b5ae22d939..df6fbd19e6fc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_aux_bus.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -186,6 +187,7 @@ struct panel_simple {
 
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
+	struct drm_dp_aux *aux;
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
@@ -658,7 +660,8 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
-static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
+static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
+			      struct drm_dp_aux *aux)
 {
 	struct panel_simple *panel;
 	struct display_timing dt;
@@ -674,6 +677,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	panel->enabled = false;
 	panel->prepared_time = 0;
 	panel->desc = desc;
+	panel->aux = aux;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
 	if (!panel->no_hpd) {
@@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 		if (!panel->ddc)
 			return -EPROBE_DEFER;
+	} else if (aux) {
+		panel->ddc = &aux->ddc;
 	}
 
 	if (desc == &panel_dpi) {
@@ -802,7 +808,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
-	if (panel->ddc)
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
 	return err;
@@ -818,7 +824,7 @@ static int panel_simple_remove(struct device *dev)
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-	if (panel->ddc)
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
 	return 0;
@@ -4633,7 +4639,7 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, id->data);
+	return panel_simple_probe(&pdev->dev, id->data, NULL);
 }
 
 static int panel_simple_platform_remove(struct platform_device *pdev)
@@ -4913,7 +4919,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 
 	desc = id->data;
 
-	err = panel_simple_probe(&dsi->dev, &desc->desc);
+	err = panel_simple_probe(&dsi->dev, &desc->desc, NULL);
 	if (err < 0)
 		return err;
 
@@ -4966,7 +4972,7 @@ static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
 	if (!id)
 		return -ENODEV;
 
-	return panel_simple_probe(&aux_ep->dev, id->data);
+	return panel_simple_probe(&aux_ep->dev, id->data, aux_ep->aux);
 }
 
 static void panel_simple_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
-- 
2.32.0.272.g935e593368-goog

