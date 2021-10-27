Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40A343CD1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237775AbhJ0PLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 11:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236477AbhJ0PLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 11:11:46 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A1AC061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:09:21 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso4032841otl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/6FAd6fMUfAz38yO91cXMR9wIErBnyo/uWdco2ik1NI=;
        b=riptIEjXXKXUGTNoUfl1hcMCRMAY4jrbaLZqicZrou6N35vHAeZakrty2iVIIKflo3
         YLVaCQTN1pca/stJjb/Bi/CU7Y5O9ciI3qX+nK89Z23GfDCRQgr7Y4uJ0YH6cIaTSYf6
         xwslVOHtDIwwvTQIRjPBAiE1ZzWIJzJyuZwQZNJS0Ma6rzLvvl2b1sZeKF9Pn6pPaIq5
         YUG4e0UuuEbKf+YqynjnznvhQqnUtHgZ/JhBK035R/iP0xTh41RonkknKw0/M7sx4uRP
         1cgn1e0oKbeTPUbqOCCkgQlunUKGfSQgCFVzGDPp7kpFau3uEENHeoA/NzuciVyrtTHC
         Ja3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/6FAd6fMUfAz38yO91cXMR9wIErBnyo/uWdco2ik1NI=;
        b=ElcH0dPTtn64V1GZ/0NDAnq3KsdatXMV3nalON+lvH2CeMjfpVPnNfCXk/DcyA/M69
         2MjeNpwFhGEXTSVfqHdIVQw6EluyIRiy0lQnov0nU4iiYiapNvD/K1G7NDT5oDeL0jzg
         1nas0F/swvpqRTc+IWlu1rok3uxDF4xv40a+N1lcZms/yjIiyGIO9p60bvEHovNK7z9U
         ohfChhPcBWEKvP6ldsnuDURxT1jkwOskZ817xX9D3s+Jnw2oEHPh7gPZD4lrDFWwHmPZ
         q7OP+FMq4Rq5H/2kjPmbYRdUTW37y39cbiNF+l+h+aQCY8jblyU7oKU2J6uDlr5EJSMK
         dvoA==
X-Gm-Message-State: AOAM531EX8sapNAPImrloj0jNREUIVkoXgr7B4XlhLr6xR5zLHOgGxFl
        pqnnRL7fxRwVC+eJUQfarOzABg==
X-Google-Smtp-Source: ABdhPJziTi5uxZTFjK9FIGAZsoBifOYiXlvi/xSSya4B1d6Ed5ib6QCbk+LlvODUgBkmsCt0M80WAA==
X-Received: by 2002:a9d:6c8b:: with SMTP id c11mr9232614otr.50.1635347360595;
        Wed, 27 Oct 2021 08:09:20 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bk8sm46295oib.57.2021.10.27.08.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 08:09:19 -0700 (PDT)
Date:   Wed, 27 Oct 2021 08:11:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
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
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd
 bindings for dwc3 qcom
Message-ID: <YXlsEF9XZpthecJC@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper>
 <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
 <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 27 Oct 07:24 PDT 2021, Ulf Hansson wrote:

