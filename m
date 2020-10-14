Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E719528E1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 15:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgJNNve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 09:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgJNNve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 09:51:34 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C3BC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 06:51:34 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id d19so2095886vso.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mzp0uOZxXIMEmqgMQM3rOPvqT0bfptiQ8aXw/0OajwY=;
        b=FGMxXMcQ0fjPjm1NdHS2BrYWsaDp4MrMRsFJoVrZbqnME3EkBT2AMgXYXzHOfhwBKt
         +9vHfHlxbgATM2OCJ/GfHuM2abN5A0cQN9Jl8j9/Kuq7YW1nqmfhh2CZpbu02TbKF+Yt
         zxUXw7yuVqMUnC30hkzguLE0NxbAvMup2Wq+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mzp0uOZxXIMEmqgMQM3rOPvqT0bfptiQ8aXw/0OajwY=;
        b=Op3jzZrRzCtwNIrErY8orMdYw/1ErHIzHe0urnPTrjx+FSkbapa58ASbfpAqySjFct
         2UjHUaP7ypAztrC3shT6lFekdv4/9rknsyiXM6G4ONDSSCBrHzvZA6pdbzBrTQJOIk/Q
         ehp/hYgO0AvdT5JTY/QbLHiQk724rslI+KSunVtifsDBv2rsGfYJBQGRHz3BZJFjS0uE
         QisXD0mKF2z9v0pCWWzKep6YvtAD9998R9YiCQJ5RpLun7HwjSBz2DceDXsL4j+jtF2B
         s0TB/TmiQhTvOQ18o43bcvkVYuaarSlvS/giDgDORwIDDz2w0oj9IaEvHKxdSZ9ehFCX
         FgqA==
X-Gm-Message-State: AOAM530Dr0NXGfObXcqS/9j+mXAqcWyIaAMgm3rY4vic+NQlbCo59ITA
        uLtnlwRHP+oJYUIHbusWFC9GQoS7EdLSew==
X-Google-Smtp-Source: ABdhPJz2Hjor4bcM/SDl3TaMT7trWupoRUQYUcBjBnH3GxeB25NhEx2Sc4imqbI0/XDsdaM58J0/sQ==
X-Received: by 2002:a05:6102:31b5:: with SMTP id d21mr3209026vsh.19.1602683492536;
        Wed, 14 Oct 2020 06:51:32 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id e9sm545836uad.20.2020.10.14.06.51.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 06:51:31 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id s15so2150806vsm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 06:51:31 -0700 (PDT)
X-Received: by 2002:a67:e3b9:: with SMTP id j25mr3194594vsm.37.1602683490772;
 Wed, 14 Oct 2020 06:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201013080103.410133-1-amstan@chromium.org> <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
 <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com> <20201014113313.y5uzugw5lpcbo46p@holly.lan>
In-Reply-To: <20201014113313.y5uzugw5lpcbo46p@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 06:51:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGm4sc_At+7YPFbZ4YPY7rKfTLDVUMKt2MvCLgt7vF1Q@mail.gmail.com>
Message-ID: <CAD=FV=WGm4sc_At+7YPFbZ4YPY7rKfTLDVUMKt2MvCLgt7vF1Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: trogdor: Add brightness-levels
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Alexandru Stan <amstan@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 4:33 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Oct 13, 2020 at 09:28:38AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Oct 13, 2020 at 1:01 AM Alexandru Stan <amstan@chromium.org> wrote:
> > >
> > > Now that we have better interpolation for the backlight
> > > ("backlight: pwm_bl: Fix interpolation"), we can now add the curve to
> > > the trogdor boards, being careful to crop the low end.
> >
> > Just to make it clear, the patch this depends on hasn't landed yet.
> > Presumably it will land in the v5.10 timeframe?  That means that
> > without extra coordination this patch can target v5.11.
>
> You're talking about patch 1 from this set? Despite the title I view
> the patch as changing policy (albeit one that does also fix some annoying
> quantization errors at the same time) so it's not necessarily a
> candidate for merging outside the merge window (I've not checked with
> Lee but I think it likely the shutter is already down for features).

Ugh, I'm off by one.  :(  Right.  New features prepared for v5.10
should already have been baking in linuxnext and merge requests have
already started flowing towards Linus.  After v5.10-rc1 then it'd just
fixes and this doesn't really qualify.  So the timing dictates that
patch #1 will land in v5.11, not v5.10.


> Moreover I'm not clear why there a dependency here that would stop the
> changes landing in different trees.

I haven't tried Alexandru's device tree patch without the associated
code changes, but I guess I just assumed that it would make a really
ugly (non)ideal backlight curve and we'd be better off with what we
currently have (AKA no curve specified at all).

Hrm, thinking about it, I guess the worst case is a slightly non-ideal
backlight curve and it would be all good in the final v5.11 which
would have the device tree and code changes, so you're right that both
the code and device tree could target v5.11 without anything too
bad...


> Daniel.
>
>
> > > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > index bf875589d364..ccdabc6c4994 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -179,6 +179,15 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> > >         backlight: backlight {
> > >                 compatible = "pwm-backlight";
> > >
> > > +               /* The panels don't seem to like anything below ~ 5% */
> > > +               brightness-levels = <
> > > +                       196 256 324 400 484 576 676 784 900 1024 1156 1296
> > > +                       1444 1600 1764 1936 2116 2304 2500 2704 2916 3136
> > > +                       3364 3600 3844 4096
> > > +               >;
> > > +               num-interpolated-steps = <64>;
> > > +               default-brightness-level = <951>;
> >
> > I haven't done lots of digging here, but this matches what Alexandru
> > and Matthias agreed upon for the downstream tree and seems sane.
> > Thus:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
