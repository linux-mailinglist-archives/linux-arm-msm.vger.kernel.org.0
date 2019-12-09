Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD89A117082
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfLIPby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:31:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:38856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbfLIPby (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:31:54 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2145324653;
        Mon,  9 Dec 2019 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575905513;
        bh=ofqIYIemd1D0b3yzkB6LCuueWfFwja6Mfc7dfyMtTLw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HeHu/WczDuuQ+b3lqLaESpVihmzfEFNIaCPnKUJzWPJy4JSBtt6+xlLUv3pT2PnR3
         Lcl0iKZ/xjEKW+lSPCuwP4tlRUQLyowK8UNJZ/+0n54qy+zwA5T3j5HNhZ8923XWFs
         Fv1mWFCSvAhOX0Hd77vT+5U3V0NXNNAg8ktrn9hQ=
Received: by mail-qk1-f174.google.com with SMTP id a203so3247493qkc.3;
        Mon, 09 Dec 2019 07:31:53 -0800 (PST)
X-Gm-Message-State: APjAAAUCPUNx9m6AQNQUegP7VIM9QUOC/qYVal6CW3prGSocBN7av7Xi
        2Qfxg9h0gMP+AbGOJwBkOMm36i2tEINLNg2zBg==
X-Google-Smtp-Source: APXvYqyfkfzQ/i4Lsc3E69M49ZOIyASsab3VnWlhaCawfK85eSyUl3IfhJlvAVUYIQ0qxm+a4uEWnbu24j4V/Gz9iWU=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr27896771qkd.223.1575905512012;
 Mon, 09 Dec 2019 07:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20191207203553.286017-1-robdclark@gmail.com> <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com> <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
 <20191208182757.GE14311@pendragon.ideasonboard.com> <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
In-Reply-To: <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 9 Dec 2019 09:31:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8jpdNj6yZ4Mst0bVLZHKsY0ArM+wEjOraeD9Om5YyPg@mail.gmail.com>
Message-ID: <CAL_Jsq+8jpdNj6yZ4Mst0bVLZHKsY0ArM+wEjOraeD9Om5YyPg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
To:     Rob Clark <robdclark@gmail.com>
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

On Sun, Dec 8, 2019 at 3:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Sun, Dec 8, 2019 at 10:28 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Rob,
> >
> > On Sun, Dec 08, 2019 at 08:50:32AM -0800, Rob Clark wrote:
> > > On Sun, Dec 8, 2019 at 6:45 AM Laurent Pinchart wrote:
> > > > On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > For devices that have one of several possible panels installed, the
> > > > > panel-id property gives firmware a generic way to locate and enable the
> > > > > panel node corresponding to the installed panel.  Example of how to use
> > > > > this property:
> > > > >
> > > > >     ivo_panel {
> > > > >         compatible = "ivo,m133nwf4-r0";
> > > > >         panel-id = <0xc5>;
> > > > >         status = "disabled";
> > > > >
> > > > >         ports {
> > > > >             port {
> > > > >                 ivo_panel_in_edp: endpoint {
> > > > >                     remote-endpoint = <&sn65dsi86_out_ivo>;
> > > > >                 };
> > > > >             };
> > > > >         };
> > > > >     };
> > > > >
> > > > >     boe_panel {
> > > > >         compatible = "boe,nv133fhm-n61";
> > > > >         panel-id = <0xc4>;
> > > > >         status = "disabled";
> > > > >
> > > > >         ports {
> > > > >             port {
> > > > >                 boe_panel_in_edp: endpoint {
> > > > >                     remote-endpoint = <&sn65dsi86_out_boe>;
> > > > >                 };
> > > > >             };
> > > > >         };
> > > > >     };
> > > > >
> > > > >     sn65dsi86: bridge@2c {
> > > > >         compatible = "ti,sn65dsi86";
> > > > >
> > > > >         ports {
> > > > >             #address-cells = <1>;
> > > > >             #size-cells = <0>;
> > > > >
> > > > >             port@0 {
> > > > >                 reg = <0>;
> > > > >                 sn65dsi86_in_a: endpoint {
> > > > >                     remote-endpoint = <&dsi0_out>;
> > > > >                 };
> > > > >             };
> > > > >
> > > > >             port@1 {
> > > > >                 reg = <1>;
> > > > >
> > > > >                 sn65dsi86_out_boe: endpoint@c4 {
> > > > >                     remote-endpoint = <&boe_panel_in_edp>;
> > > > >                 };
> > > > >
> > > > >                 sn65dsi86_out_ivo: endpoint@c5 {
> > > > >                     remote-endpoint = <&ivo_panel_in_edp>;
> > > > >                 };
> > > > >             };
> > > > >         };
> > > > >     };
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
> > > > >  1 file changed, 26 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > index ef8d8cdfcede..6113319b91dd 100644
> > > > > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > > @@ -75,6 +75,32 @@ properties:
> > > > >        in the device graph bindings defined in
> > > > >        Documentation/devicetree/bindings/graph.txt.
> > > > >
> > > > > +  panel-id:
> > > > > +    description:
> > > > > +      To support the case where one of several different panels can be installed
> > > > > +      on a device, the panel-id property can be used by the firmware to identify
> > > > > +      which panel should have it's status changed to "ok".  This property is not
> > > > > +      used by the HLOS itself.
> > > >
> > > > If your firmware can modify the status property of a panel, it can also
> > > > add DT nodes. As discussed before, I don't think this belongs to DT.
> > > > Even if panel-id isn't used by the operating system, you have Linux
> > > > kernel patches in this series that show that this isn't transparent.
> > >
> > > I've already explained several times why this is not feasible.  It
> > > would require DtbLoader to be familiar with each individual device,
> > > and be rev'd every time a new device appears.  That is not practical
> > > at all.
> > >
> > > (And fwiw, the ACPI tables describe each panel.. with an ACPI method
> > > that is passed the the panel-id and returns the appropriate table..
> > > since DT doesn't have methods, this is the solution.)
> > >
> > > I stand by this patch, we can't keep running away from this problem
> > > and wave the magic firmware wand.
> >
> > I believe in firmware solutions more than firmware magic wands :-)
> >
>
> and with that in mind, I think I've come up with a firmware solution,
> in the form of dtb overlays :-)
>
> I've managed to get DtbLoader to find and load a panel overlay based
> on the panel-id it reads, which drops all patches in the patchset
> except the last one, which now has this delta:

