Return-Path: <linux-arm-msm+bounces-6560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2244825DB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 02:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573161F241EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 01:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036FE1396;
	Sat,  6 Jan 2024 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9VwBVqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86515A5
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jan 2024 01:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-680a13af19bso1462916d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 17:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704505002; x=1705109802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRgj+/qakRLy3N1Mk0ND6eltYb1wAh+DKO5UCmLlflU=;
        b=g9VwBVqY4Gwd62rBInR0ttZQW2ZWrhiJLAahDmWcYFeXoejHBrjGUbqe1RqPhI0x+u
         w5yd1oCWDXZTXx5c0OSgN+iSKCJ2AXlhOmRj4xm5rJITxJrMVa2V47MQB9rVzHCmXZMD
         /HiLy1b7IFVZkAb9ASDYkNnMQtdda4Pkon0rd4RC5cQ54XuSdbGqOhAMvPrZrmWqRCSY
         Czo6JkKBwZ4Smrcv8NIKqt7PkI20IeQkyQqxfUAwLxezkTeumAS0ectkFNYZPGn3jM/a
         vfqBFIPb8c8kLzahjl9MF2bmRNzPRaXyKVSa6Ze/rpIqCIrLt0UFaVaSYLtm9ffIqICL
         R1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704505002; x=1705109802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRgj+/qakRLy3N1Mk0ND6eltYb1wAh+DKO5UCmLlflU=;
        b=W+zk2pmPSrHsmylo8IMXYEkkSQIU0LMnVGhBAVJeQ9jJ7iMI7J0DS9oc/sNrh+49hP
         q3JGERkus+ETycAUFRmyuy6l2VPO4PPj0jb4vb9TpW6xBToeZJ9u7wpu3i9gPSOlh3zh
         6xZArnyoIaWlGC+nGwPkAwgoSI/ZNzER+R5T54UP3Q66w1UNmsFRymCzi54tLHgSVgBx
         IFe8xGnoKJNZh7niHoOAf8ge1+i6kBmRGhU7LmCN3/rONIPvZ8nb8QGPP4fVXKjOGrDM
         jpFi7RbFpWhAEjdlv7/cNd0SIPqGoJBXn0XKgOg6lJ5srtL6RVUjRKqXQAk22bXK24MY
         g7Ag==
X-Gm-Message-State: AOJu0YzqF0PyoCiw1dV0sGcUMcYmNwopct9ZtlWCS5kLRyo1idLqqfSj
	bxIIaaGA/iQRlSVC+aK6hKSVFyEm6ED8JOOXQM026GI9xTaTCg==
X-Google-Smtp-Source: AGHT+IFw6cpGi2+LBMWK+n4JSb8aX4EBN95a6we+6kab8/dQs0FnQaLzyiu65nQgZLJYnFRnTBtknHZt723/2y3MkHc=
X-Received: by 2002:a05:6214:519b:b0:680:3f5e:f52f with SMTP id
 kl27-20020a056214519b00b006803f5ef52fmr352103qvb.90.1704505002500; Fri, 05
 Jan 2024 17:36:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com> <20240105-fp4-panel-v1-2-1afbabc55276@fairphone.com>
