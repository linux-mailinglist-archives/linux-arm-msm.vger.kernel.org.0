Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAF5116317
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 17:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfLHQuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 11:50:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38425 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfLHQuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 11:50:44 -0500
Received: by mail-ed1-f66.google.com with SMTP id i6so9185626edr.5;
        Sun, 08 Dec 2019 08:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5268J1NFAVPYb03zg4yxAHEPtmKtCkfwDIdeRVIg4Rk=;
        b=sNSOcxLMkHkLq7mqJrwFiEZbyLA3n6tB4r6O04GfU7SRAQ67CX2xpUl1G2yf5EX9ZU
         oeRcShEqz1KoA63fdwN4rcbzXSinu+BdHowq3J9OlehXn3b90u38H+D6GokpFXq2bL71
         KeiMUpDVCkqD2gblBHPaqsglrs+SKwTFPCXhp1oexfBVgTP9Wods/p90efdYWa01MyVD
         TcipV7siRtsT0am5ogz9Q0Oz2D7j+R+Rw1lPpLAsTluaWzvlyodBvNAr9r7AmuEos2PM
         p0FRAd1I5IY31UROyfayTdDKBo/JgRhDKICdtu7eQ6LqUndU7fCGKsvV0TtdyPOCy1UM
         bLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5268J1NFAVPYb03zg4yxAHEPtmKtCkfwDIdeRVIg4Rk=;
        b=NnWm9XB2UAy8OFqvbesy+HcIceQbj5HVMEj2GHuQSQtpKfGA7ffZGM34fhUlyhCwtU
         IsOsAomcY1mPkXqNiU9D223hJWrAqbFWfRoAXKvkDPDEnnTn9kYFDJX6X6ND9xOaX6SS
         v8IGoBCUN/1AUxVbso44QG/0GeJXVzpD3/K3ib7IQCWdrzy4R6uF41lpFu1qbH1xkvmn
         RQwsUiPayXX1vZcde7sSuKpJPrZFfn7hNLb5puv5Ucd7YcFvk20d5ABoaamgQ67XzATm
         l+oPvCrrPSaBl/9cwBC7Q/6Z95CYkNPrJeV3hiIaUf73V1x0FfjSTtNgnW+hWrRD+7Ik
         5x4w==
X-Gm-Message-State: APjAAAV0cRgKpsLwNE7qCaSJdRN5Kc+kCzEJlTTgyDVqi3JSWWWk27wv
        HILGGEBBGK1jAxCIHk6V0Sy1eAR1v8vYcFbHxXM=
X-Google-Smtp-Source: APXvYqwQwUx9vSTIuL3ZAVzKfRsj7+JBZH6Yc2AYMnTq028wZD+Tz4/jkwyp6YC6I3B3jBaQDnMB8PvHrZoGdkN4/nA=
X-Received: by 2002:a17:906:958e:: with SMTP id r14mr26095468ejx.228.1575823841573;
 Sun, 08 Dec 2019 08:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20191207203553.286017-1-robdclark@gmail.com> <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com>
