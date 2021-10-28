Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790DF43E69D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhJ1Qxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhJ1Qxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:53:52 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75526C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:51:25 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id y207so9111529oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vdcieApq76aVwV7YeMbL8svFqnVx22XOBF/ZRhqhdrw=;
        b=VmAzlfQViSU8L2QzalW4BxxyO3g0UOqJWS98/kME2IOfJlFAK1uyLIMYdqNHwB4J3Q
         tk/T4YqeIUhBk14pYTxaqxaYliGAPfRs4B7iKO3BWERKdjJzRSY/wdOSk/rZBF6ZPKed
         QiN+Lqj3HC74T4frOj4auTGqAafFJ4KVxg445qaLRQkDIW8MEQ1qREhUkO0c+llAqgK9
         0uNIvg1RAiBhIvvnVWcDKMrrG54qz3etlmFfWRquIwUpyACrGtpXgw7LdJc93XksOYtx
         XW2t8kOKZLhJQ81wjMAvsheSde6OVDVyEhSjeXPKh3gRV0YmSwbv1fMqZqXbebUu54ZS
         rvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vdcieApq76aVwV7YeMbL8svFqnVx22XOBF/ZRhqhdrw=;
        b=yr63eg+FXIXhpeZ2bpXEkAXcfiDHy63WaEHSvW5W242dtlqb48J+RRDaN40s7y6Dir
         7nT/gTgkQntRN2a5ZiA1i1EvIjHy6DT1bVcDi/Gs6DtAGG9n69pbmXvWSUew21QlKMWj
         imCALJmsuBz4U3LTFAMkhL8MneZRnmwODr/kF9gvHCt4GpRTaNJq2sKLRAWI+wJBfZmo
         tDo6Gz/DV2pu3QgXG0pLlb+9tWRP72MWnFNo06ABnpCTgir5mvD2q9f2HsbpXEihC4vQ
         Sgeu03tQ6gdnJw1OePNVAu6vvpsRxMphtQZogjSiCE3MpDkRs0uX6VwZ5Naa9Tg8U7N2
         +KcA==
X-Gm-Message-State: AOAM531UREPJFubGHy6yVFIXcf5sAjP1Fwam9i7A5FWDD30HlAjjIsPm
        p+fwIpWRdv6v0L6M6x/45+pZ5A==
X-Google-Smtp-Source: ABdhPJxFgbLyfR/ke3FH70Vv9T+iJrawjEp7Pk+BsCSCkyiKAoFyC4dXUhGH3nTTI7DWi8fkZYMzig==
X-Received: by 2002:a05:6808:171c:: with SMTP id bc28mr9424798oib.18.1635439884570;
        Thu, 28 Oct 2021 09:51:24 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q15sm1178672otm.15.2021.10.28.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:51:24 -0700 (PDT)
Date:   Thu, 28 Oct 2021 09:53:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
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
Message-ID: <YXrVevUlCJJtbpLi@ripper>
References: <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper>
 <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga>
 <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
 <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
 <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e32a59e2-0d8b-3338-5963-81ea07a709ef@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Oct 03:46 PDT 2021, Rajendra Nayak wrote:

> 
> On 10/28/2021 4:05 PM, Ulf Hansson wrote:
> > [...]
> > 
> > > > > > Got it. So in this case we could have the various display components
> > > > > > that are in the mdss gdsc domain set their frequency via OPP and then
> > > > > > have that translate to a level in CX or MMCX. How do we parent the power
> > > > > > domains outside of DT? I'm thinking that we'll need to do that if MMCX
> > > > > > is parented by CX or something like that and the drivers for those two
> > > > > > power domains are different. Is it basic string matching?
> > > > > 
> > > > > In one way or another we need to invoke pm_genpd_add_subdomain() to link
> > > > > the two power-domains (actually genpds) together, like what was done in
> > > > > 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
> > > > > 
> > > > > In the case of MMCX and CX, my impression of the documentation is that
> > > > > they are independent - but if we need to express that CX is parent of
> > > > > MMCX, they are both provided by rpmhpd which already supports this by
> > > > > just specifying .parent on mmcx to point to cx.
> > > > 
> > > > I was trying to follow the discussion, but it turned out to be a bit
> > > > complicated to catch up and answer all things. In any case, let me
> > > > just add a few overall comments, perhaps that can help to move things
> > > > forward.
> > > > 
> > > > First, one domain can have two parent domains. Both from DT and from
> > > > genpd point of view, just to make this clear.
> > > > 
> > > > Although, it certainly looks questionable to me, to hook up the USB
> > > > device to two separate power domains, one to control power and one to
> > > > control performance. Especially, if it's really the same piece of HW
> > > > that is managing both things.
> > > []..
> > > > Additionally, if it's correct to model
> > > > the USB GDSC power domain as a child to the CX power domain from HW
> > > > point of view, we should likely do that.
> > > 
> > > I think this would still require a few things in genpd, since
> > > CX and USB GDSC are power domains from different providers.
> > > Perhaps a pm_genpd_add_subdomain_by_name()?
> > > 
> > 
> > I think of_genpd_add_subdomain() should help to address this. No?
> 
> We only describe the provider nodes in DT and not the individual power domains.
> For instance GCC is the power domain provider which is in DT, and USB GDSC is one
> of the many power domains it supports, similarly RPMHPD is the provider node in
> DT and CX is one of the many power domains it supports.
> So we would need some non-DT way of hooking up power domains from two different
> providers as parent/child.
> 

See 266e5cf39a0f ("arm64: dts: qcom: sm8250: remove mmcx regulator") and
3652265514f5 ("clk: qcom: gdsc: enable optional power domain support")

MMCX is declared as power-domain for the dispcc (which is correct
in itself) and the gdsc code will register GDSCs as subdomains of
the same power-domain.


To ensure this code path is invoked the clock driver itself needed this
6158b94ec807 ("clk: qcom: dispcc-sm8250: use runtime PM for the clock
controller")

So at least in theory, considering only USB the minimum would be to
pm_runtime_enable() gcc-7280 and add power-domains = <CX> to the gcc
node.


The "problem" I described would be if there are GDSCs that are
subdomains of MX - which I've seen hinted in some documentation. If so
we should to specify both CX and MX as power-domains for &gcc and the
gdsc implementation needs to be extended to allow us to select between
the two.

For this I believe a combination of genpd_dev_pm_attach_by_name() and
of_genpd_add_subdomain() would do the trick.

That is, if there actually are GDSCs exposed by gcc that are not
subdomains of CX - otherwise none of this is needed.

Regards,
Bjorn
