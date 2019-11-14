Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB43FFCB93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNRP1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:15:27 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35188 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfKNRP0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:15:26 -0500
Received: by mail-pf1-f195.google.com with SMTP id q13so4674353pff.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 09:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=mXGc15ze5FkLvK8bKyJikjN/XitZLiqox2qKqZ0ej7M=;
        b=TIOMk7lfZRHEzhgLxniST8xwCaUkax4lb9wy8IDtdMl7x/1ayef0CC5FHkxKnb665l
         eUZN+NKq1gGP0IYXhtRZqkqOcrg+B8f/JW01COtBWtrVAAH8hCjPFP6C8bsz6/chTmxY
         N2iFQ1ZnDVeQnsgkUCLlXWwEnqNsnPOYB2jCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=mXGc15ze5FkLvK8bKyJikjN/XitZLiqox2qKqZ0ej7M=;
        b=aeScjxbHSlh0OwqhPdiR4ALjytXARH9DDsjMZtfBl1HP7bU4xWh0zFa1QGu2Q6uQVb
         ppYQc06W/zFMmB2UiGukBLsJyXbGxKxjaez8Iz+pLIyo3ceaqKWK4xJTvTZZ6o3nJ0vM
         3P/hkxVvdrdsoQFhsqZp0FjvhBsGpdwETAGPHRZlyQcLx3lwz+apQ6h3B+Irg2jkFf5g
         dj+LBA3DU8fxRx5UsGit1sjaoGox8k4mGjqqxhAng6KrxoFSJy5/Iz0QU5WCUKdDmloL
         cEWle8vqqlHynPwt64hk/qq4womj1mB6LijP2EuflgPRCSkUR6kiNOR/E/u3mZt/twgi
         MAtQ==
X-Gm-Message-State: APjAAAXaYGla8qaeSc8leAbWomsS3YRhRK8HF+MMKktl3hUKzsUh8puC
        gYUMafgE62WZvefzvoEfKjhwHA==
X-Google-Smtp-Source: APXvYqz/9IgSpWBHpYH+F4lnVYLIaWHthdusN1FnC4aPUIjyMUv7RjdCi9mU0gmhzpEhUdgwiijBnA==
X-Received: by 2002:a62:2bc1:: with SMTP id r184mr12046578pfr.88.1573751725638;
        Thu, 14 Nov 2019 09:15:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s26sm6898757pfh.66.2019.11.14.09.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:15:25 -0800 (PST)
Message-ID: <5dcd8bad.1c69fb81.7569b.3b13@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573726588-18897-2-git-send-email-harigovi@codeaurora.org>
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org> <1573726588-18897-2-git-send-email-harigovi@codeaurora.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 1/2] drm/panel: add support for rm69299 visionox panel driver
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 09:15:24 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Harigovindan P (2019-11-14 02:16:27)
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu=
/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 0000000..faf6d05
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <drm/drm_panel.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>

This is included twice. It's really a panel!

> +#include <drm/drm_print.h>
> +
> +#include <linux/of_gpio.h>

Is this include used?

> +#include <linux/gpio/consumer.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>

Is this include used?

> +#include <linux/pinctrl/consumer.h>

Is this include used?

> +#include <linux/regulator/consumer.h>
> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +
> +#include <video/mipi_display.h>
> +
> +static const char * const regulator_names[] =3D {
> +       "vdda",
> +       "vdd3p3",
> +};
> +
> +static unsigned long const regulator_enable_loads[] =3D {
> +       32000,
> +       13200,
> +};
> +
> +static unsigned long const regulator_disable_loads[] =3D {
> +       80,
> +       80,
> +};

Why do we need these static arrays for two regulators? Is the panel
going to have additional regulators added in the future? I'd prefer
these arrays go away and the regulator setup is open coded in probe.
Maybe that means dropping the use of bulk APIs, I'm not sure.

