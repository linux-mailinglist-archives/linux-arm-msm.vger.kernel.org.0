Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C8E2A8C9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 03:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgKFCTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 21:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKFCTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 21:19:23 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D81C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 18:19:22 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g12so2757334pgm.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 18:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ThqwPvqZX83KmgF5BY1PefVZt9YcjzqlfmLEG4bvmlw=;
        b=FvHlQ+YfMPFzoBk5hdYiEqNTe/RaxVCprl/rfo+96/QbnAIiVe/LFGJLjRL065U/f0
         v8t5kiTCi6Lz4CAFs30wgSyP1VYz+SpeCS/NzwdNM8WHXXSwpfs1E0OistQuyv6R95PS
         0gsTngclvE0sgyXAN7tSMxE1Wv8PhBBY94yT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ThqwPvqZX83KmgF5BY1PefVZt9YcjzqlfmLEG4bvmlw=;
        b=uKJkwMO0ZlMllA4efcWxxilK/CKAHXFFuoMU0iU2Fjr7Sr7j806BE1CHaN+D37mnnq
         uDamT0DMUIInCMXsocN1BpL3qWWICgnUlxLjPmmrxuEbOc9F5DUN0qlR304coXVMc86R
         2PDBudfFXNfCCKqt2438CA70moRO1Qak6sq7ib/XdmLuOf/F5NAYWdLkbwP8RpTBuMy5
         fvYzV2ZjgUhkbB/jU6cGEGDnlC0SyWDJq6f6YluNpRE7HZDkTMZYsMV1uFCRySIlVemQ
         gLqZGFYUacQK6OkoRL+Ut2Dh/JcO6GmrQ9ZGNu7TuDJoRsR41pc72vanu8Y6wbtk4VZO
         rUmw==
X-Gm-Message-State: AOAM530z3KwfZY4KODubwAKXQrldxmLa+jgazxTOs4vgyu80+KMMf/XM
        t8BMUz6dxztU4+HfgcHN77JmItbzl3Yclw==
X-Google-Smtp-Source: ABdhPJwfRrkfR5rLKajUvQCxuRLHYyRA8tcQYEOUxq4EZD0w2cOHWxAPPzuDD2dndthCxI47EThnrA==
X-Received: by 2002:a17:90a:c7c3:: with SMTP id gf3mr5367076pjb.140.1604629162354;
        Thu, 05 Nov 2020 18:19:22 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id j13sm4045356pfd.97.2020.11.05.18.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 18:19:21 -0800 (PST)
Date:   Thu, 5 Nov 2020 18:19:20 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a
 the default supply for pp3300_hub
Message-ID: <20201106021920.GB4128558@google.com>
References: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
 <20201105163724.v2.2.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
 <CAD=FV=Xi-Fiay983L4WWVA07WWZvL0DSK4cazBwb9B3brVgM-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xi-Fiay983L4WWVA07WWZvL0DSK4cazBwb9B3brVgM-g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 05, 2020 at 05:05:38PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Thu, Nov 5, 2020 at 4:37 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > index 0a281c24841c..6603f2102233 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
> > @@ -58,10 +58,23 @@ ap_ts: touchscreen@10 {
> >         };
> >  };
> >
> > +&pp3300_hub {
> > +       /* pp3300_l7c is used to power the USB hub */
> > +       /delete-property/regulator-always-on;
> > +};
> > +
> > +&pp3300_l7c {
> > +       regulator-always-on;
> 
> Personally I always end up pairing "always-on" and "boot-on", but that
> might just be superstition from many kernel versions ago when there
> were weird quirks.  The way you have it now you will sometimes have
> "boot-on" but not "always-on".  Probably what you have is fine,
> though.

You are right, it makes a certain sense to have them paired, I'll change it
even though it leads to a few more entries.

> > +};
> > +
> >  &sdhc_2 {
> >         status = "okay";
> >  };
> >
> > +&usb_hub {
> > +        vdd-supply = <&pp3300_l7c>;
> > +};
> > +
> >  /* PINCTRL - board-specific pinctrl */
> >
> >  &tlmm {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index bf875589d364..50e733412a7f 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -174,6 +174,25 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
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
> > +               /* AP turns on with en_pp3300_hub; always on for AP */
> 
> Delete the above comment.  It's obvious based on the properties in
> this node.  Other similar comments are useful because they describe
> how the _EC_ turns on regulators and why a regulator that has an
> enable still looks like an "always-on" regulator to the AP (because
> it's always on whenever the AP is on).
> 
> If you want to add a comment, you could say:
> 
> /* Always on until we have a way to specify it can go off in suspend */

ok

> > @@ -469,7 +488,6 @@ ppvar_l6c: ldo6 {
> >                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >                 };
> >
> > -               pp3300_hub:
> >                 pp3300_l7c: ldo7 {
> >                         regulator-min-microvolt = <3304000>;
> >                         regulator-max-microvolt = <3304000>;
> 
> Shouldn't you delete the "regulator-always-on;" from ldo7 since you're
> adding it for all the older revs?

Indeed, that was the intention, it didn't blow up into my face during testing
since the downstream tree doesn't have it anymore.
