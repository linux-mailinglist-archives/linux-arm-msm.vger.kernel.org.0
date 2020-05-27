Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1783B1E3F40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 12:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgE0Kj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 06:39:27 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:23289 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgE0Kj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 06:39:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 62F3241B37;
        Wed, 27 May 2020 12:39:23 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=KwAx43cb;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xJ3m8nb415Ba; Wed, 27 May 2020 12:39:22 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 56FFD41B35;
        Wed, 27 May 2020 12:39:22 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id 76B3E197; Wed, 27 May 2020 12:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590575961; bh=/OEWwyG8W6/+TXlSil7Qb7WcCIxfSh/sOv0HEvPJ60E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KwAx43cbNDygHPjbkrZAN7Zvn1IwVG/gM5lCXXP/pTNPwsw8CxtDYdqpDkrBvEeKW
         MMwo8dkLaQi/6xdtBN4WoyB45zPQEVnK8TKaYA/NIeGsjBl/i5gi0j+xW9OpGNJ9Mv
         Ao7g+HjJ5bBxEFofvT5l+WoVW+Q2Q6Qg6HRm6U2M=
Date:   Wed, 27 May 2020 12:39:21 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200527103921.GB9977@flawful.org>
References: <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
 <20200526205403.GA7256@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526205403.GA7256@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 26, 2020 at 10:54:03PM +0200, Stephan Gerhold wrote:
> Speaking of the current solution, I also have to say that (IMO) the
> device tree binding for "required-opps" is rather confusing
> and potentially misleading.
> 
> e.g. for VDD_MX scaling I use
> 
> 	required-opps = <&rpmpd_opp_nom>;
> 
> but looking at just the OPP table absolutely nothing tells me this is
> supposed to apply to VDD_MX. You actually need to go search for the cpu@
> device tree node and then know that some of the power domains there
> (in some order) are eventually going to be used for the required-opps
> there. The order is only defined by the qcom-nvmem-cpufreq driver.
> 
> It took me a few hours to get that right... :)
> 
> Nevertheless I guess we need a solution for scaling MEMACC without CPR
> for now. :) I'm not sure if rewriting all this is very realistic
> (if even possible). So I guess we might be stuck with the genpd approach?

I agree, the CPR driver will most likely not be changed now, since we
need to be compatible with the existing device tree.


For DVFS without CPR:

You need to scale APC, MX, MEMACC.

If we don't care about MEMACC, then the existing code in the OPP library
satisfies all our needs.
The problem here is if we need to do MEMACC as well.

I don't think it is proper to implement MEMACC as a power domain
(because it is not). Thus, we can't add it as a required-opp.

Another problem is that MEMACC should be done after regulator_set_voltage()
when scaling up, and before regulator_set_voltage() when scaling down.

So even if MEMACC was a power domain, currently the OPP library does
the _set_required_opps() call in the wrong order needed for MEMACC.

Like you said, the OPP library almost does everything already,
so it probably makes most sense to extend it to your needs,
rather than duplicating most of the code inside dev_pm_opp_set_rate().


I guess what you really want is two new optional callbacks in
dev_pm_opp_set_rate(), one before _generic_set_opp_regulator() and one
after, where you could do the MEMACC thing.

The callbacks need to have a parameter that tells if we are scaling down
or up.

Or, if Viresh doesn't like new function pointers, create a new
OPP_EVENT_* that you can register for, and in that callback you do what
you need.

Or, maybe you can even use the existing CPUFREQ_TRANSITION_NOTIFIER,
with CPUFREQ_PRECHANGE / CPUFREQ_POSTCHANGE, however, I'm not sure
how nicely they play when you are using the OPP library.


Kind regards,
Niklas
