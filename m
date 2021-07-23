Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC743D30D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 02:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhGVXlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 19:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhGVXls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 19:41:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A2AC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:19 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j17-20020a17090aeb11b029017613554465so1519335pjz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lTsOWkE5xwBy2u5RnQLSAYUR8XEsGjJI+nk3qmejC1E=;
        b=BNPuxlOtn1RwTIqc8Bt1Q8S0mgPrnNYGqHWkq+nLZcsqFyCQa4+3aWxn7yAuA6u4cX
         aiXXgqBypo0flGvnyhkU+EerKrL3ie6Tr/3yv3Y+dkK+JJV4wSuFKaR3dObKgNcT+hkh
         6mZ/3NaOCo1KBPbav0MKLq91w6cUWn1UCTC/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lTsOWkE5xwBy2u5RnQLSAYUR8XEsGjJI+nk3qmejC1E=;
        b=OE1fr/zxjjxL7QAdF1TQYhxS1zoYJwPdPT0W4LnWOr2l9JaChgPxEK4c3+UDrMDexl
         zsZOolZpgw05RZ6ifTwBN7jMaU+d+Q+8pQcOfuRtBA4VJJEjCw0xk28IDKgIp9KQhv63
         Ut3Pzlek35mR/NS3zT53X2PwRZ2eZFAArDieCDS/awPAie5GC+N86ZdgDdh0qjGhbpJV
         WBwy/1XH+VKkkRrTAEVA/PmUrpeVETbxMuspx1zy1Dvsd0ST3bRQxl8OEJe941gsIp8+
         sYj2Nkb6gqUX/7dBRHzx+zzg37l15mNj0fIc9t2r/UzAnjaIZ4os4bjKIJUP8x/kF9d6
         NmZg==
X-Gm-Message-State: AOAM530z7IGTKTqWBcJcWEeiMcLDdoGjIoIPbtV18path+3X1dclBg48
        MaAGSVcs81anp6QXa1r/Rb0yJA==
X-Google-Smtp-Source: ABdhPJx3OwSufl06QG8cE253jZR44h1aw0BjXeshriQ5ivE540skLrstai4OBhXaFncTv/Vjt1j/aw==
X-Received: by 2002:a17:90a:4d04:: with SMTP id c4mr11018142pjg.148.1626999738853;
        Thu, 22 Jul 2021 17:22:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
        by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:22:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/8] drm/panel-simple: Implement generic "edp-panel"s probed by EDID