In-Reply-To: <20191208144533.GA14311@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 8 Dec 2019 08:50:32 -0800
Message-ID: <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 8, 2019 at 6:45 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For devices that have one of several possible panels installed, the
> > panel-id property gives firmware a generic way to locate and enable the
> > panel node corresponding to the installed panel.  Example of how to use
> > this property:
> >
> >     ivo_panel {
> >         compatible = "ivo,m133nwf4-r0";
> >         panel-id = <0xc5>;
> >         status = "disabled";
> >
> >         ports {
> >             port {
> >                 ivo_panel_in_edp: endpoint {
> >                     remote-endpoint = <&sn65dsi86_out_ivo>;
> >                 };
> >             };
> >         };
> >     };
> >
> >     boe_panel {
> >         compatible = "boe,nv133fhm-n61";
> >         panel-id = <0xc4>;
> >         status = "disabled";
> >
> >         ports {
> >             port {
> >                 boe_panel_in_edp: endpoint {
> >                     remote-endpoint = <&sn65dsi86_out_boe>;
> >                 };
> >             };
> >         };
> >     };
> >
> >     sn65dsi86: bridge@2c {
> >         compatible = "ti,sn65dsi86";
> >
> >         ports {
> >             #address-cells = <1>;
> >             #size-cells = <0>;
> >
> >             port@0 {
> >                 reg = <0>;
> >                 sn65dsi86_in_a: endpoint {
> >                     remote-endpoint = <&dsi0_out>;
> >                 };
> >             };
> >
> >             port@1 {
> >                 reg = <1>;
> >
> >                 sn65dsi86_out_boe: endpoint@c4 {
> >                     remote-endpoint = <&boe_panel_in_edp>;
> >                 };
> >
> >                 sn65dsi86_out_ivo: endpoint@c5 {
> >                     remote-endpoint = <&ivo_panel_in_edp>;
> >                 };
> >             };
> >         };
> >     };
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > index ef8d8cdfcede..6113319b91dd 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > @@ -75,6 +75,32 @@ properties:
> >        in the device graph bindings defined in
> >        Documentation/devicetree/bindings/graph.txt.
> >
> > +  panel-id:
> > +    description:
> > +      To support the case where one of several different panels can be installed
> > +      on a device, the panel-id property can be used by the firmware to identify
> > +      which panel should have it's status changed to "ok".  This property is not
> > +      used by the HLOS itself.
>
> If your firmware can modify the status property of a panel, it can also
> add DT nodes. As discussed before, I don't think this belongs to DT.
> Even if panel-id isn't used by the operating system, you have Linux
> kernel patches in this series that show that this isn't transparent.

I've already explained several times why this is not feasible.  It
would require DtbLoader to be familiar with each individual device,
and be rev'd every time a new device appears.  That is not practical
at all.

(And fwiw, the ACPI tables describe each panel.. with an ACPI method
that is passed the the panel-id and returns the appropriate table..
since DT doesn't have methods, this is the solution.)

I stand by this patch, we can't keep running away from this problem
and wave the magic firmware wand.

BR,
-R


> This needs to be handled in the firmware (or, if not possible, in a
> kernel board driver). The above DT fragment, visible to the kernel,
> doesn't describe the actual hardware. Furthermore, you would require all
> bridge drivers to be patched to support this method, which shows again
> that the issue isn't handled in the right place.
>
> Finally, unless I'm mistaken, this series is meant to support display
> for an ACPI-based ARM machine. Using DT as a stop-gap measure because
> ACPI support isn't there yet is fine out-of-tree, and fine by me in-tree
> provided that the DT bindings are clean, but not when DT is abused like
> this.
>
> I'm sorry, but this is a NACK from me. Please handle this transparently
> in the firmware if you want DT-based boot, or with ACPI.
>
> > +
> > +      For a device with multiple potential panels, a node for each potential
> > +      should be defined with status = "disabled", and an appropriate panel-id
> > +      property.  The video data producer should be setup with endpoints going to
> > +      each possible panel.  The firmware will find the dt node with a panel-id
> > +      matching the actual panel installed, and change it's status to "ok".
> > +
> > +      The exact method the firmware uses to determine the panel-id of the installed
> > +      panel is outside the scope of this binding, but a few examples are
> > +
> > +      1) u-boot module reading a value from a u-boot env var
> > +      2) EFI driver module reading a value from an EFI variable
> > +      3) device specific firmware reading some device specific GPIOs or
> > +         e-fuse
> > +
> > +      The panel-id values are an opaque integer.  They can be sparse.  The only
> > +      important thing is that each possible panel in the system has a unique
> > +      panel-id, and that the values configured in the device's DTB match the
> > +      values that the firmware is looking for.
> > +
> >    ddc-i2c-bus:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:
>
> --
> Regards,
>
> Laurent Pinchart