> +
> +struct cmd_set {
> +       u8 commands[4];
> +       u8 size;
> +};
> +
> +struct rm69299_config {
> +       u32 width_mm;
> +       u32 height_mm;

Why u32 for these types? Do they need to be 32 bits wide or can they be
more generic like unsigned long types?

> +       const char *panel_name;
> +       const struct cmd_set *panel_on_cmds;
> +       u32 num_on_cmds;
> +       const struct drm_display_mode *dm;
> +};
> +
> +struct visionox_rm69299 {
> +       struct device *dev;
> +       struct drm_panel panel;
> +
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +
> +       struct gpio_desc *reset_gpio;
> +
> +       struct backlight_device *backlight;
> +
> +       struct mipi_dsi_device *dsi;
> +       const struct rm69299_config *config;
> +       bool prepared;
> +       bool enabled;
> +};
> +
> +static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *pa=
nel)
> +{
> +       return container_of(panel, struct visionox_rm69299, panel);
> +}
> +
> +static const struct cmd_set qcom_rm69299_1080p_panel_magic_cmds[] =3D {

I like magic.

> +       { { 0xfe, 0x00 }, 2 },
> +       { { 0xc2, 0x08 }, 2 },
> +       { { 0x35, 0x00 }, 2 },
> +       { { 0x51, 0xff }, 2 },
> +};
> +
> +static int visionox_dcs_write(struct drm_panel *panel, u32 command)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int i =3D 0, ret;
> +
> +       ret =3D mipi_dsi_dcs_write(ctx->dsi, command, NULL, 0);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "cmd 0x%x failed for dsi =3D %d\n",
> +                       command, i);
> +       }
> +
> +       return ret;
> +}
> +
> +static int visionox_dcs_write_buf(struct drm_panel *panel,
> +       u32 size, const u8 *buf)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int ret =3D 0;
> +       int i =3D 0;

Please don't assign variables by default and then reassign them without
testing them in between. Also, i is never used so it's confusing that it
isn't just hardcoded into the printk message as '0'.

> +
> +       ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, buf, size);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "failed to tx cmd [%d], err: %d\n", i, ret);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
> +{
> +       int ret, i;

Nitpick: Add a newline between declarations and statements.

> +       for (i =3D 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +               ret =3D regulator_set_load(ctx->supplies[i].consumer,
> +                                       regulator_enable_loads[i]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->sup=
plies);
> +       if (ret < 0)
> +               return ret;

We forgot to drop the load... O well. Probably best to just never drop
the load anyway, see below.

> +
> +       /*
> +        * Reset sequence of visionox panel requires the panel to be
> +        * out of reset for 10ms, followed by being held in reset
> +        * for 10ms and then out again
> +        */
> +       gpiod_set_value(ctx->reset_gpio, 1);
> +       usleep_range(10000, 20000);
> +       gpiod_set_value(ctx->reset_gpio, 0);
> +       usleep_range(10000, 20000);
> +       gpiod_set_value(ctx->reset_gpio, 1);
> +       usleep_range(10000, 20000);
> +
> +       return 0;
> +}
> +
> +static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
> +{
> +       int ret =3D 0;

Ugh. Please stop pre-assigning ret.

> +       int i;
> +
> +       gpiod_set_value(ctx->reset_gpio, 0);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> +               ret =3D regulator_set_load(ctx->supplies[i].consumer,
> +                               regulator_disable_loads[i]);

Do we need to drop the load? I thought that disabling the regulator
would make the regulator core stop considering the load from these
consumers.

> +               if (ret) {
> +                       DRM_DEV_ERROR(ctx->dev,
> +                               "regulator_set_load failed %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       ret =3D regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->su=
pplies);
> +       if (ret) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "regulator_bulk_disable failed %d\n", ret);
> +       }
> +       return ret;
> +}
> +
> +static int visionox_rm69299_disable(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int ret;
> +
> +       if (!ctx->enabled)
> +               return 0;
> +
> +       if (ctx->backlight) {

backlight_disable() and backlight_enable() already check for NULL so
these NULL checks can go away.

> +               ret =3D backlight_disable(ctx->backlight);
> +               if (ret < 0)
> +                       DRM_DEV_ERROR(ctx->dev, "backlight disable failed=
 %d\n",
> +                               ret);
> +       }
> +
> +       ctx->enabled =3D false;
> +       return 0;
> +}
> +
> +static int visionox_rm69299_unprepare(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int ret =3D 0;
> +
> +       if (!ctx->prepared)
> +               return 0;
> +
> +       ctx->dsi->mode_flags =3D 0;
> +
> +       ret =3D visionox_dcs_write(panel, MIPI_DCS_SET_DISPLAY_OFF);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "set_display_off cmd failed ret =3D %d\n",
> +                       ret);

