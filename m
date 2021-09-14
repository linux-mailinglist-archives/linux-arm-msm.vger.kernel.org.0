Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52BA40B91E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234837AbhINUY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbhINUX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:23:57 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F977C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:32 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id k23-20020a17090a591700b001976d2db364so531087pji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nAj1TelyJmSaF4TMY4AbANDSnLkT0dFj5LXHDQg3Ys=;
        b=dF+lwG1XH8BqSXrkMnBSyJBFNCujUPK52qzlX33pfMk3KFVEFZSCy3YwxKXlC9YyXh
         /FWEgMOcQcjSOSVRizEbX4igxs2cpO2y0kxzLsKwq5Mm9on/8fLzP1ehP3RJq5zEHIhO
         aQIugJBaKXengbn8v0u+1m1MCcWmHTlWQzwSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nAj1TelyJmSaF4TMY4AbANDSnLkT0dFj5LXHDQg3Ys=;
        b=rw9nsdGeRkUEi4ZYt8k4dgcR7H1BV52PXUH1NSae/+dL2Ye5TXlii9+dWelHmlliHI
         YJd7TCp3cRa75gdZJcTEPn+rd1AOCpDrd6ubNFrM4tEmIXGV7pdoDMu/WdiWjPtsU+D8
         eqI57SQB3sc9jIO06IsJ6S9MJ3ufO3SSqOhhy1grivUpWYUA8iaRTpnSy2luusXwAxWr
         ShT/L9nzW/v0pkfI1xnIc5+XlQOVy8RpWUaiJ3j6ri0Owkqe+frRt75DcdsmSlWdlXXV
         bu7sTu73fdvjTCSMDhLV61m4sfWO0/xP00ESWrrjUmUSc1IsNK8Kqp/7VJPgsNmZC1DG
         8htg==
X-Gm-Message-State: AOAM53058jM4g6oMZa1DQ395l1u7yzgrj+4uAkos8p71fBeManXyTeaa
        Yh5dz85f1IvfadrkeSP6A9AXnQ==
X-Google-Smtp-Source: ABdhPJzwz7dEtrc7PX46OhcDWI6/INexSawjgoWx5S1nThpMM3I6+pw6/2VGGGk5vKUX7ot44FTbnw==
X-Received: by 2002:a17:902:da88:b0:13b:76f3:5263 with SMTP id j8-20020a170902da8800b0013b76f35263mr16538893plx.47.1631650951583;
        Tue, 14 Sep 2021 13:22:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:31 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/15] drm/panel-edp: Split eDP panels out of panel-simple
Date:   Tue, 14 Sep 2021 13:21:54 -0700
Message-Id: <20210914132020.v5.7.I0a2f75bb822d17ce06f5b147734764eeb0c3e3df@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The panel-simple driver handles way too much. Let's start trying to
get a handle on it by splitting out the eDP panels. This patch does
this:

1. Start by copying simple-panel verbatim over to a new driver,
   simple-panel-edp.
2. Rename "panel_simple" to "panel_edp" in the new driver.
3. Keep only panels marked with `DRM_MODE_CONNECTOR_eDP` in the new
   driver. Remove those panels from the old driver.
4. Remove all recent "DP AUX bus" stuff from the old driver. The DP
   AUX bus is only possible on DP panels.
5. Remove all DSI / MIPI related functions from the new driver.
6. Remove bus_format / bus_flags from eDP driver. These things don't
   seem to make any sense for eDP panels so let's stop filling in made
   up stuff.

In the end we end up with a bunch of duplicated code for now. Future
patches will try to address _some_ of this duplicated code though some
of it will be unavoidable.

NOTE: This may not actually move all eDP panels over to the new driver
since not all panels were properly marked with
`DRM_MODE_CONNECTOR_eDP`. A future patch will attempt to move wayward
panels I could identify but even so there may be some missed.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- PANEL_SIMPLE_EDP => PANEL_EDP
- Remove "non-eDP" in panel-simple description.
- panel-simple-edp => panel-edp

Changes in v3:
- Split eDP panels patch new for v3.

 drivers/gpu/drm/panel/Kconfig        |   16 +-
 drivers/gpu/drm/panel/Makefile       |    1 +
 drivers/gpu/drm/panel/panel-edp.c    | 1298 ++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c |  573 +-----------
 4 files changed, 1322 insertions(+), 566 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-edp.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 0b3784941312..369cb76512fe 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -77,14 +77,26 @@ config DRM_PANEL_LVDS
 	  backlight handling if the panel is attached to a backlight controller.
 
 config DRM_PANEL_SIMPLE
