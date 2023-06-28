Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6009B7413C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 16:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjF1OVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 10:21:53 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:37737 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjF1OUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 10:20:39 -0400
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 79F273F78D;
        Wed, 28 Jun 2023 16:20:36 +0200 (CEST)
Date:   Wed, 28 Jun 2023 16:20:34 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Caleb Connolly <caleb@connolly.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH RFC 10/10] drm/panel/sony-griffin-samsung: Add panel
 driver for Sony Xperia 1
Message-ID: <a7h7hudmgg3ldb334o2knga7dqilvp47tfd46se4szpri2xi35@lxg5i5igjfmj>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
 <CACRpkdbrk_pPqewo-bGPq4NQScHSRKNMeO0ik_aqEQ+BY12BBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbrk_pPqewo-bGPq4NQScHSRKNMeO0ik_aqEQ+BY12BBQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-28 11:22:37, Linus Walleij wrote:
> On Sun, May 21, 2023 at 11:23 PM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> 
> > The Sony Xperia 1 (codename kumano griffin) features an unnamed 4k OLED
> > DSI cmd mode panel produced by Samsung.  It can be driven in a
> > 1644x3840@60 or 1096x2560@60 mode, and always has Display Stream
> > Compression 1.1 enabled.
> >
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> (...)
> 
> > +static int sony_griffin_samsung_on(struct sony_griffin_samsung *ctx)
> > +{
> 
> > +       ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +       if (ret < 0) {
> > +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +               return ret;
> > +       }
> > +       usleep_range(10000, 11000);
> > +
> > +       ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +       if (ret < 0) {
> > +               dev_err(dev, "Failed to set tear on: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x07);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> > +       /* Enable backlight control */
> > +       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
> > +       msleep(110);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xe2, enable_4k ? 0 : 1);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> > +
> > +       ret = mipi_dsi_dcs_set_column_address(dsi, 0, hdisplay - 1);
> > +       if (ret < 0) {
> > +               dev_err(dev, "Failed to set column address: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = mipi_dsi_dcs_set_page_address(dsi, 0, vdisplay - 1);
> > +       if (ret < 0) {
> > +               dev_err(dev, "Failed to set page address: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x70);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x60);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xc5, 0x2e, 0x21);
> > +       mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> > +
> > +       ret = mipi_dsi_dcs_set_display_on(dsi);
> > +       if (ret < 0) {
> > +               dev_err(dev, "Failed to turn display on: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> 
> This is eerily similar to the sequence in panel-samsung-sofef00.c:
> 
> static int sofef00_panel_on(struct sofef00_panel *ctx)
> {
>         struct mipi_dsi_device *dsi = ctx->dsi;
>         struct device *dev = &dsi->dev;
>         int ret;
> 
>         dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> 
>         ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>                 return ret;
>         }
>         usleep_range(10000, 11000);
> 
>         mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> 
>         ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to set tear on: %d\n", ret);
>                 return ret;
>         }
> 
>         mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>         mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>         mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
>         mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
>         mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> 
>         ret = mipi_dsi_dcs_set_display_on(dsi);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to set display on: %d\n", ret);
>                 return ret;
>         }
> 
>         return 0;
> }
> 
> Isn't this just the same display controller with a different configuration?
> Especially the sleep ranges are even the same.
> 
> I almost feel like buying these phones just to pry them apart and put
> under a microscope to figure out what these displays actually contain.

In the second iteration this is going to be the souxp00 controller,
powering specifically the amb650wh01 panel on the Xperia 1 (griffin) and
amb650wh07 on the Xperia 1 II.

To answer your question more generically, open a few more of the Samsung
panels already in the tree and within this series.  All their commands
look awkwardly similar.  Some call the 0xf0, 0x5a, 0x5a sequence an MCS
password, others call it an MCS_LEVEL_2_KEY, and for our panels where we
have zero documentation and only a list of commands downstream we leave
them undocumented.

In an ideal world we have documentation and can accurately determine
what the commands mean (and if they're similar between DrIC revisions),
and instead describe the right parameters per-panel which are
generically converted to commands, allowing us to implement all these
lookalikes in a single driver.

But for now we might already create a step-up version of that by having
a "Samsung panel driver library" to deduplicate generic commands, which
drivers can freely call into?  Or do you envision anything else here
considering that there is no spec to build on top of that guarantees our
observations?

On the other hand of the spectrum we currently have 4 downstream panels
for Sony devices that all declare to be using the sofef01 controller,
but with vastly different command sets.  And even if we "accidentally"
send the wrong set for the wrong device, the panel works anyway with no
noticeable color shifts or otherwise...

- Marijn
