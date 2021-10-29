Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A57443F3D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 02:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhJ2AWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 20:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJ2AWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 20:22:23 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE989C061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:19:55 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so11199036otg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 17:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S95oHAhOZ33aco8y31Nb+6NRNh2mtjVljN3OFxkcnow=;
        b=fX1BpofDBYkMJm/nHKQ/cUp3Hjha7jt39/dgmREdgOf162aSFJ2S7zBKi03yRNvn08
         Ko9TtoEutKgw67cI85dZOO+N3EUFBwI0ajADpskhokfXADAjaBSdHkzFOkC1pGsTCs2r
         9OhE+y3oJQ809aFceeUsafJVgtKTHJln66cdlU66M+KFPuRv7wXnZShfXPtRXKXzzVwJ
         dlOfnFDhXFwkGRLIK4QA+e64LBrWwYNqDdvRDSjbJoh/h8XA20coZDJqlvuYSgIHiuj/
         jdlzm02G4DdmHxXXdGhZ1LssRuEGNC1qXHsqNoHtOrF7wgXu0hXyE20maCGagE+sKXYB
         rmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S95oHAhOZ33aco8y31Nb+6NRNh2mtjVljN3OFxkcnow=;
        b=q+15itpU5C9YzghVofJcYXqqRpGBirTfh0oJyVmWHIGBeWXdag++65Pg3L3JXB/JG5
         XCXDJi7pHKhkwPfyp8IysfpG4iEv8tHo0bYd4pqCJekdjSzKzjayTtxI7axK88kIjbmu
         F0SfE8y8FcVN4Z6KMotdJ7ZV2iUcSzaUqHWQkEb4L7sLnYxFdaal43Pleh6o578VSaMh
         PJR6Yze9zeuIskN6XR63hPlcTnVIC2Wkw1GjnPgu2Cm0M5Ng2c9jI9zVWnZB3HrrZs+L
         fnO/rRA1i2yZ2C/N5uhvUlxPxE637xMcvMByFbe5numohsQSVFfulSEj5vhcAQJZRxJZ
         AgCA==
X-Gm-Message-State: AOAM531O1Z5jxrEe1XdXiWx+LCew4HNXNPy6cAzLzw81x8s5M/S8lqD1
        8MYm95a8F5iSPt9469NUBjEDQA==
X-Google-Smtp-Source: ABdhPJxMlQ/9QSZzhNsDewrvfItL/HF0LUBwXPfKLuKB25kcyriC5qAcU/7uLU1QT1t67f/kFjD/rw==
X-Received: by 2002:a05:6830:3114:: with SMTP id b20mr6291033ots.120.1635466793532;
        Thu, 28 Oct 2021 17:19:53 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 64sm1354758otm.37.2021.10.28.17.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 17:19:52 -0700 (PDT)
Date:   Thu, 28 Oct 2021 17:21:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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
Message-ID: <YXs+lIizc5UD7Qce@ripper>
References: <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
 <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
 <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
 <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org>
 <YXrVevUlCJJtbpLi@ripper>
 <CAE-0n50qisTv95PJjMXsOT97B3ZUhUV_TtpSHir7jq-vjTW9mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50qisTv95PJjMXsOT97B3ZUhUV_TtpSHir7jq-vjTW9mw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Oct 13:04 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-28 09:53:14)
