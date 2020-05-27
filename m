Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A6F1E4FB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 22:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgE0U4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 16:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgE0U4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 16:56:17 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194E5C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590612974;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NrTOSXu4SOQ1gOKsg7PYryvgB0102LBe+CTBKjN5pqs=;
        b=jrcopy1I151lntQIb/25d/p/7LqjzkBi+A4B9hFC97tnE5qfe//bmyrEJR8n+wG3ER
        oXbkTBlJA14j5pNGhf0X9b+Sy4dSSKCSmXWd2oV/w5D2Z0W9uYAK9/piJfaNo4hjHNcr
        bf8MoUvNp+1F340WIUTg3P2Qp/Vz7Ol+2gbVgUqd3jbHJ/SwdxArpqcsvmD7V/9x0VDA
        EkD6NDroJh8leVE+hqh4ObPJVARcS4eMbn1YjifkAhpu4z0iCUkaCWlgPEpVCYc7uXBv
        zlFi/qOo61nFNAYoHUpA/7L2zo56gU85fCvq4Fi1RdGy7mGsO4lrYNeUwlAlQ1AbWrys
        rXTQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4RKuDpYc
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 27 May 2020 22:56:13 +0200 (CEST)
Date:   Wed, 27 May 2020 22:56:07 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200527205518.GA8254@gerhold.net>
References: <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
 <20200527120441.GA4166@gerhold.net>
 <20200527125919.GA16363@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527125919.GA16363@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 02:59:19PM +0200, Niklas Cassel wrote:
> On Wed, May 27, 2020 at 02:04:52PM +0200, Stephan Gerhold wrote:
> > > I guess what you really want is two new optional callbacks in
> > > dev_pm_opp_set_rate(), one before _generic_set_opp_regulator() and one
> > > after, where you could do the MEMACC thing.
> > > 
> > > The callbacks need to have a parameter that tells if we are scaling down
> > > or up.
> > > 
> > > Or, if Viresh doesn't like new function pointers, create a new
> > > OPP_EVENT_* that you can register for, and in that callback you do what
> > > you need.
> > > 
> > > Or, maybe you can even use the existing CPUFREQ_TRANSITION_NOTIFIER,
> > > with CPUFREQ_PRECHANGE / CPUFREQ_POSTCHANGE, however, I'm not sure
> > > how nicely they play when you are using the OPP library.
> > > 
> > 
> > I'm not sure. Overall all of this doesn't really sound like it is going
> > to make all this easier to understand (from looking at the device tree).
> > We then have required-opps for VDD_MX, and CPR (which isn't really a
> > power domain), and something entirely different for MEMACC (which like
> > CPR, isn't really a power domain).
> > 
> > I don't know, right now this mixture of different approaches sounds
> > rather complicated (and confusing) to me...
> 
> You are going to need performance states where it is needed,
> e.g. for controlling MX (as it is a power domain).
> For performance states, you using the required-opps DT property.
> 
> My 50 cents is just to not use it for something that is not
> a power domain, e.g. MEMACC.
> 

I agree.

> > 
> > Just to throw another idea in the room: there seems to be a set_opp()
> > callback already in the OPP table, which bypasses the code that
> > updates clock and regulators (see ti-opp-supply.c). Actually if I'm
> > reading this correctly ti-opp-supply seems to implement adaptive voltage
> > scaling similar to CPR with it. Seemingly we have two different solutions
> > for the same concept now:
> > 
> >   - CPR implements a power domain provider (even though it's not really
> >     a power domain since it has only one consumer)
> >   - ti-opp-supply implements this with the set_opp() callback
> 
> Yes, and there are more ways to implement AVS, see e.g.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=25cb20a212a1f989385dfe23230817e69c62bee5
> 
> Which probably would have been a better fit for CPR,
> if it were to be designed today.
> 

Would this actually work if you update the voltage of the current OPP?
Looking at the qcom-cpr code the voltage is dynamically changed when
receiving IRQs. I would say with that function you can only change the
voltage when switching to that OPP the next time. Maybe I'm wrong though.

Otherwise that's pretty nice, because the setup is very similar with or
without CPR (since the regulator is still managed by the OPP core).

> > 
> > In general I think this looks pretty nice - we don't duplicate the full
> > cpufreq driver, but have control about the order
> > regulators/clocks/power domains etc are changed.
> > 
> > I think something like this would fit quite well for my case
> > (scaling MX, APC and MEMACC without CPR). However, not sure how it would
> > integrate with the existing CPR driver at some point.
> 
> You care about how to do DVFS without AVS (CPR).
> 
> Why do you worry about how it will look when, if ever,
> you transition to full AVS (CPR)?
> 

I mean, CPR is arguably the better solution on long term.
I doubt it will be me who will enable it for MSM8916 (mainly for lack of
understanding of the whole scaling formulas etc), but IMO it would be
worth to at least consider how to switch in the future.

> If the CPR driver is not changed, which I doubt, you will simply change
> the device tree to remove the cpu-supply regulator and move it into the
> new CPR DT node.
> 
> Old device trees will still use your DVFS solution, new device
> trees will use the CPR DT node and will use the AVS solution.
> 

I think my concern is essentially that I would duplicate the MEMACC code
into a new driver utilizing .set_opp() - and to keep backwards
compatibility we would need to keep that duplication forever.

The MEMACC scaling isn't all that complicated, but overall I would
prefer to avoid introducing duplication in the first place.

Also: If full CPR ever happens we would be basically back
to one part of the current discussion: specifying two "required-opps"
MX and CPR (= APC + MEMACC) would result in the wrong order
when scaling up/down.

But maybe I just worry too much?

Thanks,
Stephan
