Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0236C32F47F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 21:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhCEULe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 15:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhCEULP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 15:11:15 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637B5C061761
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 12:11:15 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id j12so2791959pfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 12:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XpRWrCpvKq9nt1h78wFpc/rhz9Ju6DpPSZWvCQyczCw=;
        b=i5inxvA0mUjOzQNjG7ciEg6oz8aIWcIRZsDlhjBbs/19w1v7F2XVzfzADNzTUz9DFI
         0DATDju49awK+y15gl32BddzbO9uDs5x80mn7xvPdesARvf0Hw2/nQrDTboWADj7jCxo
         afl7HId/BZeUxy2VwiuwgDoOSJj4LMSERIs5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpRWrCpvKq9nt1h78wFpc/rhz9Ju6DpPSZWvCQyczCw=;
        b=t5/KN2v3BhAcEYXCTeYtczbmCoBFNBsNvHB2i8ZaEHHWE1p/1x/yrqjy7x7O5rRteD
         S+kLKTznJ9p3nsQeSUkLWO8S5Wm9C0lEQ65SR8Gjeejad4IdnBeL7TlrGvTYy9L3RdiO
         AphYI0u/ynn7fc9ApF7+SGeDpmrhtNNwaz6VktbV/PShAAhdmLchzz+J/ObbbLO+axGy
         Fb1j0O6/ADRyspo+7obJDW7gYV8da9VFwfiyrPm7/0e5twVU/a33Tkugyi7YrsMDHAvK
         NKS83eWB7IrDgG57W6MuM2Gr8tVlzavsXF2FiF8UhMHMuwFkT/NGVcOavJkcMte6ulsn
         gl6g==
X-Gm-Message-State: AOAM531MEg3jAtBaL4Anw/VO7kIII2zTIT6CRITMmJ1uMBqIEFLu4crA
        IvEGNYJVh8trZmdfEe+Va7voAw==
X-Google-Smtp-Source: ABdhPJzp+MS3v5CN7KWxUphZ2+tM3MVGymlJxG+hV9vMQn8t2v+QgGLYQanFrGOnwfplkbU3TPajHA==
X-Received: by 2002:a63:ee4e:: with SMTP id n14mr10174615pgk.422.1614975074818;
        Fri, 05 Mar 2021 12:11:14 -0800 (PST)
Received: from localhost ([2620:15c:202:1:2878:25d1:94cb:a547])
        by smtp.gmail.com with UTF8SMTPSA id x14sm29266pfn.162.2021.03.05.12.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 12:11:14 -0800 (PST)
Date:   Fri, 5 Mar 2021 12:11:12 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: lazor: Simplify disabling
 of charger thermal zone
Message-ID: <YEKQYPIjisL+V1xH@google.com>
References: <20210304180415.1531430-1-mka@chromium.org>
 <20210304100341.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
 <CAD=FV=XKpzSq2GqvoDieuZVZFrwmO0Q2prPaKeJRKXJmxPGWpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XKpzSq2GqvoDieuZVZFrwmO0Q2prPaKeJRKXJmxPGWpg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 10:36:49AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 4, 2021 at 10:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Commit f73558cc83d1 ("arm64: dts: qcom: sc7180: Disable charger
> > thermal zone for lazor") disables the charger thermal zone for
> > specific lazor revisions due to an unsupported thermistor type.
> > The initial idea was to disable the thermal zone for older
> > revisions and leave it enabled for newer ones that use a
> > supported thermistor. Finally the thermistor won't be changed
> > on newer revisions, hence the thermal zone should be disabled
> > for all lazor (and limozeen) revisions. Instead of disabling
> > it per revision do it once in the shared .dtsi for lazor.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 ---------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 9 +++++++++
> >  4 files changed, 9 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > index 5c997cd90069..30e3e769d2b4 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > @@ -14,15 +14,6 @@ / {
> >         compatible = "google,lazor-rev0", "qcom,sc7180";
> >  };
> >
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > -
> >  &pp3300_hub {
> >         /* pp3300_l7c is used to power the USB hub */
> >         /delete-property/regulator-always-on;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > index d9fbcc7bc5bd..c2ef06367baf 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > @@ -14,15 +14,6 @@ / {
> >         compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
> >  };
> >
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > -
> >  &pp3300_hub {
> >         /* pp3300_l7c is used to power the USB hub */
> >         /delete-property/regulator-always-on;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > index 19e69adb9e04..1b9d2f46359e 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> > @@ -13,12 +13,3 @@ / {
> >         model = "Google Lazor (rev3+)";
> >         compatible = "google,lazor", "qcom,sc7180";
> >  };
> > -
> > -/*
> > - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > - * to avoid using bogus temperature values.
> > - */
> > -&charger_thermal {
> > -       status = "disabled";
> > -};
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > index 89e5cd29ec09..aa2c4a9098db 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> > @@ -58,6 +58,15 @@ ap_ts: touchscreen@10 {
> >         };
> >  };
> >
> > +/*
> > + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> > + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> > + * to avoid using bogus temperature values.
> > + */
> > +&charger_thermal {
> > +       status = "disabled";
> > +};
> > +
> >  /* PINCTRL - modifications to sc7180-trogdor.dtsi */
> >
> >  &ts_reset_l {
> 
> The idea is right, but I'm having a hard time figuring out what tree
> you posted your patch against. You said you did it atop my "v2" series
> [1], right?  ...but the "sc7180-trogdor-lazor.dtsi" really doesn't
> match. In my tree, for instance, right above the PINCTRL comment
> should be:
> 
> &wifi {
>   qcom,ath10k-calibration-variant = "GO_LAZOR";
> };
> 
> ...but that's definitely not what's there in whatever your patch was
> written against... It seems like you're also missing the panel and
> trackpad nodes...
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=440315

You got me! I was too lazy to pick all 13 patches, since most of them are
irrelevant for this series, but apparently I missed some that are. I guess
I'll pick them all for v2 ...
