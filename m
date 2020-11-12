Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E47D2B09C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 17:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgKLQV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 11:21:29 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:52578 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgKLQV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 11:21:28 -0500
Date:   Thu, 12 Nov 2020 16:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198081;
        bh=OX0uNZ/OkPeX422zzpXH+Id8u6JoteSOQcBLBHoP/No=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=L38i1ruQd1Hp1BqC2C4XXz4GwPjd9r7DUTY7vLiptzO7SIV78W5NW0BgsONBtbIZB
         lpGqIDmy/+aOq0jMQMwXoacm/Qf4lLb4HAF9r/pD3qYedXixjxfeULGPckgm5Kpgiq
         xf62Ld0oXmAII4dGREgbVnVZa5UWLuJqRHw5xisw=
To:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/5] drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices
Message-ID: <20201112161920.2671430-2-caleb@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
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

The OnePlus 6/T devices use different panels however they are
functionally identical with the only differences being the resolution.
The panels also don't seem to be used by any other devices, just combine
them into one driver.

The panels are: samsung,sofef00
and             samsung,s6e3fc2x01

Signed-off-by: Caleb Connolly <caleb@connolly.tech>

---

Changes since v1:
 * Rename driver to samsung-sofef00 rather than be device
 specific.
 * Make use of drm_panel backlight, simplifying the driver.
 * Make reset function do a full reset, instead of simply taking the
 panel out of reset.
 * Removed get_brightness function as it doesn't return correct data.
---
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 353 ++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-sofef00.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index b9dbedf8f15e..c4486b6b4e5a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -361,6 +361,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
 =09select DRM_MIPI_DSI
 =09select VIDEOMODE_HELPERS
=20
+config DRM_PANEL_SAMSUNG_SOFEF00
+=09tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
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
 config DRM_PANEL_SEIKO_43WVF1G
 =09tristate "Seiko 43WVF1G panel"
 =09depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefil=
e
index 2ba560bca61d..ebb67f3de10e 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) +=3D panel-sa=
msung-s6e63m0-spi.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) +=3D panel-samsung-s6e63m0-dsi=
.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung-s6e8=
8a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) +=3D panel-sharp-ls037v7dw01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/dr=
m/panel/panel-samsung-sofef00.c
new file mode 100644
index 000000000000..84b4f4cb2e6f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device=
 tree:
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/swab.h>
+#include <linux/backlight.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct sofef00_panel {
+=09struct drm_panel panel;
+=09struct mipi_dsi_device *dsi;
+=09struct regulator *supply;
+=09struct gpio_desc *reset_gpio;
+=09const struct drm_display_mode *mode;
+=09bool prepared;
+};
+
+static inline
+struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
+{
+=09return container_of(panel, struct sofef00_panel, panel);
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
+static void sofef00_panel_reset(struct sofef00_panel *ctx)
+{
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09usleep_range(5000, 6000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09usleep_range(2000, 3000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09usleep_range(12000, 13000);
+}
+
+static int sofef00_panel_on(struct sofef00_panel *ctx)
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
+static int sofef00_panel_off(struct sofef00_panel *ctx)
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
+static int sofef00_panel_prepare(struct drm_panel *panel)
+{
+=09struct sofef00_panel *ctx =3D to_sofef00_panel(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (ctx->prepared)
+=09=09return 0;
+
+=09ret =3D regulator_enable(ctx->supply);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enable regulator: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09sofef00_panel_reset(ctx);
+
+=09ret =3D sofef00_panel_on(ctx);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
+=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09=09return ret;
+=09}
+
+=09ctx->prepared =3D true;
+=09return 0;
+}
+
+static int sofef00_panel_unprepare(struct drm_panel *panel)
+{
+=09struct sofef00_panel *ctx =3D to_sofef00_panel(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09if (!ctx->prepared)
+=09=09return 0;
+
+=09ret =3D sofef00_panel_off(ctx);
+=09if (ret < 0)
+=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+=09regulator_disable(ctx->supply);
+
+=09ctx->prepared =3D false;
+=09return 0;
+}
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
+static int sofef00_panel_get_modes(struct drm_panel *panel,
+=09=09=09struct drm_connector *connector)
+{
+=09struct drm_display_mode *mode;
+=09struct sofef00_panel *ctx =3D to_sofef00_panel(panel);
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
+static const struct drm_panel_funcs sofef00_panel_panel_funcs =3D {
+=09.prepare =3D sofef00_panel_prepare,
+=09.unprepare =3D sofef00_panel_unprepare,
+=09.get_modes =3D sofef00_panel_get_modes,
+};
+
+static int sofef00_panel_bl_update_status(struct backlight_device *bl)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09int err;
+=09u16 brightness;
+
+=09brightness =3D (u16)backlight_get_brightness(bl);
+=09// This panel needs the high and low bytes swapped for the brightness v=
alue
+=09brightness =3D __swab16(brightness);
+
+=09err =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+=09if (err < 0)
+=09=09return err;
+
+=09return 0;
+}
+
+static const struct backlight_ops sofef00_panel_bl_ops =3D {
+=09.update_status =3D sofef00_panel_bl_update_status,
+};
+
+static struct backlight_device *
+sofef00_create_backlight(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09const struct backlight_properties props =3D {
+=09=09.type =3D BACKLIGHT_PLATFORM,
+=09=09.brightness =3D 1023,
+=09=09.max_brightness =3D 1023,
+=09};
+
+=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+=09=09=09=09=09=09&sofef00_panel_bl_ops, &props);
+}
+
+
+static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct sofef00_panel *ctx;
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
+=09ctx->dsi =3D dsi;
+=09mipi_dsi_set_drvdata(dsi, ctx);
+
+=09dsi->lanes =3D 4;
+=09dsi->format =3D MIPI_DSI_FMT_RGB888;
+
+=09drm_panel_init(&ctx->panel, dev, &sofef00_panel_panel_funcs,
+=09=09=09=09DRM_MODE_CONNECTOR_DSI);
+
+=09ctx->panel.backlight =3D sofef00_create_backlight(dsi);
+=09if (IS_ERR(ctx->panel.backlight))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+=09=09=09=09=09"Failed to create backlight\n");
+
+=09drm_panel_add(&ctx->panel);
+
+=09ret =3D mipi_dsi_attach(dsi);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+static int sofef00_panel_remove(struct mipi_dsi_device *dsi)
+{
+=09struct sofef00_panel *ctx =3D mipi_dsi_get_drvdata(dsi);
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
+static const struct of_device_id sofef00_panel_of_match[] =3D {
+=09{ // OnePlus 6 / enchilada
+=09=09.compatible =3D "samsung,sofef00",
+=09=09.data =3D &enchilada_panel_mode,
+=09},
+=09{ // OnePlus 6T / fajita
+=09=09.compatible =3D "samsung,s6e3fc2x01",
+=09=09.data =3D &fajita_panel_mode,
+=09},
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);
+
+static struct mipi_dsi_driver sofef00_panel_driver =3D {
+=09.probe =3D sofef00_panel_probe,
+=09.remove =3D sofef00_panel_remove,
+=09.driver =3D {
+=09=09.name =3D "panel-oneplus6",
+=09=09.of_match_table =3D sofef00_panel_of_match,
+=09},
+};
+
+module_mipi_dsi_driver(sofef00_panel_driver);
+
+MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
+MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OneP=
lus 6/6T phones");
+MODULE_LICENSE("GPL v2");
--=20
2.29.2