> On Wed, 27 Oct 2021 at 06:55, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 26 Oct 19:48 CDT 2021, Stephen Boyd wrote:
> >
> > > +Rajendra
> > >
> > > Quoting Bjorn Andersson (2021-10-25 19:48:02)
> > > > On Mon 25 Oct 15:41 PDT 2021, Stephen Boyd wrote:
> > > >
> > > > >
> > > > > When the binding was introduced I recall we punted on the parent child
> > > > > conversion stuff. One problem at a time. There's also the possibility
> > > > > for a power domain to be parented by multiple power domains so
> > > > > translation tables need to account for that.
> > > > >
> > > >
> > > > But for this case - and below display case - the subdomain (the device's
> > > > power-domain) is just a dumb gate. So there is no translation, the given
> > > > performance_state applies to the parent. Or perhaps such implicitness
> > > > will come back and bite us?
> > >
> > > In the gate case I don't see how the implicitness will ever be a
> > > problem.
> > >
> > > >
> > > > I don't think we allow a power-domain to be a subdomain of two
> > > > power-domains - and again it's not applicable to USB or display afaict.
> > >
> > > Ah maybe. I always confuse power domains and genpd.
> > >
> > > >
> > > > > >
> > > > > > > Or we may need to make another part of the OPP binding to indicate the
> > > > > > > relationship between the power domain and the OPP and the parent of
> > > > > > > the power domain.
> > > > > >
> > > > > > I suspect this would be useful if a power-domain provider needs to
> > > > > > translate a performance_state into a different supply-performance_state.
> > > > > > Not sure if we have such case currently; these examples are all an
> > > > > > adjustable power-domain with "gating" subdomains.
> > > > >
> > > > > Even for this case, we should be able to have the GDSC map the on state
> > > > > to some performance state in the parent domain. Maybe we need to add
> > > > > some code to the gdsc.c file to set a performance state on the parent
> > > > > domain when it is turned on. I'm not sure where the value for that perf
> > > > > state comes from. I guess we can hardcode it in the driver for now and
> > > > > if it needs to be multiple values based on the clk frequency we can push
> > > > > it out to an OPP table or something like that.
> > > > >
> > > >
> > > > For the GDSC I believe we only have 1:1 mapping, so implementing
> > > > set_performance_state to just pass that on to the parent might do the
> > > > trick (although I haven't thought this through).
> > > >
> > > > Conceptually I guess this would be like calling clk_set_rate() on a
> > > > clock gate, relying on it being propagated upwards. The problem here is
> > > > that the performance_state is just a "random" integer without a well
> > > > defined unit.
> > > >
> > >
> > > Right. Ideally it would be in the core code somehow so that if there
> > > isn't a set_performance_state function we go to the parent or some
> > > special return value from the function says "call it on my parent". The
> > > translation scheme could come later so we can translate the "random"
> > > integer between parent-child domains.
> >
> > As a proof of concept it should be sufficient to just add an
> > implementation of sc->pd.set_performance_state in gdsc.c. But I agree
> > that it would be nice to push this into some framework code, perhaps
> > made opt-in by some GENPD_FLAG_xyz.
> >
> > > At the end of the day the device
> > > driver wants to set a frequency or runtime pm get the device and let the
> > > OPP table or power domain code figure out what the level is supposed to
> > > be.
> > >
> >
> > Yes and this is already working for the non-nested case - where the
> > single power-domain jumps between performance states as the opp code
> > switches from one opp to another.
> >
> > So if we can list only the child power-domain (i.e. the GDSC) and have
> > the performance_stat requests propagate up to the parent rpmhpd resource
> > I think we're good.
> >
> >
> > Let's give this a spin and confirm that this is the case...
> >
> > > >
> > > >
> > > > The one case where I believe we talked about having different mapping
> > > > between the performance_state levels was in the relationship between CX
> > > > and MX. But I don't think we ever did anything about that...
> > >
> > > Hmm alright. I think there's a constraint but otherwise nobody really
> > > wants to change both at the same time.
> > >
> > > > >
> > > > > Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
> > > > > etc. Is the display subsystem an example of different clk frequencies
> > > > > wanting to change the perf state of CX? If so it's a good place to work
> > > > > out the translation scheme for devices that aren't listing the CX power
> > > > > domain in DT.
> > > >
> > > > Yes, the various display components sits in MDSS_GDSC but the opp-tables
> > > > needs to change the performance_state of MDSS_GDSC->parent (i.e. CX or
> > > > MMCX, depending on platform).
> > > >
> > > > As I said, today we hack this by trusting that the base drm/msm driver
> > > > will keep MDSS_GDSC on and listing MMCX (or CX) as power-domain for each
> > > > of these components.
> > > >
> > > >
> > > > So if we solve this, then that seems to directly map to the static case
> > > > for USB as well.
> > > >
> > >
> > > Got it. So in this case we could have the various display components
> > > that are in the mdss gdsc domain set their frequency via OPP and then
> > > have that translate to a level in CX or MMCX. How do we parent the power
> > > domains outside of DT? I'm thinking that we'll need to do that if MMCX
> > > is parented by CX or something like that and the drivers for those two
> > > power domains are different. Is it basic string matching?
> >
> > In one way or another we need to invoke pm_genpd_add_subdomain() to link
> > the two power-domains (actually genpds) together, like what was done in
> > 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
> >
> > In the case of MMCX and CX, my impression of the documentation is that
> > they are independent - but if we need to express that CX is parent of
> > MMCX, they are both provided by rpmhpd which already supports this by
> > just specifying .parent on mmcx to point to cx.
> 
> I was trying to follow the discussion, but it turned out to be a bit
> complicated to catch up and answer all things. In any case, let me
> just add a few overall comments, perhaps that can help to move things
> forward.
> 

Thanks for jumping in Ulf.

> First, one domain can have two parent domains. Both from DT and from
> genpd point of view, just to make this clear.
> 

I was under the impression that the only such configuration we supported
was that we can explicitly attach and control multiple PDs from a
driver. I didn't think we could say that a given genpd is a subdomain of
multiple other genpds...

That said, it's better if we can ignore this, as it doesn't apply to our
problem at hand.

> Although, it certainly looks questionable to me, to hook up the USB
> device to two separate power domains, one to control power and one to
> control performance. Especially, if it's really the same piece of HW
> that is managing both things. Additionally, if it's correct to model
> the USB GDSC power domain as a child to the CX power domain from HW
> point of view, we should likely do that.
> 

So to clarify, we have the following situation:

+---------------+
| CX            |
| +-----------+ |
| | USB_GDSC  | |
| | +-------+ | |
| | | dwc3  | | |
| | +-------+ | |
| +-----------+ |
+---------------+

CX can operate at different performance_states, USB_GDSC can be toggled
on/off and hence dwc3 needs CX to operate at a performance_state meeting
its needs.

The proposed patch is to list both CX and USB_GDSC as power-domains for
dwc3, in order for the required-opp in the dwc3 to affect CX.

> From the performance states point of view, genpd supports propagating
> performance states to parent domains, via a 1:1 mapping of the
> performance state. Note that, we have also quite recently made genpd's
> ->set_performance_state() callback to be optional. A vote for a
> performance state will be propagated to the parent domain, even if the
> child domain would lack the ->set_performance_state() callback.  This
> should be useful, where a child domain relies on its parent domain for
> performance state management, which seems to be the case for the USB
> GDSC/CX power domains, right?
> 

I presume you're referring to the first half of
_genpd_set_performance_state(). This looks to be exactly what Stephen
and I discussed implementing.

I had a rather messy tree when I looked at this last time, presumably
missing something else to hide this propagation.


For the USB_GDSC we today don't describe that as a subdomain of CX, but
per your guidance and the recently introduced 3652265514f5 ("clk: qcom:
gdsc: enable optional power domain support") we should be fairly close
to the solution.


The one "problem" I can see is that I believe that some of the GDSCs in
GCC should be subdomains of MX, so the above referenced patch would then
need to be extended to allow specifying which of the multiple
power-domains each GDSC should be a subdomain of - something Dmitry and
I did discuss, but wasn't needed for the display GDSC.
Perhaps I'm just misinformed regarding this need though.

> In regards to the parsing of the "required-opps" DT binding for a
> device node, I think that should work for cases like these, too. Or is
> there something missing around this?
> 

Given that Sandeep's proposed patch solves his problem without touching
the framework those patches (required-opps) must already have been
picked up.

Regards,
Bjorn
