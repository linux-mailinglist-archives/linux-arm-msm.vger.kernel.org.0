Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18AB70BEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbjEVM7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 08:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjEVM7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 08:59:10 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19294CD
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 05:59:08 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-ba81031424dso9129826276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684760347; x=1687352347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCjgaIBg1413+ZAECALmVtqZ0DPPflZA/0F3xjG6XnA=;
        b=yYKMTbxYVK5vRAtLSrpyvIV5n49h3TOGLPgHoNJUv4Kik5xPQ4GIqCZ/YCshKUzyjW
         Yb4ccgR6KfkRMmam+HARFZrksrhBsBRXoWruGLARLFMKq4dXIS6lsY3eUKbL7xBCnZgj
         +/0NQtbhLOU8ycD/ZJrAVhR/4pq6mc32Ixzn7BTSku1UpegwBZl/raBcDpWeFbpS4ZzQ
         x8XmWPZdFrzxdG6FX+Ac7Ua79KnPf+VbY1cZPCixOvziz+qd81geKYuBtkm1rupZsU+p
         zu6rr1pEjjkERmH0cgewbDfuR1KxqU7K31B7QmMzRkuJraG0Xzi04o51vprsVgF6x3Mh
         dEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684760347; x=1687352347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCjgaIBg1413+ZAECALmVtqZ0DPPflZA/0F3xjG6XnA=;
        b=FziL3PYCYzQLw7kQsaC+o5apsgiKNm5wtOv6v4WaXqW5Lwh17qmx5b30Rebp13OVZW
         K5l4JQ4KOy95iY7BHE/ollG0ORPIZv4cYCcXEKrg2coWvtmE/iWsClPQ/Paoq06hlzLZ
         60jsd2F7SFEQWrgt/J1ui+h68EURXz+OLw9MywLjTwLz306iyJI5MZOUquFn75ksjzez
         vFM7W4BnROx0t7bSfof7u9K04dJwxPOb+4xidISZolQE0RNyuq3URTyY6gB05GRl8UQI
         +JISCRI/Fm5iMhOA2L58gAoEZIAKLupj76mcIVQM3lAD7xelJVPQZt0nieLfYspJre1Q
         zT8A==
X-Gm-Message-State: AC+VfDxfNHb9hSYhBQH2bLkbd4qF9HuMrPHoP5c4JI21VzJflnJwKFsd
        OdYvKZD2JiEIeaoQMc0qMdRH7R86l/eOtqN1p8p/eQ==
X-Google-Smtp-Source: ACHHUZ6cWxlY3y77MvSqyblAVtFUTXlIh6df32iAVJm+u3VEWjzbbKn2z/2n4pkLhV51v/peB0tFOfaRK/VQ6yzT3o0=
X-Received: by 2002:a25:fc28:0:b0:ba8:37bd:59db with SMTP id
 v40-20020a25fc28000000b00ba837bd59dbmr9143905ybd.34.1684760347027; Mon, 22
 May 2023 05:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org> <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