Date:   Thu, 22 Jul 2021 17:21:45 -0700
Message-Id: <20210722172104.RFC.7.Id9c96cba4eba3e5ee519bfb09cd64b39f2490293@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed in the patch ("dt-bindings: drm/panel-simple: Introduce
generic eDP panels") we can actually support probing eDP panels at
runtime instead of hardcoding what panel is connected. Add support to
the panel-simple driver for this.

We'll implement a solution like this:
* We'll read in two delays from the device tree that are used for
  powering up the panel the initial time (to read the EDID).
* In the EDID we can find a 32-bit ID that identifies what panel we've
  found. From this ID we can look up the full set of delays.

After this change we'll still need to add per-panel delays into the
panel-simple driver but we will no longer need to specify exactly
which panel is connected to which board. Nicely, any panels that are
only supported this way also don't need to hardcode mode data since
it's guaranteed that we can get that through the EDID.

This patch will seed the ID-to-delay table with a few panels that I
have access to, many of which are on sc7180-trogdor devices.

NOTE: as part of this patch, we'll also support a "fallback" panel. If
we have problems reading the EDID or we don't recognize the panel
connected then we can fallback to the delays from the fallback
panel. This can be handy for transitioning existing boards over to use
the new edp-panel solution since we'll still end up with a working
system even if some boards were shipped with different panels or bad
EDIDs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 218 ++++++++++++++++++++++++---
 1 file changed, 200 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 80bc60648ecf..3220298f0772 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -194,6 +194,20 @@ struct panel_desc {
 	int connector_type;
 };
 
+/**
+ * struct edp_panel_entry - Maps panel ID to delay / panel name.
+ */
+struct edp_panel_entry {
+	/** @panel_id: 32-bit ID for panel, encoded with encode_edid_id(). */
+	u32 panel_id;
+
+	/* @delay: The power sequencing delays needed for this panel. */
+	const struct panel_delay *delay;
+
+	/* @name: Name of this panel (for printing to logs). */
+	const char *name;
+};
+
 struct panel_simple {
 	struct drm_panel base;
 	bool enabled;
@@ -552,8 +566,15 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
-	/* add hard-coded panel modes */
-	num += panel_simple_get_non_edid_modes(p, connector);
+	/*
+	 * Add hard-coded panel modes. Don't call this if there are no timings
+	 * and no modes (the generic edp-panel case) because it will clobber
+	 * the display_info that was already set by drm_add_edid_modes().
+	 */
+	if (p->desc.num_timings || p->desc.num_modes)
+		num += panel_simple_get_non_edid_modes(p, connector);
+	else if (!num)
+		dev_warn(p->base.dev, "No display modes\n");
 
 	/* set up connector's "panel orientation" property */
 	drm_connector_set_panel_orientation(connector, p->orientation);
@@ -677,9 +698,90 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
+
+static int generic_edp_panel_probe(struct device *dev, struct panel_simple *panel)
+{
+	const struct edp_panel_entry *edp_panel;
+	u32 panel_id;
+	char vend[4];
+	u16 product_id;
+	u32 val;
+	int ret;
+
+	/*
+	 * Read the dts properties for the initial probe. These are used by
+	 * the runtime resume code which will get called by the
+	 * pm_runtime_get_sync() call below.
+	 *
+	 * NOTE: the delays might be pre-populated if a fallback panel was
+	 * specified or might be 0 if no fallback panel was specified.
+	 *
+	 * The value in the device tree can be _higher_ than the fallback
+	 * panel but never lower since the device tree value should be the max
+	 * of all possible panels that might be plugged into a given board.
+	 */
+	ret = of_property_read_u32(dev->of_node, "hpd-reliable-delay", &val);
+	if (!ret) {
+		if (panel->desc.delay.prepare > val)
+			dev_warn(dev,
+				 "Ignoring hpd-reliable-delay that's lower than fallback\n");
+		else
+			panel->desc.delay.prepare = val;
+	}
+	ret = of_property_read_u32(dev->of_node, "hpd-absent-delay", &val);
+	if (!ret) {
+		if (panel->desc.delay.hpd_absent_delay > val)
+			dev_warn(dev,
+				 "Ignoring hpd-absent-delay that's lower than fallback\n");
+		else if (panel->desc.delay.prepare > val)
+			dev_warn(dev,
+				 "Ignoring hpd-absent-delay that's lower than prepare delay\n");
+		else
+			/* hpd_absent_delay is added to prepare delay in prepare, so subtract now */
+			panel->desc.delay.hpd_absent_delay =
+				val - panel->desc.delay.prepare;
+	}
+
+	/* Power the panel on so we can read the EDID */
+	pm_runtime_get_sync(dev);
+
+	panel_id = drm_get_panel_id(panel->ddc);
+	if (!panel_id) {
+		dev_warn(dev, "Couldn't identify panel via EDID\n");
+		ret = -EIO;
+		goto exit;
+	}
+	decode_edid_id(panel_id, vend, &product_id);
+
+	edp_panel = find_edp_panel(panel_id);
+	if (!edp_panel) {
+		dev_warn(dev, "Unrecognized panel %s %#06x\n", vend, product_id);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	dev_info(dev, "Detected %s %s (%#06x)\n", vend, edp_panel->name, product_id);
+
+	/* Zero out anything from the fallback */
+	memset(&panel->desc, 0, sizeof(panel->desc));
+
+	/* Fill in the two required things; everything else comes from EDID */
+	panel->desc.connector_type = DRM_MODE_CONNECTOR_eDP;
+	panel->desc.delay = *edp_panel->delay;
+
+	ret = 0;
+exit:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			      struct drm_dp_aux *aux)
 {
+	bool is_generic_edp_panel = false;
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
@@ -693,7 +795,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 
 	panel->enabled = false;
 	panel->prepared_time = 0;
-	panel->desc = *desc;
+	if (desc)
+		panel->desc = *desc;
 	panel->aux = aux;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
@@ -743,6 +846,36 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
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
+	if (of_device_is_compatible(dev->of_node, "edp-panel")) {
+		err = generic_edp_panel_probe(dev, panel);
+		if (err && !desc)
+			return dev_err_probe(dev, err,
+					     "Couldn't detect panel nor find a fallback\n");
+
+		is_generic_edp_panel = !err;
+
+		/*
+		 * If desc was non-NULL then worst case we're using the fallback
+		 * and we can ignore errors. The generic_edp_panel_probe()
+		 * function would have already printed a warning.
+		 */
+		err = 0;
+	}
+
+	desc = &panel->desc;
+
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {
@@ -766,7 +899,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			desc->bpc != 8);
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
-		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
+		if (!is_generic_edp_panel && desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
 			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
 		break;
 	case DRM_MODE_CONNECTOR_DSI:
@@ -802,18 +935,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	if (!panel->enable_gpio && desc->delay.power_to_enable)
 		dev_warn(dev, "Need a delay before enabling panel GPIO, but a GPIO wasn't provided\n");
 
-	dev_set_drvdata(dev, panel);
-
-	/*
-	 * We use runtime PM for prepare / unprepare since those power the panel
-	 * on and off and those can be very slow operations. This is important
-	 * to optimize powering the panel on briefly to read the EDID before
-	 * fully enabling the panel.
-	 */
-	pm_runtime_enable(dev);
-	pm_runtime_set_autosuspend_delay(dev, 1000);
-	pm_runtime_use_autosuspend(dev);
-
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
@@ -4331,6 +4452,9 @@ static const struct panel_desc arm_rtsm = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		/* Must be first */
+		.compatible = "edp-panel",
+	}, {
 		.compatible = "ampire,am-1280800n3tzqw-t00h",
 		.data = &ampire_am_1280800n3tzqw_t00h,
 	}, {
@@ -4760,11 +4884,61 @@ static const struct of_device_id platform_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
+const struct panel_delay boe116whm_t01_delay = {
+	.hpd_absent_delay = 200,
+	.prepare_to_enable = 80,
+	.unprepare = 500,
+};
+
+#define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
+{ \
+	.name = _name, \
+	.panel_id = encode_edid_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id), \
+	.delay = _delay \
+}
+
+/*
+ * This table is used to figure out power sequencing delays for panels that
+ * are detected by EDID. Entries here may point to entries in the
+ * platform_of_match table (if a panel is listed in both places).
+ *
+ * Sort first by vendor, then by product ID.
+ */
+static const struct edp_panel_entry edp_panels[] = {
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x5c40, &auo_b116xak01.delay, "B116XAK01"),
+
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x2d08, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x8607, &boe116whm_t01_delay, "NV116WHM-T01"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x8d09, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0xd107, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x4c11, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x2406, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
+
+	{ /* sentinal */ }
+};
+
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+{
+	const struct edp_panel_entry *panel;
+
+	if (!panel_id)
+		return NULL;
+
+	for (panel = edp_panels; panel->panel_id; panel++)
+		if (panel->panel_id == panel_id)
+			return panel;
+
+	return NULL;
+}
+
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 
-	id = of_match_node(platform_of_match, pdev->dev.of_node);
+	/* Skip one since "edp-panel" is only supported on DP AUX bus */
+	id = of_match_node(platform_of_match + 1, pdev->dev.of_node);
 	if (!id)
 		return -ENODEV;
 
@@ -5097,7 +5271,15 @@ static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
 {
 	const struct of_device_id *id;
 
-	id = of_match_node(platform_of_match, aux_ep->dev.of_node);
+	/*
+	 * Try "+ 1" first to only match "edp-panel" as a last resort. This
+	 * means that our descriptor will be set based on the fallback
+	 * compatible string if possible.
+	 */
+	id = of_match_node(platform_of_match + 1, aux_ep->dev.of_node);
+	if (!id)
+		id = of_match_node(platform_of_match, aux_ep->dev.of_node);
+
 	if (!id)
 		return -ENODEV;
 
-- 
2.32.0.432.gabb21c7263-goog

