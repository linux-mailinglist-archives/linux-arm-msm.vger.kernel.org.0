Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4843E93D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhJ1UGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhJ1UGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:06:42 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254B1C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:04:15 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o4so9913280oia.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mGZjgjZw5bgu9Y9bDDOK9kEbyB9lrsZgB8HmWSURgEU=;
        b=h74RVVRdtZoQE6vVw7yh+jKb8TrPN3jfPZlrvxiqM46xXjYUUXKYWa0DQpgpjvcqq6
         YXrXvNVbb3YhYEBJn75YvLiUpsqehJQfFZTZSLRQakl7Y346dbR5mpiFYi6iVPoLlyMz
         A19DIVxxgQ3HV9qcYkjRHMoJiKjhKxigGDpBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mGZjgjZw5bgu9Y9bDDOK9kEbyB9lrsZgB8HmWSURgEU=;
        b=r3QiPZL4CmPqHSIbPA+SrLVlYW1HRZJhK7AZWeIzJuJOpmrr9D+yAFyQ7pUnKO3avr
         ne3ZbEK3oskSM1gqa2cyqY47gWiY0IkfcwxOcTpI+QKNyPK5miO63+uBALecZpu3yTUC
         TgKLky8hqE5aytEH9rLyS+Vwmqp9JiszQP9r0TZSZzXTI6MPFpKVjHiHUAaMxFLgwCk7
         AeB7Yj94XO4CN3HiG3iUhn+2plkcTUXffu02wngzx/bmT3/KBsMFMTnRGdqNg6U8EhfD
         oy1OSyGer8Zizo6evKGq1if6zTV8JS+NCM+x4mFYIwAqlZmVid6qZoeowfoJTdy7MJTE
         6iOg==
X-Gm-Message-State: AOAM531LeTwUVh0ig8o1r4rDNiR3hRzBCQDgWhm5lS+5iVkZeZnL/kSO
        ib4WkJM8wWPityQNghEawCI3esjbqqnTc3xf/GPpLQ==
X-Google-Smtp-Source: ABdhPJy2q+HHUz63qgXfWXtSdNlPEY6/0WwYC4qaLsX53/faPf0EtIXESM0UiORWnIVEMJ7X8MEPSlBUU0d3O3yRZ1k=
X-Received: by 2002:a05:6808:2128:: with SMTP id r40mr2991551oiw.164.1635451454353;
 Thu, 28 Oct 2021 13:04:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 13:04:13 -0700
MIME-Version: 1.0
In-Reply-To: <YXrVevUlCJJtbpLi@ripper>
References: <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper> <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga> <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org> <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
 <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org> <YXrVevUlCJJtbpLi@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 13:04:13 -0700
