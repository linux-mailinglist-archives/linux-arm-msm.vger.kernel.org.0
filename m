Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B712699461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 13:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjBPMcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 07:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBPMci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 07:32:38 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1C92CFD1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:32:35 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id r28so1502009oiw.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O/mbVCUW37SP5uqxmbuctI4JAQmuxWJTA6baY6ZYJ+0=;
        b=Ry6UpXEvwhJlC97SvhjGppSOLiW7Gf//PSyU+lyZXjAVAXIeTogm+hN8vh9AiEneBq
         Qi+rB3DjeqBdOwtRYJW8ucQOQQ+uJAAezupE1zTREaqdwetEO+EVxtJbHt8MT428mgnl
         MHAPQ+pT/tdV14Kk0YafC40Lm3KpP4m/9i+IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/mbVCUW37SP5uqxmbuctI4JAQmuxWJTA6baY6ZYJ+0=;
        b=CP+FgI1vo+jwKShx+VlvlSlNyznQMESy2wjyn3t09QpgQmrHM5qN1MjqMKLSOwkKRm
         orP9oqT469TsgzG6Ns2tACVumy2p0c7MZukYrtW6NLreVDmcTZd+Sklc4AsRp7QzUU0y
         k4qQpQmUYNaNapeVfQTiZ8e5osx6h3lgfY5my1Mmuxq8gpSJ0Ab3HL9rR4V//xnailgX
         Y5L74WDJVkG9SuLC4UhS6myeVBRh/tRU6Orh+Qw/IoE+QVIP2691xRRrcWuRGceuTqMu
         djK4q8pu4tlB5anzEPrPwsvhDxhE8b2yskT6XYUl875NblnxSh/AYu7z5DzrsI7K0nyK
         F//w==
X-Gm-Message-State: AO0yUKV7tPaG83FLgOWG0ohs4jD6YUokCKLru5K21uO2dVBAEqRGzue+
        H+S0LcZFTV22dyo5KezEunoESujn8t9M+MGAUTKB8A==
X-Google-Smtp-Source: AK7set+Sr1eQOm0FWTiwt/xpuW9UUzdGx1RYsJnEMYw92LldArjz5Tz+ayVou6oWXjFrF+tQe0dkfqk99tKRv/CFndE=
X-Received: by 2002:a05:6808:3203:b0:368:ca97:3a2a with SMTP id
 cb3-20020a056808320300b00368ca973a2amr197482oib.261.1676550754202; Thu, 16
 Feb 2023 04:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
 <20230119163201.580858-2-konrad.dybcio@linaro.org> <725a5727-fdde-e3ae-a448-2679c5c4c7f4@linaro.org>
In-Reply-To: <725a5727-fdde-e3ae-a448-2679c5c4c7f4@linaro.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 16 Feb 2023 13:32:22 +0100
Message-ID: <CAKMK7uFpc3Kg=Ym6ee_JTZo-0h2ig7Twtf2uwE7oV-1c6YRP=Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Feb 2023 at 12:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 19.01.2023 17:32, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@somainline.org>
> >
> > Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> > some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> > of smartphone manufacturing, it is impossible to retrieve a better name
> > for this panel.
> >
> > This revision adds support for the default 60 Hz configuration, however
> > there could possibly be some room for expansion, as the display panels
> > used on Sony devices have historically been capable of >2x refresh rate
> > overclocking.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> Are there any outstanding issues with this driver, or perhaps I did
> not CC some important list? It has gotten very little activity ever
> since its initial submission around Sept'22..

Sam is usually picking up panel drivers these days, but maybe we need
a bit more help in this area? If anyone from linaro has a handful of
drm patches landed in upstream they could apply for drm-misc commit
rights and help push these. I think linaro has lost a few of the
drm-misc committers so things tend to be stuck a bit more :-/
-Daniel