There will be double error prints in this case. Can we just have one
print instead?

> +       }
> +
> +       /* 120ms delay required here as per DCS spec */
> +       msleep(120);
> +
> +       ret =3D visionox_dcs_write(panel, MIPI_DCS_ENTER_SLEEP_MODE);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "enter_sleep cmd failed ret =3D %d\n", ret);
> +       }
> +
> +       ret =3D visionox_rm69299_power_off(ctx);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(ctx->dev, "power_off failed ret =3D %d\n", =
ret);
> +
> +       ctx->prepared =3D false;
> +       return ret;
> +}
> +
> +static int visionox_rm69299_prepare(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int ret;
> +       int i;
> +       const struct cmd_set *panel_on_cmds;
> +       const struct rm69299_config *config;
> +       u32 num_cmds;
> +
> +       if (ctx->prepared)
> +               return 0;
> +
> +       ret =3D visionox_35597_power_on(ctx);
> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       config =3D ctx->config;
> +       panel_on_cmds =3D config->panel_on_cmds;
> +       num_cmds =3D config->num_on_cmds;
> +
> +       for (i =3D 0; i < num_cmds; i++) {
> +               ret =3D visionox_dcs_write_buf(panel,
> +                               panel_on_cmds[i].size,
> +                                       panel_on_cmds[i].commands);
> +               if (ret < 0) {
> +                       DRM_DEV_ERROR(ctx->dev,
> +                               "cmd set tx failed i =3D %d ret =3D %d\n",
> +                                       i, ret);
> +                       goto power_off;
> +               }
> +       }
> +
> +       ret =3D visionox_dcs_write(panel, MIPI_DCS_EXIT_SLEEP_MODE);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "exit_sleep_mode cmd failed ret =3D %d\n",
> +                       ret);
> +               goto power_off;
> +       }
> +
> +       /* Per DSI spec wait 120ms after sending exit sleep DCS command */
> +       msleep(120);
> +
> +       ret =3D visionox_dcs_write(panel, MIPI_DCS_SET_DISPLAY_ON);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "set_display_on cmd failed ret =3D %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       /* Per DSI spec wait 120ms after sending set_display_on DCS comma=
nd */
> +       msleep(120);
> +
> +       ctx->prepared =3D true;
> +
> +       return 0;
> +
> +power_off:
> +       if (visionox_rm69299_power_off(ctx))
> +               DRM_DEV_ERROR(ctx->dev, "power_off failed\n");
> +       return ret;
> +}
> +
> +static int visionox_rm69299_enable(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       int ret;
> +
> +       if (ctx->enabled)
> +               return 0;
> +
> +       if (ctx->backlight) {
> +               ret =3D backlight_enable(ctx->backlight);
> +               if (ret < 0)
> +                       DRM_DEV_ERROR(ctx->dev, "backlight enable failed =
%d\n",
> +                                                 ret);
> +       }
> +
> +       ctx->enabled =3D true;
> +
> +       return 0;
> +}
> +
> +static int visionox_rm69299_get_modes(struct drm_panel *panel)
> +{
> +       struct drm_connector *connector =3D panel->connector;
> +       struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
> +       struct drm_display_mode *mode;
> +       const struct rm69299_config *config;
> +
> +       config =3D ctx->config;
> +       mode =3D drm_mode_create(connector->dev);
> +       if (!mode) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "failed to create a new display mode\n");
> +               return 0;
> +       }
> +
> +       connector->display_info.width_mm =3D config->width_mm;
> +       connector->display_info.height_mm =3D config->height_mm;
> +       drm_mode_copy(mode, config->dm);
> +       mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_probed_add(connector, mode);
> +
> +       return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_rm69299_drm_funcs =3D {
> +       .disable =3D visionox_rm69299_disable,
> +       .unprepare =3D visionox_rm69299_unprepare,
> +       .prepare =3D visionox_rm69299_prepare,
> +       .enable =3D visionox_rm69299_enable,
> +       .get_modes =3D visionox_rm69299_get_modes,
> +};
> +
> +static int visionox_rm69299_panel_add(struct visionox_rm69299 *ctx)

