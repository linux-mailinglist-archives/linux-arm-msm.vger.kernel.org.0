Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA80353127
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhDBW3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbhDBW3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6273EC061797
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ha17so3280327pjb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bd7ZOcdLbggTkWq/b11t2tsonPi+tFBvbqHGCQY6R64=;
        b=Y82Ifp58mbKXik+k+22lEwNmBxDnbi4EdOcUxNE4tS1v8FtKxAXjDKfbiCg1WQ1fwo
         9m5VHOYO2zt2rDjV9NpyYNB5AaUcnKTAozlTmgHodqHfwDOnGzuV6pogLfdcuiiaB8C+
         GfUTEIrZj4D0dVJE4meMDZmr4ij2391fcpK9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bd7ZOcdLbggTkWq/b11t2tsonPi+tFBvbqHGCQY6R64=;
        b=tkxBkyOSVH0Qbk2GAuqYyKbJ+x+mM1oB7bAlR/0xrguSgvgRQPDb/ZPO7+KdcnvCZr
         fYnW4qRsMNEjVIP7oIa4kTgImN9J8+U9SCF0iu9L+pLNkbH1Dw5RIr7gG/fQLqjuZL2L
         un90vk6H7kPkPyG2VU1lOkUMmd6agcI+XZYS274JtZwB3xrSzgtH/HFnwCrLMq7GQXZu
         elu+TG4SJYE9Pj7J/9CNnFr4bGr/9USLXfAo2V7gIPmdjZuo1aReGy3OK5jjEyy2nxTp
         LYyZDvHCt87NhwQJ2kV2F6i/AAjjTMn83T1rRSdk9vxH4oZpwqL5Sl1/1+qTGfcOnZx9
         Faqw==
X-Gm-Message-State: AOAM531fQIHab5XcA/qasBiS762Scld8sM03NBQMAGzpp8+qp4b3tnLI
        mqXLBoMmgD3K+9X6TGysmKbymw==
X-Google-Smtp-Source: ABdhPJxIVU3dtJ6L+VxCnlaevQ2t7j0kZEkmzIZuSwfT1L7CjV9b4QC3Izww+hVdZMWB+Q+O6j29oA==
X-Received: by 2002:a17:902:e051:b029:e7:37d9:f32e with SMTP id x17-20020a170902e051b02900e737d9f32emr14488918plx.78.1617402579937;
        Fri, 02 Apr 2021 15:29:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/12] drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare
Date:   Fri,  2 Apr 2021 15:28:46 -0700
Message-Id: <20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unpreparing and re-preparing a panel can be a really heavy
operation. Panels datasheets often specify something on the order of
500ms as the delay you should insert after turning off the panel
before turning it on again. In addition, turning on a panel can have
delays on the order of 100ms - 200ms before the panel will assert HPD
(AKA "panel ready"). The above means that we should avoid turning a
panel off if we're going to turn it on again shortly.

The above becomes a problem when we want to read the EDID of a
panel. The way that ordering works is that userspace wants to read the
EDID of the panel _before_ fully enabling it so that it can set the
initial mode correctly. However, we can't read the EDID until we power
it up. This leads to code that does this dance (like
ps8640_bridge_get_edid()):

1. When userspace requests EDID / the panel modes (through an ioctl),
   we power on the panel just enough to read the EDID and then power
   it off.
2. Userspace then turns the panel on.

There's likely not much time between step #1 and #2 and so we want to
avoid powering the panel off and on again between those two steps.

Let's use Runtime PM to help us. We'll move the existing prepare() and
unprepare() to be runtime resume() and runtime suspend(). Now when we
want to prepare() or unprepare() we just increment or decrement the
refcount. We'll default to a 1 second autosuspend delay which seems
sane given the typical delays we see for panels.

A few notes:
- It seems the existing unprepare() and prepare() are defined to be
  no-ops if called extra times. We'll preserve that behavior.
- This is a slight change in the ABI of simple panel. If something was
  absolutely relying on the unprepare() to happen instantly that
  simply won't be the case anymore. I'm not aware of anyone relying on
  that behavior, but if there is someone then we'll need to figure out
  how to enable (or disable) this new delayed behavior selectively.
- In order for this to work we now have a hard dependency on
  "PM". From memory this is a legit thing to assume these days and we
  don't have to find some fallback to keep working if someone wants to
  build their system without "PM".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/Kconfig        |  1 +
 drivers/gpu/drm/panel/panel-simple.c | 93 +++++++++++++++++++++-------
 2 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..ef87d92cdf49 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -80,6 +80,7 @@ config DRM_PANEL_SIMPLE
 	tristate "support for simple panels"
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
 	select VIDEOMODE_HELPERS
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index be312b5c04dd..6b22872b3281 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/display_timing.h>
@@ -175,6 +176,8 @@ struct panel_simple {
 	bool enabled;
 	bool no_hpd;
 
+	bool prepared;
+
 	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
@@ -334,19 +337,31 @@ static int panel_simple_disable(struct drm_panel *panel)
 	return 0;
 }
 
