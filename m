Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846E638F6AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhEYAE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhEYAER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:04:17 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AACBC061342
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:47 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j12so21302739pgh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONlP6+gSkJuweEz0JsYlBcsxQlrl6J2nKtwaKsr8Z8Y=;
        b=YcuBLrvkRDE0AgUOrrBPNrOpBX2u2k1iQqa9PfHwvLAViUvOXdYNa30Kbmvt2Xdfwg
         ApnJHOW/E0Irt7iOdqGcPT3NUn4YFRVnu08pcEF9EQ1hgYDMOE8m+AOIiE21oX57NcZV
         PuiZ5APw0zluZB63VOpFg1o/W6Qv8dzW4fsnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONlP6+gSkJuweEz0JsYlBcsxQlrl6J2nKtwaKsr8Z8Y=;
        b=Mm40vNpfRB+Uj4usSNcWyjTOTOSeBPlEFO991cF6z6jJlI9312SitntrN+H/eQk6Sy
         orlFQKNMTz9+L99RFZQXV/BAlUaCEufX1oXyGaZIhoAtLWVLwUVd0i3RWSfmV1luVuS5
         3urXErOiWRjVCJD/DSlel6TiUuy278z09I2+5/n86payuFP6HcErQWqGH5YlKaVKKUlV
         yfnESRPp5HhXbK4nduVTMrUFpAdrAQ0DQfsxVCXGoFazpOqAAn1MUnDik4ER8qsrXG54
         1FgPwK6FL/GO90YAGnZ8sx1Iz5S3M7WiJ8ED3GOKudepZexNAdxgQEnZY1zfTIjbjF0N
         FfEQ==
X-Gm-Message-State: AOAM533/I1qetmT0B9UEv/koNvOufGIFYMjhYVyysfxBKU0aC9WNyNXs
        yNspGoXxlNkk0GnZPbHvBnVkLQ==
X-Google-Smtp-Source: ABdhPJy4NR41GJd99X4lvXJNC6dficjAkNhXr9PFTIDipvOLbS4rEl5uyT19pS0//YLxOPyUNm7x4Q==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id i22-20020aa78b560000b02902b977bed305mr27588027pfd.61.1621900966895;
        Mon, 24 May 2021 17:02:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
        by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:02:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/11] drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint device
Date:   Mon, 24 May 2021 17:01:54 -0700
Message-Id: <20210524165920.v8.6.Iada41f76a7342354bae929d0bb3ceba40f27f0ea@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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
index ef87d92cdf49..b1ea86d9fdaf 100644
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
2.31.1.818.g46aad6cb9e-goog