> > On Thu 28 Oct 03:46 PDT 2021, Rajendra Nayak wrote:
> >
> > >
> > > On 10/28/2021 4:05 PM, Ulf Hansson wrote:
> > > > [...]
> > > >
> > > > > > > > Got it. So in this case we could have the various display components
> > > > > > > > that are in the mdss gdsc domain set their frequency via OPP and then
> > > > > > > > have that translate to a level in CX or MMCX. How do we parent the power
> > > > > > > > domains outside of DT? I'm thinking that we'll need to do that if MMCX
> > > > > > > > is parented by CX or something like that and the drivers for those two
> > > > > > > > power domains are different. Is it basic string matching?
> > > > > > >
> > > > > > > In one way or another we need to invoke pm_genpd_add_subdomain() to link
> > > > > > > the two power-domains (actually genpds) together, like what was done in
> > > > > > > 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
> > > > > > >
> > > > > > > In the case of MMCX and CX, my impression of the documentation is that
> > > > > > > they are independent - but if we need to express that CX is parent of
> > > > > > > MMCX, they are both provided by rpmhpd which already supports this by
> > > > > > > just specifying .parent on mmcx to point to cx.
> > > > > >
> > > > > > I was trying to follow the discussion, but it turned out to be a bit
> > > > > > complicated to catch up and answer all things. In any case, let me
> > > > > > just add a few overall comments, perhaps that can help to move things
> > > > > > forward.
> > > > > >
> > > > > > First, one domain can have two parent domains. Both from DT and from
> > > > > > genpd point of view, just to make this clear.
> > > > > >
> > > > > > Although, it certainly looks questionable to me, to hook up the USB
> > > > > > device to two separate power domains, one to control power and one to
> > > > > > control performance. Especially, if it's really the same piece of HW
> > > > > > that is managing both things.
> > > > > []..
> > > > > > Additionally, if it's correct to model
> > > > > > the USB GDSC power domain as a child to the CX power domain from HW
> > > > > > point of view, we should likely do that.
> > > > >
> > > > > I think this would still require a few things in genpd, since
> > > > > CX and USB GDSC are power domains from different providers.
> > > > > Perhaps a pm_genpd_add_subdomain_by_name()?
> > > > >
> > > >
> > > > I think of_genpd_add_subdomain() should help to address this. No?
> > >
> > > We only describe the provider nodes in DT and not the individual power domains.
> > > For instance GCC is the power domain provider which is in DT, and USB GDSC is one
> > > of the many power domains it supports, similarly RPMHPD is the provider node in
> > > DT and CX is one of the many power domains it supports.
> > > So we would need some non-DT way of hooking up power domains from two different
> > > providers as parent/child.
> > >
> >
> > See 266e5cf39a0f ("arm64: dts: qcom: sm8250: remove mmcx regulator") and
> > 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support")
> >
> > MMCX is declared as power-domain for the dispcc (which is correct
> > in itself) and the gdsc code will register GDSCs as subdomains of
> > the same power-domain.
> >
> >
> > To ensure this code path is invoked the clock driver itself needed this
> > 6158b94ec807 ("clk: qcom: dispcc-sm8250: use runtime PM for the clock
> > controller")
> >
> > So at least in theory, considering only USB the minimum would be to
> > pm_runtime_enable() gcc-7280 and add power-domains = <CX> to the gcc
> > node.
> 
> I'm wary of runtime PM enabling the main clock controller.

I thought of that as well after sending my last reply. Seems like a good
idea if we can avoid it.

> Does it work?
> 

Had to test it, but specifying power-domain = <CX> in &gcc and adding
the required-opp to the usb node causes CX to enter the given
performance_state.

So it boots just fine and I didn't pm_runtime_enable() gcc, so
gdsc_pm_runtime_get() will just return.

That said, I don't grasp all the details happening under the hood, so I
might be missing some details that will bite us when it comes to suspend
or power collapse?

> I can understand that we need to get the CX power domain pointer into
> the gdsc code somehow, and thus setting the power domain to CX in DT is
> a way to do that. Why do we need to runtime pm enable the clk controller
> though?

In the case of dispcc we need it because accessing the clock registers
without it crashes the board.

> Just to make genpd_dev_pm_attach_by_name() hand us a genpd?

dispcc has a single power-domain so ((struct device*)dispcc)->pm_domain
will automatically be filled out.

> I
> see in commit 3652265514f5 that we also use it to have gdsc_enable()
> enable the parent domain by using runtime PM to get the clk controller
> and enable the parent domain. That is convoluted.
> 

The purpose of the gdsc_pm_runtime_get() call from gdsc_enable() is to
ensure that the clock controller is powered up, so that we can access
the registers - just as you do in clk_pm_runtime_get()

So regardless of us changing how the subdomains are setup I think this
part should stay, to work for the clock controllers that need to ensure
their registers are accessible.

> I'd prefer if we could list that the parent domain is in the registering
> device's power-domain index number, ala clk_parent_data, so that we
> don't have to make the power domain provider into a consumer itself.
> This would clean up the gdsc code so that it doesn't have to go from the
> provider's genpd enable through the provider device to the parent power
> domain enable. Obviously it works but it's hard to follow.
> 

Giving it another look I think the current implementation in gdsc.c will
enable the parent power-domain twice; once in the core because of the
dependency from the subdomain and one by the device itself.

That said, I do find this technically correct for the dispcc case -
MDSS_GDSC has a vote and dispcc has another vote.


I don't have any objections to replacing the current
pd_to_genpd(dev->pm_domain) in gdsc's call to pm_genpd_add_subdomain()
with something carrying information from the clock driver indicating
which of the multiple power domains the gdsc should be parented by.

> >
> >
> > The "problem" I described would be if there are GDSCs that are
> > subdomains of MX - which I've seen hinted in some documentation. If so
> > we should to specify both CX and MX as power-domains for &gcc and the
> > gdsc implementation needs to be extended to allow us to select between
> > the two.
> >
> > For this I believe a combination of genpd_dev_pm_attach_by_name() and
> > of_genpd_add_subdomain() would do the trick.
> >
> > That is, if there actually are GDSCs exposed by gcc that are not
> > subdomains of CX - otherwise none of this is needed.
> >
> 
> Rajendra can correct me, but I believe every device that has a GDSC
> gating power to it is actually inside CX and MX. The CX is for digital
> logic (think registers and interrupts, fetching data from the bus, etc.)
> and the MX is for memories (think flops that retain state of registers
> and internal state of the device). In more modern SoCs they've split
> multimedia (MMCX) and GPU (gpu_gx) out of CX and supply it with a
> different voltage supply and pin on the SoC package. Historically, MX
> voltage has been maintained by the power manager, RPM or RPMh, so that
> when CX is changed, MX >= CX constraints are maintained. I think that
> also changed over time though and MX had to be controlled in addition to
> CX on some firmwares. I recall we had some constraint code that bumped
> up MX whenever CX got higher than it. Having to control both led to more
> round trip time when changing clk rates though so it got combined on the
> backend so that only one message had to be sent to the RPM.
> 

That would explain the current hack(?) in rpmhpd.c which states that mx
is the parent of cx - which I presume is there to say that "mx needs to
be on when cx is on".

As a side effect of all this magic though this means that my vote from
usb is actually applied to MX as well (as would it in Sandeep's original
proposal)...

> We probably ought to list both CX and MX as power-domains on the clk
> nodes that provide GDSCs to match the hardware. Then we need to know
> which power domain each GDSC wants to set a minimum level on. That would
> be the most correct way to do it.

As we describe multiple power-domains we won't get dev->pm_domain filled
out for us, so we need to genpd_dev_pm_attach_by_{id,name}() to get the
struct devices for each power-domain and then use those when setting up
the subdomain for each gdsc.

But per the current implementation (with the CX votes trickling down to
MX as well) we should be able to just grab genpd_dev_pm_attach_by_id(0)
in gdsc_register() and use that if dev->pm_domain isn't set - at least
until we explicitly need to vote for MX only...


Let's see what Rajendra says about the requirements here.

Regards,
Bjorn
