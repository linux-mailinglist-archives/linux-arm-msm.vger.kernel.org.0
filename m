Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC30828EF3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 11:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgJOJQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 05:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgJOJQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 05:16:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D05C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 02:16:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 13so2397316wmf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eqdOjb4HsOtdSUyO/k88d8GDoscSKYaaq0n+YsnzZog=;
        b=DiR8ARqL+kQ9Pc0Ntj7ZeegNBLYt4XQ6PKMKHGEsFkpL/OOurMS18VPcOSGBpUH12P
         hPg9v+ZD0V/9WjLdlKdxxB8sGnQL/QTe1j+uL+s9x76XnvJic6beLZ+TEvQnbiFG1jDW
         JNqNfgNEtLfg/ldLwt9Gp0V9jLJyXFjyO5WdC5RS2APpWpD0QjOEo3ud0iWLPkcorWTD
         Gk6mE2ppgYGAWwdAdifg3h3T2/1k8NBYmfxCiEwbRa42vsNTSZZ+ZZBvPXXum8HNtIU8
         WtduwotIAebsmvx5RfBG45EQf+HRMohbxCVVNi8TyKN4AxFiQL0Tncv0KVXu/ArGUoyN
         cDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eqdOjb4HsOtdSUyO/k88d8GDoscSKYaaq0n+YsnzZog=;
        b=ow8A8iBe60bd8Uy2ZlBk2iRZD9YJU7ricDaOK+BpQ8PlN2kOBen4bQZTpRe4E1mZLx
         BJGFo30UYfwI/vaRY6qi+ndyRZo+xrASxa9jgX3uaIkXh5fXaTsKqIrlcwg4Z6ovX819
         pnfFZb9PqlwB+kRQ3Pzx4+VCMGrVveKMTR4WwIrN378g0b+WTeet6dIj7Ype5fqHEfuH
         rxAZ72svue0HqllornkFEJmSnAfXV2djPgCUBn2IvP7OHiKlaQmXvWW336sNM93tXG8s
         yq9CcGohau4SiiAZkLKv0Kp6nyJaQnceUkcYGIr2cpX+fYxXawqH7GD5K4rI09aqwvs0
         kK9g==
X-Gm-Message-State: AOAM530x56MO1ugytVCpx84Jr/rI6VcWEAZp5Tr4JRGG1Ree5kUxtJnl
        hQ0SXBKYrAX/jmlecpnPelNEKQ==
X-Google-Smtp-Source: ABdhPJytnsThxWJIPfgVbkSecoZ5ece7rl9V53yHPJTCzThrQLBcRiN1WFnsrGOzinWhRanE20BZ6w==
X-Received: by 2002:a1c:4306:: with SMTP id q6mr3169301wma.189.1602753360864;
        Thu, 15 Oct 2020 02:16:00 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id a82sm3616424wmc.44.2020.10.15.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 02:15:59 -0700 (PDT)
Date:   Thu, 15 Oct 2020 10:15:57 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Alexandru Stan <amstan@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: trogdor: Add brightness-levels
Message-ID: <20201015091557.lwgw3msapj4nnyoo@holly.lan>
References: <20201013080103.410133-1-amstan@chromium.org>
 <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
 <CAD=FV=W4fv_AdS7G2FFe2Kan3YYJ4D0MVJD90aJMrgCja5N4vg@mail.gmail.com>
 <20201014113313.y5uzugw5lpcbo46p@holly.lan>
 <CAD=FV=WGm4sc_At+7YPFbZ4YPY7rKfTLDVUMKt2MvCLgt7vF1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WGm4sc_At+7YPFbZ4YPY7rKfTLDVUMKt2MvCLgt7vF1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 14, 2020 at 06:51:19AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 14, 2020 at 4:33 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Oct 13, 2020 at 09:28:38AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Oct 13, 2020 at 1:01 AM Alexandru Stan <amstan@chromium.org> wrote:
> > > >
> > > > Now that we have better interpolation for the backlight
> > > > ("backlight: pwm_bl: Fix interpolation"), we can now add the curve to
> > > > the trogdor boards, being careful to crop the low end.
> > >
> > > Just to make it clear, the patch this depends on hasn't landed yet.
> > > Presumably it will land in the v5.10 timeframe?  That means that
> > > without extra coordination this patch can target v5.11.
> >
> > You're talking about patch 1 from this set? Despite the title I view
> > the patch as changing policy (albeit one that does also fix some annoying
> > quantization errors at the same time) so it's not necessarily a
> > candidate for merging outside the merge window (I've not checked with
> > Lee but I think it likely the shutter is already down for features).
> 
> Ugh, I'm off by one.  :(  Right.  New features prepared for v5.10
> should already have been baking in linuxnext and merge requests have
> already started flowing towards Linus.  After v5.10-rc1 then it'd just
> fixes and this doesn't really qualify.  So the timing dictates that
> patch #1 will land in v5.11, not v5.10.
> 
> 
> > Moreover I'm not clear why there a dependency here that would stop the
> > changes landing in different trees.
> 
> I haven't tried Alexandru's device tree patch without the associated
> code changes, but I guess I just assumed that it would make a really
> ugly (non)ideal backlight curve and we'd be better off with what we
> currently have (AKA no curve specified at all).
> 
> Hrm, thinking about it, I guess the worst case is a slightly non-ideal
> backlight curve and it would be all good in the final v5.11 which
> would have the device tree and code changes, so you're right that both
> the code and device tree could target v5.11 without anything too
> bad...

Excellent. I'll try to remember this for v3 so I can get my Acked-by
versus Reviewed-by tags correct ;-) .


Daniel.


> 
> 
> > Daniel.
> >
> >
> > > > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > > > ---
> > > >
> > > >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > index bf875589d364..ccdabc6c4994 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > @@ -179,6 +179,15 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
> > > >         backlight: backlight {
> > > >                 compatible = "pwm-backlight";
> > > >
> > > > +               /* The panels don't seem to like anything below ~ 5% */
> > > > +               brightness-levels = <
> > > > +                       196 256 324 400 484 576 676 784 900 1024 1156 1296
> > > > +                       1444 1600 1764 1936 2116 2304 2500 2704 2916 3136
> > > > +                       3364 3600 3844 4096
> > > > +               >;
> > > > +               num-interpolated-steps = <64>;
> > > > +               default-brightness-level = <951>;
> > >
> > > I haven't done lots of digging here, but this matches what Alexandru
> > > and Matthias agreed upon for the downstream tree and seems sane.
> > > Thus:
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
