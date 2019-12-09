Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB0D1170F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfLIP53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:57:29 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40331 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLIP53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:57:29 -0500
Received: by mail-ed1-f66.google.com with SMTP id c93so13088228edf.7;
        Mon, 09 Dec 2019 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ethsic8hVbQoP36cpzKIhflM9d/9+pupoj0j8RoOH34=;
        b=Rt4Ls1boUpKIOaG0R+AUWQ+kggnhvizFcGQDqv3UZmhZxqJUIowYDcd+q2ph3S3Vsz
         j3cjMoo1Ykp/+O+CtY1tqnfjesb6IHXZuoSTfDDNiKgqBWILI591Sxi3qOn1t6aCRc3f
         EGjJdiXHE8WLtCXN1fBRdwIK9bJt9p1fEuh5XacbfoTmNCXNT5pqoFqwRX/yahKCtC7u
         4KTBuSp++MXTjKyGIyHaHRt1uzCxm1nlsvtvL/NMkMYIcsTxqqVAM4RcDf2fGcGwu5sb
         RZBr+L0b8Hkaui/uvbZzzi6vDE90an8Jc62H2SmBFU6jyaHXXyhQWpCHv0WGfO/xMzx/
         HTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ethsic8hVbQoP36cpzKIhflM9d/9+pupoj0j8RoOH34=;
        b=L1Q3usWM2EhOtY+5t/1NDQsWhcikVuXkgiLXXJ0kIsSW+ROL0u7yVu6B8Sz+Pk0vts
         WXkB3EOEmEMf065SwlghU45XVT4CJ5tFjFptxCqf+3lDc1SLdsoOzgEHEo5gtLrB4AjU
         ZQc/x9+0rUEj8he9mi7/Vpxq1AoOgVtl3A6gtBYBIUelhtHfk9GLKpYuBCF1wMQWszwk
         ZTFW9Bj9IrUEoUllzkKrs1oYK9auJ3sSQK1AoAhxoIPZq4FRdlnZUl46EiHPoFJ8BtQz
         7OD6WIkD8aUoDnFDfx1hkhnnH9YIy+DefrKrA6vNltl5BrrGY7ETRCcRbKPZG+LxWP99
         Ohtg==
X-Gm-Message-State: APjAAAWPkSzuPb8d+gW4Nou6JGRRspXk/m9eBF2OkBMv350Ty2VnnvJk
        UJ2VRkLgvYa64+r0ykUmGsLaHf3Y694WrEuV5bo=
X-Google-Smtp-Source: APXvYqwanh4BtF4Fn1oBlCMoc2jM9L7bvkdVhk//seXBK7KNu3vMukfURFhK5m37pUmNsIQLLG7h35jkeSEkGIWMeIw=
X-Received: by 2002:a50:f313:: with SMTP id p19mr33158997edm.57.1575907047163;
 Mon, 09 Dec 2019 07:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20191207203553.286017-1-robdclark@gmail.com> <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com> <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
 <20191208182757.GE14311@pendragon.ideasonboard.com> <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
 <CAL_Jsq+8jpdNj6yZ4Mst0bVLZHKsY0ArM+wEjOraeD9Om5YyPg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+8jpdNj6yZ4Mst0bVLZHKsY0ArM+wEjOraeD9Om5YyPg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Dec 2019 07:57:16 -0800