-	tristate "support for simple panels"
+	tristate "support for simple panels (other than eDP ones)"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
+	select VIDEOMODE_HELPERS
+	help
+	  DRM panel driver for dumb non-eDP panels that need at most a regulator
+	  and a GPIO to be powered up. Optionally a backlight can be attached so
+	  that it can be automatically turned off when the panel goes into a
+	  low power state.
+
+config DRM_PANEL_EDP
+	tristate "support for simple Embedded DisplayPort panels"
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	help
-	  DRM panel driver for dumb panels that need at most a regulator and
+	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 60c0149fc54a..6e30640b9099 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
new file mode 100644
index 000000000000..a3f609edface
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -0,0 +1,1298 @@
+/*
+ * Copyright (C) 2013, NVIDIA Corporation.  All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sub license,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_dp_aux_bus.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_panel.h>
+
+/**
+ * struct panel_desc - Describes a simple panel.
+ */
+struct panel_desc {
+	/**
+	 * @modes: Pointer to array of fixed modes appropriate for this panel.
+	 *
+	 * If only one mode then this can just be the address of the mode.
+	 * NOTE: cannot be used with "timings" and also if this is specified
+	 * then you cannot override the mode in the device tree.
+	 */
+	const struct drm_display_mode *modes;
+
+	/** @num_modes: Number of elements in modes array. */
+	unsigned int num_modes;
+
+	/**
+	 * @timings: Pointer to array of display timings
+	 *
+	 * NOTE: cannot be used with "modes" and also these will be used to
+	 * validate a device tree override if one is present.
+	 */
+	const struct display_timing *timings;
+
+	/** @num_timings: Number of elements in timings array. */
+	unsigned int num_timings;
+
+	/** @bpc: Bits per color. */
+	unsigned int bpc;
+
+	/** @size: Structure containing the physical size of this panel. */
+	struct {
+		/**
+		 * @size.width: Width (in mm) of the active display area.
+		 */
+		unsigned int width;
+
+		/**
+		 * @size.height: Height (in mm) of the active display area.
+		 */
+		unsigned int height;
+	} size;
+
+	/** @delay: Structure containing various delay values for this panel. */
+	struct {
+		/**
+		 * @delay.prepare: Time for the panel to become ready.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * become ready and start receiving video data
+		 */
+		unsigned int prepare;
+
+		/**
+		 * @delay.hpd_absent_delay: Time to wait if HPD isn't hooked up.
+		 *
+		 * Add this to the prepare delay if we know Hot Plug Detect
+		 * isn't used.
+		 */
+		unsigned int hpd_absent_delay;
+
+		/**
+		 * @delay.prepare_to_enable: Time between prepare and enable.
+		 *
+		 * The minimum time, in milliseconds, that needs to have passed
+		 * between when prepare finished and enable may begin. If at
+		 * enable time less time has passed since prepare finished,
+		 * the driver waits for the remaining time.
+		 *
+		 * If a fixed enable delay is also specified, we'll start
+		 * counting before delaying for the fixed delay.
+		 *
+		 * If a fixed prepare delay is also specified, we won't start
+		 * counting until after the fixed delay. We can't overlap this
+		 * fixed delay with the min time because the fixed delay
+		 * doesn't happen at the end of the function if a HPD GPIO was
+		 * specified.
+		 *
+		 * In other words:
+		 *   prepare()
+		 *     ...
+		 *     // do fixed prepare delay
+		 *     // wait for HPD GPIO if applicable
+		 *     // start counting for prepare_to_enable
+		 *
+		 *   enable()
+		 *     // do fixed enable delay
+		 *     // enforce prepare_to_enable min time
+		 */
+		unsigned int prepare_to_enable;
+
+		/**
+		 * @delay.enable: Time for the panel to display a valid frame.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * display the first valid frame after starting to receive
+		 * video data.
+		 */
+		unsigned int enable;
+
+		/**
+		 * @delay.disable: Time for the panel to turn the display off.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display off (no content is visible).
+		 */
+		unsigned int disable;
+
+		/**
+		 * @delay.unprepare: Time to power down completely.
+		 *
+		 * The time (in milliseconds) that it takes for the panel
+		 * to power itself down completely.
+		 *
+		 * This time is used to prevent a future "prepare" from
+		 * starting until at least this many milliseconds has passed.
+		 * If at prepare time less time has passed since unprepare
+		 * finished, the driver waits for the remaining time.
+		 */
+		unsigned int unprepare;
+	} delay;
+};
+
+struct panel_edp {
+	struct drm_panel base;
+	bool enabled;
+	bool no_hpd;
+
+	bool prepared;
+
+	ktime_t prepared_time;
+	ktime_t unprepared_time;
+
+	const struct panel_desc *desc;
+
+	struct regulator *supply;
+	struct i2c_adapter *ddc;
+	struct drm_dp_aux *aux;
+
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *hpd_gpio;
+
+	struct edid *edid;
+
+	struct drm_display_mode override_mode;
+
+	enum drm_panel_orientation orientation;
+};
+
+static inline struct panel_edp *to_panel_edp(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_edp, base);
+}
+
+static unsigned int panel_edp_get_timings_modes(struct panel_edp *panel,
+						struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	unsigned int i, num = 0;
+
+	for (i = 0; i < panel->desc->num_timings; i++) {
+		const struct display_timing *dt = &panel->desc->timings[i];
+		struct videomode vm;
+
+		videomode_from_timing(dt, &vm);
+		mode = drm_mode_create(connector->dev);
+		if (!mode) {
+			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
+				dt->hactive.typ, dt->vactive.typ);
+			continue;
+		}
+
+		drm_display_mode_from_videomode(&vm, mode);
+
+		mode->type |= DRM_MODE_TYPE_DRIVER;
+
+		if (panel->desc->num_timings == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+		num++;
+	}
+
+	return num;
+}
+
+static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
+						struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	unsigned int i, num = 0;
+
+	for (i = 0; i < panel->desc->num_modes; i++) {
+		const struct drm_display_mode *m = &panel->desc->modes[i];
+
+		mode = drm_mode_duplicate(connector->dev, m);
+		if (!mode) {
+			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
+				m->hdisplay, m->vdisplay,
+				drm_mode_vrefresh(m));
+			continue;
+		}
+
+		mode->type |= DRM_MODE_TYPE_DRIVER;
+
+		if (panel->desc->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_set_name(mode);
+
+		drm_mode_probed_add(connector, mode);
+		num++;
+	}
+
+	return num;
+}
+
+static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	bool has_override = panel->override_mode.type;
+	unsigned int num = 0;
+
+	if (!panel->desc)
+		return 0;
+
+	if (has_override) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel->override_mode);
+		if (mode) {
+			drm_mode_probed_add(connector, mode);
+			num = 1;
+		} else {
+			dev_err(panel->base.dev, "failed to add override mode\n");
+		}
+	}
+
+	/* Only add timings if override was not there or failed to validate */
+	if (num == 0 && panel->desc->num_timings)
+		num = panel_edp_get_timings_modes(panel, connector);
+
+	/*
+	 * Only add fixed modes if timings/override added no mode.
+	 *
+	 * We should only ever have either the display timings specified
+	 * or a fixed mode. Anything else is rather bogus.
+	 */
+	WARN_ON(panel->desc->num_timings && panel->desc->num_modes);
+	if (num == 0)
+		num = panel_edp_get_display_modes(panel, connector);
+
+	connector->display_info.bpc = panel->desc->bpc;
+	connector->display_info.width_mm = panel->desc->size.width;
+	connector->display_info.height_mm = panel->desc->size.height;
+
+	return num;
+}
+
+static void panel_edp_wait(ktime_t start_ktime, unsigned int min_ms)
+{
+	ktime_t now_ktime, min_ktime;
+
+	if (!min_ms)
+		return;
+
+	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
+	now_ktime = ktime_get();
+
+	if (ktime_before(now_ktime, min_ktime))
+		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
+}
+
+static int panel_edp_disable(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+	if (!p->enabled)
+		return 0;
+
+	if (p->desc->delay.disable)
+		msleep(p->desc->delay.disable);
+
+	p->enabled = false;
+
+	return 0;
+}
+
+static int panel_edp_suspend(struct device *dev)
+{
+	struct panel_edp *p = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+	p->unprepared_time = ktime_get();
+
+	kfree(p->edid);
+	p->edid = NULL;
+
+	return 0;
+}
+
+static int panel_edp_unprepare(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+	int ret;
+
+	/* Unpreparing when already unprepared is a no-op */
+	if (!p->prepared)
+		return 0;
+
+	pm_runtime_mark_last_busy(panel->dev);
+	ret = pm_runtime_put_autosuspend(panel->dev);
+	if (ret < 0)
+		return ret;
+	p->prepared = false;
+
+	return 0;
+}
+
+static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
+{
+	int err;
+
+	p->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+	if (IS_ERR(p->hpd_gpio)) {
+		err = PTR_ERR(p->hpd_gpio);
+
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
+
+		return err;
+	}
+
+	return 0;
+}
+
+static int panel_edp_prepare_once(struct panel_edp *p)
+{
+	struct device *dev = p->base.dev;
+	unsigned int delay;
+	int err;
+	int hpd_asserted;
+	unsigned long hpd_wait_us;
+
+	panel_edp_wait(p->unprepared_time, p->desc->delay.unprepare);
+
+	err = regulator_enable(p->supply);
+	if (err < 0) {
+		dev_err(dev, "failed to enable supply: %d\n", err);
+		return err;
+	}
+
+	gpiod_set_value_cansleep(p->enable_gpio, 1);
+
+	delay = p->desc->delay.prepare;
+	if (p->no_hpd)
+		delay += p->desc->delay.hpd_absent_delay;
+	if (delay)
+		msleep(delay);
+
+	if (p->hpd_gpio) {
+		if (p->desc->delay.hpd_absent_delay)
+			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
+		else
+			hpd_wait_us = 2000000;
+
+		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
+					 hpd_asserted, hpd_asserted,
+					 1000, hpd_wait_us);
+		if (hpd_asserted < 0)
+			err = hpd_asserted;
+
+		if (err) {
+			if (err != -ETIMEDOUT)
+				dev_err(dev,
+					"error waiting for hpd GPIO: %d\n", err);
+			goto error;
+		}
+	}
+
+	p->prepared_time = ktime_get();
+
+	return 0;
+
+error:
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+	p->unprepared_time = ktime_get();
+
+	return err;
+}
+
+/*
+ * Some panels simply don't always come up and need to be power cycled to
+ * work properly.  We'll allow for a handful of retries.
+ */
+#define MAX_PANEL_PREPARE_TRIES		5
+
+static int panel_edp_resume(struct device *dev)
+{
+	struct panel_edp *p = dev_get_drvdata(dev);
+	int ret;
+	int try;
+
+	for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
+		ret = panel_edp_prepare_once(p);
+		if (ret != -ETIMEDOUT)
+			break;
+	}
+
+	if (ret == -ETIMEDOUT)
+		dev_err(dev, "Prepare timeout after %d tries\n", try);
+	else if (try)
+		dev_warn(dev, "Prepare needed %d retries\n", try);
+
+	return ret;
+}
+
+static int panel_edp_prepare(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
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
+static int panel_edp_enable(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+	if (p->enabled)
+		return 0;
+
+	if (p->desc->delay.enable)
+		msleep(p->desc->delay.enable);
+
+	panel_edp_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
+
+	p->enabled = true;
+
+	return 0;
+}
+
+static int panel_edp_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+	int num = 0;
+
+	/* probe EDID if a DDC bus is available */
+	if (p->ddc) {
+		pm_runtime_get_sync(panel->dev);
+
+		if (!p->edid)
+			p->edid = drm_get_edid(connector, p->ddc);
+
+		if (p->edid)
+			num += drm_add_edid_modes(connector, p->edid);
+
+		pm_runtime_mark_last_busy(panel->dev);
+		pm_runtime_put_autosuspend(panel->dev);
+	}
+
+	/* add hard-coded panel modes */
+	num += panel_edp_get_non_edid_modes(p, connector);
+
+	/* set up connector's "panel orientation" property */
+	drm_connector_set_panel_orientation(connector, p->orientation);
+
+	return num;
+}
+
+static int panel_edp_get_timings(struct drm_panel *panel,
+				    unsigned int num_timings,
+				    struct display_timing *timings)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+	unsigned int i;
+
+	if (p->desc->num_timings < num_timings)
+		num_timings = p->desc->num_timings;
+
+	if (timings)
+		for (i = 0; i < num_timings; i++)
+			timings[i] = p->desc->timings[i];
+
+	return p->desc->num_timings;
+}
+
+static const struct drm_panel_funcs panel_edp_funcs = {
+	.disable = panel_edp_disable,
+	.unprepare = panel_edp_unprepare,
+	.prepare = panel_edp_prepare,
+	.enable = panel_edp_enable,
+	.get_modes = panel_edp_get_modes,
+	.get_timings = panel_edp_get_timings,
+};
+
+#define PANEL_EDP_BOUNDS_CHECK(to_check, bounds, field) \
+	(to_check->field.typ >= bounds->field.min && \
+	 to_check->field.typ <= bounds->field.max)
+static void panel_edp_parse_panel_timing_node(struct device *dev,
+					      struct panel_edp *panel,
+					      const struct display_timing *ot)
+{
+	const struct panel_desc *desc = panel->desc;
+	struct videomode vm;
+	unsigned int i;
+
+	if (WARN_ON(desc->num_modes)) {
+		dev_err(dev, "Reject override mode: panel has a fixed mode\n");
+		return;
+	}
+	if (WARN_ON(!desc->num_timings)) {
+		dev_err(dev, "Reject override mode: no timings specified\n");
+		return;
+	}
+
+	for (i = 0; i < panel->desc->num_timings; i++) {
+		const struct display_timing *dt = &panel->desc->timings[i];
+
+		if (!PANEL_EDP_BOUNDS_CHECK(ot, dt, hactive) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, hfront_porch) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, hback_porch) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, hsync_len) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, vactive) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, vfront_porch) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, vback_porch) ||
+		    !PANEL_EDP_BOUNDS_CHECK(ot, dt, vsync_len))
+			continue;
+
+		if (ot->flags != dt->flags)
+			continue;
+
+		videomode_from_timing(ot, &vm);
+		drm_display_mode_from_videomode(&vm, &panel->override_mode);
+		panel->override_mode.type |= DRM_MODE_TYPE_DRIVER |
+					     DRM_MODE_TYPE_PREFERRED;
+		break;
+	}
+
+	if (WARN_ON(!panel->override_mode.type))
+		dev_err(dev, "Reject override mode: No display_timing found\n");
+}
+
+static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
+			      struct drm_dp_aux *aux)
+{
+	struct panel_edp *panel;
+	struct display_timing dt;
+	struct device_node *ddc;
+	int err;
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	panel->enabled = false;
+	panel->prepared_time = 0;
+	panel->desc = desc;
+	panel->aux = aux;
+
+	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
+	if (!panel->no_hpd) {
+		err = panel_edp_get_hpd_gpio(dev, panel);
+		if (err)
+			return err;
+	}
+
+	panel->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(panel->supply))
+		return PTR_ERR(panel->supply);
+
+	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(panel->enable_gpio)) {
+		err = PTR_ERR(panel->enable_gpio);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "failed to request GPIO: %d\n", err);
+		return err;
+	}
+
+	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
+	if (err) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return err;
+	}
+
+	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (ddc) {
+		panel->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
+		if (!panel->ddc)
+			return -EPROBE_DEFER;
+	} else if (aux) {
+		panel->ddc = &aux->ddc;
+	}
+
+	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
+		panel_edp_parse_panel_timing_node(dev, panel, &dt);
+
+	/* Catch common mistakes for panels. */
+	if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
+		dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
+
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
+	drm_panel_init(&panel->base, dev, &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
+
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		goto disable_pm_runtime;
+
+	if (!panel->base.backlight && panel->aux) {
+		pm_runtime_get_sync(dev);
+		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+		if (err)
+			goto disable_pm_runtime;
+	}
+
+	drm_panel_add(&panel->base);
+
+	return 0;
+
+disable_pm_runtime:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
+		put_device(&panel->ddc->dev);
+
+	return err;
+}
+
+static int panel_edp_remove(struct device *dev)
+{
+	struct panel_edp *panel = dev_get_drvdata(dev);
+
+	drm_panel_remove(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
+		put_device(&panel->ddc->dev);
+
+	return 0;
+}
+
+static void panel_edp_shutdown(struct device *dev)
+{
+	struct panel_edp *panel = dev_get_drvdata(dev);
+
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+}
+
+static const struct drm_display_mode auo_b116xak01_mode = {
+	.clock = 69300,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 48,
+	.hsync_end = 1366 + 48 + 32,
+	.htotal = 1366 + 48 + 32 + 10,
+	.vdisplay = 768,
+	.vsync_start = 768 + 4,
+	.vsync_end = 768 + 4 + 6,
+	.vtotal = 768 + 4 + 6 + 15,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc auo_b116xak01 = {
+	.modes = &auo_b116xak01_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+	},
+};
+
+static const struct drm_display_mode auo_b116xw03_mode = {
+	.clock = 70589,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 40,
+	.htotal = 1366 + 40 + 40 + 32,
+	.vdisplay = 768,
+	.vsync_start = 768 + 10,
+	.vsync_end = 768 + 10 + 12,
+	.vtotal = 768 + 10 + 12 + 6,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc auo_b116xw03 = {
+	.modes = &auo_b116xw03_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.enable = 400,
+	},
+};
+
+static const struct drm_display_mode auo_b133han05_mode = {
+	.clock = 142600,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 58,
+	.hsync_end = 1920 + 58 + 42,
+	.htotal = 1920 + 58 + 42 + 60,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 5,
+	.vtotal = 1080 + 3 + 5 + 54,
+};
+
+static const struct panel_desc auo_b133han05 = {
+	.modes = &auo_b133han05_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+	.delay = {
+		.prepare = 100,
+		.enable = 20,
+		.unprepare = 50,
+	},
+};
+
+static const struct drm_display_mode auo_b140han06_mode = {
+	.clock = 141000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 16,
+	.hsync_end = 1920 + 16 + 16,
+	.htotal = 1920 + 16 + 16 + 152,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 14,
+	.vtotal = 1080 + 3 + 14 + 19,
+};
+
+static const struct panel_desc auo_b140han06 = {
+	.modes = &auo_b140han06_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+	.delay = {
+		.prepare = 100,
+		.enable = 20,
+		.unprepare = 50,
+	},
+};
+
+static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
+	{
+		.clock = 207800,
+		.hdisplay = 2160,
+		.hsync_start = 2160 + 48,
+		.hsync_end = 2160 + 48 + 32,
+		.htotal = 2160 + 48 + 32 + 100,
+		.vdisplay = 1440,
+		.vsync_start = 1440 + 3,
+		.vsync_end = 1440 + 3 + 6,
+		.vtotal = 1440 + 3 + 6 + 31,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{
+		.clock = 138500,
+		.hdisplay = 2160,
+		.hsync_start = 2160 + 48,
+		.hsync_end = 2160 + 48 + 32,
+		.htotal = 2160 + 48 + 32 + 100,
+		.vdisplay = 1440,
+		.vsync_start = 1440 + 3,
+		.vsync_end = 1440 + 3 + 6,
+		.vtotal = 1440 + 3 + 6 + 31,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct panel_desc boe_nv110wtm_n61 = {
+	.modes = boe_nv110wtm_n61_modes,
+	.num_modes = ARRAY_SIZE(boe_nv110wtm_n61_modes),
+	.bpc = 8,
+	.size = {
+		.width = 233,
+		.height = 155,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.prepare_to_enable = 80,
+		.enable = 50,
+		.unprepare = 500,
+	},
+};
+
+/* Also used for boe_nv133fhm_n62 */
+static const struct drm_display_mode boe_nv133fhm_n61_modes = {
+	.clock = 147840,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 200,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 6,
+	.vtotal = 1080 + 3 + 6 + 31,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+/* Also used for boe_nv133fhm_n62 */
+static const struct panel_desc boe_nv133fhm_n61 = {
+	.modes = &boe_nv133fhm_n61_modes,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 294,
+		.height = 165,
+	},
+	.delay = {
+		/*
+		 * When power is first given to the panel there's a short
+		 * spike on the HPD line.  It was explained that this spike
+		 * was until the TCON data download was complete.  On
+		 * one system this was measured at 8 ms.  We'll put 15 ms
+		 * in the prepare delay just to be safe and take it away
+		 * from the hpd_absent_delay (which would otherwise be 200 ms)
+		 * to handle this.  That means:
+		 * - If HPD isn't hooked up you still have 200 ms delay.
+		 * - If HPD is hooked up we won't try to look at it for the
+		 *   first 15 ms.
+		 */
+		.prepare = 15,
+		.hpd_absent_delay = 185,
+
+		.unprepare = 500,
+	},
+};
+
+static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
+	{
+		.clock = 148500,
+		.hdisplay = 1920,
+		.hsync_start = 1920 + 48,
+		.hsync_end = 1920 + 48 + 32,
+		.htotal = 2200,
+		.vdisplay = 1080,
+		.vsync_start = 1080 + 3,
+		.vsync_end = 1080 + 3 + 5,
+		.vtotal = 1125,
+	},
+};
+
+static const struct panel_desc boe_nv140fhmn49 = {
+	.modes = boe_nv140fhmn49_modes,
+	.num_modes = ARRAY_SIZE(boe_nv140fhmn49_modes),
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+	.delay = {
+		.prepare = 210,
+		.enable = 50,
+		.unprepare = 160,
+	},
+};
+
+static const struct drm_display_mode innolux_n116bca_ea1_mode = {
+	.clock = 76420,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 136,
+	.hsync_end = 1366 + 136 + 30,
+	.htotal = 1366 + 136 + 30 + 60,
+	.vdisplay = 768,
+	.vsync_start = 768 + 8,
+	.vsync_end = 768 + 8 + 12,
+	.vtotal = 768 + 8 + 12 + 12,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc innolux_n116bca_ea1 = {
+	.modes = &innolux_n116bca_ea1_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.prepare_to_enable = 80,
+		.unprepare = 500,
+	},
+};
+
+/*
+ * Datasheet specifies that at 60 Hz refresh rate:
+ * - total horizontal time: { 1506, 1592, 1716 }
+ * - total vertical time: { 788, 800, 868 }
+ *
+ * ...but doesn't go into exactly how that should be split into a front
+ * porch, back porch, or sync length.  For now we'll leave a single setting
+ * here which allows a bit of tweaking of the pixel clock at the expense of
+ * refresh rate.
+ */
+static const struct display_timing innolux_n116bge_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1366, 1366, 1366 },
+	.hfront_porch = { 136, 136, 136 },
+	.hback_porch = { 60, 60, 60 },
+	.hsync_len = { 30, 30, 30 },
+	.vactive = { 768, 768, 768 },
+	.vfront_porch = { 8, 8, 8 },
+	.vback_porch = { 12, 12, 12 },
+	.vsync_len = { 12, 12, 12 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n116bge = {
+	.timings = &innolux_n116bge_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+};
+
+static const struct drm_display_mode innolux_n125hce_gn1_mode = {
+	.clock = 162000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 40,
+	.hsync_end = 1920 + 40 + 40,
+	.htotal = 1920 + 40 + 40 + 80,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 4,
+	.vsync_end = 1080 + 4 + 4,
+	.vtotal = 1080 + 4 + 4 + 24,
+};
+
+static const struct panel_desc innolux_n125hce_gn1 = {
+	.modes = &innolux_n125hce_gn1_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 276,
+		.height = 155,
+	},
+};
+
+static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
+	.clock = 138778,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 24,
+	.hsync_end = 1920 + 24 + 48,
+	.htotal = 1920 + 24 + 48 + 88,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 12,
+	.vtotal = 1080 + 3 + 12 + 17,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc ivo_m133nwf4_r0 = {
+	.modes = &ivo_m133nwf4_r0_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 294,
+		.height = 165,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+		.unprepare = 500,
+	},
+};
+
+static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
+	.clock = 81000,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 32,
+	.htotal = 1366 + 40 + 32 + 62,
+	.vdisplay = 768,
+	.vsync_start = 768 + 5,
+	.vsync_end = 768 + 5 + 5,
+	.vtotal = 768 + 5 + 5 + 122,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc kingdisplay_kd116n21_30nv_a010 = {
+	.modes = &kingdisplay_kd116n21_30nv_a010_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+	.delay = {
+		.hpd_absent_delay = 200,
+	},
+};
+
+static const struct drm_display_mode lg_lp120up1_mode = {
+	.clock = 162300,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 40,
+	.hsync_end = 1920 + 40 + 40,
+	.htotal = 1920 + 40 + 40 + 80,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 4,
+	.vsync_end = 1280 + 4 + 4,
+	.vtotal = 1280 + 4 + 4 + 12,
+};
+
+static const struct panel_desc lg_lp120up1 = {
+	.modes = &lg_lp120up1_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 267,
+		.height = 183,
+	},
+};
+
+static const struct drm_display_mode neweast_wjfh116008a_modes[] = {
+	{
+		.clock = 138500,
+		.hdisplay = 1920,
+		.hsync_start = 1920 + 48,
+		.hsync_end = 1920 + 48 + 32,
+		.htotal = 1920 + 48 + 32 + 80,
+		.vdisplay = 1080,
+		.vsync_start = 1080 + 3,
+		.vsync_end = 1080 + 3 + 5,
+		.vtotal = 1080 + 3 + 5 + 23,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	}, {
+		.clock = 110920,
+		.hdisplay = 1920,
+		.hsync_start = 1920 + 48,
+		.hsync_end = 1920 + 48 + 32,
+		.htotal = 1920 + 48 + 32 + 80,
+		.vdisplay = 1080,
+		.vsync_start = 1080 + 3,
+		.vsync_end = 1080 + 3 + 5,
+		.vtotal = 1080 + 3 + 5 + 23,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	}
+};
+
+static const struct panel_desc neweast_wjfh116008a = {
+	.modes = neweast_wjfh116008a_modes,
+	.num_modes = 2,
+	.bpc = 6,
+	.size = {
+		.width = 260,
+		.height = 150,
+	},
+	.delay = {
+		.prepare = 110,
+		.enable = 20,
+		.unprepare = 500,
+	},
+};
+
+static const struct of_device_id platform_of_match[] = {
+	{
+		.compatible = "auo,b116xa01",
+		.data = &auo_b116xak01,
+	}, {
+		.compatible = "auo,b116xw03",
+		.data = &auo_b116xw03,
+	}, {
+		.compatible = "auo,b133han05",
+		.data = &auo_b133han05,
+	}, {
+		.compatible = "auo,b140han06",
+		.data = &auo_b140han06,
+	}, {
+		.compatible = "boe,nv110wtm-n61",
+		.data = &boe_nv110wtm_n61,
+	}, {
+		.compatible = "boe,nv133fhm-n61",
+		.data = &boe_nv133fhm_n61,
+	}, {
+		.compatible = "boe,nv133fhm-n62",
+		.data = &boe_nv133fhm_n61,
+	}, {
+		.compatible = "boe,nv140fhmn49",
+		.data = &boe_nv140fhmn49,
+	}, {
+		.compatible = "innolux,n116bca-ea1",
+		.data = &innolux_n116bca_ea1,
+	}, {
+		.compatible = "innolux,n116bge",
+		.data = &innolux_n116bge,
+	}, {
+		.compatible = "innolux,n125hce-gn1",
+		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "ivo,m133nwf4-r0",
+		.data = &ivo_m133nwf4_r0,
+	}, {
+		.compatible = "kingdisplay,kd116n21-30nv-a010",
+		.data = &kingdisplay_kd116n21_30nv_a010,
+	}, {
+		.compatible = "lg,lp120up1",
+		.data = &lg_lp120up1,
+	}, {
+		.compatible = "neweast,wjfh116008a",
+		.data = &neweast_wjfh116008a,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, platform_of_match);
+
+static int panel_edp_platform_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *id;
+
+	id = of_match_node(platform_of_match, pdev->dev.of_node);
+	if (!id)
+		return -ENODEV;
+
+	return panel_edp_probe(&pdev->dev, id->data, NULL);
+}
+
+static int panel_edp_platform_remove(struct platform_device *pdev)
+{
+	return panel_edp_remove(&pdev->dev);
+}
+
+static void panel_edp_platform_shutdown(struct platform_device *pdev)
+{
+	panel_edp_shutdown(&pdev->dev);
+}
+
+static const struct dev_pm_ops panel_edp_pm_ops = {
+	SET_RUNTIME_PM_OPS(panel_edp_suspend, panel_edp_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver panel_edp_platform_driver = {
+	.driver = {
+		.name = "panel-edp",
+		.of_match_table = platform_of_match,
+		.pm = &panel_edp_pm_ops,
+	},
+	.probe = panel_edp_platform_probe,
+	.remove = panel_edp_platform_remove,
+	.shutdown = panel_edp_platform_shutdown,
+};
+
+static int panel_edp_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
+{
+	const struct of_device_id *id;
+
+	id = of_match_node(platform_of_match, aux_ep->dev.of_node);
+	if (!id)
+		return -ENODEV;
+
+	return panel_edp_probe(&aux_ep->dev, id->data, aux_ep->aux);
+}
+
+static void panel_edp_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
+{
+	panel_edp_remove(&aux_ep->dev);
+}
+
+static void panel_edp_dp_aux_ep_shutdown(struct dp_aux_ep_device *aux_ep)
+{
+	panel_edp_shutdown(&aux_ep->dev);
+}
+
+static struct dp_aux_ep_driver panel_edp_dp_aux_ep_driver = {
+	.driver = {
+		.name = "panel-simple-dp-aux",
+		.of_match_table = platform_of_match,	/* Same as platform one! */
+		.pm = &panel_edp_pm_ops,
+	},
+	.probe = panel_edp_dp_aux_ep_probe,
+	.remove = panel_edp_dp_aux_ep_remove,
+	.shutdown = panel_edp_dp_aux_ep_shutdown,
+};
+
+static int __init panel_edp_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&panel_edp_platform_driver);
+	if (err < 0)
+		return err;
+
+	err = dp_aux_dp_driver_register(&panel_edp_dp_aux_ep_driver);
+	if (err < 0)
+		goto err_did_platform_register;
+
+	return 0;
+
+err_did_platform_register:
+	platform_driver_unregister(&panel_edp_platform_driver);
+
+	return err;
+}
+module_init(panel_edp_init);
+
+static void __exit panel_edp_exit(void)
+{
+	dp_aux_dp_driver_unregister(&panel_edp_dp_aux_ep_driver);
+	platform_driver_unregister(&panel_edp_platform_driver);
+}
+module_exit(panel_edp_exit);
+
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_DESCRIPTION("DRM Driver for Simple eDP Panels");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4ec310a650cd..317bf4f95d87 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -36,8 +36,6 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -187,7 +185,6 @@ struct panel_simple {
 
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
-	struct drm_dp_aux *aux;
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
@@ -660,8 +657,7 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
-static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
-			      struct drm_dp_aux *aux)
+static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
 	struct panel_simple *panel;
 	struct display_timing dt;
