Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C9E43C1E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 06:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbhJ0E5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 00:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238075AbhJ0E5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 00:57:44 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620A8C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 21:55:19 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y128so1824749oie.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J99rmDKIQI2eC8q064AGTBU2y0hLumUdXAMPtYLL8MA=;
        b=sHNiMgskTiGVKJ6vhCbd5IpqIPcaJvHCci+2o9JoEtlZoitdyHhxkP3dr/N8BEjyZ4
         8PS3UAp80kfz9NPmYLCqY0tDQsN9B5ajxakmiDzc2B8kcGfaKUP6kedsFI/anlb+urLK
         y8o87G/Ylf+l0w7oS8KOj9kuBW21ljTEZc4j7cBUjLcF9zlo/xz3YYGE1SfnljNkrqV9
         kQhGyjA6Jexld6kJo2oRt96qrYNbDiv5Q2XbWX9daIys0r4SiPdz/K+ej7Tgny1rInUY
         y4W6+H2Px1GyZZaRFktF04DQdDtkjOPVQYYi5r6Rl20nK7siz3bzGHMIgKjPUDGbi2ir
         UM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J99rmDKIQI2eC8q064AGTBU2y0hLumUdXAMPtYLL8MA=;
        b=v4VoGTIRpYvFOoXQ1QklK+bJfWXPgzfi/FyQSBGHiyVzH4OXZdbA6UpYscjGVjBjJf
         PxsxMKVVHBNlI6cR6MadC900eRcfYtNhw/adz8VlzbHRcErUzqn5VsELcaVnoEVKw+2z
         WVX28jNNDEsqx+5kZ/1pCQTA0CKHOHAbjg1ku49ctHvSFTa2CYz2relpyegIyZVDWBaU
         GBBC69McTRaJTymOA5uBZfXFsE2r3esLRqu31UEb38wFM8EIgWHg1MlF4gQ+YCI6VZQn
         Zssj+wOEW8xKC+racEtNJD9BQIm/AOEQ8yMRU4RlLQdNzgyOy3ereUreY9+JS0Di0lVe
         8JQg==
X-Gm-Message-State: AOAM532Zdho2nQ7eA2Iri5TQWtI8J2Lq/XBKRArbQAzKXhBiO3nIXVGh
        ztWk1i/NZtnTPws4q7xNVIs4tw==
X-Google-Smtp-Source: ABdhPJwJ2j+0DwiuLCVP/0eAK3IWSwAXTjToS1NB1fODmYk5R5Ago1qsEUwMBFe74XIZUK7EB3joOA==
X-Received: by 2002:aca:3c8b:: with SMTP id j133mr1854305oia.159.1635310518091;
        Tue, 26 Oct 2021 21:55:18 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:40c7:d4ff:fe65:a72c])
        by smtp.gmail.com with ESMTPSA id h7sm916430otn.11.2021.10.26.21.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 21:55:17 -0700 (PDT)
Date:   Tue, 26 Oct 2021 23:55:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd
 bindings for dwc3 qcom
Message-ID: <YXjbs3Bv6Y3d87EC@yoga>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper>
 <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Oct 19:48 CDT 2021, Stephen Boyd wrote:

