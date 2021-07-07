Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4773BE250
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 07:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhGGFGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 01:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhGGFGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 01:06:48 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E128C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 22:04:02 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w74so2009352oiw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZwJ6LzMYt92aA7ipQ1QaHUSOYNKd4HK3usxDJ6K7NKM=;
        b=PGN9NdUnXnCAdb8kuPDg2/8BBx3g2U09UWEkOuU3CoaeWRP2zV9wavZF+QlJHnjCWK
         7HLqF4HNg71I5OGbiu9dLgiu0i8/zjXgOATD3gf8YD8G1vSsat8s7UKoIEq9A1fOAO54
         Sm9M8PbYlkiVOXEC1yQCaW1UpO7ZSUpZ7KDt55DFT03M5jLcvy5pYR4bfU3pMhIb0w/W
         oMTlA97aDAUjTs93SdusWlCB6Uu16surdUd/MIut0z56PbmGlAcy6d8yJYMEDMfpbdp0
         OLv6VJt/T1SyHT9HgxNmgjuSE9LolYJDGSyq3QylDdCsqSEbvRPpWRjGfsRF2+PhKjSY
         cM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZwJ6LzMYt92aA7ipQ1QaHUSOYNKd4HK3usxDJ6K7NKM=;
        b=qvA6t6DeAgRmHHpbaUCw/rez/29JheootgY4EYNWb3OJ0TwhOQbi0BFU2Y/7fHn6Am
         z8NQYpV/WqAeF6FFonZ7qCMVH43wcZf+uisc42wmAaw/6s8L2wnk3zQtXgwlww01Jo6W
         CwJ14MH5tgJwl/EgHxfkooIrMOU+9rAOFlr5YzE+SBJfvJEsC36RyWbmeBTYnyCSv0/O
         5UCuDHZHohJppXNp2Ld54BTaSVh7mQKk4bQ8iDNH1wFmbVJBU4RAcH+5czhFGWvcnRjZ
         TQP+FV+tMQzmw6RyCNjs3ynz+FuJIt6Z8USrru6wnChNTnhzWPDGRXE8Z0bjGjrQKQjD
         iCDQ==
X-Gm-Message-State: AOAM530iehqGo6C2hkmDO56VxRtBQDekSfFW0YLhvMbEHWyUlkQCVDq6
        kOs4PQtCbMO314OByF0StW4iRQ==
X-Google-Smtp-Source: ABdhPJyX3o3IfKJMEmv3UDHct1fG27sWu3pT+IFd99WMQOQwlG2vBE3hZFGg3IT7WSO/FOJ7DDmq7w==
X-Received: by 2002:aca:4b43:: with SMTP id y64mr2905391oia.176.1625634241482;
        Tue, 06 Jul 2021 22:04:01 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r186sm3899058oia.6.2021.07.06.22.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 22:04:00 -0700 (PDT)
Date:   Wed, 7 Jul 2021 00:03:58 -0500
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
Message-ID: <YOU1vv4zSWfe0P7Y@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
 <CAPDyKFpXD3rCmp53LFFYky_xQv9ucofvTezG5qWyDZt427chNQ@mail.gmail.com>
 <CAA8EJpob=TpXiJozac-5sKJzE71ddWRFDj7D2-F=W=a2mgKvxA@mail.gmail.com>
 <CAPDyKFq-vwMchLFb3JvK7B9ZQ9=z-TXzGHUij6CocTR+VmAOqQ@mail.gmail.com>
 <YN4W7vd3Yep+DX3N@yoga>
 <CAPDyKFrPyu6dT_+G3-ivPTLGS0G1kd9Tph_Pi2VP7ycEn3R5AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrPyu6dT_+G3-ivPTLGS0G1kd9Tph_Pi2VP7ycEn3R5AQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 02:23 CDT 2021, Ulf Hansson wrote:

