Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32F61E4137
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 14:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgE0MFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 08:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgE0MFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 08:05:08 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8FCC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590581105;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p67yzbFdbZRdoO5Poqs6dMO4MA5JS9StMeCLjDdfvrg=;
        b=WfeERJTFnoDpmwJGsRG1uHxP4yN8XyDhpxpfPh14crjd8YtUL6MIOlnlYU37bWoQbE
        4DtjV7+R4XC14jzBmbhYlNDiGBxlfjaRONbMz9n7mOEuULESs30LljSV9ZtNw2Vsk4nk
        1z1oGRx29xBAEAXHQu3S7cP/iOA77PCO08yDDNDalWZeMpw/d+ucdZAGs9nvRmzVHICx
        AZJur98ZH0vogXUWQXEf3A1R43uO0UBuXDtQN4kRxplv7r9CUAL9JHPG+//KZ6uGNb0f
        KhpflEwdIwLYHKody7e/xFCNkKTYNAPx4uSmzg+nTbR34s520WX5/r2UcHMwHWmlnBAP
        bpJA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4RC54lkS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 27 May 2020 14:05:04 +0200 (CEST)
Date:   Wed, 27 May 2020 14:04:52 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200527120441.GA4166@gerhold.net>
References: <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527103921.GB9977@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Cc Viresh (should have already done this earlier :) )

On Wed, May 27, 2020 at 12:39:21PM +0200, Niklas Cassel wrote:
> On Tue, May 26, 2020 at 10:54:03PM +0200, Stephan Gerhold wrote:
> > Speaking of the current solution, I also have to say that (IMO) the
> > device tree binding for "required-opps" is rather confusing
> > and potentially misleading.
> > 
> > e.g. for VDD_MX scaling I use
> > 
> > 	required-opps = <&rpmpd_opp_nom>;
> > 
> > but looking at just the OPP table absolutely nothing tells me this is
> > supposed to apply to VDD_MX. You actually need to go search for the cpu@
> > device tree node and then know that some of the power domains there
> > (in some order) are eventually going to be used for the required-opps
> > there. The order is only defined by the qcom-nvmem-cpufreq driver.
> > 
> > It took me a few hours to get that right... :)
> > 
> > Nevertheless I guess we need a solution for scaling MEMACC without CPR
> > for now. :) I'm not sure if rewriting all this is very realistic
> > (if even possible). So I guess we might be stuck with the genpd approach?
> 
> I agree, the CPR driver will most likely not be changed now, since we
> need to be compatible with the existing device tree.
> 
> 
> For DVFS without CPR:
> 
> You need to scale APC, MX, MEMACC.
> 
> If we don't care about MEMACC, then the existing code in the OPP library
> satisfies all our needs.
> The problem here is if we need to do MEMACC as well.
> 
> I don't think it is proper to implement MEMACC as a power domain
> (because it is not). Thus, we can't add it as a required-opp.
> 
> Another problem is that MEMACC should be done after regulator_set_voltage()
> when scaling up, and before regulator_set_voltage() when scaling down.
> 
> So even if MEMACC was a power domain, currently the OPP library does
> the _set_required_opps() call in the wrong order needed for MEMACC.
> 
> Like you said, the OPP library almost does everything already,
> so it probably makes most sense to extend it to your needs,
> rather than duplicating most of the code inside dev_pm_opp_set_rate().
> 
> 
> I guess what you really want is two new optional callbacks in
> dev_pm_opp_set_rate(), one before _generic_set_opp_regulator() and one
> after, where you could do the MEMACC thing.
> 
> The callbacks need to have a parameter that tells if we are scaling down
> or up.
> 
> Or, if Viresh doesn't like new function pointers, create a new
> OPP_EVENT_* that you can register for, and in that callback you do what
> you need.
> 
> Or, maybe you can even use the existing CPUFREQ_TRANSITION_NOTIFIER,
> with CPUFREQ_PRECHANGE / CPUFREQ_POSTCHANGE, however, I'm not sure
> how nicely they play when you are using the OPP library.
> 

I'm not sure. Overall all of this doesn't really sound like it is going
to make all this easier to understand (from looking at the device tree).
We then have required-opps for VDD_MX, and CPR (which isn't really a
power domain), and something entirely different for MEMACC (which like
CPR, isn't really a power domain).

I don't know, right now this mixture of different approaches sounds
rather complicated (and confusing) to me...

Just to throw another idea in the room: there seems to be a set_opp()
callback already in the OPP table, which bypasses the code that
updates clock and regulators (see ti-opp-supply.c). Actually if I'm
reading this correctly ti-opp-supply seems to implement adaptive voltage
scaling similar to CPR with it. Seemingly we have two different solutions
for the same concept now:

  - CPR implements a power domain provider (even though it's not really
    a power domain since it has only one consumer)
  - ti-opp-supply implements this with the set_opp() callback

In general I think this looks pretty nice - we don't duplicate the full
cpufreq driver, but have control about the order
regulators/clocks/power domains etc are changed.

I think something like this would fit quite well for my case
(scaling MX, APC and MEMACC without CPR). However, not sure how it would
integrate with the existing CPR driver at some point.

Adding Viresh to Cc in case he has some opinion for all this.

Thanks,
Stephan
