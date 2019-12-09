Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C47D116BB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 12:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfLILF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 06:05:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56600 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLILF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 06:05:56 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D02999A;
        Mon,  9 Dec 2019 12:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575889552;
        bh=N4w4AXaS16p/lwcdBi2cR5SP3Xey0/2llcHIAVZmHOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jMjYClSKlGqv65k+anEjhCc845ZQnnelSeRjHrx1ZoPJ/516MitNKZzs8KN3k9IDT
         8PXnJUk5Tp/klOC19o/ECHdPvwxzEWZagboLI2SxFWEZkrIJMP9fDbxhuWl3+L7uLp
         drm9DmTcuKdECLzM+ZSkGi5H+lUkEIIqgxKfVnUY=
Date:   Mon, 9 Dec 2019 13:05:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
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
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
Message-ID: <20191209110545.GB4853@pendragon.ideasonboard.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com>
 <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
 <20191208182757.GE14311@pendragon.ideasonboard.com>
 <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Sun, Dec 08, 2019 at 01:23:59PM -0800, Rob Clark wrote:
> On Sun, Dec 8, 2019 at 10:28 AM Laurent Pinchart wrote:
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
> 
> and with that in mind, I think I've come up with a firmware solution,
> in the form of dtb overlays :-)
> 
> I've managed to get DtbLoader to find and load a panel overlay based
> on the panel-id it reads, which drops all patches in the patchset
> except the last one, which now has this delta:

Thank you for looking into this, I really like the outcome :-)

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

-- 
Regards,

Laurent Pinchart
