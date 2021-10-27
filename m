Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF8343CC19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 16:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242500AbhJ0O1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 10:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238272AbhJ0O1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 10:27:54 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD27AC0613B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 07:25:28 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id l2so4995683lji.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WNAMDt0ADcK+n3RsR7jtkIgpfhbhOoaoKp+bIVUXzCo=;
        b=ox50lX+eprZt1V6nglRNBzkFkP9BY6+LFieoj8+/IXJkU7HwHZSE6HKntwtP0qW6Po
         llsnguVNK7I+uCHSLGEm7j52FncoKeR89sGDLEJdNsKvNVhkWV5LGBb6ExNKqJng/cir
         hMoIIUg97fyCHt6127zqJRZlfm++CictFvuO2QiKcrkfUpNYnG2Dl2J97hFlnjz3CUND
         brS4N6M03ATDJkPH8OPtIn4f4O6kOXbl2dJQyugs6ROQi7muJknUmDmzOxHx6hMwEY+r
         IjYovE2eI/1UAYT8Dpjjfj/l4LvtzD/nOyjVNqBoU348DwT6fZ5tBRKcC2gbv3e95Qn2
         6VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNAMDt0ADcK+n3RsR7jtkIgpfhbhOoaoKp+bIVUXzCo=;
        b=HTQ0xf8r3oMW7TfgIn3Us88DIPyk2QgZKzaQB6KFIfbiY0+bC8EEZh21h5J8r0TUvG
         eDgNybNq5Bs8WUEjQvyyxZ3GdmFIHEroKofIELzzR7A8zJ90d+R7jP/wtVPa2SuDMMgw
         i93sB90Mnd3v4VvCQqL1X1g/31+vcxgLiWyKMJvJyIphjk+SWE72y459DD5DHJtsb7Xy
         xCsGyJJIOQ04C9QPj1xfr2dVSeVJ57Wi1GjMDG7BnQM0E/D8z1l99TlGutePy+aPNy33
         pJ4EeNWDP5gyJ0sErUCvljxhMseWIxbB+kIfFr0fyGGrQo82AGXg/eMmx4nChamU2zkK
         rmMQ==
X-Gm-Message-State: AOAM533JvLU97G5cDzONWIip8IHrEblvWN+blg/tIkToeqltCL7DMu29
        asBVcZrQaobA11wNUQ4rVXDlfVZR4LLWo1xtkZA5aQMCxKjK3A==
X-Google-Smtp-Source: ABdhPJy6HDilhtMJ4mWprnuUa4gEBr21bSJphH24YDGc1eAc5GIF49QKqAbykfnywK/pWXjBK7lgAhjvv/hVR4Mj3tk=
X-Received: by 2002:a2e:b550:: with SMTP id a16mr34038341ljn.229.1635344726453;
 Wed, 27 Oct 2021 07:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper> <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper> <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper> <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
