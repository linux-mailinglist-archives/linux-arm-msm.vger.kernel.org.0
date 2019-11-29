Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5397010D19E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 07:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2G4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 01:56:21 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:4027 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726780AbfK2G4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 01:56:21 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Nov 2019 12:26:15 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:25:57 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id C63072346; Fri, 29 Nov 2019 12:25:56 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v1 2/2] drm/panel: add support for rm69299 visionox panel driver
Date:   Fri, 29 Nov 2019 12:25:45 +0530
Message-Id: <1575010545-25971-3-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Visionox panel driver.

Changes in v1:
	-Split out panel driver patch from dsi config changes(Rob Clark).
        -Remove unrelated code(Stephen Boyd).
        -Remove static arrays to make regulator setup open coded
	 in probe(Stephen Boyd).
        -Remove pre-assigning variables(Stephen Boyd).
        -Inline panel_add function into probe(Stephen Boyd).
        -Use mipi_dsi_dcs_write directly(Rob Clark).
	-Remove qcom_rm69299_1080p_panel_magic_cmds array(Rob Clark).

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/panel/Kconfig                  |   9 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 412 +++++++++++++++++++++++++
 3 files changed, 422 insertions(+)
 create mode 100755 drivers/gpu/drm/panel/panel-visionox-rm69299.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index f152bc4..c06c403 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -355,4 +355,13 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	help
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
+
+config DRM_PANEL_VISIONOX_RM69299
+	tristate "Visionox RM69299"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Visionox
+	  RM69299  DSI Video Mode panel.
+
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b6cd39f..6f1e4c6 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
new file mode 100755
index 0000000..da86714
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <drm/drm_panel.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_print.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/backlight.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+
+#include <video/mipi_display.h>
+
+struct rm69299_config {
+	unsigned long width_mm;
+	unsigned long height_mm;
+	const char *panel_name;
+	u32 num_on_cmds;
+	const struct drm_display_mode *dm;
+};
+
+struct visionox_rm69299 {
+	struct device *dev;
+	struct drm_panel panel;
+
+	struct regulator_bulk_data supplies[2];
+
+	struct gpio_desc *reset_gpio;
+
+	struct backlight_device *backlight;
+
+	struct mipi_dsi_device *dsi;
+	const struct rm69299_config *config;
+	bool prepared;
+	bool enabled;
+};
+
+static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_rm69299, panel);
+}
+
+static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
+{
+	int ret;
+
+	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
+	if (ret)
+		return ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Reset sequence of visionox panel requires the panel to be
+	 * out of reset for 10ms, followed by being held in reset
+	 * for 10ms and then out again
+	 */
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
+static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
+{
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+
+	ret = regulator_set_load(ctx->supplies[0].consumer, 80);
+
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_set_load failed %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_set_load(ctx->supplies[1].consumer, 80);
+
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_set_load failed %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret) {
+		DRM_DEV_ERROR(ctx->dev,
+			"regulator_bulk_disable failed %d\n", ret);
+	}
+	return ret;
+}
+
+static int visionox_rm69299_disable(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	if (!ctx->enabled)
+		return 0;
+
+	ret = backlight_disable(ctx->backlight);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev, "backlight disable failed %d\n",
+		ret);
+
+	ctx->enabled = false;
+	return 0;
+}
+
+static int visionox_rm69299_unprepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	if (!ctx->prepared)
+		return 0;
+
+	ctx->dsi->mode_flags = 0;
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"set_display_off cmd failed ret = %d\n",
+			ret);
+	}
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"enter_sleep cmd failed ret = %d\n", ret);
+	}
+
+	ret = visionox_rm69299_power_off(ctx);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev, "power_off failed ret = %d\n", ret);
+
+	ctx->prepared = false;
+	return ret;
+}
+
+static int visionox_rm69299_prepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+	const struct rm69299_config *config;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = visionox_35597_power_on(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	config = ctx->config;
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 0 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 1 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 2 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+		"cmd set tx 3 failed, ret = %d\n",
+		ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"exit_sleep_mode cmd failed ret = %d\n",
+			ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->dev,
+			"set_display_on cmd failed ret = %d\n", ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
+	msleep(120);
+
+	ctx->prepared = true;
+
+	return 0;
+
+power_off:
+	if (visionox_rm69299_power_off(ctx))
+		DRM_DEV_ERROR(ctx->dev, "power_off failed\n");
+	return ret;
+}
+
+static int visionox_rm69299_enable(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	if (ctx->enabled)
+		return 0;
+
+	ret = backlight_enable(ctx->backlight);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->dev, "backlight enable failed %d\n",
+		ret);
+
+	ctx->enabled = true;
+
+	return 0;
+}
+
+static int visionox_rm69299_get_modes(struct drm_panel *panel)
+{
+	struct drm_connector *connector = panel->connector;
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	struct drm_display_mode *mode;
+	const struct rm69299_config *config;
+
+	config = ctx->config;
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_DEV_ERROR(ctx->dev,
+			"failed to create a new display mode\n");
+		return 0;
+	}
+
+	connector->display_info.width_mm = config->width_mm;
+	connector->display_info.height_mm = config->height_mm;
+	drm_mode_copy(mode, config->dm);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
+	.disable = visionox_rm69299_disable,
+	.unprepare = visionox_rm69299_unprepare,
+	.prepare = visionox_rm69299_prepare,
+	.enable = visionox_rm69299_enable,
+	.get_modes = visionox_rm69299_get_modes,
+};
+
+static const struct drm_display_mode qcom_sc7180_mtp_1080p_mode = {
+	.name = "1080x2248",
+	.clock = 158695,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 26,
+	.hsync_end = 1080 + 26 + 2,
+	.htotal = 1080 + 26 + 2 + 36,
+	.vdisplay = 2248,
+	.vsync_start = 2248 + 56,
+	.vsync_end = 2248 + 56 + 4,
+	.vtotal = 2248 + 56 + 4 + 4,
+	.vrefresh = 60,
+	.flags = 0,
+};
+
+static const struct rm69299_config rm69299_dir = {
+	.width_mm = 74,
+	.height_mm = 131,
+	.panel_name = "qcom_sc7180_mtp_1080p_panel",
+	.dm = &qcom_sc7180_mtp_1080p_mode,
+};
+
+static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device *device;
+	struct visionox_rm69299 *ctx;
+	const struct rm69299_config *config;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->config = device_get_match_data(dev);
+
+	if (!ctx->config) {
+		dev_err(dev, "missing device configuration\n");
+		return -ENODEV;
+	}
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+	ctx->dsi = dsi;
+
+	device = ctx->dev;
+
+	config = ctx->config;
+	ctx->supplies[0].supply = "vdda";
+	ctx->supplies[1].supply = "vdd3p3";
+
+	ret = devm_regulator_bulk_get(device, ARRAY_SIZE(ctx->supplies),
+								ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(device, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
+					PTR_ERR(ctx->reset_gpio));
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	drm_panel_init(&ctx->panel);
+	ctx->panel.dev = device;
+	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
+	drm_panel_add(&ctx->panel);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
+		MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev,
+			"dsi attach failed ret = %d\n", ret);
+		goto err_dsi_attach;
+	}
+
+	return 0;
+
+err_dsi_attach:
+	drm_panel_remove(&ctx->panel);
+	return ret;
+}
+
+static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	if (ctx->dsi) {
+		mipi_dsi_detach(ctx->dsi);
+		mipi_dsi_device_unregister(ctx->dsi);
+	}
+
+	drm_panel_remove(&ctx->panel);
+	return 0;
+}
+
+static const struct of_device_id visionox_rm69299_of_match[] = {
+	{
+		.compatible = "visionox,rm69299-1080p-display",
+		.data = &rm69299_dir,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
+
+static struct mipi_dsi_driver visionox_rm69299_driver = {
+	.driver = {
+		.name = "panel-visionox-rm69299",
+		.of_match_table = visionox_rm69299_of_match,
+	},
+	.probe = visionox_rm69299_probe,
+	.remove = visionox_rm69299_remove,
+};
+module_mipi_dsi_driver(visionox_rm69299_driver);
+
+MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