Message-ID: <CAF6AEGtt8+SmEMnko7efiOUbdXcAy7XS6vs+rgWYM+BoXEN7SA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 9, 2019 at 7:31 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Dec 8, 2019 at 3:24 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Sun, Dec 8, 2019 at 10:28 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Sun, Dec 08, 2019 at 08:50:32AM -0800, Rob Clark wrote:
> > > > On Sun, Dec 8, 2019 at 6:45 AM Laurent Pinchart wrote:
> > > > > On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > For devices that have one of several possible panels installed, the
> > > > > > panel-id property gives firmware a generic way to locate and enable the
> > > > > > panel node corresponding to the installed panel.  Example of how to use
> > > > > > this property:
> > > > > >
> > > > > >     ivo_panel {
> > > > > >         compatible = "ivo,m133nwf4-r0";
> > > > > >         panel-id = <0xc5>;
> > > > > >         status = "disabled";
> > > > > >
> > > > > >         ports {
> > > > > >             port {
> > > > > >                 ivo_panel_in_edp: endpoint {
> > > > > >                     remote-endpoint = <&sn65dsi86_out_ivo>;
> > > > > >                 };
> > > > > >             };
> > > > > >         };
> > > > > >     };
> > > > > >
> > > > > >     boe_panel {
> > > > > >         compatible = "boe,nv133fhm-n61";
> > > > > >         panel-id = <0xc4>;
> > > > > >         status = "disabled";
> > > > > >
> > > > > >         ports {
> > > > > >             port {
> > > > > >                 boe_panel_in_edp: endpoint {
> > > > > >                     remote-endpoint = <&sn65dsi86_out_boe>;
> > > > > >                 };
> > > > > >             };
> > > > > >         };
> > > > > >     };
> > > > > >
> > > > > >     sn65dsi86: bridge@2c {
> > > > > >         compatible = "ti,sn65dsi86";
> > > > > >
> > > > > >         ports {
> > > > > >             #address-cells = <1>;
> > > > > >             #size-cells = <0>;
> > > > > >
> > > > > >             port@0 {
> > > > > >                 reg = <0>;
> > > > > >                 sn65dsi86_in_a: endpoint {
> > > > > >                     remote-endpoint = <&dsi0_out>;
> > > > > >                 };
> > > > > >             };
> > > > > >
> > > > > >             port@1 {
> > > > > >                 reg = <1>;
> > > > > >
> > > > > >                 sn65dsi86_out_boe: endpoint@c4 {
> > > > > >                     remote-endpoint = <&boe_panel_in_edp>;
> > > > > >                 };
> > > > > >
> > > > > >                 sn65dsi86_out_ivo: endpoint@c5 {
> > > > > >                     remote-endpoint = <&ivo_panel_in_edp>;
> > > > > >                 };
> > > > > >             };
> > > > > >         };
> > > > > >     };
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
> > > > > >  1 file changed, 26 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > > index ef8d8cdfcede..6113319b91dd 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > > @@ -75,6 +75,32 @@ properties:
> > > > > >        in the device graph bindings defined in
> > > > > >        Documentation/devicetree/bindings/graph.txt.
> > > > > >
> > > > > > +  panel-id:
> > > > > > +    description:
> > > > > > +      To support the case where one of several different panels can be installed
> > > > > > +      on a device, the panel-id property can be used by the firmware to identify
> > > > > > +      which panel should have it's status changed to "ok".  This property is not
> > > > > > +      used by the HLOS itself.
> > > > >
> > > > > If your firmware can modify the status property of a panel, it can also
> > > > > add DT nodes. As discussed before, I don't think this belongs to DT.
> > > > > Even if panel-id isn't used by the operating system, you have Linux
> > > > > kernel patches in this series that show that this isn't transparent.
> > > >
> > > > I've already explained several times why this is not feasible.  It
> > > > would require DtbLoader to be familiar with each individual device,
> > > > and be rev'd every time a new device appears.  That is not practical
> > > > at all.
> > > >
> > > > (And fwiw, the ACPI tables describe each panel.. with an ACPI method
> > > > that is passed the the panel-id and returns the appropriate table..
> > > > since DT doesn't have methods, this is the solution.)
> > > >
> > > > I stand by this patch, we can't keep running away from this problem
> > > > and wave the magic firmware wand.
> > >
> > > I believe in firmware solutions more than firmware magic wands :-)
> > >
> >
> > and with that in mind, I think I've come up with a firmware solution,
> > in the form of dtb overlays :-)
> >
> > I've managed to get DtbLoader to find and load a panel overlay based
> > on the panel-id it reads, which drops all patches in the patchset
> > except the last one, which now has this delta:
>
> This looks good to me. The only slight concern I have with it is
> making the overlay filename an ABI. I don't have a better suggestion
> though. How would this work for other vendors or the same panel ID
> (for different panels) used on different platforms? For different
> vendors at least, I guess dtbloader gets the base dtb path somehow and
> the overlay's are relative to that?