>
> Konrad
> > v3 -> v4:
> > - De-magicize some numbers
> > - Pick up rb
> >  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 329 ++++++++++++++++++
> >  3 files changed, 340 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index d03a64155d15..8da741f1c2ba 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -677,6 +677,16 @@ config DRM_PANEL_SONY_ACX565AKM
> >         Say Y here if you want to enable support for the Sony ACX565AKM
> >         800x600 3.5" panel (found on the Nokia N900).
> >
> > +config DRM_PANEL_SONY_TD4353_JDI
> > +     tristate "Sony TD4353 JDI panel"
> > +     depends on GPIOLIB && OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Say Y here if you want to enable support for the Sony Tama
> > +       TD4353 JDI command mode panel as found on some Sony Xperia
> > +       XZ2 and XZ2 Compact smartphones.
> > +
> >  config DRM_PANEL_SONY_TULIP_TRULY_NT35521
> >       tristate "Sony Tulip Truly NT35521 panel"
> >       depends on GPIOLIB && OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index 1630dd0c69ae..22155d62bec0 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> > +obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_SYNAPTICS_JDI) += panel-sony-synaptics-jdi.o
> >  obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
> > diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> > new file mode 100644
> > index 000000000000..8d8813dbaa45
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> > @@ -0,0 +1,329 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@somainline.org>
> > + *
> > + * Generated with linux-mdss-dsi-panel-driver-generator with a
> > + * substantial amount of manual adjustments.
> > + *
> > + * SONY Downstream kernel calls this one:
> > + * - "JDI ID3" for Akari  (XZ2)
> > + * - "JDI ID4" for Apollo (XZ2 Compact)
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +enum {
> > +     TYPE_TAMA_60HZ,
> > +     /*
> > +      * Leaving room for expansion - SONY very often uses
> > +      * *truly reliably* overclockable panels on their flagships!
> > +      */
> > +};
> > +
> > +struct sony_td4353_jdi {
> > +     struct drm_panel panel;
> > +     struct mipi_dsi_device *dsi;
> > +     struct regulator_bulk_data supplies[3];
> > +     struct gpio_desc *panel_reset_gpio;
> > +     struct gpio_desc *touch_reset_gpio;
> > +     bool prepared;
> > +     int type;
> > +};
> > +
> > +static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct sony_td4353_jdi, panel);
> > +}
> > +
> > +static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
> > +{
> > +     struct mipi_dsi_device *dsi = ctx->dsi;
> > +     struct device *dev = &dsi->dev;
> > +     int ret;
> > +
> > +     dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > +
> > +     ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set column address: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2160 - 1);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set page address: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set tear scanline: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set tear on: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> > +
> > +     ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set pixel format: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
> > +                       0x00, 0x00, 0x08, 0x6f);
> > +
> > +     ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +             return ret;
> > +     }
> > +     msleep(70);
> > +
> > +     mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
> > +
> > +     ret = mipi_dsi_dcs_set_display_on(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to turn display on: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
> > +{
> > +     struct mipi_dsi_device *dsi = ctx->dsi;
> > +     struct device *dev = &dsi->dev;
> > +     int ret;
> > +
> > +     dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret = mipi_dsi_dcs_set_display_off(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set display off: %d\n", ret);
> > +             return ret;
> > +     }
> > +     msleep(22);
> > +
> > +     ret = mipi_dsi_dcs_set_tear_off(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set tear off: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> > +             return ret;
> > +     }
> > +     msleep(80);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode)
> > +{
> > +     gpiod_set_value_cansleep(ctx->touch_reset_gpio, mode);
> > +     gpiod_set_value_cansleep(ctx->panel_reset_gpio, mode);
> > +     usleep_range(5000, 5100);
> > +}
> > +
> > +static int sony_td4353_jdi_prepare(struct drm_panel *panel)
> > +{
> > +     struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> > +     struct device *dev = &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     if (ctx->prepared)
> > +             return 0;
> > +
> > +     ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     msleep(100);
> > +
> > +     sony_td4353_assert_reset_gpios(ctx, 1);
> > +
> > +     ret = sony_td4353_jdi_on(ctx);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to power on panel: %d\n", ret);
> > +             sony_td4353_assert_reset_gpios(ctx, 0);
> > +             regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +             return ret;
> > +     }
> > +
> > +     ctx->prepared = true;
> > +     return 0;
> > +}
> > +
> > +static int sony_td4353_jdi_unprepare(struct drm_panel *panel)
> > +{
> > +     struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> > +     struct device *dev = &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     if (!ctx->prepared)
> > +             return 0;
> > +
> > +     ret = sony_td4353_jdi_off(ctx);
> > +     if (ret < 0)
> > +             dev_err(dev, "Failed to power off panel: %d\n", ret);
> > +
> > +     sony_td4353_assert_reset_gpios(ctx, 0);
> > +     regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +
> > +     ctx->prepared = false;
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode sony_td4353_jdi_mode_tama_60hz = {
> > +     .clock = (1080 + 4 + 8 + 8) * (2160 + 259 + 8 + 8) * 60 / 1000,
> > +     .hdisplay = 1080,
> > +     .hsync_start = 1080 + 4,
> > +     .hsync_end = 1080 + 4 + 8,
> > +     .htotal = 1080 + 4 + 8 + 8,
> > +     .vdisplay = 2160,
> > +     .vsync_start = 2160 + 259,
> > +     .vsync_end = 2160 + 259 + 8,
> > +     .vtotal = 2160 + 259 + 8 + 8,
> > +     .width_mm = 64,
> > +     .height_mm = 128,
> > +};
> > +
> > +static int sony_td4353_jdi_get_modes(struct drm_panel *panel,
> > +                                struct drm_connector *connector)
> > +{
> > +     struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
> > +     struct drm_display_mode *mode = NULL;
> > +
> > +     if (ctx->type == TYPE_TAMA_60HZ)
> > +             mode = drm_mode_duplicate(connector->dev, &sony_td4353_jdi_mode_tama_60hz);
> > +     else
> > +             return -EINVAL;
> > +
> > +     if (!mode)
> > +             return -ENOMEM;
> > +
> > +     drm_mode_set_name(mode);
> > +
> > +     mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +     connector->display_info.width_mm = mode->width_mm;
> > +     connector->display_info.height_mm = mode->height_mm;
> > +     drm_mode_probed_add(connector, mode);
> > +
> > +     return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs sony_td4353_jdi_panel_funcs = {
> > +     .prepare = sony_td4353_jdi_prepare,
> > +     .unprepare = sony_td4353_jdi_unprepare,
> > +     .get_modes = sony_td4353_jdi_get_modes,
> > +};
> > +
> > +static int sony_td4353_jdi_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev = &dsi->dev;
> > +     struct sony_td4353_jdi *ctx;
> > +     int ret;
> > +
> > +     ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +     if (!ctx)
> > +             return -ENOMEM;
> > +
> > +     ctx->type = (uintptr_t)of_device_get_match_data(dev);
> > +
> > +     ctx->supplies[0].supply = "vddio";
> > +     ctx->supplies[1].supply = "vsp";
> > +     ctx->supplies[2].supply = "vsn";
> > +     ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> > +                                   ctx->supplies);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to get regulators\n");
> > +
> > +     ctx->panel_reset_gpio = devm_gpiod_get(dev, "panel-reset", GPIOD_ASIS);
> > +     if (IS_ERR(ctx->panel_reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->panel_reset_gpio),
> > +                                  "Failed to get panel-reset-gpios\n");
> > +
> > +     ctx->touch_reset_gpio = devm_gpiod_get(dev, "touch-reset", GPIOD_ASIS);
> > +     if (IS_ERR(ctx->touch_reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->touch_reset_gpio),
> > +                                  "Failed to get touch-reset-gpios\n");
> > +
> > +     ctx->dsi = dsi;
> > +     mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +     dsi->lanes = 4;
> > +     dsi->format = MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +
> > +     drm_panel_init(&ctx->panel, dev, &sony_td4353_jdi_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +
> > +     ret = drm_panel_of_backlight(&ctx->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get backlight\n");
> > +
> > +     drm_panel_add(&ctx->panel);
> > +
> > +     ret = mipi_dsi_attach(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> > +             drm_panel_remove(&ctx->panel);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sony_td4353_jdi_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct sony_td4353_jdi *ctx = mipi_dsi_get_drvdata(dsi);
> > +     int ret;
> > +
> > +     ret = mipi_dsi_detach(dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> > +
> > +     drm_panel_remove(&ctx->panel);
> > +}
> > +
> > +static const struct of_device_id sony_td4353_jdi_of_match[] = {
> > +     { .compatible = "sony,td4353-jdi-tama", .data = (void *)TYPE_TAMA_60HZ },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sony_td4353_jdi_of_match);
> > +
> > +static struct mipi_dsi_driver sony_td4353_jdi_driver = {
> > +     .probe = sony_td4353_jdi_probe,
> > +     .remove = sony_td4353_jdi_remove,
> > +     .driver = {
> > +             .name = "panel-sony-td4353-jdi",
> > +             .of_match_table = sony_td4353_jdi_of_match,
> > +     },
> > +};
> > +module_mipi_dsi_driver(sony_td4353_jdi_driver);
> > +
> > +MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@somainline.org>");
> > +MODULE_DESCRIPTION("DRM panel driver for SONY Xperia XZ2/XZ2c JDI panel");
> > +MODULE_LICENSE("GPL");



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
