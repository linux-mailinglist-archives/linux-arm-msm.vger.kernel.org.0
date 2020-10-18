Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F47729179F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Oct 2020 15:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgJRNf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Oct 2020 09:35:56 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:39114 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgJRNfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Oct 2020 09:35:55 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 3A47520020;
        Sun, 18 Oct 2020 15:35:48 +0200 (CEST)
Date:   Sun, 18 Oct 2020 15:35:46 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/panel/oneplus6: Add panel-oneplus6
Message-ID: <20201018133546.GA352707@ravnborg.org>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-2-caleb@connolly.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=pG8NhYCFD_6Fsa5lt6wA:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Caleb.

I have missed to provice review feedback so here goes.
There is some improvements that can be made as the infrastructure has
evolved since the driver was started.
But despite the number of comments below it is all trivial and the
driver looks good in general.

I look forward to see the next revision.

	Sam

On Wed, Oct 07, 2020 at 05:49:08PM +0000, Caleb Connolly wrote:
> This commit adds support for the display panels used in the OnePlus 6 /
> T devices.
> 
> The OnePlus 6/T devices use different panels however they are
> functionally identical with much of the commands being shared. The
> panels don't appear to be used by any other devices some combine them as
> one driver that is specific to the devices.
> 
> The panels are: samsung,sofef00
> and             samsung,s6e3fc2x01
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/Kconfig          |  12 +
>  drivers/gpu/drm/panel/Makefile         |   1 +
>  drivers/gpu/drm/panel/panel-oneplus6.c | 418 +++++++++++++++++++++++++

It would be better to name the driver after the panels and not their
user. So something like panel-samsung-sofef00.
It is OK to name it after one panel and let it support mroe than one
panel. The Kconfig description could then expain where it is used.


>  3 files changed, 431 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-oneplus6.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index de2f2a452be5..d72862265400 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -229,6 +229,18 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
>  	  Say Y here if you want to enable support for Olimex Ltd.
>  	  LCD-OLinuXino panel.
>  
> +config DRM_PANEL_ONEPLUS6
> +	tristate "OnePlus 6/6T Samsung AMOLED DSI command mode panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the Samsung AMOLED
> +	  command mode panels found in the OnePlus 6/6T smartphones.
> +
> +	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
> +
>  config DRM_PANEL_ORISETECH_OTM8009A
>  	tristate "Orise Technology otm8009a 480x800 dsi 2dl panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index e45ceac6286f..017539056f53 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) += panel-olimex-lcd-olinuxino.o
> +obj-$(CONFIG_DRM_PANEL_ONEPLUS6) += panel-oneplus6.o
>  obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) += panel-orisetech-otm8009a.o
>  obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) += panel-osd-osd101t2587-53ts.o
>  obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
> diff --git a/drivers/gpu/drm/panel/panel-oneplus6.c b/drivers/gpu/drm/panel/panel-oneplus6.c
> new file mode 100644
> index 000000000000..5e212774b1e0
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-oneplus6.c
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + *
> + * Caleb Connolly <caleb@connolly.tech>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <linux/backlight.h>
Keep all linux include together.

> +
> +struct oneplus6_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct backlight_device *backlight;
Use drm_panel backlight support - so you can drop this variable and
simplify some of the code below.

> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
The enable_gpio is not used.

> +	const struct drm_display_mode *mode;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline
> +struct oneplus6_panel *to_oneplus6_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct oneplus6_panel, panel);
> +}
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +static void oneplus6_panel_reset(struct oneplus6_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +}
IT is not obvious if this helper reset the panel or de-assert the reset
signal. It does not help me that there is only one helper despite both
operatiosn are needed.

