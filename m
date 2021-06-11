Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775333A47C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 19:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhFKRVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 13:21:13 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:40842 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhFKRVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 13:21:10 -0400
Received: by mail-pj1-f42.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso6206752pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fLUswd1dSQ0hPRNhs52IrDtd9ENhPFtFix4wQei6vxU=;
        b=NAETJtO4D7MVafOLBIqeEz1+Qv+4DGD89aACIYgtCY431W7AT9ZC8J6IaxHJ+xwlt0
         YaWIHpEE+YITkMTdxBikYyXL9S+ZfZ3CLS9c/+C1NS4Px+psyj+1LZFAre0YXYKQd9Tu
         HyW/B6+0La9ZTSPyPMlyVL0FTgS9h0y7QZQnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fLUswd1dSQ0hPRNhs52IrDtd9ENhPFtFix4wQei6vxU=;
        b=t37Ke+eZG5YoS/sms/6ypiM3kg5s3YGRNpB3sA6CxnFCI4M7KVYV9nPmNvSLTFYTLr
         CPCIw9zIeMi5dZ0RN4h5Qh4ed0HG0AcRyZzHndLjF2Gw/rLk9R4jehSxuzuttnC2ZYvk
         YKQwqW+oHm32oEiYddxTJqx0n3dPwD9Ah7UCUYQ1GyNoqFYRWIAdhls74WarSA2EmJCH
         IuLnIxp7ufG4Bgnl5ul/MGjOE5Ll6QJH9VM5BYA6uQQ4XJHS7M6AcsPtX/ah5wZM3kEe
         27ugZMlwI9ELVMufRcAme8Jw8DIDtLPSsC5Gj5ZCa7tOY/oDRNwyrhrtdJWKQeuoby4Q
         DuIA==
X-Gm-Message-State: AOAM532Sufx4w9SmEAvKuN12Z+Tqrzhk4pfx7PjzR4maYnPYmmSuLRsx
        qEeTPpK0W+6NFIxKqkOMv4weUQ==
X-Google-Smtp-Source: ABdhPJxV8cRIoU+LeovEJWmgTUI4w536XmUkBS8ZKX2GuJimd6Sjl+crXzNRFCak+h5mVLWuOODLxQ==
X-Received: by 2002:a17:90b:941:: with SMTP id dw1mr9778868pjb.115.1623431892186;
        Fri, 11 Jun 2021 10:18:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:4128:5428:5cd0:cfa5])
        by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:18:11 -0700 (PDT)
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
Subject: [PATCH v10 05/11] drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint device
Date:   Fri, 11 Jun 2021 10:17:41 -0700
Message-Id: <20210611101711.v10.5.Iada41f76a7342354bae929d0bb3ceba40f27f0ea@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The panel-simple driver can already have devices instantiated as
platform devices or MIPI DSI devices. Let's add a 3rd way to
instantiate it: as DP AUX endpoint devices.

At the moment there is no benefit to instantiating it in this way,
but:
- In the next patch we'll give it access to the DDC channel via the DP
  AUX bus.
- Possibly in the future we may use this channel to configure the
  backlight.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

(no changes since v7)

Changes in v7:
- Patch to allow panel-simple to be DP AUX EP new for v7.

 drivers/gpu/drm/panel/Kconfig        |  1 +
 drivers/gpu/drm/panel/panel-simple.c | 52 +++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1352dffda705..7c32b040aa72 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -82,6 +82,7 @@ config DRM_PANEL_SIMPLE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
+	select DRM_DP_AUX_BUS
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 21939d4352cf..d3b5ae22d939 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -36,6 +36,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -4957,6 +4958,38 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
 	.shutdown = panel_simple_dsi_shutdown,
 };
 
+static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
+{
+	const struct of_device_id *id;
+
+	id = of_match_node(platform_of_match, aux_ep->dev.of_node);
+	if (!id)
+		return -ENODEV;
+
+	return panel_simple_probe(&aux_ep->dev, id->data);
+}
+
+static void panel_simple_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
+{
+	panel_simple_remove(&aux_ep->dev);
+}
+
+static void panel_simple_dp_aux_ep_shutdown(struct dp_aux_ep_device *aux_ep)
+{
+	panel_simple_shutdown(&aux_ep->dev);
+}
+
+static struct dp_aux_ep_driver panel_simple_dp_aux_ep_driver = {
+	.driver = {
+		.name = "panel-simple-dp-aux",
+		.of_match_table = platform_of_match,	/* Same as platform one! */
+		.pm = &panel_simple_pm_ops,
+	},
+	.probe = panel_simple_dp_aux_ep_probe,
+	.remove = panel_simple_dp_aux_ep_remove,
+	.shutdown = panel_simple_dp_aux_ep_shutdown,
+};
+
 static int __init panel_simple_init(void)
 {
 	int err;
@@ -4965,15 +4998,25 @@ static int __init panel_simple_init(void)
 	if (err < 0)
 		return err;
 
+	err = dp_aux_dp_driver_register(&panel_simple_dp_aux_ep_driver);
+	if (err < 0)
+		goto err_did_platform_register;
+
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
 		err = mipi_dsi_driver_register(&panel_simple_dsi_driver);
-		if (err < 0) {
-			platform_driver_unregister(&panel_simple_platform_driver);
-			return err;
-		}
+		if (err < 0)
+			goto err_did_aux_ep_register;
 	}
 
 	return 0;
+
+err_did_aux_ep_register:
+	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
+
+err_did_platform_register:
+	platform_driver_unregister(&panel_simple_platform_driver);
+
+	return err;
 }
 module_init(panel_simple_init);
 
@@ -4982,6 +5025,7 @@ static void __exit panel_simple_exit(void)
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
 		mipi_dsi_driver_unregister(&panel_simple_dsi_driver);
 
+	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
 	platform_driver_unregister(&panel_simple_platform_driver);
 }
 module_exit(panel_simple_exit);
-- 
2.32.0.272.g935e593368-goog

