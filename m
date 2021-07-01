Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480D83B968C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 21:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhGATav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 15:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbhGAT3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 15:29:15 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DB8C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 12:26:41 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t3so8575814oic.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jul 2021 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kgry+NHhIXRto0lihG09dvKrpOIpSuRCcDkQYUAh4RI=;
        b=aizhnnYOcdskMEQ6r7sUhkeD59cflOqSzk9alJZHPv3y5LbR1/JWMIX51EAoC3Q6ya
         T/1dJ9/FcXOXLZC9bgH1vVyLDDXla90OgKB4eygUvPEaddF7R/i311qvgRyaCIj3mH/D
         UU1CdRZiiz8/tnHaMJQqP7qTCNTmp+cqjQBBqCiv6j5RpkjuLeNjfCYFeR5GoHElPWhF
         u72S5BFduhL0HeBtjtkrN5E15Kt4cZH+d8HtNNB1CHW9w0yqkEteCl6REChwMY+rgDWj
         SjUs9dSJpxkkFAEP1yvxhhjyyQlyZG1BrGdyH7Ms6GzJgo0wPAryxK1ZGl+4f2W/+lIY
         mezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kgry+NHhIXRto0lihG09dvKrpOIpSuRCcDkQYUAh4RI=;
        b=QVjQaseYfOTTHD2fhE8N0iMU/8Uy3zYCVS/R7ixIoCRlIFyJeBijk4tS8UaTwiXbxJ
         I40pz7vl7HcTxVhqQHQW0A86dP/FJ/i50LsOC9jm0u7XMfHpOZhreBNfHJ/pgPecyIqj
         DXueUIpIWQX/H2ZtdDa/amMfoS8blishKTf62Uv0rJR/hvYSBF2ISWHdDHY1fsGbSPCw
         ALk/Afh4uKF2XaEgDxViBv43+aYPzF7As6uuNP4+rxLNRwfPa3X3NbaU8dJYObTNOIxy
         IcZuyuiKqkCGHRitmcUty4c2XwYQQZHa59TKyiiidFRYGxmKBREZzK43cosQp7dMDS3z
         9+dQ==
X-Gm-Message-State: AOAM530JLPaMpGjP1B0bMYV50T3m0CY3PrIg4MOOlAR0R4Hftfjp9MQN
        txIlJfNoy/BDqWdsNQ3PAy5PLA==
X-Google-Smtp-Source: ABdhPJw8dFMNFHOqRpqbt6qTcwP5OdglQZTYNAI/4mcxv9pX4SSp3kexHozFx6rQg5fYNi9NVdJGOw==
X-Received: by 2002:aca:d0c:: with SMTP id 12mr2441231oin.62.1625167601087;
        Thu, 01 Jul 2021 12:26:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n65sm129311ota.37.2021.07.01.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 12:26:40 -0700 (PDT)
Date:   Thu, 1 Jul 2021 14:26:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx
 power domain
Message-ID: <YN4W7vd3Yep+DX3N@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
 <CAPDyKFpXD3rCmp53LFFYky_xQv9ucofvTezG5qWyDZt427chNQ@mail.gmail.com>
 <CAA8EJpob=TpXiJozac-5sKJzE71ddWRFDj7D2-F=W=a2mgKvxA@mail.gmail.com>
 <CAPDyKFq-vwMchLFb3JvK7B9ZQ9=z-TXzGHUij6CocTR+VmAOqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq-vwMchLFb3JvK7B9ZQ9=z-TXzGHUij6CocTR+VmAOqQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 01 Jul 11:58 CDT 2021, Ulf Hansson wrote:

> On Thu, 1 Jul 2021 at 18:39, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 1 Jul 2021 at 19:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Wed, 30 Jun 2021 at 15:31, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On sm8250 dispcc requires MMCX power domain to be powered up before
> > > > clock controller's registers become available. For now sm8250 was using
> > > > external regulator driven by the power domain to describe this
> > > > relationship. Switch into specifying power-domain and required opp-state
> > > > directly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > index 0cdf53f41f84..48d86fb34fa7 100644
> > > > --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > @@ -55,6 +55,16 @@ properties:
> > > >    reg:
> > > >      maxItems: 1
> > > >
> > > > +  power-domains:
> > > > +    description:
> > > > +      A phandle and PM domain specifier for the MMCX power domain.
> > > > +    maxItems: 1
> > > > +
> > >
> > > Should you perhaps state that this is a parent domain? Or it isn't?
> > >
> > > Related to this and because this is a power domain provider, you
> > > should probably reference the common power-domain bindings somewhere
> > > here. Along the lines of this:
> > >
> > > - $ref: power-domain.yaml#
> > >
> > > As an example, you could have a look at
> > > Documentation/devicetree/bindings/power/pd-samsung.yaml.
> >
> > I'll take a look.
> >
> > >
> > > > +  required-opps:
> > > > +    description:
> > > > +      Performance state to use for MMCX to enable register access.
> > > > +    maxItems: 1
> > >
> > > According to the previous discussions, I was under the assumption that
> > > this property belongs to a consumer node rather than in the provider
> > > node, no?
> >
> > It is both a consumer and a provider. It consumes SM8250_MMCX from
> > rpmhpd and provides MMSC_GDSC.
> 
> That sounds a bit weird to me.
> 

dispcc is a hardware block powered by MMCX, so it is a consumer of it
and needs to control MMCX.

> In my view and per the common power domain bindings (as pointed to
> above): If a power domain provider is a consumer of another power
> domain, that per definition means that there is a parent domain
> specified.
> 

And in addition to needing MMCX to access the dispcc, the exposed
power-domain "MDSS_GDSC" is powered by the same MMCX and as such
MDSS_GDSC should be a subdomain of MMCX.


But what I was trying to say yesterday is that the power-domain property
should be sufficient and that we shouldn't need to drive MMCX to a
particular performance_state in order to access the registers.

Then as clients make votes on clock rates that requires higher
performance_state, they would describe this in their opp-tables etc.


But without any performance_state requests, pd->corner will in
rpmhpd_power_on() be 0 and as such powering on the power-domain won't
actually do anything. Similarly dev_pm_genpd_set_performance_state(dev,
0) on an active power-domain from rpmhpd will turn it off.


So the reason why Dmitry is adding the required-opps to the binding is
to get rpmhpd to actually tell the hardware to turn on the power domain.
And I don't think this is in accordance with the framework's
expectations.

Regards,
Bjorn