In-Reply-To: <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 May 2023 15:58:56 +0300
Message-ID: <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia XZ3
To:     neil.armstrong@linaro.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Caleb Connolly <caleb@connolly.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 May 2023 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 22/05/2023 03:16, Dmitry Baryshkov wrote:
> > On 22/05/2023 00:23, Marijn Suijten wrote:
> >> Sony provides an unlabeled LGD + Atmel maXTouch assembly in its Xperia
> >> XZ3 (tama akatsuki) phone, with custom DCS commands to match.
> >>
> >> This panel features Display Stream Compression 1.1.
> >>
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> ---
> >>   drivers/gpu/drm/panel/Kconfig                   |  11 +
> >>   drivers/gpu/drm/panel/Makefile                  |   1 +
> >>   drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c | 362 ++++++++++++++++++++++++
> >>   3 files changed, 374 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> >> index 67ef898d133f2..18bd116e78a71 100644
> >> --- a/drivers/gpu/drm/panel/Kconfig
> >> +++ b/drivers/gpu/drm/panel/Kconfig
> >> @@ -706,6 +706,17 @@ config DRM_PANEL_SONY_ACX565AKM
> >>         Say Y here if you want to enable support for the Sony ACX565AKM
> >>         800x600 3.5" panel (found on the Nokia N900).
> >> +config DRM_PANEL_SONY_AKATSUKI_LGD
> >> +    tristate "Sony Xperia XZ3 LGD panel"
> >> +    depends on GPIOLIB && OF
> >> +    depends on DRM_MIPI_DSI
> >> +    depends on BACKLIGHT_CLASS_DEVICE
> >> +    help
> >> +      Say Y here if you want to enable support for the Sony Xperia XZ3
> >> +      1440x2880@60 6.0" OLED DSI cmd mode panel produced by LG Display.
> >> +
> >> +      This panel uses Display Stream Compression 1.1.
> >> +
> >>   config DRM_PANEL_SONY_TD4353_JDI
> >>       tristate "Sony TD4353 JDI panel"
> >>       depends on GPIOLIB && OF
> >> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> >> index ff169781e82d7..85133f73558f3 100644
> >> --- a/drivers/gpu/drm/panel/Makefile
> >> +++ b/drivers/gpu/drm/panel/Makefile
> >> @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
> >>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
> >>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> >>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> >> +obj-$(CONFIG_DRM_PANEL_SONY_AKATSUKI_LGD) += panel-sony-akatsuki-lgd.o
> >>   obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> >>   obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
> >>   obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
> >> diff --git a/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
> >> new file mode 100644
> >> index 0000000000000..f55788f963dab
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
> >> @@ -0,0 +1,362 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
> >> + *
> >> + * Based on Sony Downstream's "Atmel LGD ID5" Akatsuki panel dtsi.
> >> + */
> >> +
> >> +#include <linux/backlight.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/regulator/consumer.h>
> >> +
> >> +#include <video/mipi_display.h>
> >> +
> >> +#include <drm/drm_mipi_dsi.h>
> >> +#include <drm/drm_modes.h>
> >> +#include <drm/drm_panel.h>
> >> +#include <drm/drm_probe_helper.h>
> >> +#include <drm/display/drm_dsc.h>
> >> +#include <drm/display/drm_dsc_helper.h>
> >> +
> >> +struct sony_akatsuki_lgd {
> >> +    struct drm_panel panel;
> >> +    struct mipi_dsi_device *dsi;
> >> +    struct regulator *vddio;
> >> +    struct gpio_desc *reset_gpio;
> >> +    bool prepared;
> >> +};
> >> +
> >> +static inline struct sony_akatsuki_lgd *to_sony_akatsuki_lgd(struct drm_panel *panel)
> >> +{
> >> +    return container_of(panel, struct sony_akatsuki_lgd, panel);
> >> +}
> >> +
> >> +static int sony_akatsuki_lgd_on(struct sony_akatsuki_lgd *ctx)
> >> +{
> >> +    struct mipi_dsi_device *dsi = ctx->dsi;
> >> +    struct device *dev = &dsi->dev;
> >> +    int ret;
> >> +
> >> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x02, 0x01);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x59, 0x01);
> >> +    /* Enable backlight control */
> >> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x57, 0x20, 0x80, 0xde, 0x60, 0x00);
> >> +
> >> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1440 - 1);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set column address: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2880 - 1);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set page address: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> >> +
> >> +    ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x03);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x04);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x01, 0x7f, 0x00);
> >> +
> >> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +    msleep(120);
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xe3, 0xac, 0x19, 0x34, 0x14, 0x7d);
> >> +
> >> +    ret = mipi_dsi_dcs_set_display_on(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
> >> +        return ret;
> >> +    }
> >
> > My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() part?
>
>
> No, prepare is called before the video stream is started and when display is still in LPM mode and the mode hasn't been set.
>

Yes, that's my point. Shouldn't we enable the panel _after_ starting the stream?

-- 
With best wishes
Dmitry
