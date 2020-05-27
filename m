Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474871E42CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 14:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbgE0M7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 08:59:24 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:46498 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730045AbgE0M7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 08:59:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B640B3FA0A;
        Wed, 27 May 2020 14:59:21 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=IOTCshbC;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=flawful.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Q92Pf_OBIl-7; Wed, 27 May 2020 14:59:20 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 67B2E3F79A;
        Wed, 27 May 2020 14:59:20 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id 81D1B197; Wed, 27 May 2020 14:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590584359; bh=uOZCLyP+zmGBakWPrPEYWpoMgAyFAbSVswqIP9vGSgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOTCshbCbbelZKK1e1+1PeWei8eKKRZnbM8gfORfvrECiohf1C3UOZC5dsuYUVpjd
         U/DO1+UByyGy9M4OvPHzWg+t78UIWhRlTknAhHf2Wkvhv0nrsJrIgD+ojVeeTqGpe9
         CrWSx4M4QEEpl+09j5jp4hrtLc4ro753VjCkfVXk=
Date:   Wed, 27 May 2020 14:59:19 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200527125919.GA16363@flawful.org>
References: <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
 <20200527103921.GB9977@flawful.org>
 <20200527120441.GA4166@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120441.GA4166@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 02:04:52PM +0200, Stephan Gerhold wrote:
> > I guess what you really want is two new optional callbacks in
> > dev_pm_opp_set_rate(), one before _generic_set_opp_regulator() and one
> > after, where you could do the MEMACC thing.
> > 
> > The callbacks need to have a parameter that tells if we are scaling down
> > or up.
> > 
> > Or, if Viresh doesn't like new function pointers, create a new
> > OPP_EVENT_* that you can register for, and in that callback you do what
> > you need.
> > 
> > Or, maybe you can even use the existing CPUFREQ_TRANSITION_NOTIFIER,
> > with CPUFREQ_PRECHANGE / CPUFREQ_POSTCHANGE, however, I'm not sure
> > how nicely they play when you are using the OPP library.
> > 
> 
> I'm not sure. Overall all of this doesn't really sound like it is going
> to make all this easier to understand (from looking at the device tree).
> We then have required-opps for VDD_MX, and CPR (which isn't really a
> power domain), and something entirely different for MEMACC (which like
> CPR, isn't really a power domain).
> 
> I don't know, right now this mixture of different approaches sounds
> rather complicated (and confusing) to me...

You are going to need performance states where it is needed,
e.g. for controlling MX (as it is a power domain).
For performance states, you using the required-opps DT property.

My 50 cents is just to not use it for something that is not
a power domain, e.g. MEMACC.

> 
> Just to throw another idea in the room: there seems to be a set_opp()
> callback already in the OPP table, which bypasses the code that
> updates clock and regulators (see ti-opp-supply.c). Actually if I'm
> reading this correctly ti-opp-supply seems to implement adaptive voltage
> scaling similar to CPR with it. Seemingly we have two different solutions
> for the same concept now:
> 
>   - CPR implements a power domain provider (even though it's not really
>     a power domain since it has only one consumer)
>   - ti-opp-supply implements this with the set_opp() callback

Yes, and there are more ways to implement AVS, see e.g.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=25cb20a212a1f989385dfe23230817e69c62bee5

Which probably would have been a better fit for CPR,
if it were to be designed today.

> 
> In general I think this looks pretty nice - we don't duplicate the full
> cpufreq driver, but have control about the order
> regulators/clocks/power domains etc are changed.
> 
> I think something like this would fit quite well for my case
> (scaling MX, APC and MEMACC without CPR). However, not sure how it would
> integrate with the existing CPR driver at some point.

You care about how to do DVFS without AVS (CPR).

Why do you worry about how it will look when, if ever,
you transition to full AVS (CPR)?

If the CPR driver is not changed, which I doubt, you will simply change
the device tree to remove the cpu-supply regulator and move it into the
new CPR DT node.

Old device trees will still use your DVFS solution, new device
trees will use the CPR DT node and will use the AVS solution.


Kind regards,
Niklas