In-Reply-To: <YXjbs3Bv6Y3d87EC@yoga>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 27 Oct 2021 16:24:49 +0200
Message-ID: <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Oct 2021 at 06:55, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 26 Oct 19:48 CDT 2021, Stephen Boyd wrote:
>
> > +Rajendra
> >
> > Quoting Bjorn Andersson (2021-10-25 19:48:02)
> > > On Mon 25 Oct 15:41 PDT 2021, Stephen Boyd wrote:
> > >
> > > >
> > > > When the binding was introduced I recall we punted on the parent child
> > > > conversion stuff. One problem at a time. There's also the possibility
> > > > for a power domain to be parented by multiple power domains so
> > > > translation tables need to account for that.
> > > >
> > >
> > > But for this case - and below display case - the subdomain (the device's
> > > power-domain) is just a dumb gate. So there is no translation, the given
> > > performance_state applies to the parent. Or perhaps such implicitness
> > > will come back and bite us?
> >
> > In the gate case I don't see how the implicitness will ever be a
> > problem.
> >
> > >
> > > I don't think we allow a power-domain to be a subdomain of two
> > > power-domains - and again it's not applicable to USB or display afaict.
> >
> > Ah maybe. I always confuse power domains and genpd.
> >
> > >
> > > > >
> > > > > > Or we may need to make another part of the OPP binding to indicate the
> > > > > > relationship between the power domain and the OPP and the parent of
> > > > > > the power domain.
> > > > >
> > > > > I suspect this would be useful if a power-domain provider needs to
> > > > > translate a performance_state into a different supply-performance_state.
> > > > > Not sure if we have such case currently; these examples are all an
> > > > > adjustable power-domain with "gating" subdomains.
> > > >
> > > > Even for this case, we should be able to have the GDSC map the on state
> > > > to some performance state in the parent domain. Maybe we need to add
> > > > some code to the gdsc.c file to set a performance state on the parent
> > > > domain when it is turned on. I'm not sure where the value for that perf
> > > > state comes from. I guess we can hardcode it in the driver for now and
> > > > if it needs to be multiple values based on the clk frequency we can push
> > > > it out to an OPP table or something like that.
> > > >
> > >
> > > For the GDSC I believe we only have 1:1 mapping, so implementing
> > > set_performance_state to just pass that on to the parent might do the
> > > trick (although I haven't thought this through).
> > >
> > > Conceptually I guess this would be like calling clk_set_rate() on a
> > > clock gate, relying on it being propagated upwards. The problem here is
> > > that the performance_state is just a "random" integer without a well
> > > defined unit.
> > >
> >
> > Right. Ideally it would be in the core code somehow so that if there
> > isn't a set_performance_state function we go to the parent or some
> > special return value from the function says "call it on my parent". The
> > translation scheme could come later so we can translate the "random"
> > integer between parent-child domains.
>
> As a proof of concept it should be sufficient to just add an
> implementation of sc->pd.set_performance_state in gdsc.c. But I agree
> that it would be nice to push this into some framework code, perhaps
> made opt-in by some GENPD_FLAG_xyz.
>
> > At the end of the day the device
> > driver wants to set a frequency or runtime pm get the device and let the
> > OPP table or power domain code figure out what the level is supposed to
> > be.
> >
>
> Yes and this is already working for the non-nested case - where the
> single power-domain jumps between performance states as the opp code
> switches from one opp to another.
>
> So if we can list only the child power-domain (i.e. the GDSC) and have
> the performance_stat requests propagate up to the parent rpmhpd resource
> I think we're good.
>
>
> Let's give this a spin and confirm that this is the case...
>
> > >
> > >
> > > The one case where I believe we talked about having different mapping
> > > between the performance_state levels was in the relationship between CX
> > > and MX. But I don't think we ever did anything about that...
> >
> > Hmm alright. I think there's a constraint but otherwise nobody really
> > wants to change both at the same time.
> >
> > > >
> > > > Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
> > > > etc. Is the display subsystem an example of different clk frequencies
> > > > wanting to change the perf state of CX? If so it's a good place to work
> > > > out the translation scheme for devices that aren't listing the CX power
> > > > domain in DT.
> > >
> > > Yes, the various display components sits in MDSS_GDSC but the opp-tables
> > > needs to change the performance_state of MDSS_GDSC->parent (i.e. CX or
> > > MMCX, depending on platform).
> > >
> > > As I said, today we hack this by trusting that the base drm/msm driver
> > > will keep MDSS_GDSC on and listing MMCX (or CX) as power-domain for each
> > > of these components.
> > >
> > >
> > > So if we solve this, then that seems to directly map to the static case
> > > for USB as well.
> > >
> >
> > Got it. So in this case we could have the various display components
> > that are in the mdss gdsc domain set their frequency via OPP and then
> > have that translate to a level in CX or MMCX. How do we parent the power
> > domains outside of DT? I'm thinking that we'll need to do that if MMCX
> > is parented by CX or something like that and the drivers for those two
> > power domains are different. Is it basic string matching?
>
> In one way or another we need to invoke pm_genpd_add_subdomain() to link
> the two power-domains (actually genpds) together, like what was done in
> 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
>
> In the case of MMCX and CX, my impression of the documentation is that
> they are independent - but if we need to express that CX is parent of
> MMCX, they are both provided by rpmhpd which already supports this by
> just specifying .parent on mmcx to point to cx.

I was trying to follow the discussion, but it turned out to be a bit
complicated to catch up and answer all things. In any case, let me
just add a few overall comments, perhaps that can help to move things
forward.

First, one domain can have two parent domains. Both from DT and from
genpd point of view, just to make this clear.

Although, it certainly looks questionable to me, to hook up the USB
device to two separate power domains, one to control power and one to
control performance. Especially, if it's really the same piece of HW
that is managing both things. Additionally, if it's correct to model
the USB GDSC power domain as a child to the CX power domain from HW
point of view, we should likely do that.

From the performance states point of view, genpd supports propagating
performance states to parent domains, via a 1:1 mapping of the
performance state. Note that, we have also quite recently made genpd's
->set_performance_state() callback to be optional. A vote for a
performance state will be propagated to the parent domain, even if the
child domain would lack the ->set_performance_state() callback.  This
should be useful, where a child domain relies on its parent domain for
performance state management, which seems to be the case for the USB
GDSC/CX power domains, right?

In regards to the parsing of the "required-opps" DT binding for a
device node, I think that should work for cases like these, too. Or is
there something missing around this?

Kind regards
Uffe
