Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF879427444
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 01:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243836AbhJHXla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 19:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhJHXl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 19:41:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903B6C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 16:39:33 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r1so24379122ybo.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 16:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nmFzS3AbTLHxdnncfbOvzzEVI7phr9NSLef8AoPLTjM=;
        b=mqx3+t8D+JNOVWKdQ1Pga0ueYs2XLMy4d5Gy1AhlLlPXMz+5mtjl1gOKVWvmZ0RySb
         hczOVymBc69zb54sud6Zaz2/2qQZcts2POEpeEYbjUk4DwgbeHmRPZQfnNWyYFeoX/yU
         /KBWQPiqB2QEiJdiXI4Jb9o+u2fvkGLqWYeik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nmFzS3AbTLHxdnncfbOvzzEVI7phr9NSLef8AoPLTjM=;
        b=wNKjmjwcaP/y8CgZUK1MrsR4S+J7gPxaIFD2rMx8wHcoiD1Ghv05QN9A+UDhPiXDn7
         H4Wny8HREOQj3Md5q8a3w484pCnMr4n3SRUA8qRso3a11n4bB9LPA+i3KId50Bh4bhEc
         lzFuwTylA/LYyTwut0qhaV48lAAfTnfUfOcATHeHcaf5fJ+loZZDxteJG/eX4KizI4rT
         /7coFpGVd3468BqDDRGgjj7OA7IRj/IJMDbl/V0KM/pOILdq6GGUB7jBi1mPDOmwQfZp
         /BddSIDezrIH7k4lCeHsgpae9XPD81fhOoq1zzMnfm7u+9kr3gOMqjoKsIpr4V227jz8
         VLtw==
X-Gm-Message-State: AOAM530rRqcWfxwh9Gk4tKnyEYlu9sAKqB9ZMLHHaAHxm7FsXf8BgZfC
        2ZvQejB18X+e6JI2PNxii5PKGoFWeHsMFCtQWnov/g==
X-Google-Smtp-Source: ABdhPJwwucls5tMBedD7hFAv3uw/mJALkRLyU3e5okdsFA0sAW8kY+NrN9gaf2eWJXVfsdW9DZ1IsnmkSLu3PNPJx6c=
X-Received: by 2002:a25:cf07:: with SMTP id f7mr6786613ybg.100.1633736372830;
 Fri, 08 Oct 2021 16:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.3.I630340a51130f4582dbe14e42f673b74e0531a2b@changeid>
 <CAE-0n53EBvKv-RdMwiiOsUkb+LOKAKwrpP7cDavx4meA2vbvcA@mail.gmail.com>
 <CAD=FV=XoOhSNP2EXurkA=G9iG2BnH9VzkvSEiNJ8W71s8N9bgg@mail.gmail.com>
 <CA+cxXhkM9Gzc+0EVapZVu=pJZ3WZawgucG5J2=bokYEJXFNKCQ@mail.gmail.com>
 <CA+cxXh=1D08O6EcC4Xq6+cCEthCtXfASOfGW38z=FhkmW3ce9g@mail.gmail.com> <CAD=FV=VfuxrrFbzZwCQr-6KYb2OXEPmrAH5y9UPr4V6Pud2h7g@mail.gmail.com>
In-Reply-To: <CAD=FV=VfuxrrFbzZwCQr-6KYb2OXEPmrAH5y9UPr4V6Pud2h7g@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Fri, 8 Oct 2021 16:39:21 -0700
Message-ID: <CA+cxXh=wfuZjhUWA2VmEs_5-GpK1Db_jtin2EeaWvBsSMpEzew@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 8, 2021 at 4:13 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Oct 8, 2021 at 11:46 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Hi
> >
> > On Thu, Oct 7, 2021 at 11:15 AM Philip Chen <philipchen@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Sep 30, 2021 at 9:22 AM Doug Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Sep 29, 2021 at 9:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > >
> > > > > > +       pp3300_brij_ps8640: pp3300-brij-ps8640 {
> > > > > > +               compatible = "regulator-fixed";
> > > > > > +               status = "okay";
> > > > > > +               regulator-name = "pp3300_brij_ps8640";
> > > > > > +
> > > > > > +               regulator-min-microvolt = <3300000>;
> > > > > > +               regulator-max-microvolt = <3300000>;
> > > > > > +
> > > > > > +               gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
> > > > >
> > > > > Doesn't this need
> > > > >
> > > > >                 enable-active-high;
> > > >
> > > > Looks like it. Without that it looks like it assumes active low.
> > > Thanks for catching this.
> > > I'll fix it in v3.
> > >
> > > >
> > > >
> > > > > > +
> > > > > > +               pinctrl-names = "default";
> > > > > > +               pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
> > > > > > +
> > > > > > +               vin-supply = <&pp3300_a>;
> > > > > > +       };
> > > > > > +};
> > > > > > +
> > > > > > +&dsi0_out {
> > > > > > +       remote-endpoint = <&ps8640_in>;
> > > > >
> > > > > Should this also have data-lanes to be "complete"?
> > > >
> > > > That's still back in the main trogdor.dtsi, isn't it?
> > > Yes, I think so.
> > > Plus, ti-sn65 dts doesn't define data-lanes for input either.
> > Sorry, I was wrong.
> > ti-sn65 dts actually defines data-lanes for input.
> > However, since ps8640 driver doesn't parse input data-lanes for now,
> > it's not useful to add data-lanes here anyway.
>
> Ah, right. This one _isn't_ in the dtsi. Looking closer, I agree with
> you that it's not useful. Specifically it should be noted that, unlike
> ti-sn65dsi86, this bridge part looks to only support 2-lanes of DP
> traffic. If both of these two lanes are routed to the panel then
> there's really nothing to specify--that should be the default
> assumption of the driver if/when it ever adds support for data-lanes.

Actually, dsi0_out is the input to the bridge.
So the data lanes here are "MIPI DSI lanes", which is hardcoded to 4,
for both sn65 driver and ps8640 driver, right?

What's different in sn65 driver and ps8640 driver is the output data
lanes for DP:
* sn65 supports 1, 2, or 4 DP lanes. The driver parses DP "data lanes"
from DT and then configures the support accordingly.
* ps8640 supports 1 or 2 DP lanes. As of now, the driver doesn't parse
DP "data lanes" from DT.

As a result:
* Adding input "data lanes" for either sn65 or ps8640 DT is not useful.
* Adding output "data lanes" for sn65 DT is useful, while adding
output "data lanes" for ps8640 DT is not useful.

>
> -Doug