+static int panel_simple_suspend(struct device *dev)
+{
+	struct panel_simple *p = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+	p->unprepared_time = ktime_get();
+
+	return 0;
+}
+
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
+	int ret;
 
-	if (p->prepared_time == 0)
+	/* Unpreparing when already unprepared is a no-op */
+	if (!p->prepared)
 		return 0;
 
-	gpiod_set_value_cansleep(p->enable_gpio, 0);
-
-	regulator_disable(p->supply);
-
-	p->prepared_time = 0;
-	p->unprepared_time = ktime_get();
+	pm_runtime_mark_last_busy(panel->dev);
+	ret = pm_runtime_put_autosuspend(panel->dev);
+	if (ret < 0)
+		return ret;
+	p->prepared = false;
 
 	return 0;
 }
@@ -376,22 +391,19 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
 	return 0;
 }
 
-static int panel_simple_prepare_once(struct drm_panel *panel)
+static int panel_simple_prepare_once(struct panel_simple *p)
 {
-	struct panel_simple *p = to_panel_simple(panel);
+	struct device *dev = p->base.dev;
 	unsigned int delay;
 	int err;
 	int hpd_asserted;
 	unsigned long hpd_wait_us;
 
-	if (p->prepared_time != 0)
-		return 0;
-
 	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
 
 	err = regulator_enable(p->supply);
 	if (err < 0) {
-		dev_err(panel->dev, "failed to enable supply: %d\n", err);
+		dev_err(dev, "failed to enable supply: %d\n", err);
 		return err;
 	}
 
@@ -405,7 +417,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
 
 	if (p->hpd_gpio) {
 		if (IS_ERR(p->hpd_gpio)) {
-			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
+			err = panel_simple_get_hpd_gpio(dev, p, false);
 			if (err)
 				goto error;
 		}
@@ -423,7 +435,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
 
 		if (err) {
 			if (err != -ETIMEDOUT)
-				dev_err(panel->dev,
+				dev_err(dev,
 					"error waiting for hpd GPIO: %d\n", err);
 			goto error;
 		}
@@ -447,25 +459,46 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
  */
 #define MAX_PANEL_PREPARE_TRIES		5
 
-static int panel_simple_prepare(struct drm_panel *panel)
+static int panel_simple_resume(struct device *dev)
 {
+	struct panel_simple *p = dev_get_drvdata(dev);
 	int ret;
 	int try;
 
 	for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
-		ret = panel_simple_prepare_once(panel);
+		ret = panel_simple_prepare_once(p);
 		if (ret != -ETIMEDOUT)
 			break;
 	}
 
 	if (ret == -ETIMEDOUT)
-		dev_err(panel->dev, "Prepare timeout after %d tries\n", try);
+		dev_err(dev, "Prepare timeout after %d tries\n", try);
 	else if (try)
-		dev_warn(panel->dev, "Prepare needed %d retries\n", try);
+		dev_warn(dev, "Prepare needed %d retries\n", try);
 
 	return ret;
 }
 
+static int panel_simple_prepare(struct drm_panel *panel)
+{
+	struct panel_simple *p = to_panel_simple(panel);
+	int ret;
+
+	/* Preparing when already prepared is a no-op */
+	if (p->prepared)
+		return 0;
+
+	ret = pm_runtime_get_sync(panel->dev);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(panel->dev);
+		return ret;
+	}
+
+	p->prepared = true;
+
+	return 0;
+}
+
 static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
@@ -748,6 +781,18 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		break;
 	}
 
+	dev_set_drvdata(dev, panel);
+
+	/*
+	 * We use runtime PM for prepare / unprepare since those power the panel
+	 * on and off and those can be very slow operations. This is important
+	 * to optimize powering the panel on briefly to read the EDID before
+	 * fully enabling the panel.
+	 */
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
@@ -756,8 +801,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	drm_panel_add(&panel->base);
 
-	dev_set_drvdata(dev, panel);
-
 	return 0;
 
 free_ddc:
@@ -4603,10 +4646,17 @@ static void panel_simple_platform_shutdown(struct platform_device *pdev)
 	panel_simple_shutdown(&pdev->dev);
 }
 
+static const struct dev_pm_ops panel_simple_pm_ops = {
+	SET_RUNTIME_PM_OPS(panel_simple_suspend, panel_simple_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 static struct platform_driver panel_simple_platform_driver = {
 	.driver = {
 		.name = "panel-simple",
 		.of_match_table = platform_of_match,
+		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_platform_probe,
 	.remove = panel_simple_platform_remove,
@@ -4901,6 +4951,7 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
 	.driver = {
 		.name = "panel-simple-dsi",
 		.of_match_table = dsi_of_match,
+		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_dsi_probe,
 	.remove = panel_simple_dsi_remove,
-- 
2.31.0.208.g409f899ff0-goog