@@ -677,7 +673,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	panel->enabled = false;
 	panel->prepared_time = 0;
 	panel->desc = desc;
-	panel->aux = aux;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
 	if (!panel->no_hpd) {
@@ -712,8 +707,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 
 		if (!panel->ddc)
 			return -EPROBE_DEFER;
-	} else if (aux) {
-		panel->ddc = &aux->ddc;
 	}
 
 	if (desc == &panel_dpi) {
@@ -749,9 +742,9 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			desc->bpc != 8);
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
-		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
-			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
-		break;
+		dev_warn(dev, "eDP panels moved to panel-edp\n");
+		err = -EINVAL;
+		goto free_ddc;
 	case DRM_MODE_CONNECTOR_DSI:
 		if (desc->bpc != 6 && desc->bpc != 8)
 			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
@@ -798,15 +791,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	if (err)
 		goto disable_pm_runtime;
 
-	if (!panel->base.backlight && panel->aux) {
-		pm_runtime_get_sync(dev);
-		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-		if (err)
-			goto disable_pm_runtime;
-	}
-
 	drm_panel_add(&panel->base);
 
 	return 0;
@@ -815,7 +799,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
-	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
+	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
 	return err;
@@ -831,7 +815,7 @@ static int panel_simple_remove(struct device *dev)
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
+	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
 	return 0;