Not sure if "different vendors" in this context means different
OEMs/ODMs, or different SoC's?  This solution is snapdragon specific..
and in this case the panel id seems to be a flat namespace (I don't
see re-use for different panels).  But in DtbLoader I attempt loading
a device specific path first, just in case.  In particular the paths
DtbLoader uses (for dtb and panel overlay) are (where
$SysVendor/$ProductName/$BoardName come from SMBIOS tables and
$PanelId comes from a qcom specific UEFIDisplayInfo variable)
described below:

It tries to load dtb from (in order, paths relative to
EFI system partition where DtbLoader is installed):

1) \dtb\$SysVendor\$ProductName-$BoardName.dtb
2) \dtb\$SysVendor\$ProductName.dtb

and panel overlay dtb from:

1) \dtb\$SysVendor\$ProductName-$BoardName-panel-$PanelId.dtb
2) \dtb\$SysVendor\$ProductName-panel-$PanelId.dtb
3) \dtb\panels\panel-$PanelId.dtb

We are already using different dtb names for the main dtb compared to
what the kernel uses.  Which isn't great.  At some point we might want
to add SysVendor/ProductName/BoardName fields in the dtb so we could
automate renaming and stuffing the dtb's into the correct layout.

> > ---------
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile
> > b/arch/arm64/boot/dts/qcom/Makefile
> > index 6498a1ec893f..1a61e8da2521 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +subdir-y += panels
> >  dtb-$(CONFIG_ARCH_QCOM)    += apq8016-sbc.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)    += apq8096-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk01.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/panels/Makefile
> > b/arch/arm64/boot/dts/qcom/panels/Makefile
> > new file mode 100644
> > index 000000000000..dbf55f423555
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/panels/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_QCOM) += panel-c4.dtb
> > +dtb-$(CONFIG_ARCH_QCOM) += panel-c5.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> > b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> > new file mode 100644
> > index 000000000000..ebcf65419dad
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Panel overlay for panel-id 0xc4
> > + *
> > + * Copyright (c) 2019, Linaro Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +    fragment@0 {
> > +        target-path = "/panel";
> > +        __overlay__ {
> > +            compatible = "boe,nv133fhm-n61";
> > +        };
> > +    };
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> > b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> > new file mode 100644
> > index 000000000000..0ad5bb6003e3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Panel overlay for panel-id 0xc5
> > + *
> > + * Copyright (c) 2019, Linaro Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +    fragment@0 {
> > +        target-path = "/panel";
> > +        __overlay__ {
> > +            compatible = "ivo,m133nwf4-r0";
> > +        };
> > +    };
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > index c35d8099d8eb..92c76afb721c 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -22,11 +22,13 @@
> >          hsuart0 = &uart6;
> >      };
> >
> > +    /*
> > +     * stub node which defines how panel is connected to bridge, which
> > +     * will be updated by panel specific overlay
> > +     */
> >      panel {
> > -        compatible = "ivo,m133nwf4-r0";
> >          power-supply = <&vlcm_3v3>;
> >          no-hpd;
> > -
> >          ports {
> >              port {
> >                  panel_in_edp: endpoint {
> > ---------
> >
> > Side note, try as I might, I couldn't get the 'target = <&phandle>'
> > approach to work in the overlays, so I ended up going with target-path
> > instead.  From digging thru the fdt_overlay code, I *think* it is
> > because I end up w/ an overlay dtb without symbols.  In the end, I
> > guess target-path works just as well.
>
> It's the base dtb that needs the symbols I think.
>
> BTW, to answer the question on #dri-devel, if you wanted to put the
> full panel into an overlay, the way to solve the problem of having
> bridge specific knowledge is defining a connector node. That should
> provide enough abstraction. Presumably the connector is actually the
> same across panels in this situation, so that should match up with the
> actual h/w. It could be possible to have a different physical
> connector populated for each possible panel, but hopefully that's not
> the common case.
>

ok, I'm not too familiar with this connector node thing.  I think in
the end, it is really just the compatible string that differs (ie.
power-supply, etc would all be the same for each possible panel).  But
it might be worth trying this connector node thing

BR,
-R
