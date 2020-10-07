Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B8928662C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgJGRtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 13:49:21 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:46632 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgJGRtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 13:49:18 -0400
Date:   Wed, 07 Oct 2020 17:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602092951;
        bh=lr01I54W83dQfyPAXxNgr/K8XWBKrwkLjst7BnhvlRw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=m4IwO25YmBvfEuEDwWD9+/JIVWz3wLdO4TFRyPG1WcCwENR5IyUuhFHcZQWwmdnX8
         S/Ty7oK4JDv+R/AXBtsKyrB/RPQXzC/T0lebh5X2Rdh1if76+jGkzy/VGdXXVF0KaI
         FQDURiePjNj+dim/L1r9YwEFP+e5bcudISZ5kwlM=
To:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/5] drm/panel/oneplus6: Add panel-oneplus6
Message-ID: <20201007174736.292968-2-caleb@connolly.tech>
In-Reply-To: <20201007174736.292968-1-caleb@connolly.tech>
References: <20201007174736.292968-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the display panels used in the OnePlus 6 /
T devices.

The OnePlus 6/T devices use different panels however they are
functionally identical with much of the commands being shared. The
panels don't appear to be used by any other devices some combine them as
one driver that is specific to the devices.

The panels are: samsung,sofef00
and             samsung,s6e3fc2x01

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/Kconfig          |  12 +
 drivers/gpu/drm/panel/Makefile         |   1 +
 drivers/gpu/drm/panel/panel-oneplus6.c | 418 +++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-oneplus6.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index de2f2a452be5..d72862265400 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -229,6 +229,18 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
 =09  Say Y here if you want to enable support for Olimex Ltd.
 =09  LCD-OLinuXino panel.
=20
+config DRM_PANEL_ONEPLUS6
+=09tristate "OnePlus 6/6T Samsung AMOLED DSI command mode panels"
+=09depends on OF
+=09depends on DRM_MIPI_DSI
+=09depends on BACKLIGHT_CLASS_DEVICE
+=09select VIDEOMODE_HELPERS
+=09help
+=09  Say Y or M here if you want to enable support for the Samsung AMOLED
+=09  command mode panels found in the OnePlus 6/6T smartphones.
+
+=09  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
+
 config DRM_PANEL_ORISETECH_OTM8009A
 =09tristate "Orise Technology otm8009a 480x800 dsi 2dl panel"
 =09depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefil=
e
index e45ceac6286f..017539056f53 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) +=3D panel-nec-nl8=
048hl11.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) +=3D panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) +=3D panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) +=3D panel-olimex-lcd-olinuxi=
no.o
+obj-$(CONFIG_DRM_PANEL_ONEPLUS6) +=3D panel-oneplus6.o
 obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) +=3D panel-orisetech-otm8009a.o
 obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) +=3D panel-osd-osd101t2587-53=
ts.o
 obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) +=3D panel-panasonic-vvx10f=
034n00.o
diff --git a/drivers/gpu/drm/panel/panel-oneplus6.c b/drivers/gpu/drm/panel=
/panel-oneplus6.c
new file mode 100644
index 000000000000..5e212774b1e0
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-oneplus6.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device=
 tree:
