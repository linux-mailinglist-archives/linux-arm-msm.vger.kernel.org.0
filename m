Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392A61C06D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgD3Tq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgD3Tqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:46:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B83C09B040
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e6so1310167pjt.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18Forp5+g/d/pxVZSsn0tcdk9UfdWJp9klOtqj0eYRI=;
        b=mr8nNlcKXcCEZnkHZiBZidBV3UR0TJqCPNQtGgh1fQWaNgl85dgxydxCoz+9L1gnVh
         2LNDZgHoAaTe8AHvtVJ4YRq6pEgMPId2Clwccx0CoPy5CTPfnEUZooODm35qX21xzB69
         fR9dEgebGVLRbb1nDbdT27qFCYfKQV/OHsHvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18Forp5+g/d/pxVZSsn0tcdk9UfdWJp9klOtqj0eYRI=;
        b=iK8/3553Bozf15MTnyhmKSOB09S7qCPOWeQ8L3361lioq8m0rDkGMwgCjyM8Z8vnIn
         g1LJ5pBBtYEZHSD3PV5TiGaf+pSzKM19FAQ7u8sceI/kYgrrMqVQ5FVOjiPumgQb9ua+
         dGxxCFAKK30xJLONty9AwVRQcWtvyiL2wA28j3V9hdey+lqU4U1fcFB5t2vZGTScjdqT
         tQe7+nGVGpFq14x/nl/sf5CsZ0rKXrWcCNYXSKPW0moN9xiuvc6wM/xcjYarax4hITCg
         tcUyirqpM+kNMk7Vx5VRo6AKkfGW3lvqeIgh1C5KD3u+GQ8ITzzbnF1wRUyBTf3/b2sc
         Ctww==
X-Gm-Message-State: AGi0PuaYlHWcuhP2Nd+ec0gQL6X+7ngyOZbV4mQov/wCXcHCRnXOKSVP
        YOZ87hhfZs6DeHL1YQqMCOm8Ig==
X-Google-Smtp-Source: APiQypJiiPg0AHbv1LplSnQZRy3lAkJBvHGsUqdCPSJLVGyrcfUn4eezmereo9Kt5jX7p5OkOuJKlg==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id iq14mr486978pjb.146.1588275990734;
        Thu, 30 Apr 2020 12:46:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:46:30 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     linux-gpio@vger.kernel.org, jonas@kwiboo.se,
        robdclark@chromium.org, bjorn.andersson@linaro.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] drm/panel-simple: Support hpd-gpios for delaying prepare()
Date:   Thu, 30 Apr 2020 12:46:14 -0700
Message-Id: <20200430124442.v4.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

People use panel-simple when they have panels that are builtin to
their device.  In these cases the HPD (Hot Plug Detect) signal isn't
really used for hotplugging devices but instead is used for power
sequencing.  Panel timing diagrams (especially for eDP panels) usually
have the HPD signal in them and it acts as an indicator that the panel
is ready for us to talk to it.

Sometimes the HPD signal is hooked up to a normal GPIO on a system.
In this case we need to poll it in the correct place to know that the
panel is ready for us.  In some system designs the right place for
this is panel-simple.

When adding this support, we'll account for the case that there might
be a circular dependency between panel-simple and the provider of the
GPIO.  The case this was designed for was for the "ti-sn65dsi86"
bridge chip.  If HPD is hooked up to one of the GPIOs provided by the
bridge chip then in our probe function we'll always get back
-EPROBE_DEFER.  Let's handle this by allowing this GPIO to show up
late if we saw -EPROBE_DEFER during probe.  NOTE: since the
gpio_get_optional() is used, if the "hpd-gpios" isn't there our
variable will just be NULL and we won't do anything in prepare().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

Changes in v4: None
Changes in v3:
- Remind how gpio_get_optional() works in the commit message.

Changes in v2:
- ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")

 drivers/gpu/drm/panel/panel-simple.c | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3ad828eaefe1..f816e2aa29cd 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -23,6 +23,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -108,6 +109,7 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
+	struct gpio_desc *hpd_gpio;
 
 	struct drm_display_mode override_mode;
 };
@@ -259,11 +261,37 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int panel_simple_get_hpd_gpio(struct device *dev,
+				     struct panel_simple *p, bool from_probe)
+{
+	int err;
+
+	p->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+	if (IS_ERR(p->hpd_gpio)) {
+		err = PTR_ERR(p->hpd_gpio);
+
+		/*
+		 * If we're called from probe we won't consider '-EPROBE_DEFER'
+		 * to be an error--we'll leave the error code in "hpd_gpio".
+		 * When we try to use it we'll try again.  This allows for
+		 * circular dependencies where the component providing the
+		 * hpd gpio needs the panel to init before probing.
+		 */
+		if (err != -EPROBE_DEFER || !from_probe) {
+			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int panel_simple_prepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 	unsigned int delay;
 	int err;
+	int hpd_asserted;
 
 	if (p->prepared)
 		return 0;
@@ -282,6 +310,26 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	if (delay)
 		msleep(delay);
 
+	if (p->hpd_gpio) {
+		if (IS_ERR(p->hpd_gpio)) {
+			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
+			if (err)
+				return err;
+		}
+
+		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
+					 hpd_asserted, hpd_asserted,
+					 1000, 2000000);
+		if (hpd_asserted < 0)
+			err = hpd_asserted;
+
+		if (err) {
+			dev_err(panel->dev,
+				"error waiting for hpd GPIO: %d\n", err);
+			return err;
+		}
+	}
+
 	p->prepared = true;
 
 	return 0;
@@ -462,6 +510,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	panel->desc = desc;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
+	if (!panel->no_hpd) {
+		err = panel_simple_get_hpd_gpio(dev, panel, true);
+		if (err)
+			return err;
+	}
 
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
-- 
2.26.2.526.g744177e7f7-goog

