Return-Path: <linux-arm-msm+bounces-15969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA2C894551
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 21:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98D941F21C8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 19:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8820442056;
	Mon,  1 Apr 2024 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtF/avTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D98F9DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711998722; cv=none; b=ePSotxdd87ygVbHZrIkzmaHaZ5HwglJfPCRjiNgI/nTfCBEtrfitP5zwO/tikcWEE48LaLjgh1T5pfaQUF+Q2Kn1LIIOxRXnyyZXOh60xmHt353sUXN0ji1rsOrdGSh7QXxI4+l4IukzP99JHckyg90aZ5TtTk+Remwx2UwjtMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711998722; c=relaxed/simple;
	bh=x1zz7MdsTCJuVwQOPljsjb0GOlEYI8qTxfhUzxNEV6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1OLJdXcFlNnwklwpWZsAXYSrzrs6lhk+zE5R8mouhzkYKmww3C37gkSM8wxDPJ4RbOfVWXMplXo+hoFGhEdDEfWby6cLDLDFQQKZM7E9uWj6/Y+u8K5eWiGssmRmKUwqhdcaGYVHmJabbYzDK8XLDCRl4AcVqTjB0C+M77BHLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtF/avTZ; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso3994194276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711998719; x=1712603519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kk7Hyn+xpvgbM6tKLNLW7TGc/bsms5PvzXNhL2wyFJo=;
        b=wtF/avTZ32pvL8GullRZm8YDpT654tFnEEkn5na1T6m1fvj7Oq+JbjyR4kRrXvwJTo
         c1/974oyi4pTZGJOM3DTAVvQmwM4zFMDCSj7s4afn7GMUTbSwBiXmbhON2NoW7gOsxvC
         LjONF+lJhw6VpP9+5cqEUUVbUAAUKHG/dlq/2m8ZgWN5s1LBd+ZP6LnWo7gtOK+GRdMA
         geiqk7+RSr34ZclzLVwWUc182ZcRn/Kx9M4KnXodQfFFbseaqx8+8dI0W7QdsGEzFGEN
         aqO4A6wm0H6Z8YwJFngAfxjJ1z5gXw7wz/qXVOVLWUDUHqJH6c/y1tEgNu/PR0kjMRkO
         0OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711998719; x=1712603519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kk7Hyn+xpvgbM6tKLNLW7TGc/bsms5PvzXNhL2wyFJo=;
        b=JS9pgCCoYYZuIYG4BXcipr5QLUTiGAEge026zzgv5t9mYtzTGZ2mxtlEH7FDc4W001
         IcX9yLccDlI+N/Vu+NSyCfu1klLPgm0GD/N1E8wbCrJSn+CACBavFCcKd/6yxMUync+/
         HM/SWkKG98z678eLrSKYbA7RAYIX5SrEaWVBPf2ED6zldQO1wJE9Fiw+i26Ni7/E7ibq
         PnrLUSqNt5adzttyyVi1LW4gRTe0gPJqpB8XOZRozNj0Orhk7ikEogOk+96TizdrccPe
         2jMgZUn/i7VsyuhUcO6RLdl4/1CigwP8APisgufpDJ7rRu3PvkmIx91XUmh0+blBiOLU
         7WJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiqHZbptTxuRSykHOXu6zX9vwBdGeyZtiJCDUpf0q9yc3cmIgcsu1is6AWq6lI/D1qSvA3ZYI+xFxb5KxpxX9t8ZOZLFnwDHqv2q2VfQ==
X-Gm-Message-State: AOJu0YwRLp0rDLjk+Kl+/oM8ro5t8CDAbycVyKMqClP1G1os8eZY9sAM
	04OuA/JyBax1237YrH2utVmZDs960GeDKXv9m/gwZQSlc57CeUObkcHgyANk5cMZDxwogy2hNay
	+vO4//ZQd111dheZJ0CgCux/WGTG7GgSUxaT5rQ==