This looks good to me. The only slight concern I have with it is
making the overlay filename an ABI. I don't have a better suggestion
though. How would this work for other vendors or the same panel ID
(for different panels) used on different platforms? For different
vendors at least, I guess dtbloader gets the base dtb path somehow and
the overlay's are relative to that?

> ---------
> diff --git a/arch/arm64/boot/dts/qcom/Makefile
> b/arch/arm64/boot/dts/qcom/Makefile
> index 6498a1ec893f..1a61e8da2521 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += panels
>  dtb-$(CONFIG_ARCH_QCOM)    += apq8016-sbc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)    += apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk01.dtb
> diff --git a/arch/arm64/boot/dts/qcom/panels/Makefile
> b/arch/arm64/boot/dts/qcom/panels/Makefile
> new file mode 100644
> index 000000000000..dbf55f423555
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/panels/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_QCOM) += panel-c4.dtb
> +dtb-$(CONFIG_ARCH_QCOM) += panel-c5.dtb
> diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> new file mode 100644
> index 000000000000..ebcf65419dad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Panel overlay for panel-id 0xc4
> + *
> + * Copyright (c) 2019, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +    fragment@0 {
> +        target-path = "/panel";
> +        __overlay__ {
> +            compatible = "boe,nv133fhm-n61";
> +        };
> +    };
> +};
> diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> new file mode 100644
> index 000000000000..0ad5bb6003e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Panel overlay for panel-id 0xc5
> + *
> + * Copyright (c) 2019, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +    fragment@0 {
> +        target-path = "/panel";
> +        __overlay__ {
> +            compatible = "ivo,m133nwf4-r0";
> +        };
> +    };
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index c35d8099d8eb..92c76afb721c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -22,11 +22,13 @@
>          hsuart0 = &uart6;
>      };
>
> +    /*
> +     * stub node which defines how panel is connected to bridge, which
> +     * will be updated by panel specific overlay
> +     */
>      panel {
> -        compatible = "ivo,m133nwf4-r0";
>          power-supply = <&vlcm_3v3>;
>          no-hpd;
> -
>          ports {
>              port {
>                  panel_in_edp: endpoint {
> ---------
>
> Side note, try as I might, I couldn't get the 'target = <&phandle>'
> approach to work in the overlays, so I ended up going with target-path
> instead.  From digging thru the fdt_overlay code, I *think* it is
> because I end up w/ an overlay dtb without symbols.  In the end, I
> guess target-path works just as well.

It's the base dtb that needs the symbols I think.

BTW, to answer the question on #dri-devel, if you wanted to put the
full panel into an overlay, the way to solve the problem of having
bridge specific knowledge is defining a connector node. That should
provide enough abstraction. Presumably the connector is actually the
same across panels in this situation, so that should match up with the
actual h/w. It could be possible to have a different physical
connector populated for each possible panel, but hopefully that's not
the common case.

Rob