In-Reply-To: <20240105-fp4-panel-v1-2-1afbabc55276@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 6 Jan 2024 03:36:31 +0200
Message-ID: <CAA8EJpoTuz5JCokPoQfiANaSvBC678x1sqUbvMd8QvgC9AvP=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jan 2024 at 16:29, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
> driver IC, as found on the Fairphone 4 smartphone.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                |   9 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 372 +++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 99e14dc212ec..e98d329826f2 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -162,6 +162,15 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
>           Say Y if you want to enable support for panels based on the
>           Feiyang FY07024DI26A30-D MIPI-DSI interface.
>
> +config DRM_PANEL_HIMAX_HX83112A
> +       tristate "Himax HX83112A-based DSI panel"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         Say Y here if you want to enable support for Himax HX83112A-based
> +         display panels, such as the one found in the Fairphone 4 smartphone.
> +
>  config DRM_PANEL_HIMAX_HX8394
>         tristate "HIMAX HX8394 MIPI-DSI LCD panels"
>         depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index d10c3de51c6d..c2fc4c8c8340 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
>  obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>  obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>  obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
> +obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> new file mode 100644
> index 000000000000..ce86aad11bf5
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct hx83112a_panel {
> +       struct drm_panel panel;
> +       struct mipi_dsi_device *dsi;
> +       struct regulator_bulk_data supplies[3];
> +       struct gpio_desc *reset_gpio;
> +       bool prepared;

I think this should not be necessary after d2aacaf07395 ("drm/panel:
Check for already prepared/enabled in drm_panel")

> +};
> +
> +static inline struct hx83112a_panel *to_hx83112a_panel(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct hx83112a_panel, panel);
> +}
> +
> +static void hx83112a_reset(struct hx83112a_panel *ctx)
> +{
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       msleep(20);
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +       msleep(20);
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       msleep(50);
> +}
> +
> +static int hx83112a_on(struct hx83112a_panel *ctx)
> +{
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct device *dev = &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x83, 0x11, 0x2a);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb1,
> +                              0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb2,
> +                              0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
> +                              0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb4,
> +                              0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
> +                              0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
> +                              0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
> +                              0x12, 0x00, 0x29);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xb4,
> +                              0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
> +                              0x53);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc1,
> +                              0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +                              0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +                              0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +                              0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +                              0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +                              0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +                              0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +                              0x40);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc1,
> +                              0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +                              0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +                              0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +                              0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +                              0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +                              0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +                              0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +                              0x40);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc1,
> +                              0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +                              0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +                              0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +                              0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +                              0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +                              0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +                              0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +                              0x40);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xc7, 0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x2b, 0x2b);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd3,
> +                              0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
> +                              0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
> +                              0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
> +                              0x07, 0x00, 0x07, 0x32, 0x19, 0x31, 0x09, 0x31,
> +                              0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
> +                              0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
> +                              0x0f);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd3,
> +                              0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd5,
> +                              0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +                              0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
> +                              0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
> +                              0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
> +                              0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
> +                              0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd6,
> +                              0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +                              0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
> +                              0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
> +                              0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
> +                              0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
> +                              0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
> +                              0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
> +                              0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
> +                              0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
> +                              0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
> +                              0xff, 0xff, 0xff, 0xff);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +                              0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
> +                              0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe7,
> +                              0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
> +                              0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
> +                              0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe7,
> +                              0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe7,
> +                              0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
> +                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
> +                              0x00, 0x00, 0x00, 0x02, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe9, 0xc3);
> +       mipi_dsi_dcs_write_seq(dsi, 0xcb, 0xd1, 0xd6);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x3f);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe9, 0xc6);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbf, 0x37);
> +       mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x3f);
> +
> +       ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(150);
> +
> +       ret = mipi_dsi_dcs_set_display_on(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set display on: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(50);
> +
> +       return 0;
> +}
> +
> +static int hx83112a_disable(struct drm_panel *panel)
> +{
> +       struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct device *dev = &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +       ret = mipi_dsi_dcs_set_display_off(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set display off: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(20);
> +
> +       ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(120);
> +
> +       return 0;
> +}
> +
> +static int hx83112a_prepare(struct drm_panel *panel)
> +{
> +       struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +       struct device *dev = &ctx->dsi->dev;
> +       int ret;
> +
> +       if (ctx->prepared)
> +               return 0;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +               return ret;
> +       }
> +
> +       hx83112a_reset(ctx);
> +
> +       ret = hx83112a_on(ctx);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +               gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +               regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +               return ret;
> +       }
> +
> +       ctx->prepared = true;
> +       return 0;
> +}
> +
> +static int hx83112a_unprepare(struct drm_panel *panel)
> +{
> +       struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +
> +       if (!ctx->prepared)
> +               return 0;
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +       regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +       ctx->prepared = false;
> +       return 0;
> +}
> +
> +static const struct drm_display_mode hx83112a_mode = {
> +       .clock = (1080 + 28 + 8 + 8) * (2340 + 27 + 5 + 5) * 60 / 1000,
> +       .hdisplay = 1080,
> +       .hsync_start = 1080 + 28,
> +       .hsync_end = 1080 + 28 + 8,
> +       .htotal = 1080 + 28 + 8 + 8,
> +       .vdisplay = 2340,
> +       .vsync_start = 2340 + 27,
> +       .vsync_end = 2340 + 27 + 5,
> +       .vtotal = 2340 + 27 + 5 + 5,
> +       .width_mm = 65,
> +       .height_mm = 115,
> +};
> +
> +static int hx83112a_get_modes(struct drm_panel *panel,
> +                                 struct drm_connector *connector)
> +{
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_mode_duplicate(connector->dev, &hx83112a_mode);
> +       if (!mode)
> +               return -ENOMEM;
> +
> +       drm_mode_set_name(mode);
> +
> +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       connector->display_info.width_mm = mode->width_mm;
> +       connector->display_info.height_mm = mode->height_mm;
> +       drm_mode_probed_add(connector, mode);

This looks like drm_connector_helper_get_modes_fixed()

> +
> +       return 1;
> +}
> +
> +static const struct drm_panel_funcs hx83112a_panel_funcs = {
> +       .prepare = hx83112a_prepare,
> +       .unprepare = hx83112a_unprepare,
> +       .disable = hx83112a_disable,
> +       .get_modes = hx83112a_get_modes,
> +};
> +
> +static int hx83112a_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev = &dsi->dev;
> +       struct hx83112a_panel *ctx;
> +       int ret;
> +
> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->supplies[0].supply = "vdd1";
> +       ctx->supplies[1].supply = "vsn";
> +       ctx->supplies[2].supply = "vsp";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +                                     ctx->supplies);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +       ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ctx->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +                                    "Failed to get reset-gpios\n");
> +
> +       ctx->dsi = dsi;
> +       mipi_dsi_set_drvdata(dsi, ctx);
> +
> +       dsi->lanes = 4;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +                         MIPI_DSI_MODE_VIDEO_HSE |
> +                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +       drm_panel_init(&ctx->panel, dev, &hx83112a_panel_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);
> +       ctx->panel.prepare_prev_first = true;
> +
> +       ret = drm_panel_of_backlight(&ctx->panel);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +       drm_panel_add(&ctx->panel);
> +
> +       ret = mipi_dsi_attach(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to attach to DSI host: %d\n", ret);

Probably this can become dev_err_probe() too.

> +               drm_panel_remove(&ctx->panel);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void hx83112a_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct hx83112a_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +       int ret;
> +
> +       ret = mipi_dsi_detach(dsi);
> +       if (ret < 0)
> +               dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +       drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id hx83112a_of_match[] = {
> +       { .compatible = "fairphone,fp4-hx83112a-djn" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, hx83112a_of_match);
> +
> +static struct mipi_dsi_driver hx83112a_driver = {
> +       .probe = hx83112a_probe,
> +       .remove = hx83112a_remove,
> +       .driver = {
> +               .name = "panel-himax-hx83112a",
> +               .of_match_table = hx83112a_of_match,
> +       },
> +};
> +module_mipi_dsi_driver(hx83112a_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for hx83112a-equipped DSI panels");
> +MODULE_LICENSE("GPL");
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