> +
> +static int oneplus6_panel_on(struct oneplus6_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(10000, 11000);
> +
> +	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set tear on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
> +	dsi_dcs_write_seq(dsi, 0xb6, 0x12);
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int oneplus6_panel_off(struct oneplus6_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(40);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(160);
> +
> +	return 0;
> +}
> +
> +static int oneplus6_panel_prepare(struct drm_panel *panel)
> +{
> +	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
Do you not need to do a regulator_enable() here to get power supply to
the panel?

> +	oneplus6_panel_reset(ctx);
> +
> +	ret = oneplus6_panel_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		return ret;
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int oneplus6_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(ctx->supply);
Looks strange that the power supply is enabled here - was it not enabled
before to use the panel?

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = oneplus6_panel_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	regulator_disable(ctx->supply);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +
> +static int oneplus6_panel_enable(struct drm_panel *panel)
> +{
> +	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	ret = backlight_enable(ctx->backlight);
> +	if (ret < 0) {
> +		dev_err(&ctx->dsi->dev, "Failed to enable backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->enabled = true;
> +	return 0;
> +}
> +
> +static int oneplus6_panel_disable(struct drm_panel *panel)
> +{
> +	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
> +	int ret;
> +
> +	if (!ctx->enabled)
> +		return 0;
> +
> +	ret = backlight_disable(ctx->backlight);
> +	if (ret < 0) {
> +		dev_err(&ctx->dsi->dev, "Failed to disable backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->enabled = false;
> +	return 0;
> +}
When backlight support in drm_panel is used the two enabled/disable
functions can be dropped and the enabled flag is then no longer sued and
can be dropped too.

> +
> +
> +static const struct drm_display_mode enchilada_panel_mode = {
> +	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 112,
> +	.hsync_end = 1080 + 112 + 16,
> +	.htotal = 1080 + 112 + 16 + 36,
> +	.vdisplay = 2280,
> +	.vsync_start = 2280 + 36,
> +	.vsync_end = 2280 + 36 + 8,
> +	.vtotal = 2280 + 36 + 8 + 12,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static const struct drm_display_mode fajita_panel_mode = {
> +	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 72,
> +	.hsync_end = 1080 + 72 + 16,
> +	.htotal = 1080 + 72 + 16 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 32,
> +	.vsync_end = 2340 + 32 + 4,
> +	.vtotal = 2340 + 32 + 4 + 18,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static int oneplus6_panel_get_modes(struct drm_panel *panel,
> +						struct drm_connector *connector)
Some indent looks fishy here.
Try to check the driver using checkpatch --strict - it should be clean.
> +{
> +	struct drm_display_mode *mode;
> +	struct oneplus6_panel *ctx = to_oneplus6_panel(panel);
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs oneplus6_panel_panel_funcs = {
> +	.disable = oneplus6_panel_disable,
> +	.enable = oneplus6_panel_enable,
> +	.prepare = oneplus6_panel_prepare,
> +	.unprepare = oneplus6_panel_unprepare,
> +	.get_modes = oneplus6_panel_get_modes,
> +};
> +
> +static int oneplus6_panel_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int err;
> +	u16 brightness = bl->props.brightness;
No need to read the brightness here. It will be set if
mipi_dsi_dcs_get_display_brightness() succeeds.
> +
> +	err = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> +	if (err < 0) {
> +		return err;
> +	}
> +
> +	return brightness & 0xff;
> +}
> +
> +static int oneplus6_panel_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	int err;
> +	unsigned short brightness;
> +
Use backlight_get_brightness() to get the current brightness from the
backlight device. Do not access the properties direct.
> +	// This panel needs the high and low bytes swapped for the brightness value
> +	brightness = ((bl->props.brightness<<8)&0xff00)|((bl->props.brightness>>8)&0x00ff);
> +
> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	if (err < 0) {
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops oneplus6_panel_bl_ops = {
> +	.update_status = oneplus6_panel_bl_update_status,
> +	.get_brightness = oneplus6_panel_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +oneplus6_panel_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct backlight_properties props = {
const
> +		.type = BACKLIGHT_PLATFORM,
> +		.scale = BACKLIGHT_SCALE_LINEAR,
> +		.brightness = 255,
> +		.max_brightness = 512,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +						  &oneplus6_panel_bl_ops, &props);
> +}
> +
> +
> +static int oneplus6_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct oneplus6_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->mode = of_device_get_match_data(dev);
> +
> +	if (!ctx->mode) {
> +		dev_err(dev, "Missing device mode\n");
> +		return -ENODEV;
> +	}
> +
> +	ctx->supply = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(ctx->supply)) {
> +		ret = PTR_ERR(ctx->supply);
> +		dev_err(dev, "Failed to get vddio regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		ret = PTR_ERR(ctx->reset_gpio);
> +		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->backlight = oneplus6_panel_create_backlight(dsi);
> +	if (IS_ERR(ctx->backlight)) {
> +		ret = PTR_ERR(ctx->backlight);
> +		dev_err(dev, "Failed to create backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +
> +	drm_panel_init(&ctx->panel, dev, &oneplus6_panel_panel_funcs,
> +			   DRM_MODE_CONNECTOR_DSI);
> +
When using backlight support from drm_panel remember to assing
pane-backlight after drm_panel_init()

> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to add panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Successfully added oneplus6 panel");
This is just noide, drop it.
> +
> +	return 0;
> +}
> +
> +static int oneplus6_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct oneplus6_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id oneplus6_panel_of_match[] = {
> +	{
> +		.compatible = "samsung,sofef00",
> +		.data = &enchilada_panel_mode,
> +	},
> +	{
> +		.compatible = "samsung,s6e3fc2x01",
> +		.data = &fajita_panel_mode,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, oneplus6_panel_of_match);
> +
> +static struct mipi_dsi_driver oneplus6_panel_driver = {
> +	.probe = oneplus6_panel_probe,
> +	.remove = oneplus6_panel_remove,
> +	.driver = {
> +		.name = "panel-oneplus6",
> +		.of_match_table = oneplus6_panel_of_match,
> +	},
> +};
> +
> +module_mipi_dsi_driver(oneplus6_panel_driver);
> +
> +MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
> +MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OnePlus 6/6T phones");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.28.0
> 