@@ -1015,63 +999,6 @@ static const struct panel_desc auo_b101xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b116xak01_mode = {
-	.clock = 69300,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 48,
-	.hsync_end = 1366 + 48 + 32,
-	.htotal = 1366 + 48 + 32 + 10,
-	.vdisplay = 768,
-	.vsync_start = 768 + 4,
-	.vsync_end = 768 + 4 + 6,
-	.vtotal = 768 + 4 + 6 + 15,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc auo_b116xak01 = {
-	.modes = &auo_b116xak01_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 256,
-		.height = 144,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-static const struct drm_display_mode auo_b116xw03_mode = {
-	.clock = 70589,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 40,
-	.hsync_end = 1366 + 40 + 40,
-	.htotal = 1366 + 40 + 40 + 32,
-	.vdisplay = 768,
-	.vsync_start = 768 + 10,
-	.vsync_end = 768 + 10 + 12,
-	.vtotal = 768 + 10 + 12 + 6,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc auo_b116xw03 = {
-	.modes = &auo_b116xw03_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 256,
-		.height = 144,
-	},
-	.delay = {
-		.enable = 400,
-	},
-	.bus_flags = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode auo_b133xtn01_mode = {
 	.clock = 69500,
 	.hdisplay = 1366,
@@ -1094,36 +1021,6 @@ static const struct panel_desc auo_b133xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b133han05_mode = {
-	.clock = 142600,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 58,
-	.hsync_end = 1920 + 58 + 42,
-	.htotal = 1920 + 58 + 42 + 60,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 5,
-	.vtotal = 1080 + 3 + 5 + 54,
-};
-
-static const struct panel_desc auo_b133han05 = {
-	.modes = &auo_b133han05_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 293,
-		.height = 165,
-	},
-	.delay = {
-		.prepare = 100,
-		.enable = 20,
-		.unprepare = 50,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode auo_b133htn01_mode = {
 	.clock = 150660,
 	.hdisplay = 1920,
@@ -1151,36 +1048,6 @@ static const struct panel_desc auo_b133htn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b140han06_mode = {
-	.clock = 141000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 16,
-	.hsync_end = 1920 + 16 + 16,
-	.htotal = 1920 + 16 + 16 + 152,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 14,
-	.vtotal = 1080 + 3 + 14 + 19,
-};
-
-static const struct panel_desc auo_b140han06 = {
-	.modes = &auo_b140han06_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 309,
-		.height = 174,
-	},
-	.delay = {
-		.prepare = 100,
-		.enable = 20,
-		.unprepare = 50,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct display_timing auo_g070vvn01_timings = {
 	.pixelclock = { 33300000, 34209000, 45000000 },
 	.hactive = { 800, 800, 800 },
@@ -1564,129 +1431,6 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
-static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
-	{
-		.clock = 207800,
-		.hdisplay = 2160,
-		.hsync_start = 2160 + 48,
-		.hsync_end = 2160 + 48 + 32,
-		.htotal = 2160 + 48 + 32 + 100,
-		.vdisplay = 1440,
-		.vsync_start = 1440 + 3,
-		.vsync_end = 1440 + 3 + 6,
-		.vtotal = 1440 + 3 + 6 + 31,
-		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
-	},
-	{
-		.clock = 138500,
-		.hdisplay = 2160,
-		.hsync_start = 2160 + 48,
-		.hsync_end = 2160 + 48 + 32,
-		.htotal = 2160 + 48 + 32 + 100,
-		.vdisplay = 1440,
-		.vsync_start = 1440 + 3,
-		.vsync_end = 1440 + 3 + 6,
-		.vtotal = 1440 + 3 + 6 + 31,
-		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
-	},
-};
-
-static const struct panel_desc boe_nv110wtm_n61 = {
-	.modes = boe_nv110wtm_n61_modes,
-	.num_modes = ARRAY_SIZE(boe_nv110wtm_n61_modes),
-	.bpc = 8,
-	.size = {
-		.width = 233,
-		.height = 155,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-		.prepare_to_enable = 80,
-		.enable = 50,
-		.unprepare = 500,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-/* Also used for boe_nv133fhm_n62 */
-static const struct drm_display_mode boe_nv133fhm_n61_modes = {
-	.clock = 147840,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 48,
-	.hsync_end = 1920 + 48 + 32,
-	.htotal = 1920 + 48 + 32 + 200,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 6,
-	.vtotal = 1080 + 3 + 6 + 31,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
-/* Also used for boe_nv133fhm_n62 */
-static const struct panel_desc boe_nv133fhm_n61 = {
-	.modes = &boe_nv133fhm_n61_modes,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 294,
-		.height = 165,
-	},
-	.delay = {
-		/*
-		 * When power is first given to the panel there's a short
-		 * spike on the HPD line.  It was explained that this spike
-		 * was until the TCON data download was complete.  On
-		 * one system this was measured at 8 ms.  We'll put 15 ms
-		 * in the prepare delay just to be safe and take it away
-		 * from the hpd_absent_delay (which would otherwise be 200 ms)
-		 * to handle this.  That means:
-		 * - If HPD isn't hooked up you still have 200 ms delay.
-		 * - If HPD is hooked up we won't try to look at it for the
-		 *   first 15 ms.
-		 */
-		.prepare = 15,
-		.hpd_absent_delay = 185,
-
-		.unprepare = 500,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
-	{
-		.clock = 148500,
-		.hdisplay = 1920,
-		.hsync_start = 1920 + 48,
-		.hsync_end = 1920 + 48 + 32,
-		.htotal = 2200,
-		.vdisplay = 1080,
-		.vsync_start = 1080 + 3,
-		.vsync_end = 1080 + 3 + 5,
-		.vtotal = 1125,
-	},
-};
-
-static const struct panel_desc boe_nv140fhmn49 = {
-	.modes = boe_nv140fhmn49_modes,
-	.num_modes = ARRAY_SIZE(boe_nv140fhmn49_modes),
-	.bpc = 6,
-	.size = {
-		.width = 309,
-		.height = 174,
-	},
-	.delay = {
-		.prepare = 210,
-		.enable = 50,
-		.unprepare = 160,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -2609,96 +2353,6 @@ static const struct panel_desc innolux_g121x1_l03 = {
 	},
 };
 
-static const struct drm_display_mode innolux_n116bca_ea1_mode = {
-	.clock = 76420,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 136,
-	.hsync_end = 1366 + 136 + 30,
-	.htotal = 1366 + 136 + 30 + 60,
-	.vdisplay = 768,
-	.vsync_start = 768 + 8,
-	.vsync_end = 768 + 8 + 12,
-	.vtotal = 768 + 8 + 12 + 12,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
-static const struct panel_desc innolux_n116bca_ea1 = {
-	.modes = &innolux_n116bca_ea1_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 256,
-		.height = 144,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-		.prepare_to_enable = 80,
-		.unprepare = 500,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-/*
- * Datasheet specifies that at 60 Hz refresh rate:
- * - total horizontal time: { 1506, 1592, 1716 }
- * - total vertical time: { 788, 800, 868 }
- *
- * ...but doesn't go into exactly how that should be split into a front
- * porch, back porch, or sync length.  For now we'll leave a single setting
- * here which allows a bit of tweaking of the pixel clock at the expense of
- * refresh rate.
- */
-static const struct display_timing innolux_n116bge_timing = {
-	.pixelclock = { 72600000, 76420000, 80240000 },
-	.hactive = { 1366, 1366, 1366 },
-	.hfront_porch = { 136, 136, 136 },
-	.hback_porch = { 60, 60, 60 },
-	.hsync_len = { 30, 30, 30 },
-	.vactive = { 768, 768, 768 },
-	.vfront_porch = { 8, 8, 8 },
-	.vback_porch = { 12, 12, 12 },
-	.vsync_len = { 12, 12, 12 },
-	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
-};
-
-static const struct panel_desc innolux_n116bge = {
-	.timings = &innolux_n116bge_timing,
-	.num_timings = 1,
-	.bpc = 6,
-	.size = {
-		.width = 256,
-		.height = 144,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-static const struct drm_display_mode innolux_n125hce_gn1_mode = {
-	.clock = 162000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40 + 80,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 4,
-	.vtotal = 1080 + 4 + 4 + 24,
-};
-
-static const struct panel_desc innolux_n125hce_gn1 = {
-	.modes = &innolux_n125hce_gn1_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 276,
-		.height = 155,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode innolux_n156bge_l21_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -2773,64 +2427,6 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
-static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
-	.clock = 138778,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 24,
-	.hsync_end = 1920 + 24 + 48,
-	.htotal = 1920 + 24 + 48 + 88,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 12,
-	.vtotal = 1080 + 3 + 12 + 17,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
-
-static const struct panel_desc ivo_m133nwf4_r0 = {
-	.modes = &ivo_m133nwf4_r0_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 294,
-		.height = 165,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-		.unprepare = 500,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
-static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
-	.clock = 81000,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 40,
-	.hsync_end = 1366 + 40 + 32,
-	.htotal = 1366 + 40 + 32 + 62,
-	.vdisplay = 768,
-	.vsync_start = 768 + 5,
-	.vsync_end = 768 + 5 + 5,
-	.vtotal = 768 + 5 + 5 + 122,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc kingdisplay_kd116n21_30nv_a010 = {
-	.modes = &kingdisplay_kd116n21_30nv_a010_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 256,
-		.height = 144,
-	},
-	.delay = {
-		.hpd_absent_delay = 200,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -3025,29 +2621,6 @@ static const struct panel_desc lg_lp097qx1_spa1 = {
 	},
 };
 
-static const struct drm_display_mode lg_lp120up1_mode = {
-	.clock = 162300,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40+ 80,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 4,
-	.vsync_end = 1280 + 4 + 4,
-	.vtotal = 1280 + 4 + 4 + 12,
-};
-
-static const struct panel_desc lg_lp120up1 = {
-	.modes = &lg_lp120up1_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 267,
-		.height = 183,
-	},
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode lg_lp129qe_mode = {
 	.clock = 285250,
 	.hdisplay = 2560,
@@ -3330,49 +2903,6 @@ static const struct panel_desc netron_dy_e231732 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
-static const struct drm_display_mode neweast_wjfh116008a_modes[] = {
-	{
-		.clock = 138500,
-		.hdisplay = 1920,
-		.hsync_start = 1920 + 48,
-		.hsync_end = 1920 + 48 + 32,
-		.htotal = 1920 + 48 + 32 + 80,
-		.vdisplay = 1080,
-		.vsync_start = 1080 + 3,
-		.vsync_end = 1080 + 3 + 5,
-		.vtotal = 1080 + 3 + 5 + 23,
-		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-	}, {
-		.clock = 110920,
-		.hdisplay = 1920,
-		.hsync_start = 1920 + 48,
-		.hsync_end = 1920 + 48 + 32,
-		.htotal = 1920 + 48 + 32 + 80,
-		.vdisplay = 1080,
-		.vsync_start = 1080 + 3,
-		.vsync_end = 1080 + 3 + 5,
-		.vtotal = 1080 + 3 + 5 + 23,
-		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-	}
-};
-
-static const struct panel_desc neweast_wjfh116008a = {
-	.modes = neweast_wjfh116008a_modes,
-	.num_modes = 2,
-	.bpc = 6,
-	.size = {
-		.width = 260,
-		.height = 150,
-	},
-	.delay = {
-		.prepare = 110,
-		.enable = 20,
-		.unprepare = 500,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode newhaven_nhd_43_480272ef_atxl_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -4489,21 +4019,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b101xtn01",
 		.data = &auo_b101xtn01,
-	}, {
-		.compatible = "auo,b116xa01",
-		.data = &auo_b116xak01,
-	}, {
-		.compatible = "auo,b116xw03",
-		.data = &auo_b116xw03,
-	}, {
-		.compatible = "auo,b133han05",
-		.data = &auo_b133han05,
 	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
-	}, {
-		.compatible = "auo,b140han06",
-		.data = &auo_b140han06,
 	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
@@ -4549,18 +4067,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
-	}, {
-		.compatible = "boe,nv110wtm-n61",
-		.data = &boe_nv110wtm_n61,
-	}, {
-		.compatible = "boe,nv133fhm-n61",
-		.data = &boe_nv133fhm_n61,
-	}, {
-		.compatible = "boe,nv133fhm-n62",
-		.data = &boe_nv133fhm_n61,
-	}, {
-		.compatible = "boe,nv140fhmn49",
-		.data = &boe_nv140fhmn49,
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
@@ -4672,15 +4178,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121x1-l03",
 		.data = &innolux_g121x1_l03,
-	}, {
-		.compatible = "innolux,n116bca-ea1",
-		.data = &innolux_n116bca_ea1,
-	}, {
-		.compatible = "innolux,n116bge",
-		.data = &innolux_n116bge,
-	}, {
-		.compatible = "innolux,n125hce-gn1",
-		.data = &innolux_n125hce_gn1,
 	}, {
 		.compatible = "innolux,n156bge-l21",
 		.data = &innolux_n156bge_l21,
@@ -4690,12 +4187,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
-	}, {
-		.compatible = "ivo,m133nwf4-r0",
-		.data = &ivo_m133nwf4_r0,
-	}, {
-		.compatible = "kingdisplay,kd116n21-30nv-a010",
-		.data = &kingdisplay_kd116n21_30nv_a010,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
@@ -4720,9 +4211,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "lg,lp097qx1-spa1",
 		.data = &lg_lp097qx1_spa1,
-	}, {
-		.compatible = "lg,lp120up1",
-		.data = &lg_lp120up1,
 	}, {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
@@ -4756,9 +4244,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "netron-dy,e231732",
 		.data = &netron_dy_e231732,
-	}, {
-		.compatible = "neweast,wjfh116008a",
-		.data = &neweast_wjfh116008a,
 	}, {
 		.compatible = "newhaven,nhd-4.3-480272ef-atxl",
 		.data = &newhaven_nhd_43_480272ef_atxl,
@@ -4918,7 +4403,7 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, id->data, NULL);
+	return panel_simple_probe(&pdev->dev, id->data);
 }
 
 static int panel_simple_platform_remove(struct platform_device *pdev)
@@ -5198,7 +4683,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 
 	desc = id->data;
 
-	err = panel_simple_probe(&dsi->dev, &desc->desc, NULL);
+	err = panel_simple_probe(&dsi->dev, &desc->desc);
 	if (err < 0)
 		return err;
 
@@ -5243,38 +4728,6 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
 	.shutdown = panel_simple_dsi_shutdown,
 };
 
-static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
-{
-	const struct of_device_id *id;
-
-	id = of_match_node(platform_of_match, aux_ep->dev.of_node);
-	if (!id)
-		return -ENODEV;
-
-	return panel_simple_probe(&aux_ep->dev, id->data, aux_ep->aux);
-}
-
-static void panel_simple_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
-{
-	panel_simple_remove(&aux_ep->dev);
-}
-
-static void panel_simple_dp_aux_ep_shutdown(struct dp_aux_ep_device *aux_ep)
-{
-	panel_simple_shutdown(&aux_ep->dev);
-}
-
-static struct dp_aux_ep_driver panel_simple_dp_aux_ep_driver = {
-	.driver = {
-		.name = "panel-simple-dp-aux",
-		.of_match_table = platform_of_match,	/* Same as platform one! */
-		.pm = &panel_simple_pm_ops,
-	},
-	.probe = panel_simple_dp_aux_ep_probe,
-	.remove = panel_simple_dp_aux_ep_remove,
-	.shutdown = panel_simple_dp_aux_ep_shutdown,
-};
-
 static int __init panel_simple_init(void)
 {
 	int err;
@@ -5283,21 +4736,14 @@ static int __init panel_simple_init(void)
 	if (err < 0)
 		return err;
 
-	err = dp_aux_dp_driver_register(&panel_simple_dp_aux_ep_driver);
-	if (err < 0)
-		goto err_did_platform_register;
-
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
 		err = mipi_dsi_driver_register(&panel_simple_dsi_driver);
 		if (err < 0)
-			goto err_did_aux_ep_register;
+			goto err_did_platform_register;
 	}
 
 	return 0;
 
-err_did_aux_ep_register:
-	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
-
 err_did_platform_register:
 	platform_driver_unregister(&panel_simple_platform_driver);
 
@@ -5310,7 +4756,6 @@ static void __exit panel_simple_exit(void)
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
 		mipi_dsi_driver_unregister(&panel_simple_dsi_driver);
 
-	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
 	platform_driver_unregister(&panel_simple_platform_driver);
 }
 module_exit(panel_simple_exit);
-- 
2.33.0.309.g3052b89438-goog

