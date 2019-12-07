Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A9A115ECA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 22:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfLGVez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 16:34:55 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35509 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfLGVez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 16:34:55 -0500
Received: by mail-ed1-f68.google.com with SMTP id f8so9095695edv.2;
        Sat, 07 Dec 2019 13:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSJqQNsnucOVOTO/ZHx/Qqr938fRmW2aU3y0RsfZOao=;
        b=DwRkQVVm/Bt1ZkSy5b9uP5/eScH3XKMZqBeeVZEC7QJDmbC/Qa6jmJyBK30LRz6oZH
         k6pHqnSqEtm+/PjanKp1PN35YlARPSB5KbuaWcpKCtw0WJkhxEBA9szSI8b1FCIt3imG
         eSqQn3xWJsYpeW3DBYzHkvJ6Ws1UmAeK2zh5NYQfBKkRGxKjAmEzrl8nxC83KTwdg/Bk
         GIkKzeNNwmW4BaPJT8K6i2ftByyisRjqDdauzxhYwk9/AhllrZrGXPwHjQHqq2vZ41tN
         G44OMwtIwDOnzXFFdMVEGO693Z/YOtvjWow3mPbm8Ycz+IHoG1FV3WNknAlWS9GBVEXX
         cWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSJqQNsnucOVOTO/ZHx/Qqr938fRmW2aU3y0RsfZOao=;
        b=bQLNt54nBMjO1KLFY4X6rt8bLLBc4yGWYc7XfL4RZJ9ls3VtfB8GVnXD7UN9JjY53U
         t+rVywGnGx1b/IjPNShXTsvCRkPFf1FtyIECw/bMESgb5mZReB77ZnfSjTTAEqCjM43q
         gHdwCtuMgBnvygtknmOmXYbVXrqNHFFaJ9zt7lDd+8smCHiNmLXyny5s7ofy62Zn+ji/
         lO8znbibTSfBQEHJFhyQi25+olGVj4DXBUVnn3F8ufA7FKHHZRFyM67zUr/eP/hA1fnF
         wyQzQZwSmp5ZZuT37O4bUlydlGSYBKpo8fYPHSiyTjJxKSbqn8wIbpUtcSvK48kCLuTG
         6YHQ==
X-Gm-Message-State: APjAAAWUDVv3dtvKsJwbcOU9hGM2IpJJWIu8IVXfjMTbnCQ5e57IeyXx
        O4TUZIWbBxMsw6IhiKjJiops67CrJsM3z9AvBnc=
X-Google-Smtp-Source: APXvYqyllooDrvQo8dA4ReYMfwpP6UurOZ0BGv4XaB5kDH9rhmEuFzbdAnRxwoqGAgOP/vqRCbNw4Hqk0XOc6d3/gLI=
X-Received: by 2002:a05:6402:2d7:: with SMTP id b23mr23785940edx.272.1575754492507;
 Sat, 07 Dec 2019 13:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20191207203553.286017-1-robdclark@gmail.com> <20191207203553.286017-2-robdclark@gmail.com>
 <20191207211345.GA32369@ravnborg.org>
In-Reply-To: <20191207211345.GA32369@ravnborg.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Dec 2019 13:34:42 -0800
Message-ID: <CAF6AEGtOPYkjG1_9C2CmE_-fSfnAzmXLCvZXiA=iGb2YASKjig@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 7, 2019 at 1:13 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For devices that have one of several possible panels installed, the
> > panel-id property gives firmware a generic way to locate and enable the
> > panel node corresponding to the installed panel.
>
> For display timings there is something similar.
> Here the property is named native-mode and is a phandle to the
> preferred timing.
> And it is documented that if no native-mode is specified the first
> timing in the tree is chosen.
> So a different concept than this.
>
> I could not from your otherwise well-documented changelog see why you
> wanted to go for an opauge integer and status rather than a phandle to
> the active display.

I think a lot of cases, panel-id could simply be an integer 0..N, but
for the snapdragon windows devices, they seem to assign each panel a
unique id.  For example, the two possible panels that we've seen on
the c630 are 0xc4 and 0xc5.  I think all the values we've seen so far
on other aarch64 laptops fit in an u8, but the actual value is defined
as u32.  The meaning behind those values is not really terribly
important (and might well be arbitrary.. I'm not sure why they didn't
go with a GUID).  All that matters is they match what DtbLoader pulls
out of the u32 PanelId field in the UEFIDisplayInfo variable.  The
intention behind describing the value as "opaque" was simply "don't
assume it has to be 0..N".

As far as using phandles, I had toyed around with the idea.. the ideal
thing would be if I could compile the dtb with an unresolved phandle
link, and then fixup that link in DtbLoader based on panel-id.  But
this seems not to be possible, afaict I'd have to create a dummy node
for the phandle to point to.  Maybe I'm missing something, if there
were a way to do this then I could make this work without any drm
patches.  Ofc I'm open to suggestions.

>
> The panel-id, if I get it right, is optional and the important part is
> that the first panel with staus = "okay" is selected.

yup, this was to ensure that the other panels don't probe, which was a
problem pointed out by robher with my previous approach

> This would cover my usecase fine.
> I have a target with four different displays and the bootloader
> knows what display is used (based on gpio etc).
> The bootloader (barebox in my case) uses a simple variant of the DT,
> but reads in the DT used by the kernel and can modify the DT before
> it is passed to the kernel.

I'd be pretty happy if this (or whatever the eventual solution is)
covers all the possible multi-sourced panel cases.. this comes up in
nearly all consumer devices (laptops, phones, etc) and we pretty badly
need an upstream solution for this.

BR,
-R


>
>         Sam
>
>
>
>
> > Example of how to use this property:
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
> > --
> > 2.23.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
