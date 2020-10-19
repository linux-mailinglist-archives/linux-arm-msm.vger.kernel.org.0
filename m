Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD23329292E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 16:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgJSOVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 10:21:32 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:59772 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgJSOV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 10:21:29 -0400
Date:   Mon, 19 Oct 2020 14:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1603117282;
        bh=AvlSjPI3Me+ZbY0QqfRvvc7iGE+vKeFgTugSWG0IhM0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=YzAWRqQC88AqO0NSkOJdo6Z5rdbVeUaZW6y+o6VL3sfKq2KS8Q5GdsZkxGC9f1PIF
         QQYpTz17OQjpi8RJdtRxfnNJRugzKiVyJpqGb503v+1u5dTQb5STGr7oKa2eQqMjJX
         Krq3fUmWnTZ5/OvCLH7HjB95C0tchgwMcPsT/vJ8=
To:     Sam Ravnborg <sam@ravnborg.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 1/5] drm/panel/oneplus6: Add panel-oneplus6
Message-ID: <c92675d9-7435-15f8-38f5-883e58e5fb59@connolly.tech>
In-Reply-To: <20201018133546.GA352707@ravnborg.org>
References: <20201007174736.292968-1-caleb@connolly.tech> <20201007174736.292968-2-caleb@connolly.tech> <20201018133546.GA352707@ravnborg.org>
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

Hi Sam,

Thanks a lot for the feedback! I'll get those issues resolved for the=20
next revision.

Caleb

