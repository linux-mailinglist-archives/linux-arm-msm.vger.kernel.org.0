Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1332A751E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 02:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733190AbgKEBzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 20:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKEBzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 20:55:05 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F424C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 17:55:04 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id g11so213269pll.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 17:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BIbhTyycJdg8v4aomXZ/rLjTbqfKa4wfwSkv3CiGgXs=;
        b=dUppzHrDtmOkl4va+Fx+WrFGpF1BztJf6JjZXyVmIr/spj4bPIo0htN3VmSAeRlYpD
         6kc/iHPqNy5rhMW2ijvPu2k2PMHYTTBrg8tZW4Fz5jDWUhp//QRKIS9TygUprrITg3op
         ueEbEAwtbdgKZbbjyiVC1B7S81U+ybKp5pys8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BIbhTyycJdg8v4aomXZ/rLjTbqfKa4wfwSkv3CiGgXs=;
        b=ayXufDZtzZDpaCCdrcLqg4CL469A5F+6KFY7Se8hMl1++25fzdJ2GQXOQXcYO3UqQp
         oLvwie4rleEhAuyPtgyOy3lzccsnt/lDTObSnpmRO1gIWcimzJXCu54ZD8Ke78GR4xyE
         CnyJGbEfxQ9NNwX+RmK4mzKjghAgvhgaS2VM9qZCN682fyIE6bKgZqTy9tMs0jRD6+hs
         oxsvBZMPWeYJkF3VEzE6hyK73cFdZl5Q/mdIEksQEYq1UjcgobSBCgIjX6soNFh3gWc3
         n/qjh9YOXPvHXadbpOQ0p7wvh9m41HWYYIFQxOQ/pINH/huyjqlT7rlCBh9vhN0qtxaQ
         KLGQ==
X-Gm-Message-State: AOAM531CesXW1xK1QMfxF2xiSvKvXjL6l6jwSHGi+/Lwy1YkIhD3/lzG
        Hqs06oWw6/NaaECoWJpb+SGu0A==
X-Google-Smtp-Source: ABdhPJzR3PTjViA5QvU9CtF4+v3zgRkRd/mHdtENh2KW+Fxdc/5jmJ/eheYhfIkAyalWEwBzj03F2Q==
X-Received: by 2002:a17:902:a60c:b029:d5:dc92:a1ca with SMTP id u12-20020a170902a60cb02900d5dc92a1camr237261plq.16.1604541303863;
        Wed, 04 Nov 2020 17:55:03 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id y8sm154592pfe.41.2020.11.04.17.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 17:55:03 -0800 (PST)
Date:   Wed, 4 Nov 2020 17:55:01 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the
 default supply for pp3300_hub
Message-ID: <20201105015501.GA3079843@google.com>
References: <20201103103749.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
 <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Wed, Nov 04, 2020 at 04:29:50PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 3, 2020 at 10:38 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > The trogdor design has two options for supplying the pp3300_hub power rail,
> > it can be supplied by pp3300_l7c or pp3300_a. Initially pp3300_l7c was
> > used, newer revisions (will) use pp3300_a as supply.
> >
> > Add a DT node for the pp3300_a path which includes a power switch that is
> > controlled by a GPIO. Make this path the default and keep trogdor rev1,
> > lazor rev0 and rev1 on pp3300_l7c.
> 
> It might not hurt to mention that even on early hardware that GPIO84
> was allocated to this purpose but that it was a stuff option for what
> actually provided power to the hub.  This explains why it's OK to add
> the fixed regulator (just with no clients) even on old hardware.  If
> GPIO84 had been used for something else on old hardware this would
> have been bad.

ok

> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index bf875589d364..2d64e75a2d6d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -174,6 +174,21 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> >                 vin-supply = <&pp3300_a>;
> >         };
> >
> > +       pp3300_hub: pp3300-hub {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "pp3300_hub";
> > +
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +
> > +               gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&en_pp3300_hub>;
> > +
> > +               vin-supply = <&pp3300_a>;
> 
> You're leaving things in a bit of an inconsistent state here.  The
> "pp3300_hub_7c" is always_on / boot_on.  This new one isn't.

Actually the new "pp3300_hub" it is also on at boot, the Chrome OS bootloader
asserts the GPIO.

> I know this is slightly more complicated due to the fact that downstream we
> have a way to control the hub power but didn't quite get that resolved
> upstream, but the way you have it now, on new hardware upstream will
> power off the hub but also keep "pp3300_hub_7c" powered on for no
> reason.  Seems like that should be fixed?

Our EEs told me that it would be ok in terms of power to keep "pp3300_hub_7c"
powered, since there would be no significant power consumption without load.

In any case unused RPMH regulators are switched off by the kernel ~30s after
boot, so I think we are ok:

[   31.202219] ldo7: disabling

The above is from the l7c regulator on a Lazor rev2.

> > +       };
> > +
> >         /* BOARD-SPECIFIC TOP LEVEL NODES */
> >
> >         backlight: backlight {
> > @@ -469,7 +484,7 @@ ppvar_l6c: ldo6 {
> >                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >                 };
> >
> > -               pp3300_hub:
> > +               pp3300_hub_7c:
> 
> nit: If it were me, I probably wouldn't have bothered introducing the
> "pp3300_hub_7c" alias since it's not a real thing in the schematic.  I
> would have just had the older revisions refer to "pp3300_l7c".  If you
> really love the "pp3300_hub_7c", though, I won't stand in your way.

true, it's not really needed, I'll get rid of it in the next version.

> >                 pp3300_l7c: ldo7 {
> >                         regulator-min-microvolt = <3304000>;
> >                         regulator-max-microvolt = <3304000>;
> > @@ -1151,6 +1166,19 @@ pinconf {
> >                 };
> >         };
> >
> > +       en_pp3300_hub: en-pp3300-hub {
> > +               pinmux {
> > +                       pins = "gpio84";
> > +                       function = "gpio";
> > +               };
> > +
> > +               pinconf {
> > +                       pins = "gpio84";
> > +                       drive-strength = <2>;
> > +                       bias-disable;
> > +               };
> > +       };
> > +
> >         en_pp3300_dx_edp: en-pp3300-dx-edp {
> 
> "hub" sorts after "dx", so the ordering is slightly wrong here.

ack, will change
