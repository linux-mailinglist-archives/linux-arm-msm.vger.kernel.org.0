Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58670116366
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 19:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfLHS2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 13:28:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43750 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfLHS2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 13:28:08 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C289C52B;
        Sun,  8 Dec 2019 19:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575829684;
        bh=1e4ZAX79gzPAGoD4BEt28XmHfn8PO3OcPGvsopebQbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ogLb3lQAW/fIjHuBIYOiCG1QnBlbchHuGmCh70+L6Du/hwoTtBGU0S7y6vZxXpSIm
         Eln3+tX2V9q3Z08JWX3MfnJd8BskOGsVMMmSnfXKvbOvgVzDix7WnmPbkPRT3RFo3n
         8zcrhb9RM247zevEFXaVEQ84kbWQREKJ/jEqy0E8=
Date:   Sun, 8 Dec 2019 20:27:57 +0200
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
Message-ID: <20191208182757.GE14311@pendragon.ideasonboard.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com>
 <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Sun, Dec 08, 2019 at 08:50:32AM -0800, Rob Clark wrote:
> On Sun, Dec 8, 2019 at 6:45 AM Laurent Pinchart wrote:
> > On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > For devices that have one of several possible panels installed, the
> > > panel-id property gives firmware a generic way to locate and enable the
> > > panel node corresponding to the installed panel.  Example of how to use
> > > this property:
> > >
> > >     ivo_panel {
> > >         compatible = "ivo,m133nwf4-r0";
> > >         panel-id = <0xc5>;
> > >         status = "disabled";
> > >
> > >         ports {
> > >             port {
> > >                 ivo_panel_in_edp: endpoint {
> > >                     remote-endpoint = <&sn65dsi86_out_ivo>;
> > >                 };
> > >             };
> > >         };
> > >     };
> > >
> > >     boe_panel {
> > >         compatible = "boe,nv133fhm-n61";
> > >         panel-id = <0xc4>;
> > >         status = "disabled";
> > >
> > >         ports {
> > >             port {
> > >                 boe_panel_in_edp: endpoint {
> > >                     remote-endpoint = <&sn65dsi86_out_boe>;
> > >                 };
> > >             };
> > >         };
> > >     };
> > >
> > >     sn65dsi86: bridge@2c {
> > >         compatible = "ti,sn65dsi86";
> > >
> > >         ports {
> > >             #address-cells = <1>;
> > >             #size-cells = <0>;
> > >
> > >             port@0 {
> > >                 reg = <0>;
> > >                 sn65dsi86_in_a: endpoint {
> > >                     remote-endpoint = <&dsi0_out>;
> > >                 };
> > >             };
> > >
> > >             port@1 {
> > >                 reg = <1>;
> > >
> > >                 sn65dsi86_out_boe: endpoint@c4 {
> > >                     remote-endpoint = <&boe_panel_in_edp>;
> > >                 };
> > >
> > >                 sn65dsi86_out_ivo: endpoint@c5 {
> > >                     remote-endpoint = <&ivo_panel_in_edp>;
> > >                 };
> > >             };
> > >         };
> > >     };
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > index ef8d8cdfcede..6113319b91dd 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > @@ -75,6 +75,32 @@ properties:
> > >        in the device graph bindings defined in
> > >        Documentation/devicetree/bindings/graph.txt.
> > >
> > > +  panel-id:
> > > +    description:
> > > +      To support the case where one of several different panels can be installed
> > > +      on a device, the panel-id property can be used by the firmware to identify
> > > +      which panel should have it's status changed to "ok".  This property is not
> > > +      used by the HLOS itself.
> >
> > If your firmware can modify the status property of a panel, it can also
> > add DT nodes. As discussed before, I don't think this belongs to DT.
> > Even if panel-id isn't used by the operating system, you have Linux
> > kernel patches in this series that show that this isn't transparent.
> 
> I've already explained several times why this is not feasible.  It
> would require DtbLoader to be familiar with each individual device,
> and be rev'd every time a new device appears.  That is not practical
> at all.
> 
> (And fwiw, the ACPI tables describe each panel.. with an ACPI method
> that is passed the the panel-id and returns the appropriate table..
> since DT doesn't have methods, this is the solution.)
> 
> I stand by this patch, we can't keep running away from this problem
> and wave the magic firmware wand.

I believe in firmware solutions more than firmware magic wands :-)

While device-specific knowledge in DtbLoader is indeed not practical,
you still need device-specific knowledge at the firmware level in the
sense that you pass a device-specific DT binary to DtbLoader to be
patched based on the panel ID. The device-specific information required
at the firmware level can thus be expressed as data instead of code.

I understand it wouldn't be practical for DtbLoader to receive two
independent pieces of device-specific data (the DT binary and another
custom data blob). Why couldn't however DtbLoader get a DT binary as
described in the commit message of this patch, and strip off all the
panel nodes that are not applicable to the platform, as well as the
panel-id property ? This would be completely transparent on the OS side,
and would not require patching DtbLoader for every device, as all the
information required would be present in a single DT binary, encoded
using DT syntax.

Ths would create a dichotomy in the DT bindings, in the sense that we
would have bindings applicable to the boot loader only, and bindings for
the OS, but this is already the case in what you're proposing here as
the panel-id property is documented as not used by the OS itself.

> > This needs to be handled in the firmware (or, if not possible, in a
> > kernel board driver). The above DT fragment, visible to the kernel,
> > doesn't describe the actual hardware. Furthermore, you would require all
> > bridge drivers to be patched to support this method, which shows again
> > that the issue isn't handled in the right place.
> >
> > Finally, unless I'm mistaken, this series is meant to support display
> > for an ACPI-based ARM machine. Using DT as a stop-gap measure because
> > ACPI support isn't there yet is fine out-of-tree, and fine by me in-tree
> > provided that the DT bindings are clean, but not when DT is abused like
> > this.
> >
> > I'm sorry, but this is a NACK from me. Please handle this transparently
> > in the firmware if you want DT-based boot, or with ACPI.
> >
> > > +
> > > +      For a device with multiple potential panels, a node for each potential
> > > +      should be defined with status = "disabled", and an appropriate panel-id
> > > +      property.  The video data producer should be setup with endpoints going to
> > > +      each possible panel.  The firmware will find the dt node with a panel-id
> > > +      matching the actual panel installed, and change it's status to "ok".
> > > +
> > > +      The exact method the firmware uses to determine the panel-id of the installed
> > > +      panel is outside the scope of this binding, but a few examples are
> > > +
> > > +      1) u-boot module reading a value from a u-boot env var
> > > +      2) EFI driver module reading a value from an EFI variable
> > > +      3) device specific firmware reading some device specific GPIOs or
> > > +         e-fuse
> > > +
> > > +      The panel-id values are an opaque integer.  They can be sparse.  The only
> > > +      important thing is that each possible panel in the system has a unique
> > > +      panel-id, and that the values configured in the device's DTB match the
> > > +      values that the firmware is looking for.
> > > +
> > >    ddc-i2c-bus:
> > >      $ref: /schemas/types.yaml#/definitions/phandle
> > >      description:

-- 
Regards,

Laurent Pinchart
