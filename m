Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2A039E4EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 19:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhFGRJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 13:09:15 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:41900 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhFGRJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 13:09:15 -0400
Received: by mail-pl1-f179.google.com with SMTP id o12so5678542plk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZQLp2TUFZKexGG0lnWAUoM5CvTjZ8F6nfEFxMTeutA=;
        b=ZD14vGliFbqNsHPHvfHeRxS9FPyE71wQLfbAH69UHzdRNLhXe7m61TX2hMGPYFCHP3
         bviaYWzSLplcbSIge6WqH/zvtQ47Ih2ccxy+ywC0dANvoCrqrZ7ZReGwdQ4JjbdJRYBh
         SNt/NQEi9Yix8fthhwnZXmR0DMPTQGiMJF+Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZQLp2TUFZKexGG0lnWAUoM5CvTjZ8F6nfEFxMTeutA=;
        b=B70ZGLimPrNEcNICJEJlQizckyA2wDdr/+kCbRmLrdP3WKEELWQE92KqQGd6hOaNtQ
         8kOeCTgEyDiTQQV5XFjqexUD9Ylw0DFoTbWeXrKsxbxwEvEwNloWrYwADSDm4XSdTr0p
         YAHQVZfVnXEHgnnmmj9RGz50J63XMwdhsjoHvsQhguzL0qrc4HMyomlnuz2w0w9DUG5W
         Du7DiHecHkpo5TsjJOYfNWRDzR7yKEO32FGUyx79dxRyPQXFz3JPVRchD/VRHFBBTKKf
         +L8MIK2jr9kcfh4DV+R/7vB1/QcAsPLRq2EeZELBYh08XrESFKzb1q3hfSBicnrGX7Bu
         pjZw==
X-Gm-Message-State: AOAM533GKhdIXbTu05RJ/AWdUPEFw/sb34BAtMbtSTkHipYJUpEvMx9Q
        ZxicDo9m0MlHThM9di/PtKlVkQ==
X-Google-Smtp-Source: ABdhPJwtOOUFau0bbyzoo6a5rslIQuZ9iVmD6u79b/abK7sPARBs8pjJJe7aZ/NhzTdcRPQCFWMqdQ==
X-Received: by 2002:a17:90a:1f47:: with SMTP id y7mr21372790pjy.171.1623085583586;
        Mon, 07 Jun 2021 10:06:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f656:ffce:6348:a42a])
        by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:06:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 06/11] drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
Date:   Mon,  7 Jun 2021 10:05:50 -0700
Message-Id: <20210607100234.v9.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
---

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
2.32.0.rc1.229.g3e70b5a671-goog