On 2020-10-18 14:35, Sam Ravnborg wrote:
> Hi Caleb.
>
> I have missed to provice review feedback so here goes.
> There is some improvements that can be made as the infrastructure has
> evolved since the driver was started.
> But despite the number of comments below it is all trivial and the
> driver looks good in general.
>
> I look forward to see the next revision.
>
> =09Sam
>
> On Wed, Oct 07, 2020 at 05:49:08PM +0000, Caleb Connolly wrote:
>> This commit adds support for the display panels used in the OnePlus 6 /
>> T devices.
>>
>> The OnePlus 6/T devices use different panels however they are
>> functionally identical with much of the commands being shared. The
>> panels don't appear to be used by any other devices some combine them as
>> one driver that is specific to the devices.
>>
>> The panels are: samsung,sofef00
>> and             samsung,s6e3fc2x01
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   drivers/gpu/drm/panel/Kconfig          |  12 +
>>   drivers/gpu/drm/panel/Makefile         |   1 +
>>   drivers/gpu/drm/panel/panel-oneplus6.c | 418 +++++++++++++++++++++++++
> It would be better to name the driver after the panels and not their
> user. So something like panel-samsung-sofef00.
> It is OK to name it after one panel and let it support mroe than one
> panel. The Kconfig description could then expain where it is used.
>
>
>>   3 files changed, 431 insertions(+)
>>   create mode 100644 drivers/gpu/drm/panel/panel-oneplus6.c
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconf=
ig
>> index de2f2a452be5..d72862265400 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -229,6 +229,18 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
>>   =09  Say Y here if you want to enable support for Olimex Ltd.
>>   =09  LCD-OLinuXino panel.
>>
>> +config DRM_PANEL_ONEPLUS6
>> +=09tristate "OnePlus 6/6T Samsung AMOLED DSI command mode panels"
>> +=09depends on OF
>> +=09depends on DRM_MIPI_DSI
>> +=09depends on BACKLIGHT_CLASS_DEVICE
>> +=09select VIDEOMODE_HELPERS
>> +=09help
>> +=09  Say Y or M here if you want to enable support for the Samsung AMOL=
ED
>> +=09  command mode panels found in the OnePlus 6/6T smartphones.
>> +
>> +=09  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
>> +
>>   config DRM_PANEL_ORISETECH_OTM8009A
>>   =09tristate "Orise Technology otm8009a 480x800 dsi 2dl panel"
>>   =09depends on OF
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Make=
file
>> index e45ceac6286f..017539056f53 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) +=3D panel-nec-=
nl8048hl11.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) +=3D panel-novatek-nt35510.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) +=3D panel-novatek-nt39016.o
>>   obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) +=3D panel-olimex-lcd-oli=
nuxino.o
>> +obj-$(CONFIG_DRM_PANEL_ONEPLUS6) +=3D panel-oneplus6.o
>>   obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) +=3D panel-orisetech-otm800=
9a.o
>>   obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) +=3D panel-osd-osd101t258=
7-53ts.o
>>   obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) +=3D panel-panasonic-vv=
x10f034n00.o
>> diff --git a/drivers/gpu/drm/panel/panel-oneplus6.c b/drivers/gpu/drm/pa=
nel/panel-oneplus6.c
>> new file mode 100644
>> index 000000000000..5e212774b1e0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-oneplus6.c
>> @@ -0,0 +1,418 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor dev=
ice tree:
>> + *   Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + *
>> + * Caleb Connolly <caleb@connolly.tech>
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <video/mipi_display.h>
>> +
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_modes.h>
>> +#include <drm/drm_panel.h>
>> +#include <linux/backlight.h>
> Keep all linux include together.
>
>> +
>> +struct oneplus6_panel {
>> +=09struct drm_panel panel;
>> +=09struct mipi_dsi_device *dsi;
>> +=09struct backlight_device *backlight;
> Use drm_panel backlight support - so you can drop this variable and
> simplify some of the code below.
>
>> +=09struct regulator *supply;
>> +=09struct gpio_desc *reset_gpio;
>> +=09struct gpio_desc *enable_gpio;
> The enable_gpio is not used.
>
>> +=09const struct drm_display_mode *mode;
>> +=09bool prepared;
>> +=09bool enabled;
>> +};
>> +
>> +static inline
>> +struct oneplus6_panel *to_oneplus6_panel(struct drm_panel *panel)
>> +{
>> +=09return container_of(panel, struct oneplus6_panel, panel);
>> +}
>> +
>> +#define dsi_dcs_write_seq(dsi, seq...) do {=09=09=09=09\
>> +=09=09static const u8 d[] =3D { seq };=09=09=09=09\
>> +=09=09int ret;=09=09=09=09=09=09\
>> +=09=09ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));=09\
>> +=09=09if (ret < 0)=09=09=09=09=09=09\
>> +=09=09=09return ret;=09=09=09=09=09\
>> +=09} while (0)
>> +
>> +static void oneplus6_panel_reset(struct oneplus6_panel *ctx)
>> +{
>> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +=09usleep_range(5000, 6000);
>> +}
> IT is not obvious if this helper reset the panel or de-assert the reset
> signal. It does not help me that there is only one helper despite both
> operatiosn are needed.
>
>> +
>> +static int oneplus6_panel_on(struct oneplus6_panel *ctx)
>> +{
>> +=09struct mipi_dsi_device *dsi =3D ctx->dsi;
>> +=09struct device *dev =3D &dsi->dev;
>> +=09int ret;
>> +
>> +=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>> +
>> +=09ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +=09usleep_range(10000, 11000);
>> +
>> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>> +
>> +=09ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK)=
;
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to set tear on: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>> +=09dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>> +=09dsi_dcs_write_seq(dsi, 0xb0, 0x07);
>> +=09dsi_dcs_write_seq(dsi, 0xb6, 0x12);
>> +=09dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>> +=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>> +=09dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>> +
>> +=09ret =3D mipi_dsi_dcs_set_display_on(dsi);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to set display on: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09return 0;
>> +}
>> +
>> +static int oneplus6_panel_off(struct oneplus6_panel *ctx)
>> +{
>> +=09struct mipi_dsi_device *dsi =3D ctx->dsi;
>> +=09struct device *dev =3D &dsi->dev;
>> +=09int ret;
>> +
>> +=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>> +
>> +=09ret =3D mipi_dsi_dcs_set_display_off(dsi);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to set display off: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +=09msleep(40);
>> +
>> +=09ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +=09msleep(160);
>> +
>> +=09return 0;
>> +}
>> +
>> +static int oneplus6_panel_prepare(struct drm_panel *panel)
>> +{
>> +=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
>> +=09struct device *dev =3D &ctx->dsi->dev;
>> +=09int ret;
>> +
>> +=09if (ctx->prepared)
>> +=09=09return 0;
>> +
> Do you not need to do a regulator_enable() here to get power supply to
> the panel?
>
>> +=09oneplus6_panel_reset(ctx);
>> +
>> +=09ret =3D oneplus6_panel_on(ctx);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
>> +=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->prepared =3D true;
>> +=09return 0;
>> +}
>> +
>> +static int oneplus6_panel_unprepare(struct drm_panel *panel)
>> +{
>> +=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
>> +=09struct device *dev =3D &ctx->dsi->dev;
>> +=09int ret;
>> +
>> +=09if (!ctx->prepared)
>> +=09=09return 0;
>> +
>> +=09ret =3D regulator_enable(ctx->supply);
> Looks strange that the power supply is enabled here - was it not enabled
> before to use the panel?
>
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to enable regulator: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ret =3D oneplus6_panel_off(ctx);
>> +=09if (ret < 0)
>> +=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>> +
>> +=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +=09regulator_disable(ctx->supply);
>> +
>> +=09ctx->prepared =3D false;
>> +=09return 0;
>> +}
>> +
>> +
>> +static int oneplus6_panel_enable(struct drm_panel *panel)
>> +{
>> +=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
>> +=09int ret;
>> +
>> +=09if (ctx->enabled)
>> +=09=09return 0;
>> +
>> +=09ret =3D backlight_enable(ctx->backlight);
>> +=09if (ret < 0) {
>> +=09=09dev_err(&ctx->dsi->dev, "Failed to enable backlight: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->enabled =3D true;
>> +=09return 0;
>> +}
>> +
>> +static int oneplus6_panel_disable(struct drm_panel *panel)
>> +{
>> +=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
>> +=09int ret;
>> +
>> +=09if (!ctx->enabled)
>> +=09=09return 0;
>> +
>> +=09ret =3D backlight_disable(ctx->backlight);
>> +=09if (ret < 0) {
>> +=09=09dev_err(&ctx->dsi->dev, "Failed to disable backlight: %d\n", ret)=
;
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->enabled =3D false;
>> +=09return 0;
>> +}
> When backlight support in drm_panel is used the two enabled/disable
> functions can be dropped and the enabled flag is then no longer sued and
> can be dropped too.
>
>> +
>> +
>> +static const struct drm_display_mode enchilada_panel_mode =3D {
>> +=09.clock =3D (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000=
,
>> +=09.hdisplay =3D 1080,
>> +=09.hsync_start =3D 1080 + 112,
>> +=09.hsync_end =3D 1080 + 112 + 16,
>> +=09.htotal =3D 1080 + 112 + 16 + 36,
>> +=09.vdisplay =3D 2280,
>> +=09.vsync_start =3D 2280 + 36,
>> +=09.vsync_end =3D 2280 + 36 + 8,
>> +=09.vtotal =3D 2280 + 36 + 8 + 12,
>> +=09.width_mm =3D 68,
>> +=09.height_mm =3D 145,
>> +};
>> +
>> +static const struct drm_display_mode fajita_panel_mode =3D {
>> +=09.clock =3D (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
>> +=09.hdisplay =3D 1080,
>> +=09.hsync_start =3D 1080 + 72,
>> +=09.hsync_end =3D 1080 + 72 + 16,
>> +=09.htotal =3D 1080 + 72 + 16 + 36,
>> +=09.vdisplay =3D 2340,
>> +=09.vsync_start =3D 2340 + 32,
>> +=09.vsync_end =3D 2340 + 32 + 4,
>> +=09.vtotal =3D 2340 + 32 + 4 + 18,
>> +=09.width_mm =3D 68,
>> +=09.height_mm =3D 145,
>> +};
>> +
>> +static int oneplus6_panel_get_modes(struct drm_panel *panel,
>> +=09=09=09=09=09=09struct drm_connector *connector)
> Some indent looks fishy here.
> Try to check the driver using checkpatch --strict - it should be clean.
>> +{
>> +=09struct drm_display_mode *mode;
>> +=09struct oneplus6_panel *ctx =3D to_oneplus6_panel(panel);
>> +
>> +=09mode =3D drm_mode_duplicate(connector->dev, ctx->mode);
>> +=09if (!mode)
>> +=09=09return -ENOMEM;
>> +
>> +=09drm_mode_set_name(mode);
>> +
>> +=09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>> +=09connector->display_info.width_mm =3D mode->width_mm;
>> +=09connector->display_info.height_mm =3D mode->height_mm;
>> +=09drm_mode_probed_add(connector, mode);
>> +
>> +=09return 1;
>> +}
>> +
>> +static const struct drm_panel_funcs oneplus6_panel_panel_funcs =3D {
>> +=09.disable =3D oneplus6_panel_disable,
>> +=09.enable =3D oneplus6_panel_enable,
>> +=09.prepare =3D oneplus6_panel_prepare,
>> +=09.unprepare =3D oneplus6_panel_unprepare,
>> +=09.get_modes =3D oneplus6_panel_get_modes,
>> +};
>> +
>> +static int oneplus6_panel_bl_get_brightness(struct backlight_device *bl=
)
>> +{
>> +=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
>> +=09int err;
>> +=09u16 brightness =3D bl->props.brightness;
> No need to read the brightness here. It will be set if
> mipi_dsi_dcs_get_display_brightness() succeeds.
>> +
>> +=09err =3D mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
>> +=09if (err < 0) {
>> +=09=09return err;
>> +=09}
>> +
>> +=09return brightness & 0xff;
>> +}
>> +
>> +static int oneplus6_panel_bl_update_status(struct backlight_device *bl)
>> +{
>> +=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
>> +=09int err;
>> +=09unsigned short brightness;
>> +
> Use backlight_get_brightness() to get the current brightness from the
> backlight device. Do not access the properties direct.
>> +=09// This panel needs the high and low bytes swapped for the brightnes=
s value
>> +=09brightness =3D ((bl->props.brightness<<8)&0xff00)|((bl->props.bright=
ness>>8)&0x00ff);
>> +
>> +=09err =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +=09if (err < 0) {
>> +=09=09return err;
>> +=09}
>> +
>> +=09return 0;
>> +}
>> +
>> +static const struct backlight_ops oneplus6_panel_bl_ops =3D {
>> +=09.update_status =3D oneplus6_panel_bl_update_status,
>> +=09.get_brightness =3D oneplus6_panel_bl_get_brightness,
>> +};
>> +
>> +static struct backlight_device *
>> +oneplus6_panel_create_backlight(struct mipi_dsi_device *dsi)
>> +{
>> +=09struct device *dev =3D &dsi->dev;
>> +=09struct backlight_properties props =3D {
> const
>> +=09=09.type =3D BACKLIGHT_PLATFORM,
>> +=09=09.scale =3D BACKLIGHT_SCALE_LINEAR,
>> +=09=09.brightness =3D 255,
>> +=09=09.max_brightness =3D 512,
>> +=09};
>> +
>> +=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>> +=09=09=09=09=09=09  &oneplus6_panel_bl_ops, &props);
>> +}
>> +
>> +
>> +static int oneplus6_panel_probe(struct mipi_dsi_device *dsi)
>> +{
>> +=09struct device *dev =3D &dsi->dev;
>> +=09struct oneplus6_panel *ctx;
>> +=09int ret;
>> +
>> +=09ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +=09if (!ctx)
>> +=09=09return -ENOMEM;
>> +
>> +=09ctx->mode =3D of_device_get_match_data(dev);
>> +
>> +=09if (!ctx->mode) {
>> +=09=09dev_err(dev, "Missing device mode\n");
>> +=09=09return -ENODEV;
>> +=09}
>> +
>> +=09ctx->supply =3D devm_regulator_get(dev, "vddio");
>> +=09if (IS_ERR(ctx->supply)) {
>> +=09=09ret =3D PTR_ERR(ctx->supply);
>> +=09=09dev_err(dev, "Failed to get vddio regulator: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +=09if (IS_ERR(ctx->reset_gpio)) {
>> +=09=09ret =3D PTR_ERR(ctx->reset_gpio);
>> +=09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->backlight =3D oneplus6_panel_create_backlight(dsi);
>> +=09if (IS_ERR(ctx->backlight)) {
>> +=09=09ret =3D PTR_ERR(ctx->backlight);
>> +=09=09dev_err(dev, "Failed to create backlight: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ctx->dsi =3D dsi;
>> +=09mipi_dsi_set_drvdata(dsi, ctx);
>> +
>> +=09dsi->lanes =3D 4;
>> +=09dsi->format =3D MIPI_DSI_FMT_RGB888;
>> +
>> +=09drm_panel_init(&ctx->panel, dev, &oneplus6_panel_panel_funcs,
>> +=09=09=09   DRM_MODE_CONNECTOR_DSI);
>> +
> When using backlight support from drm_panel remember to assing
> pane-backlight after drm_panel_init()
>
>> +=09ret =3D drm_panel_add(&ctx->panel);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to add panel: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09ret =3D mipi_dsi_attach(dsi);
>> +=09if (ret < 0) {
>> +=09=09dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09dev_info(dev, "Successfully added oneplus6 panel");
> This is just noide, drop it.
>> +
>> +=09return 0;
>> +}
>> +
>> +static int oneplus6_panel_remove(struct mipi_dsi_device *dsi)
>> +{
>> +=09struct oneplus6_panel *ctx =3D mipi_dsi_get_drvdata(dsi);
>> +=09int ret;
>> +
>> +=09ret =3D mipi_dsi_detach(dsi);
>> +=09if (ret < 0)
>> +=09=09dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>> +
>> +=09drm_panel_remove(&ctx->panel);
>> +
>> +=09return 0;
>> +}
>> +
>> +static const struct of_device_id oneplus6_panel_of_match[] =3D {
>> +=09{
>> +=09=09.compatible =3D "samsung,sofef00",
>> +=09=09.data =3D &enchilada_panel_mode,
>> +=09},
>> +=09{
>> +=09=09.compatible =3D "samsung,s6e3fc2x01",
>> +=09=09.data =3D &fajita_panel_mode,
>> +=09},
>> +=09{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, oneplus6_panel_of_match);
>> +
>> +static struct mipi_dsi_driver oneplus6_panel_driver =3D {
>> +=09.probe =3D oneplus6_panel_probe,
>> +=09.remove =3D oneplus6_panel_remove,
>> +=09.driver =3D {
>> +=09=09.name =3D "panel-oneplus6",
>> +=09=09.of_match_table =3D oneplus6_panel_of_match,
>> +=09},
>> +};
>> +
>> +module_mipi_dsi_driver(oneplus6_panel_driver);
>> +
>> +MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
>> +MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in O=
nePlus 6/6T phones");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 2.28.0
>>


