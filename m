Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236EA10DE9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2019 19:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfK3Sj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Nov 2019 13:39:27 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33015 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfK3Sj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Nov 2019 13:39:27 -0500
Received: by mail-ed1-f66.google.com with SMTP id l63so1097088ede.0;
        Sat, 30 Nov 2019 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CyHHFJp2Gs1Mt5oXtJiggRMkVlwmo7yWvGP5ot7H7mk=;
        b=qAiM54mAvXoOnICoLu1O9KRN6bvk3hIoAUcjwCkrYS74oIEsLTY/IDkCxc2XRIveOI
         3WEST/O1EJ9Mr26J3psniVYsnr11Q/noXuZLDX3Bg33xfLHoglx1rUU8VAVVj64p6lI/
         Q/GkASxUBSZ8mUIkYu7hCkCYWCeUVAL9JU6Vn0Q7VM0f0iNGmodA0OTuiEkdy0/0qbQN
         3kEChGzTLrh1eSOX7MWntoPSHOJ/91yigxQb5/zU4Udtlj5lQD4necKd/JtMKqsdAVOQ
         GVwxlla1ZZHHKtESY6dQelGAmhJ4Eg72+RtNS+UBDRC/2GvtN6TWunZpxaGCff4Gy/4n
         R/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CyHHFJp2Gs1Mt5oXtJiggRMkVlwmo7yWvGP5ot7H7mk=;
        b=AJg/EjnyoBEZ658cIupBsa0JzReQoGEXpz479zhyKpB8/9FvXcahPV+7xUCNzSxjNt
         LzFyGKrHm269uzoqrgW0kmrCNyDddrpLvuzn8FZcS11dqWoPURFm2ZdJvLGIquT5GATe
         nPzef3hlv42xdUSGkmFIzoJxl/9wPFrOGEhw0Dlp1b21gSrkyzONhADOJ722hxDiDTKZ
         Jb9MOOb0LGbUmG1OMDLPnvAxiIwGEsnxdWrU/M0cEHIlbfRbBgac3HpRrI65cHzJQ+nH
         9dGAaVR6AXWXehgwWrL/Vf5yAmX/34UEc5u4K94mmfzQyQaCgbQt5iN98HK1mSxg8TSM
         61kQ==
X-Gm-Message-State: APjAAAU6dA7PErdbm55Jzl52wbRUFoNC2FWJ1Hw+HQBnJPU07eDewVaP
        x5adwIlplu8Xkn7rqREO5S1fq4kO6F/vRccTHp0=
X-Google-Smtp-Source: APXvYqxCgVz6rveUKZcMiwtWM+KSlK0YGQLGt4+b4KYphA7odSC11m/btOkMu7FEmOtnfMviMIauQlUY6Tt5fWnw168=
X-Received: by 2002:a17:906:34d7:: with SMTP id h23mr10012882ejb.90.1575139162974;
 Sat, 30 Nov 2019 10:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-2-robdclark@gmail.com>
 <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com> <CAF6AEGsAgUsKJjLQkRDdjZtSvX267Cz_m_P7_m6VeJ2u=Ozc1g@mail.gmail.com>
