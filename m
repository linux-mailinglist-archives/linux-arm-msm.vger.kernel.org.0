Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8997443BE97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 02:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhJ0Aum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 20:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbhJ0Aul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 20:50:41 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F84C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 17:48:16 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so1185531ote.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pO6hebzYNrv+/+pOVUyyRcxmOyAEdYQyaagcCX4YDnU=;
        b=kZTlKRIgEp17ei/WKStDhVd9uZFLymxrV+fql/20idR53mABoNwMzTsCl+FN+FIKwR
         Lz6NHPSBNnZoCrSKhle+4q2PazxCKjejYmJS99QqZ4wBZxCvMfB0eE/n9GIjxkTanxkr
         Sf3KKI/8Zi+xrSdD+NhJ6fy/An+KHG6z5iOYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pO6hebzYNrv+/+pOVUyyRcxmOyAEdYQyaagcCX4YDnU=;
        b=MFMSt5Nah25rc399w0mJx9roulwl64VQTPHS7dYkzNxxu+6kWSkd1+lYdAp3y5mXm5
         nUATEs1UPLBNmKUHvUmYEJTRmGtwx42nT+ChTL2eXkD+Er4QpVV1hVbTvrnVf9KXZMCO
         wxx4zAPGTXdowLaip3xE/6jZXju1lmYujhhEaMa9gFq0H4ixGl0gF6VXEHgsRSVJcT64
         nG2QMsYu7mcK6EMnfDMHmmKZXM4ykm1+/CRY3Aw9hNAH4GjJcfZzTkD7FeB5+gr9N4pK
         mqetqtKV1Rglk+I803Cg2KqVxkItoR216CBeEYIQ4YQp0JghJuqQYrnEF/UaT3VBLKAy
         0HIw==
X-Gm-Message-State: AOAM531cBmMFZLwOHHxHJmA8+0ELaxQiNZoMzsziaTg2F33fKSEwqfe2
        P3NxBfxqgw/SQfd+y63rh+AEYvFapu9VUTYiJWkgcg==
X-Google-Smtp-Source: ABdhPJwgxXesivM1CiIBtnjbk8y13S1s+YjKODrxZccz+Vo9N9qsPGJ7xTp9upiCfdo0ygI/lb/Czfbc978AI6SYupo=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr22343738otg.77.1635295695952;
 Tue, 26 Oct 2021 17:48:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Oct 2021 17:48:15 -0700
MIME-Version: 1.0
In-Reply-To: <YXdsYlLWnjopyMn/@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper> <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper> <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 26 Oct 2021 17:48:15 -0700
Message-ID: <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Rajendra

Quoting Bjorn Andersson (2021-10-25 19:48:02)
> On Mon 25 Oct 15:41 PDT 2021, Stephen Boyd wrote:
>
> >
> > When the binding was introduced I recall we punted on the parent child
> > conversion stuff. One problem at a time. There's also the possibility
> > for a power domain to be parented by multiple power domains so
> > translation tables need to account for that.
> >
>
> But for this case - and below display case - the subdomain (the device's
> power-domain) is just a dumb gate. So there is no translation, the given
> performance_state applies to the parent. Or perhaps such implicitness
> will come back and bite us?

In the gate case I don't see how the implicitness will ever be a
problem.

>
> I don't think we allow a power-domain to be a subdomain of two
> power-domains - and again it's not applicable to USB or display afaict.

Ah maybe. I always confuse power domains and genpd.

>
> > >
> > > > Or we may need to make another part of the OPP binding to indicate the
> > > > relationship between the power domain and the OPP and the parent of
> > > > the power domain.
> > >
> > > I suspect this would be useful if a power-domain provider needs to
> > > translate a performance_state into a different supply-performance_state.
> > > Not sure if we have such case currently; these examples are all an
> > > adjustable power-domain with "gating" subdomains.
> >
> > Even for this case, we should be able to have the GDSC map the on state
> > to some performance state in the parent domain. Maybe we need to add
> > some code to the gdsc.c file to set a performance state on the parent
> > domain when it is turned on. I'm not sure where the value for that perf
> > state comes from. I guess we can hardcode it in the driver for now and
> > if it needs to be multiple values based on the clk frequency we can push
> > it out to an OPP table or something like that.
> >
>
> For the GDSC I believe we only have 1:1 mapping, so implementing
> set_performance_state to just pass that on to the parent might do the
> trick (although I haven't thought this through).
>
> Conceptually I guess this would be like calling clk_set_rate() on a
> clock gate, relying on it being propagated upwards. The problem here is
> that the performance_state is just a "random" integer without a well
> defined unit.
>

Right. Ideally it would be in the core code somehow so that if there
isn't a set_performance_state function we go to the parent or some
special return value from the function says "call it on my parent". The
translation scheme could come later so we can translate the "random"
integer between parent-child domains. At the end of the day the device
driver wants to set a frequency or runtime pm get the device and let the
OPP table or power domain code figure out what the level is supposed to
be.

>
>
> The one case where I believe we talked about having different mapping
> between the performance_state levels was in the relationship between CX
> and MX. But I don't think we ever did anything about that...

Hmm alright. I think there's a constraint but otherwise nobody really
wants to change both at the same time.

> >
> > Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
> > etc. Is the display subsystem an example of different clk frequencies
> > wanting to change the perf state of CX? If so it's a good place to work
> > out the translation scheme for devices that aren't listing the CX power
> > domain in DT.
>
> Yes, the various display components sits in MDSS_GDSC but the opp-tables
> needs to change the performance_state of MDSS_GDSC->parent (i.e. CX or
> MMCX, depending on platform).
>
> As I said, today we hack this by trusting that the base drm/msm driver
> will keep MDSS_GDSC on and listing MMCX (or CX) as power-domain for each
> of these components.
>
>
> So if we solve this, then that seems to directly map to the static case
> for USB as well.
>

Got it. So in this case we could have the various display components
that are in the mdss gdsc domain set their frequency via OPP and then
have that translate to a level in CX or MMCX. How do we parent the power
domains outside of DT? I'm thinking that we'll need to do that if MMCX
is parented by CX or something like that and the drivers for those two
power domains are different. Is it basic string matching?
