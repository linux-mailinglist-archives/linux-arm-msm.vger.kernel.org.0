Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1C33B0EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhFVUZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhFVUZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:25:23 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ED9C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 13:23:06 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso161474ooc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ggw6fsmku27vHRmfMQszrNre4+RfK7j3PrPkaoOAI5s=;
        b=LJm/LbiFVvPJuS0y9W0doPgLlkncwZmOFafIU9v/PAm8m/8KHPwJT3Y5cbnkV4BXJu
         pibvHYmUPrUE/wlr8jvGDlSstXPVAb7sWUjUQ4VBX8iMDC18VCuC4nu1eYJFnvVrDNar
         z2oeL/qVTksu5CgRvcn+b9dGIc1UkJ/B/CICM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ggw6fsmku27vHRmfMQszrNre4+RfK7j3PrPkaoOAI5s=;
        b=pE5emkJ4D3bbLNd8qNxP53Kvsp5DNZZdV7T50cbUYvyc1lPbfW5/nQr4Tj+5W8CSdx
         SWawLzpmDCGBeG4wUUQJWBFYXmSxvZEOqIUYuGrFoqD4N+MWGySLDvAhUPR3eMi5/a7S
         dX+SnKKReY3uEHxfLq4kIdxp47Hgvaz3DLSsDaQkeyH99pwbF2SEg3GLt14TLZOToCOT
         ed3/8GMeudtB8H0oDuukTESMzR81iXFUX1aFxLFrBHZtSzSZYIwRytRGSc5qhfYLYYAL
         vJ/svwJicKkX86pORhpByOUy7wMcQYTwxsYxBN5nTUhOFQGn1LTvGwCXj6pTSGOMcr3L
         mmgg==
X-Gm-Message-State: AOAM533Ra9InWT/3haRJYrzrYS2BWN3e/IzoFrGpHrW8Cs4vHC8rDl4z
        lWgqvV5PhsqHMe9IHQbiXO3IrFwEpfYTd70329ooFw==
X-Google-Smtp-Source: ABdhPJy5r3CCQB5ei2dsC6e+iDjGtLoVXl+JauwqFRFFC7KOLNaQ916rDZGbyoUW22i3iQ7L95AFS3Jj4//ujS57zu4=
X-Received: by 2002:a4a:e2d0:: with SMTP id l16mr4771864oot.80.1624393384760;
 Tue, 22 Jun 2021 13:23:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Jun 2021 13:23:04 -0700
MIME-Version: 1.0
In-Reply-To: <YM0THrlJlv7ADW8w@builder.lan>
References: <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga> <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga> <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga> <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com> <YM0THrlJlv7ADW8w@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 22 Jun 2021 13:23:04 -0700
Message-ID: <CAE-0n53Zr-w5m-eFhLM2BVmphcYb_M4=s5je3Y7Lg6=onNo=uA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port dt node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     khsieh@codeaurora.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-06-18 14:41:50)
> On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:
>
> > Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
> > > On 2021-06-08 16:10, Bjorn Andersson wrote:
> > > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
> > > >
> > > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
> > > >> digital logic. Probably the PLL is the hardware that has some minimum
> > > >> CX
> > > >> requirement, and that flows down into the various display clks like
> > > >> the
> > > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
> > > >> probably gates CX for the display subsystem (mdss) so if we had proper
> > > >> corner aggregation logic we could indicate that mdss_gdsc is a child
> > > >> of
> > > >> the CX domain and then make requests from the DP driver for particular
> > > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
> > > >> appropriately. I don't think any of that sort of code is in place
> > > >> though, right?
> > > >
> > > > I haven't checked sc7180, but I'm guessing that it's following the
> > > > other
> > > > modern platforms, where all the MDSS related pieces (including e.g.
> > > > dispcc) lives in the MMCX domain, which is separate from CX.
> > > >
> > > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
> > > > the dp-opp-table) tells us that the PLL lives in the CX domain.
> >
> > Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
> > basically a GDSC that clamps all of multimedia hardware block power
> > logic so that the leakage is minimized when multimedia isn't in use,
> > i.e. the device is suspended. In terms of bumping up the voltage we have
> > to pin that on CX though as far as I know because that's the only power
> > domain that can actually change voltage, while MMCX merely gates that
> > voltage for multimedia.
> >
>
> No, MMCX is a separate rail from CX, which powers the display blocks and
> is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
> these platforms, so I presume this means that the displayport controller
> thereby sits in MDSS_GDSC parented by CX.
>
> But in line with what you're saying, the naming of the supplies to the
> QMP indicates that the power for the PLLs is static. As such the only
> moving things would be the clock rates in the DP controller and as such
> that's what needs to scale the voltage.
>
> So if the resources we're scaling is the clocks in the DP controller
> then the gist of the patch is correct. The only details I see is that
> the DP controller actually sits in MDSS_GDSC - while it should control
> the level of its parent (CX). Not sure if we can describe that in a
> simple way.

Right. I'm not sure things could be described any better right now. If
we need to change this to be MDSS_GDSC power domain and control the
level of the parent then I suppose we'll have to make some sort of DT
change and pair that with a driver change. Maybe if that happens we can
just pick a new compatible and leave the old code in place.

Are you happy enough with this current patch?

>
>
> PS. Why does the node name of the opp-table have to be globally unique?

Presumably the opp table node name can be 'opp-table' as long as it
lives under the node that's using it. If the opp table is at / or /soc
then it will need to be unique. I'd prefer just 'opp-table' if possible.
