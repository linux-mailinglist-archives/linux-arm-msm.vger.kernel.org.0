Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232DE10DE97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2019 19:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfK3SiI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Nov 2019 13:38:08 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43757 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfK3SiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Nov 2019 13:38:08 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so13604672edb.10;
        Sat, 30 Nov 2019 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+RzBf8pyfU8Uny6H+3RqVINrtRhR3Xcel4/XXwTyvKg=;
        b=X9NEjlyiZmhBelSb/ykZvMCcyCpdjWy4kbwJAFwk1mOs2o5b50LMBfVikEw09KAnsV
         y3PVfSEH9zoqdVjQk5fBn/EJPNrXRpAYn+Yi39tHf+eMMjI83xQq9NlBnrvT1zc2htaw
         y9mMAT1qMtFMV1L/s1ArQ3fr0mpiClaq1ZXgzlpWFSgakPDegZO+IPO3QKBeveMXAmMz
         ZfCBbMD5+kZ9phTLaK5bMkrsi/xBgeTF4dAVUz2FrjLOzqj3LMowrrTR5hSO9S1CQ+2w
         xxAyfJQ9EX+91VSU/MxidWnEwkcTU8x1ENLJKBq1L9kswfct5JYkHSgFMpxocmIi4ChK
         0OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+RzBf8pyfU8Uny6H+3RqVINrtRhR3Xcel4/XXwTyvKg=;
        b=MIAOnr5Vs7Xts/Fhss/4Y0QhRBPnDgqPzT29WZiM3D9X5sSzn2nU6PmIoEpHJrtEm/
         H8OryFbuH/lPpVHep1V2Xg9O3qBeI1Ek9LtwE2YwJskeJYlx3wX0zeleH1FK1PxMarzy
         u/gO7IiHZOo/HY6LcV3QsqMSa3d6RCa65ibbS35quI+1V8lERrMHP06qcp34T8xK7tGY
         lz68YDsoTmkj/wFxuQwpPFf06Q/hswdjIH7t1S8Fc18eW7TQQcZhC9sCp4TylBbS7bZO
         3jLkPAD5WypFy0OZf4nAPnIhYU8BjO6lPEWrbysUEzO2h3Gptd9W58Vfobcsjz2udcfO
         8hIg==
X-Gm-Message-State: APjAAAWMBl8wZptRyB8UDWFmVjKcI0qN//naN4STd38GZft6hQImDwbr
        +8Btxpc0Dq54ihHrVxXrQ4pQ0HAvHD5e6uZUyo8=
X-Google-Smtp-Source: APXvYqz70UA24fvxB0wHGdwYaTBFNDo6CMy4Oq+5QXCbIwPFql2H/V6HV8+uwA8MlG1SHEi3WC1mtJo5AlAwE8BtT0c=
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr52950584edf.163.1575139085316;
 Sat, 30 Nov 2019 10:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-2-robdclark@gmail.com>
 <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
In-Reply-To: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 30 Nov 2019 10:37:52 -0800
Message-ID: <CAF6AEGsAgUsKJjLQkRDdjZtSvX267Cz_m_P7_m6VeJ2u=Ozc1g@mail.gmail.com>
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

On Mon, Jul 1, 2019 at 7:03 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The panel-id property in chosen can be used to communicate which panel,
> > of multiple possibilities, is installed.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
>
> I need to update this file to say it's moved to the schema repository...
>
> But I don't think that will matter...
>
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index 45e79172a646..d502e6489b8b 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
> >  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
> >  should only use the "stdout-path" property.
> >
> > +panel-id
> > +--------
> > +
> > +For devices that have multiple possible display panels (multi-sourcing the
> > +display panels is common on laptops, phones, tablets), this allows the
> > +bootloader to communicate which panel is installed, e.g.
>
> How does the bootloader figure out which panel? Why can't the kernel
> do the same thing?
>
> > +
> > +/ {
> > +       chosen {
> > +               panel-id = <0xc4>;
> > +       };
> > +
> > +       ivo_panel {
> > +               compatible = "ivo,m133nwf4-r0";
> > +               power-supply = <&vlcm_3v3>;
> > +               no-hpd;
> > +
> > +               ports {
> > +                       port {
> > +                               ivo_panel_in_edp: endpoint {
> > +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       boe_panel {
> > +               compatible = "boe,nv133fhm-n61";
>
> Both panels are going to probe. So the bootloader needs to disable the
> not populated panel setting 'status' (or delete the node). If you do
> that, do you even need 'panel-id'?
>

So, I'm finally having some time to revisit this proposal..  I have a
few updates:

+ Updated DtbLoader.efi to read UEFIDisplayInfo and get the panel-id
  so I can drop the efi/libstub patch[1]
+ I can drop drm_of_find_panel_id() and fold the logic to look at
  /chosen/panel-id into drm_of_find_panel_or_bridge() so that each
  driver or bridge doesn't need an update

This doesn't realy solve the issue that both panels will probe.  On
the other hand, I really don't want to make the DtbLoader know enough
about the dt structure of each laptop to patch dt, since that is not
going to be scalable at all.  (Likewise, there is some interest for
devices that use u-boot to take the panel-id from a uboot env var and
patch dt, but again knowing enough to intelligently patch the dt is
not going to be feasible.)

But, an alternate solution could be, instead of adding a 'panel-id'
node in chosen, I could add it as an optional property in the panel
node.  So taking my original example of the yoga c630 laptops, with
the two possible panel id's 0xc4 and 0xc5:

    ivo_panel {
        compatible = "ivo,m133nwf4-r0";
        panel-id = <0xc4>;
        status = "disabled";

        ports {
            port {
                ivo_panel_in_edp: endpoint {
                    remote-endpoint = <&sn65dsi86_out_ivo>;
                };
            };
        };
    };

    boe_panel {
        compatible = "boe,nv133fhm-n61";
        panel-id = <0xc4>;
        status = "disabled";

        ports {
            port {
                boe_panel_in_edp: endpoint {
                    remote-endpoint = <&sn65dsi86_out_boe>;
                };
            };
        };
    };

    sn65dsi86: bridge@2c {
        compatible = "ti,sn65dsi86";

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;
                sn65dsi86_in_a: endpoint {
                    remote-endpoint = <&dsi0_out>;
                };
            };

            port@1 {
                reg = <1>;

                sn65dsi86_out_boe: endpoint@c4 {
                    remote-endpoint = <&boe_panel_in_edp>;
                };

                sn65dsi86_out_ivo: endpoint@c5 {
                    remote-endpoint = <&ivo_panel_in_edp>;
                };
            };
        };
    };

With this, the "firmware" (DtbLoader, u-boot, etc) could crawl the
entire dt looking for a node with a panel-id that matches the one it's
looking for, and change that node's status to enabled.

The advantage would be that the other panel(s) that is not installed
will not be probed.  The downsides are that (1) the drm drivers would
have to loop over all the endpoints to find the active panel (some
drivers do this already, most do not), and (2) the property name
"panel-id" (or whatever we pick) will now be somehow special, you
couldn't re-use that name elsewhere without potential to confuse the
firmware.  And it is more complexity in the firmware (although at
least it can be done generically) compared to just adding a property
in chosen.

Not sure if this is better, I thought my initial proposal was more
elegant.  I am open to other suggestions, anything other than teaching
DtbLoader/u-boot about the specific dt of each different device that
would use this.

BR,
-R

[1] https://github.com/robclark/edk2/commits/dtbloader