+ *   Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ * Caleb Connolly <caleb@connolly.tech>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <linux/backlight.h>
+
+struct oneplus6_panel {
+=09struct drm_panel panel;
+=09struct mipi_dsi_device *dsi;
+=09struct backlight_device *backlight;
+=09struct regulator *supply;
+=09struct gpio_desc *reset_gpio;
+=09struct gpio_desc *enable_gpio;
+=09const struct drm_display_mode *mode;
+=09bool prepared;
+=09bool enabled;
+};
+
+static inline
+struct oneplus6_panel *to_oneplus6_panel(struct drm_panel *panel)
+{
+=09return container_of(panel, struct oneplus6_panel, panel);
+}
+
+#define dsi_dcs_write_seq(dsi, seq...) do {=09=09=09=09\
+=09=09static const u8 d[] =3D { seq };=09=09=09=09\
+=09=09int ret;=09=09=09=09=09=09\
+=09=09ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));=09\
+=09=09if (ret < 0)=09=09=09=09=09=09\
+=09=09=09return ret;=09=09=09=09=09\
+=09} while (0)
+
+static void oneplus6_panel_reset(struct oneplus6_panel *ctx)
+{
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09usleep_range(5000, 6000);
+}
+
+static int oneplus6_panel_on(struct oneplus6_panel *ctx)
+{
+=09struct mipi_dsi_device *dsi =3D ctx->dsi;
+=09struct device *dev =3D &dsi->dev;
+=09int ret;
+
+=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+=09=09return ret;
+=09}
+=09usleep_range(10000, 11000);
+
+=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+
+=09ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set tear on: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+=09dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+=09dsi_dcs_write_seq(dsi, 0xb6, 0x12);
+=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+
+=09ret =3D mipi_dsi_dcs_set_display_on(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set display on: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+static int oneplus6_panel_off(struct oneplus6_panel *ctx)
+{
+=09struct mipi_dsi_device *dsi =3D ctx->dsi;
+=09struct device *dev =3D &dsi->dev;
+=09int ret;
+
+=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_set_display_off(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to set display off: %d\n", ret);
+=09=09return ret;
+=09}
+=09msleep(40);
+
+=09ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+=09=09return ret;
+=09}
+=09msleep(160);
+
+=09return 0;
+}
+
+static int oneplus6_panel_prepare(struct drm_panel *panel)
+{
+=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (ctx->prepared)
+=09=09return 0;
+
+=09oneplus6_panel_reset(ctx);
+
+=09ret =3D oneplus6_panel_on(ctx);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
+=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09=09return ret;
+=09}
+
+=09ctx->prepared =3D true;
+=09return 0;
+}
+
+static int oneplus6_panel_unprepare(struct drm_panel *panel)
+{
+=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (!ctx->prepared)
+=09=09return 0;
+
+=09ret =3D regulator_enable(ctx->supply);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enable regulator: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D oneplus6_panel_off(ctx);
+=09if (ret < 0)
+=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09regulator_disable(ctx->supply);
+
+=09ctx->prepared =3D false;
+=09return 0;
+}
+
+
+static int oneplus6_panel_enable(struct drm_panel *panel)
+{
+=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
+=09int ret;
+
+=09if (ctx->enabled)
+=09=09return 0;
+
+=09ret =3D backlight_enable(ctx->backlight);
+=09if (ret < 0) {
+=09=09dev_err(&ctx->dsi->dev, "Failed to enable backlight: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->enabled =3D true;
+=09return 0;
+}
+
+static int oneplus6_panel_disable(struct drm_panel *panel)
+{
+=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
+=09int ret;
+
+=09if (!ctx->enabled)
+=09=09return 0;
+
+=09ret =3D backlight_disable(ctx->backlight);
+=09if (ret < 0) {
+=09=09dev_err(&ctx->dsi->dev, "Failed to disable backlight: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->enabled =3D false;
+=09return 0;
+}
+
+
+static const struct drm_display_mode enchilada_panel_mode =3D {
+=09.clock =3D (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 112,
+=09.hsync_end =3D 1080 + 112 + 16,
+=09.htotal =3D 1080 + 112 + 16 + 36,
+=09.vdisplay =3D 2280,
+=09.vsync_start =3D 2280 + 36,
+=09.vsync_end =3D 2280 + 36 + 8,
+=09.vtotal =3D 2280 + 36 + 8 + 12,
+=09.width_mm =3D 68,
+=09.height_mm =3D 145,
+};
+
+static const struct drm_display_mode fajita_panel_mode =3D {
+=09.clock =3D (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 72,
+=09.hsync_end =3D 1080 + 72 + 16,
+=09.htotal =3D 1080 + 72 + 16 + 36,
+=09.vdisplay =3D 2340,
+=09.vsync_start =3D 2340 + 32,
+=09.vsync_end =3D 2340 + 32 + 4,
+=09.vtotal =3D 2340 + 32 + 4 + 18,
+=09.width_mm =3D 68,
+=09.height_mm =3D 145,
+};
+
+static int oneplus6_panel_get_modes(struct drm_panel *panel,
+=09=09=09=09=09=09struct drm_connector *connector)
+{
+=09struct drm_display_mode *mode;
+=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
+
+=09mode =3D drm_mode_duplicate(connector->dev, ctx->mode);
+=09if (!mode)
+=09=09return -ENOMEM;
+
+=09drm_mode_set_name(mode);
+
+=09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+=09connector->display_info.width_mm =3D mode->width_mm;
+=09connector->display_info.height_mm =3D mode->height_mm;
+=09drm_mode_probed_add(connector, mode);
+
+=09return 1;
+}
+
+static const struct drm_panel_funcs oneplus6_panel_panel_funcs =3D {
+=09.disable =3D oneplus6_panel_disable,
+=09.enable =3D oneplus6_panel_enable,
+=09.prepare =3D oneplus6_panel_prepare,
+=09.unprepare =3D oneplus6_panel_unprepare,
+=09.get_modes =3D oneplus6_panel_get_modes,
+};
+
+static int oneplus6_panel_bl_get_brightness(struct backlight_device *bl)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09int err;
+=09u16 brightness =3D bl->props.brightness;
+
+=09err =3D mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+=09if (err < 0) {
+=09=09return err;
+=09}
+
+=09return brightness & 0xff;
+}
+
+static int oneplus6_panel_bl_update_status(struct backlight_device *bl)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09int err;
+=09unsigned short brightness;
+
+=09// This panel needs the high and low bytes swapped for the brightness v=
alue
+=09brightness =3D ((bl->props.brightness<<8)&0xff00)|((bl->props.brightnes=
s>>8)&0x00ff);
+
+=09err =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+=09if (err < 0) {
+=09=09return err;
+=09}
+
+=09return 0;
+}
+
+static const struct backlight_ops oneplus6_panel_bl_ops =3D {
+=09.update_status =3D oneplus6_panel_bl_update_status,
+=09.get_brightness =3D oneplus6_panel_bl_get_brightness,
+};
+
+static struct backlight_device *
+oneplus6_panel_create_backlight(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct backlight_properties props =3D {
+=09=09.type =3D BACKLIGHT_PLATFORM,
+=09=09.scale =3D BACKLIGHT_SCALE_LINEAR,
+=09=09.brightness =3D 255,
+=09=09.max_brightness =3D 512,
+=09};
+
+=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+=09=09=09=09=09=09  &oneplus6_panel_bl_ops, &props);
+}
+
+
+static int oneplus6_panel_probe(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct oneplus6_panel *ctx;
+=09int ret;
+
+=09ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+=09if (!ctx)
+=09=09return -ENOMEM;
+
+=09ctx->mode =3D of_device_get_match_data(dev);
+
+=09if (!ctx->mode) {
+=09=09dev_err(dev, "Missing device mode\n");
+=09=09return -ENODEV;
+=09}
+
+=09ctx->supply =3D devm_regulator_get(dev, "vddio");
+=09if (IS_ERR(ctx->supply)) {
+=09=09ret =3D PTR_ERR(ctx->supply);
+=09=09dev_err(dev, "Failed to get vddio regulator: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+=09if (IS_ERR(ctx->reset_gpio)) {
+=09=09ret =3D PTR_ERR(ctx->reset_gpio);
+=09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->backlight =3D oneplus6_panel_create_backlight(dsi);
+=09if (IS_ERR(ctx->backlight)) {
+=09=09ret =3D PTR_ERR(ctx->backlight);
+=09=09dev_err(dev, "Failed to create backlight: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ctx->dsi =3D dsi;
+=09mipi_dsi_set_drvdata(dsi, ctx);
+
+=09dsi->lanes =3D 4;
+=09dsi->format =3D MIPI_DSI_FMT_RGB888;
+
+=09drm_panel_init(&ctx->panel, dev, &oneplus6_panel_panel_funcs,
+=09=09=09   DRM_MODE_CONNECTOR_DSI);
+
+=09ret =3D drm_panel_add(&ctx->panel);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to add panel: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D mipi_dsi_attach(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09dev_info(dev, "Successfully added oneplus6 panel");
+
+=09return 0;
+}
+
+static int oneplus6_panel_remove(struct mipi_dsi_device *dsi)
+{
+=09struct oneplus6_panel *ctx =3D mipi_dsi_get_drvdata(dsi);
+=09int ret;
+
+=09ret =3D mipi_dsi_detach(dsi);
+=09if (ret < 0)
+=09=09dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+=09drm_panel_remove(&ctx->panel);
+
+=09return 0;
+}
+
+static const struct of_device_id oneplus6_panel_of_match[] =3D {
+=09{
+=09=09.compatible =3D "samsung,sofef00",
+=09=09.data =3D &enchilada_panel_mode,
+=09},
+=09{
+=09=09.compatible =3D "samsung,s6e3fc2x01",
+=09=09.data =3D &fajita_panel_mode,
+=09},
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, oneplus6_panel_of_match);
+
+static struct mipi_dsi_driver oneplus6_panel_driver =3D {
+=09.probe =3D oneplus6_panel_probe,
+=09.remove =3D oneplus6_panel_remove,
+=09.driver =3D {
+=09=09.name =3D "panel-oneplus6",
+=09=09.of_match_table =3D oneplus6_panel_of_match,
+=09},
+};
+
+module_mipi_dsi_driver(oneplus6_panel_driver);
+
+MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
+MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OneP=
lus 6/6T phones");
+MODULE_LICENSE("GPL v2");
--=20
2.28.0


