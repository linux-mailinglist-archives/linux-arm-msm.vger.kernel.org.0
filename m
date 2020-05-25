Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A341E14F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 21:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390330AbgEYTxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 15:53:15 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:43584 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388757AbgEYTxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 15:53:14 -0400
X-Greylist: delayed 506 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 May 2020 15:53:13 EDT
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D9DA53FED7;
        Mon, 25 May 2020 21:44:45 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=QDjmeXEV;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OmX5e2RY_eTK; Mon, 25 May 2020 21:44:44 +0200 (CEST)
Received: from flawful.org (c-96c8e055.011-101-6d6c6d3.bbcust.telenor.se [85.224.200.150])
        (Authenticated sender: mb274189)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 58DD23FECE;
        Mon, 25 May 2020 21:44:44 +0200 (CEST)
Received: by flawful.org (Postfix, from userid 1001)
        id 77A402144; Mon, 25 May 2020 21:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1590435883; bh=FuA3RmRIxtFufzjmsrWISKWLXALVI1vHqwr8TKNm7K4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDjmeXEVe/u1tDiLcFfj1kSTpzsNs/pYdbkrsgnZ1LGQSE3c2mHzY+pOydVlhitOL
         AZyDFtm6/7YDiS9X3W2FFNb850Jno7XAi92g+hARmmZW5miuJWjZRIYEwcw1RANe26
         81SjG2+t6cXE2aPvGsAU7WCER9xbEFP04P3HcN9Q=
Date:   Mon, 25 May 2020 21:44:43 +0200
From:   Niklas Cassel <nks@flawful.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200525194443.GA11851@flawful.org>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525163638.GA41001@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 25, 2020 at 06:36:38PM +0200, Stephan Gerhold wrote:
> On Mon, May 25, 2020 at 05:32:47PM +0200, Niklas Cassel wrote:
> > On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > > > Based on the available downstream sources I guessed the defines to add
> > > > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > > > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > > > corners (with the mapping you mentioned above).
> > > > 
> > > 
> > > I was not aware it was possible to describe the dependency between the
> > > CPU opp table and MX in this fashion. If that's the case then this looks
> > > really good and it should be straight forward to add MSM8916 support to
> > > the CPR driver as well.
> > > 
> > > > I haven't tested it yet, maybe I can get some feedback first if the code
> > > > seems reasonable or if I'm missing something obvious? :)
> > > > 
> > > 
> > > Have you tested this yet?
> > > 
> > > > Also: Is there a good way to validate these changes?
> > > > I suppose I could check the genpd state but that wouldn't tell me if the
> > > > corner was applied correctly. Maybe I can check the actual voltage
> > > > through the SPMI interface, hm...
> > > > 
> > > 
> > > Validating that S2 and VDD_MX changes appropriately in Linux would be a
> > > pretty good test.
> > 
> > Like Bjorn says,
> > 
> > Downstream CPR on MSM8916 controls 3 things; VDD_APC, VDD_MX and MEMACC.
> > 
> > On QCS404 we don't have to adjust VDD_MX, therefore this is no code for
> > this in the upstream CPR driver. It just scales VPP_APC and MEMACC.
> > 
> > I like Stephan's idea of scaling VDD_APC and VDD_MEM to the maximum
> > necessary for the selected CPU frequency, until there is full CPR
> > support for MSM8916 (if ever).
> > 
> > 
> > The patch suggested so far looks good, however, I'm slightly worried
> > that this might lead to unstable boards, since MEMACC is never scaled
> > in the suggested patch.
> > 
> 
> Yeah, I was recently looking at that. I have no idea if it's needed.
> 
> If I understand this correctly, on downstream this is implemented
> separately as "mem-acc-regulator", although it is controlled by the
> "cpr-regulator" driver.
> 
> The mapping seems to be fairly static:
> Essentially it is just set to Nominal (1), SVS (2) or Turbo (3),
> depending on the CPU frequency. (On downstream this is specified in the
> device tree as qcom,cpr-corner-map = <1 1 2 2 3 3 3 3 3>; where each
> value is one CPU frequency.)
> 
> Additionally there seem to be some fuses to eventually override
> that behavior slightly (qcom,override-corner-acc-map).
> See: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-regulator.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n29
> 
> On mainline this is currently entirely handled by the CPR driver,
> and the register sequence for QCS404 actually looks a bit more
> complicated... Hmm.

I agree:
https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/qcs405-regulator.dtsi?h=msm-4.14#n294

> 
> The reason I mention all this: At least as I understand it,
> this isn't much different from the VDD_MX scaling. Essentially it
> doesn't strictly have something to do with the voltage scaling
> we do for CPR (VDD_APC), but rather it seems to be just another
> requirement when scaling the CPU frequency.

I agree.

> 
> In other words, I wonder if we should separate this into yet another
> power domain driver, and then reference it independently from CPR
> as additional required-opps for both MSM8916 and QCS404.

While this sounds very nice, by simply referencing these as
required-opps, I don't see how the OPP library will be able
to set APC, MX and MEMACC in the correct order:

https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/regulator/cpr-regulator.c?h=msm-4.14#n774

If scaling down, first MEMACC is set, then APC is set, then MX is set.

If scaling up, first MX is set, then APC is set, then MEMACC is set.



Perhaps the easiest way is to write a minimalistic cpufreq driver,
very similar to drivers/cpufreq/omap-cpufreq.c, that implements
the .target_index callback, and just like omap_target(), simply
gets the OPP using dev_pm_opp_find_freq_ceil(), and then calls
regulator_set_voltage() (APC), clk_set_rate() (to change the clock
frequency), dev_pm_genpd_set_performance_state() (to set MX),
and then do that little code that needs to be done for memacc.

Considering that CPR is not an actual power domain, CPR gives
adjustments to VDD_APC, but I don't know of any other device
connected to VDD_APC, other than the CPU, so in hindsight the CPR
driver probably should have been implemented using .target_index(),
rather than as a power domain provider using performance states.


Kind regards,
Niklas