In-Reply-To: <CAF6AEGsAgUsKJjLQkRDdjZtSvX267Cz_m_P7_m6VeJ2u=Ozc1g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 30 Nov 2019 10:39:10 -0800
Message-ID: <CAF6AEGtJg3vGSqrpR4bVN8SZFCiaSK8GpAr0Om5BQuFQ1OvLjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
To:     Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 30, 2019 at 10:37 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 1, 2019 at 7:03 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The panel-id property in chosen can be used to communicate which panel,
> > > of multiple possibilities, is installed.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> >
> > I need to update this file to say it's moved to the schema repository...
> >
> > But I don't think that will matter...
> >
> > > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > > index 45e79172a646..d502e6489b8b 100644
> > > --- a/Documentation/devicetree/bindings/chosen.txt
> > > +++ b/Documentation/devicetree/bindings/chosen.txt
> > > @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
> > >  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
> > >  should only use the "stdout-path" property.
> > >
> > > +panel-id
> > > +--------
> > > +
> > > +For devices that have multiple possible display panels (multi-sourcing the
> > > +display panels is common on laptops, phones, tablets), this allows the
> > > +bootloader to communicate which panel is installed, e.g.
> >
> > How does the bootloader figure out which panel? Why can't the kernel
> > do the same thing?
> >
> > > +
> > > +/ {
> > > +       chosen {
> > > +               panel-id = <0xc4>;
> > > +       };
> > > +
> > > +       ivo_panel {
> > > +               compatible = "ivo,m133nwf4-r0";
> > > +               power-supply = <&vlcm_3v3>;
> > > +               no-hpd;
> > > +
> > > +               ports {
> > > +                       port {
> > > +                               ivo_panel_in_edp: endpoint {
> > > +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +
> > > +       boe_panel {
> > > +               compatible = "boe,nv133fhm-n61";
> >
> > Both panels are going to probe. So the bootloader needs to disable the
> > not populated panel setting 'status' (or delete the node). If you do
> > that, do you even need 'panel-id'?
> >
>
> So, I'm finally having some time to revisit this proposal..  I have a
> few updates:
>
> + Updated DtbLoader.efi to read UEFIDisplayInfo and get the panel-id
>   so I can drop the efi/libstub patch[1]
> + I can drop drm_of_find_panel_id() and fold the logic to look at
>   /chosen/panel-id into drm_of_find_panel_or_bridge() so that each
>   driver or bridge doesn't need an update
>
> This doesn't realy solve the issue that both panels will probe.  On
> the other hand, I really don't want to make the DtbLoader know enough
> about the dt structure of each laptop to patch dt, since that is not
> going to be scalable at all.  (Likewise, there is some interest for
> devices that use u-boot to take the panel-id from a uboot env var and
> patch dt, but again knowing enough to intelligently patch the dt is
> not going to be feasible.)
>
> But, an alternate solution could be, instead of adding a 'panel-id'
> node in chosen, I could add it as an optional property in the panel
> node.  So taking my original example of the yoga c630 laptops, with
> the two possible panel id's 0xc4 and 0xc5:
>
>     ivo_panel {
>         compatible = "ivo,m133nwf4-r0";
>         panel-id = <0xc4>;

correction, the ivo panel should have panel-id = <0xc5>

>         status = "disabled";
>
>         ports {
>             port {
>                 ivo_panel_in_edp: endpoint {
>                     remote-endpoint = <&sn65dsi86_out_ivo>;
>                 };
>             };
>         };
>     };
>
>     boe_panel {
>         compatible = "boe,nv133fhm-n61";
>         panel-id = <0xc4>;
>         status = "disabled";
>
>         ports {
>             port {
>                 boe_panel_in_edp: endpoint {
>                     remote-endpoint = <&sn65dsi86_out_boe>;
>                 };
>             };
>         };
>     };
>
>     sn65dsi86: bridge@2c {
>         compatible = "ti,sn65dsi86";
>
>         ports {
>             #address-cells = <1>;
>             #size-cells = <0>;
>
>             port@0 {
>                 reg = <0>;
>                 sn65dsi86_in_a: endpoint {
>                     remote-endpoint = <&dsi0_out>;
>                 };
>             };
>
>             port@1 {
>                 reg = <1>;
>
>                 sn65dsi86_out_boe: endpoint@c4 {
>                     remote-endpoint = <&boe_panel_in_edp>;
>                 };
>
>                 sn65dsi86_out_ivo: endpoint@c5 {
>                     remote-endpoint = <&ivo_panel_in_edp>;
>                 };
>             };
>         };
>     };
>
> With this, the "firmware" (DtbLoader, u-boot, etc) could crawl the
> entire dt looking for a node with a panel-id that matches the one it's
> looking for, and change that node's status to enabled.
>
> The advantage would be that the other panel(s) that is not installed
> will not be probed.  The downsides are that (1) the drm drivers would
> have to loop over all the endpoints to find the active panel (some
> drivers do this already, most do not), and (2) the property name
> "panel-id" (or whatever we pick) will now be somehow special, you
> couldn't re-use that name elsewhere without potential to confuse the
> firmware.  And it is more complexity in the firmware (although at
> least it can be done generically) compared to just adding a property
> in chosen.
>
> Not sure if this is better, I thought my initial proposal was more
> elegant.  I am open to other suggestions, anything other than teaching
> DtbLoader/u-boot about the specific dt of each different device that
> would use this.
>
> BR,
> -R
>
> [1] https://github.com/robclark/edk2/commits/dtbloader