X-Google-Smtp-Source: AGHT+IFWRk3Ra/x0kvF10tvKfZ1drCZhkw7tHm5TQ325RcTbj72AmuorzfxwIMTyLTVa539S69++8PuLL+dovxmzyYE=
X-Received: by 2002:a25:6983:0:b0:dcc:67a7:430 with SMTP id
 e125-20020a256983000000b00dcc67a70430mr8993468ybc.15.1711998719359; Mon, 01
 Apr 2024 12:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
 <20240330-lg-sw43408-panel-v1-3-f5580fc9f2da@linaro.org> <554zkisebym7gbbom3657ws7kqvyidggfmcvetjm6vrnwts3gl@l53hejt72b5q>
 <CAA8EJpowdjcN8KzGRVLrGx8L8Fi5Drs-C62VZKd5VbmDHsCg+Q@mail.gmail.com> <fn3r4ykwxvgf4ujmpevpsrcwmwzpjl5bhcp6ekyebowgf4rpz3@fyxcwjgn6abg>
In-Reply-To: <fn3r4ykwxvgf4ujmpevpsrcwmwzpjl5bhcp6ekyebowgf4rpz3@fyxcwjgn6abg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 22:11:48 +0300
Message-ID: <CAA8EJprRHg2KH7H6SPF3yfg8HCT2Fe2Hg-LXU19ak78TkKWwjA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: panel: Add LG sw43408 panel driver
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2024 at 13:29, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2024-03-30 16:37:08, Dmitry Baryshkov wrote:
> > On Sat, 30 Mar 2024 at 12:27, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On 2024-03-30 05:59:30, Dmitry Baryshkov wrote:
> > > > From: Sumit Semwal <sumit.semwal@linaro.org>
> > > >
> > > > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
> > > > phones.
> > > >
> > > > Whatever init sequence we have for this panel isn't capable of
> > > > initialising it completely, toggling the reset gpio ever causes the
> > > > panel to die. Until this is resolved we avoid resetting the panel. The
> > >
> > > Are you sure it is avoided?  This patch seems to be toggling reset_gpio in
> > > sw43408_prepare()?
> > >
> > > > disable/unprepare functions only put the panel to sleep mode and
> > > > disable the backlight.
> > > >
> > > > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > > [vinod: Add DSC support]
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > [caleb: cleanup and support turning off the panel]
> > > > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > > > [DB: partially rewrote the driver and fixed DSC programming]
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  MAINTAINERS                              |   8 +
> > > >  drivers/gpu/drm/panel/Kconfig            |  11 ++
> > > >  drivers/gpu/drm/panel/Makefile           |   1 +
> > > >  drivers/gpu/drm/panel/panel-lg-sw43408.c | 322 +++++++++++++++++++++++++++++++
> > > >  4 files changed, 342 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 4b511a55101c..f4cf7ee97376 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -6755,6 +6755,14 @@ S:     Maintained
> > > >  F:   Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> > > >  F:   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > >
> > > > +DRM DRIVER FOR LG SW43408 PANELS
> > > > +M:   Sumit Semwal <sumit.semwal@linaro.org>
> > > > +M:   Caleb Connolly <caleb.connolly@linaro.org>
> > > > +S:   Maintained
> > > > +T:   git git://anongit.freedesktop.org/drm/drm-misc
> > > > +F:   Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
> > > > +F:   drivers/gpu/drm/panel/panel-lg-sw43408.c
> > > > +
> > > >  DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
> > > >  M:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > >  S:   Supported
> > > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > > > index d037b3b8b999..f94c702735cb 100644
> > > > --- a/drivers/gpu/drm/panel/Kconfig
> > > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > > @@ -335,6 +335,17 @@ config DRM_PANEL_LG_LG4573
> > > >         Say Y here if you want to enable support for LG4573 RGB panel.
> > > >         To compile this driver as a module, choose M here.
> > > >
> > > > +config DRM_PANEL_LG_SW43408
> > > > +     tristate "LG SW43408 panel"
> > > > +     depends on OF
> > > > +     depends on DRM_MIPI_DSI
> > > > +     depends on BACKLIGHT_CLASS_DEVICE
> > > > +     help
> > > > +       Say Y here if you want to enable support for LG sw43408 panel.
> > > > +       The panel has a 1080x2160 resolution and uses
> > > > +       24 bit RGB per pixel. It provides a MIPI DSI interface to
> > > > +       the host and has a built-in LED backlight.
> > > > +
> > > >  config DRM_PANEL_MAGNACHIP_D53E6EA8966
> > > >       tristate "Magnachip D53E6EA8966 DSI panel"
> > > >       depends on OF && SPI
> > > > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > > > index f156d7fa0bcc..a75687d13caf 100644
> > > > --- a/drivers/gpu/drm/panel/Makefile
> > > > +++ b/drivers/gpu/drm/panel/Makefile
> > > > @@ -34,6 +34,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
> > > >  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
> > > >  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
> > > >  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> > > > +obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
> > > >  obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
> > > >  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
> > > >  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
> > > > diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> > > > new file mode 100644
> > > > index 000000000000..365d25e14d54
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> > > > @@ -0,0 +1,322 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Copyright (C) 2019-2024 Linaro Ltd
> > > > + * Author: Sumit Semwal <sumit.semwal@linaro.org>
> > > > + *    Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > + */
> > > > +
> > > > +#include <linux/backlight.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +
> > > > +#include <video/mipi_display.h>
> > > > +
> > > > +#include <drm/drm_mipi_dsi.h>
> > > > +#include <drm/drm_panel.h>
> > > > +#include <drm/drm_probe_helper.h>
> > > > +#include <drm/display/drm_dsc.h>
> > > > +#include <drm/display/drm_dsc_helper.h>
> > > > +
> > > > +#define NUM_SUPPLIES 2
> > > > +
> > > > +struct sw43408_panel {
> > > > +     struct drm_panel base;
> > > > +     struct mipi_dsi_device *link;
> > > > +
> > > > +     const struct drm_display_mode *mode;
> > > > +
> > > > +     struct regulator_bulk_data supplies[NUM_SUPPLIES];
> > > > +
> > > > +     struct gpio_desc *reset_gpio;
> > > > +};
> > > > +
> > > > +static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
> > > > +{
> > > > +     return container_of(panel, struct sw43408_panel, base);
> > > > +}
> > > > +
> > > > +static int sw43408_unprepare(struct drm_panel *panel)
> > > > +{
> > > > +     struct sw43408_panel *ctx = to_panel_info(panel);
> > > > +     int ret;
> > > > +
> > > > +     ret = mipi_dsi_dcs_set_display_off(ctx->link);
> > > > +     if (ret < 0)
> > > > +             dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
> > > > +
> > > > +     ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
> > > > +     if (ret < 0)
> > > > +             dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
> > > > +
> > > > +     msleep(100);
> > > > +
> > > > +     gpiod_set_value(ctx->reset_gpio, 1);
> > > > +
> > > > +     return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > > +}
> > > > +
> > > > +static int sw43408_program(struct drm_panel *panel)
> > > > +{
> > > > +     struct sw43408_panel *ctx = to_panel_info(panel);
> > > > +     struct drm_dsc_picture_parameter_set pps;
> > > > +     u8 dsc_en = 0x11;
> > >
> > > Yeah, this is completely strange. Bit 0, 0x1, is to enable DSC which is
> > > normal. 0x10 however, which is bit 4, selects PPS table 2.  Do you ever set
> > > pps_identifier in struct drm_dsc_picture_parameter_set to 2?  Or is the table
> > > that you send below bogus and/or not used?  Maybe the Driver IC on the other
> > > end of the DSI link has a default PPS table with identifier 2 that works out of
> > > the box?
> >
> > Note, MIPI standard also requires two bytes argument. I suspect that
> > LG didn't fully follow the standard here.
>
> Have you read this command from downstream DTS, or have you tried sending 2
> bytes and seen the panel breaking?  The second byte is marked as reserved and
> should be equal to 0; if the Driver IC is okay with sending either 1 or 2 bytes
> I'd strive to stick with the defined length of 2 bytes for this DCS.
>
> Have you played around with the PPS table?  What if you change
> drm_dsc_picture_paremeter_set::pps_identifier to the second table, will the
> panel stop working as expected again?  This could indicate that the PPS that is
> sent is incorrect (even though the information in the original DSC config was
> enough to set up the DPU and DSI correctly).
>
> According to the DSI spec it is allowed to have a pre-stored/pre-programmed
> PPS table, which could be used here making the current call to
> mipi_dsi_picture_parameter_set() useless and "confusing"?

Ok, some short summary of my tests.

Skipping PPS doesn't work at all, so there is no default.

Adding a second zero byte doesn't seem to change anything. Dropping
the 0x1 bit ('enable') doesn't seem to change anything.

If I send COMPRESSION_MODE before sending the PPS, various combinations work.
If I send COMPRESSION_MODE after sending the PPS, the follow combos work:

pps_identifier = 0x0, COMPRESSION_MODE = 0x11
pps_identifier = 0x1, COMPRESSION_MODE = 0x21

>
> > Basically that's the reason why I went for the _raw function instead
> > of adding PPS and codec arguments to the existing function.
> >
> > >
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
> > > > +
> > > > +     mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > > > +
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
> > > > +
> > > > +     mipi_dsi_dcs_exit_sleep_mode(ctx->link);
> > > > +
> > > > +     msleep(135);
> > > > +
> > > > +     mipi_dsi_compression_mode_raw(ctx->link, &dsc_en, 1);
> > >
> > > Even though I think we should change this function to describe the known
> > > bit layout of command 0x7 per the VESA DSI spec, for now replace 1 with
> > > sizeof(dsc_en)?
> >
> > If dsc_en were an array, it would have been a proper thing. Maybe I
> > should change it to the array to remove confusion.
>
> It should work even with a single byte, just to clarify to readers that the 3rd
> argument is the byte-size of the input.
>
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
> > > > +                            0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
> > > > +                            0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
> > > > +                            0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
> > > > +                            0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
> > > > +                            0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
> > > > +                            0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
> > > > +                            0x01);
> > > > +     msleep(85);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
> > > > +                            0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
> > > > +                            0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
> > > > +                            0x16, 0x16);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
> > > > +     mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
> > > > +
> > > > +     mipi_dsi_dcs_set_display_on(ctx->link);
> > >
> > > Any specific reason to not have the (un)blanking sequence in the enable/disable
> > > callbacks and leaving display configuration in (un)prepare?
> >
> > We are back to the question on when it's fine to send the commands. I
> > think the current agreement is to send everything in the
> > prepare/unprepare, because of some strange hosts.
>
> For my panel drivers I'm sticking with having `post-on` commands (from
> downstream) in `enable/disable`, which is typically only `set_display_on`.  In
> hopes of proposing a `prepare_atomic()` some time to allow mode selection.
>
> In a short test on recent -next I am once again allowed to send DSI commands in
> both .disable and .unprepare, making both functions a "clean" inverse of .enable
> and .prepare respectively.

The world isn't limited to the MSM hosts.

>
> > > > +     msleep(50);
> > > > +
> > > > +     ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > > > +
> > > > +     drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
> > > > +     mipi_dsi_picture_parameter_set(ctx->link, &pps);
> > >
> > > I'm always surprised why this is sent _after_ turning the display on (unblanking
> > > it).  Wouldn't that cause unnecessary corruption?
> >
> > No idea. I followed the dowsntream command sequences here. Most likely
> > the panel is not fully on until it receives the full frame to be
> > displayed.
>
> According to the DSI spec a PPS update is allowed to happen every frame, and
> (for cmdmode panels) will take effect after the next TE trigger.  Unsure if a TE
> event happens before the first frame, otherwise this may start taking effect
> on the second frame onwards only.
>
> If there's no corruption on the first frame there might be a pre-programmed PPS
> table in slot 2, supporting the theory above.



-- 
With best wishes
Dmitry