Please inline this function into probe. It's not helping much to be
split out.

> +{
> +       struct device *dev =3D ctx->dev;
> +       int ret, i;
> +       const struct rm69299_config *config;
> +
> +       config =3D ctx->config;
> +       for (i =3D 0; i < ARRAY_SIZE(ctx->supplies); i++)
> +               ctx->supplies[i].supply =3D regulator_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +                                     ctx->supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(ctx->reset_gpio)) {
> +               DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +                       PTR_ERR(ctx->reset_gpio));
> +               return PTR_ERR(ctx->reset_gpio);
> +       }
> +
> +       ret =3D gpiod_direction_output(ctx->reset_gpio, 0);

Didn't the devm_gpiod_get() call above make the gpio use output
direction already? Why call this again?

> +       if(ret < 0) {
> +               pr_err("direction output failed \n");
> +       }
> +
> +       drm_panel_init(&ctx->panel);
> +       ctx->panel.dev =3D dev;
> +       ctx->panel.funcs =3D &visionox_rm69299_drm_funcs;
> +       drm_panel_add(&ctx->panel);
> +
> +       return 0;
> +}
> +
> +static const struct drm_display_mode qcom_sc7180_mtp_1080p_mode =3D {
> +       .name =3D "1080x2248",
> +       .clock =3D 158695,
> +       .hdisplay =3D 1080,
> +       .hsync_start =3D 1080 + 26,
> +       .hsync_end =3D 1080 + 26 + 2,
> +       .htotal =3D 1080 + 26 + 2 + 36,
> +       .vdisplay =3D 2248,
> +       .vsync_start =3D 2248 + 56,
> +       .vsync_end =3D 2248 + 56 + 4,
> +       .vtotal =3D 2248 + 56 + 4 + 4,
> +       .vrefresh =3D 60,
> +       .flags =3D 0,
> +};
> +
> +static const struct rm69299_config rm69299_dir =3D {
> +       .width_mm =3D 74,
> +       .height_mm =3D 131,
> +       .panel_name =3D "qcom_sc7180_mtp_1080p_panel",
> +       .dm =3D &qcom_sc7180_mtp_1080p_mode,
> +       .panel_on_cmds =3D qcom_rm69299_1080p_panel_magic_cmds,
> +       .num_on_cmds =3D ARRAY_SIZE(qcom_rm69299_1080p_panel_magic_cmds),
> +};
> +
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev =3D &dsi->dev;
> +       struct visionox_rm69299 *ctx;
> +       int ret =3D 0;
> +
> +       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->config =3D of_device_get_match_data(dev);

Call device_get_match_data() instead?

> +
> +       if (!ctx->config) {
> +               dev_err(dev, "missing device configuration\n");
> +               return -ENODEV;
> +       }
> +