> On Thu, 1 Jul 2021 at 21:26, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 01 Jul 11:58 CDT 2021, Ulf Hansson wrote:
> >
> > > On Thu, 1 Jul 2021 at 18:39, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Thu, 1 Jul 2021 at 19:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > >
> > > > > On Wed, 30 Jun 2021 at 15:31, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On sm8250 dispcc requires MMCX power domain to be powered up before
> > > > > > clock controller's registers become available. For now sm8250 was using
> > > > > > external regulator driven by the power domain to describe this
> > > > > > relationship. Switch into specifying power-domain and required opp-state
> > > > > > directly.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 19 +++++++++++++++++++
> > > > > >  1 file changed, 19 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > > > index 0cdf53f41f84..48d86fb34fa7 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > > > @@ -55,6 +55,16 @@ properties:
> > > > > >    reg:
> > > > > >      maxItems: 1
> > > > > >
> > > > > > +  power-domains:
> > > > > > +    description:
> > > > > > +      A phandle and PM domain specifier for the MMCX power domain.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > >
> > > > > Should you perhaps state that this is a parent domain? Or it isn't?
> > > > >
> > > > > Related to this and because this is a power domain provider, you
> > > > > should probably reference the common power-domain bindings somewhere
> > > > > here. Along the lines of this:
> > > > >
> > > > > - $ref: power-domain.yaml#
> > > > >
> > > > > As an example, you could have a look at
> > > > > Documentation/devicetree/bindings/power/pd-samsung.yaml.
> > > >
> > > > I'll take a look.
> > > >
> > > > >
> > > > > > +  required-opps:
> > > > > > +    description:
> > > > > > +      Performance state to use for MMCX to enable register access.
> > > > > > +    maxItems: 1
> > > > >
> > > > > According to the previous discussions, I was under the assumption that
> > > > > this property belongs to a consumer node rather than in the provider
> > > > > node, no?
> > > >
> > > > It is both a consumer and a provider. It consumes SM8250_MMCX from
> > > > rpmhpd and provides MMSC_GDSC.
> > >
> > > That sounds a bit weird to me.
> > >
> >
> > dispcc is a hardware block powered by MMCX, so it is a consumer of it
> > and needs to control MMCX.
> 
> Right, that sounds reasonable.
> 
> >
> > > In my view and per the common power domain bindings (as pointed to
> > > above): If a power domain provider is a consumer of another power
> > > domain, that per definition means that there is a parent domain
> > > specified.
> > >
> >
> > And in addition to needing MMCX to access the dispcc, the exposed
> > power-domain "MDSS_GDSC" is powered by the same MMCX and as such
> > MDSS_GDSC should be a subdomain of MMCX.
> 
> What do you mean by "exposed"? It sounds like you are saying that
> "MDSS_GDSC" is an artificial power domain, no?
> 
> If that's the case, more exactly, why is it like this?
> 
> My apologies if I bother you with details, but as a maintainer of
> genpd, it is very useful to me to have the complete picture.
> 

The display hardware blocks are powered by the MDSS_GDSC power-domain,
which is a subdomain to the MMCX power domain.

MDSS_GDSC is controlled by registers in the display clock controller
block, which is also powered by the MMCX power domain.

Lastly the MMCX power domain is controlled through the RPMh, using the
rpmhpd driver.



As such, specifying MMCX as the power-domain for the dispcc block and
making the dispcc driver use that same power-domain as parent for the
MDSS_GDSC seems to accurately depict these relationships.

Regards,
Bjorn

> >
> >
> > But what I was trying to say yesterday is that the power-domain property
> > should be sufficient and that we shouldn't need to drive MMCX to a
> > particular performance_state in order to access the registers.
> >
> > Then as clients make votes on clock rates that requires higher
> > performance_state, they would describe this in their opp-tables etc.
> >
> >
> > But without any performance_state requests, pd->corner will in
> > rpmhpd_power_on() be 0 and as such powering on the power-domain won't
> > actually do anything. Similarly dev_pm_genpd_set_performance_state(dev,
> > 0) on an active power-domain from rpmhpd will turn it off.
> 
> Yes, I noticed the patches you posted. Thanks for helping out here!
> 
> >
> >
> > So the reason why Dmitry is adding the required-opps to the binding is
> > to get rpmhpd to actually tell the hardware to turn on the power domain.
> > And I don't think this is in accordance with the framework's
> > expectations.
> 
> I agree!
> 
> >
> > Regards,
> > Bjorn
> 
> Kind regards
> Uffe