Message-ID: <CAE-0n50qisTv95PJjMXsOT97B3ZUhUV_TtpSHir7jq-vjTW9mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
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
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-28 09:53:14)
> On Thu 28 Oct 03:46 PDT 2021, Rajendra Nayak wrote:
>
> >
> > On 10/28/2021 4:05 PM, Ulf Hansson wrote:
> > > [...]
> > >
> > > > > > > Got it. So in this case we could have the various display components
> > > > > > > that are in the mdss gdsc domain set their frequency via OPP and then
> > > > > > > have that translate to a level in CX or MMCX. How do we parent the power
> > > > > > > domains outside of DT? I'm thinking that we'll need to do that if MMCX
> > > > > > > is parented by CX or something like that and the drivers for those two
> > > > > > > power domains are different. Is it basic string matching?
> > > > > >
> > > > > > In one way or another we need to invoke pm_genpd_add_subdomain() to link
> > > > > > the two power-domains (actually genpds) together, like what was done in
> > > > > > 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
> > > > > >
> > > > > > In the case of MMCX and CX, my impression of the documentation is that
> > > > > > they are independent - but if we need to express that CX is parent of
> > > > > > MMCX, they are both provided by rpmhpd which already supports this by
> > > > > > just specifying .parent on mmcx to point to cx.
> > > > >
> > > > > I was trying to follow the discussion, but it turned out to be a bit
> > > > > complicated to catch up and answer all things. In any case, let me
> > > > > just add a few overall comments, perhaps that can help to move things
> > > > > forward.
> > > > >
> > > > > First, one domain can have two parent domains. Both from DT and from
> > > > > genpd point of view, just to make this clear.
> > > > >
> > > > > Although, it certainly looks questionable to me, to hook up the USB
> > > > > device to two separate power domains, one to control power and one to
> > > > > control performance. Especially, if it's really the same piece of HW
> > > > > that is managing both things.
> > > > []..
> > > > > Additionally, if it's correct to model
> > > > > the USB GDSC power domain as a child to the CX power domain from HW
> > > > > point of view, we should likely do that.
> > > >
> > > > I think this would still require a few things in genpd, since
> > > > CX and USB GDSC are power domains from different providers.
> > > > Perhaps a pm_genpd_add_subdomain_by_name()?
> > > >
> > >
> > > I think of_genpd_add_subdomain() should help to address this. No?
> >
> > We only describe the provider nodes in DT and not the individual power domains.
> > For instance GCC is the power domain provider which is in DT, and USB GDSC is one
> > of the many power domains it supports, similarly RPMHPD is the provider node in
> > DT and CX is one of the many power domains it supports.
> > So we would need some non-DT way of hooking up power domains from two different
> > providers as parent/child.
> >
>
> See 266e5cf39a0f ("arm64: dts: qcom: sm8250: remove mmcx regulator") and
> 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support")
>
> MMCX is declared as power-domain for the dispcc (which is correct
> in itself) and the gdsc code will register GDSCs as subdomains of
> the same power-domain.
>
>
> To ensure this code path is invoked the clock driver itself needed this
> 6158b94ec807 ("clk: qcom: dispcc-sm8250: use runtime PM for the clock
> controller")
>
> So at least in theory, considering only USB the minimum would be to
> pm_runtime_enable() gcc-7280 and add power-domains = <CX> to the gcc
> node.

I'm wary of runtime PM enabling the main clock controller. Does it work?

I can understand that we need to get the CX power domain pointer into
the gdsc code somehow, and thus setting the power domain to CX in DT is
a way to do that. Why do we need to runtime pm enable the clk controller
though? Just to make genpd_dev_pm_attach_by_name() hand us a genpd? I
see in commit 3652265514f5 that we also use it to have gdsc_enable()
enable the parent domain by using runtime PM to get the clk controller
and enable the parent domain. That is convoluted.

I'd prefer if we could list that the parent domain is in the registering
device's power-domain index number, ala clk_parent_data, so that we
don't have to make the power domain provider into a consumer itself.
This would clean up the gdsc code so that it doesn't have to go from the
provider's genpd enable through the provider device to the parent power
domain enable. Obviously it works but it's hard to follow.

>
>
> The "problem" I described would be if there are GDSCs that are
> subdomains of MX - which I've seen hinted in some documentation. If so
> we should to specify both CX and MX as power-domains for &gcc and the
> gdsc implementation needs to be extended to allow us to select between
> the two.
>
> For this I believe a combination of genpd_dev_pm_attach_by_name() and
> of_genpd_add_subdomain() would do the trick.
>
> That is, if there actually are GDSCs exposed by gcc that are not
> subdomains of CX - otherwise none of this is needed.
>

Rajendra can correct me, but I believe every device that has a GDSC
gating power to it is actually inside CX and MX. The CX is for digital
logic (think registers and interrupts, fetching data from the bus, etc.)
and the MX is for memories (think flops that retain state of registers
and internal state of the device). In more modern SoCs they've split
multimedia (MMCX) and GPU (gpu_gx) out of CX and supply it with a
different voltage supply and pin on the SoC package. Historically, MX
voltage has been maintained by the power manager, RPM or RPMh, so that
when CX is changed, MX >= CX constraints are maintained. I think that
also changed over time though and MX had to be controlled in addition to
CX on some firmwares. I recall we had some constraint code that bumped
up MX whenever CX got higher than it. Having to control both led to more
round trip time when changing clk rates though so it got combined on the
backend so that only one message had to be sent to the RPM.

We probably ought to list both CX and MX as power-domains on the clk
nodes that provide GDSCs to match the hardware. Then we need to know
which power domain each GDSC wants to set a minimum level on. That would
be the most correct way to do it.