> +Rajendra
> 
> Quoting Bjorn Andersson (2021-10-25 19:48:02)
> > On Mon 25 Oct 15:41 PDT 2021, Stephen Boyd wrote:
> >
> > >
> > > When the binding was introduced I recall we punted on the parent child
> > > conversion stuff. One problem at a time. There's also the possibility
> > > for a power domain to be parented by multiple power domains so
> > > translation tables need to account for that.
> > >
> >
> > But for this case - and below display case - the subdomain (the device's
> > power-domain) is just a dumb gate. So there is no translation, the given
> > performance_state applies to the parent. Or perhaps such implicitness
> > will come back and bite us?
> 
> In the gate case I don't see how the implicitness will ever be a
> problem.
> 
> >
> > I don't think we allow a power-domain to be a subdomain of two
> > power-domains - and again it's not applicable to USB or display afaict.
> 
> Ah maybe. I always confuse power domains and genpd.
> 
> >
> > > >
> > > > > Or we may need to make another part of the OPP binding to indicate the
> > > > > relationship between the power domain and the OPP and the parent of
> > > > > the power domain.
> > > >
> > > > I suspect this would be useful if a power-domain provider needs to
> > > > translate a performance_state into a different supply-performance_state.
> > > > Not sure if we have such case currently; these examples are all an
> > > > adjustable power-domain with "gating" subdomains.
> > >
> > > Even for this case, we should be able to have the GDSC map the on state
> > > to some performance state in the parent domain. Maybe we need to add
> > > some code to the gdsc.c file to set a performance state on the parent
> > > domain when it is turned on. I'm not sure where the value for that perf
> > > state comes from. I guess we can hardcode it in the driver for now and
> > > if it needs to be multiple values based on the clk frequency we can push
> > > it out to an OPP table or something like that.
> > >
> >
> > For the GDSC I believe we only have 1:1 mapping, so implementing
> > set_performance_state to just pass that on to the parent might do the
> > trick (although I haven't thought this through).
> >
> > Conceptually I guess this would be like calling clk_set_rate() on a
> > clock gate, relying on it being propagated upwards. The problem here is
> > that the performance_state is just a "random" integer without a well
> > defined unit.
> >
> 
> Right. Ideally it would be in the core code somehow so that if there
> isn't a set_performance_state function we go to the parent or some
> special return value from the function says "call it on my parent". The
> translation scheme could come later so we can translate the "random"
> integer between parent-child domains.

As a proof of concept it should be sufficient to just add an
implementation of sc->pd.set_performance_state in gdsc.c. But I agree
that it would be nice to push this into some framework code, perhaps
made opt-in by some GENPD_FLAG_xyz.

> At the end of the day the device
> driver wants to set a frequency or runtime pm get the device and let the
> OPP table or power domain code figure out what the level is supposed to
> be.
> 

Yes and this is already working for the non-nested case - where the
single power-domain jumps between performance states as the opp code
switches from one opp to another.

So if we can list only the child power-domain (i.e. the GDSC) and have
the performance_stat requests propagate up to the parent rpmhpd resource
I think we're good.


Let's give this a spin and confirm that this is the case...

> >
> >
> > The one case where I believe we talked about having different mapping
> > between the performance_state levels was in the relationship between CX
> > and MX. But I don't think we ever did anything about that...
> 
> Hmm alright. I think there's a constraint but otherwise nobody really
> wants to change both at the same time.
> 
> > >
> > > Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
> > > etc. Is the display subsystem an example of different clk frequencies
> > > wanting to change the perf state of CX? If so it's a good place to work
> > > out the translation scheme for devices that aren't listing the CX power
> > > domain in DT.
> >
> > Yes, the various display components sits in MDSS_GDSC but the opp-tables
> > needs to change the performance_state of MDSS_GDSC->parent (i.e. CX or
> > MMCX, depending on platform).
> >
> > As I said, today we hack this by trusting that the base drm/msm driver
> > will keep MDSS_GDSC on and listing MMCX (or CX) as power-domain for each
> > of these components.
> >
> >
> > So if we solve this, then that seems to directly map to the static case
> > for USB as well.
> >
> 
> Got it. So in this case we could have the various display components
> that are in the mdss gdsc domain set their frequency via OPP and then
> have that translate to a level in CX or MMCX. How do we parent the power
> domains outside of DT? I'm thinking that we'll need to do that if MMCX
> is parented by CX or something like that and the drivers for those two
> power domains are different. Is it basic string matching?

In one way or another we need to invoke pm_genpd_add_subdomain() to link
the two power-domains (actually genpds) together, like what was done in
3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").

In the case of MMCX and CX, my impression of the documentation is that
they are independent - but if we need to express that CX is parent of
MMCX, they are both provided by rpmhpd which already supports this by
just specifying .parent on mmcx to point to cx.

Regards,
Bjorn
