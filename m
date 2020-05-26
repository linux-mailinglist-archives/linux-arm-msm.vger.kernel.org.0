Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69AC1E1DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 10:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731617AbgEZI75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 04:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731428AbgEZI74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 04:59:56 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56179C03E97E
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590483594;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dPbMC0fzA+ZH66uoSdfG6RoegblipTXAFFDYu9nvFIw=;
        b=dxGr9Og5Nsrd2S4/25CVHu7UpaeZ/a3x65nG4No9Yd15pTFQJtI2Tcm2HHK/bGbbdK
        PJ+aiWuJHaqwv+/LtSIOhZY22rzNz/ANmS6eBEjk/ZaDgdyVA1Gwq3+rNO6lJcHWOEWT
        ULYeQWOlcoCxRQcL3DzumQW6NR/xL/osWfF3dF+G+BpMgckC4PYZdhFVwQsedAU06rP9
        QI3xNO+pVUsoew15DpE8CEDRN+rbV1BY/9yL3t4gey+KFuynbNGiZV8w0E6Y+PqJ8DQT
        537shxgzMkUIFXbrigUaF70S4xlY1LAKKxBPu4IDBxLeUmJRfp9vHztMP5vL2JkEXjEu
        jIxA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/HYoo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4Q8xrcNn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 26 May 2020 10:59:53 +0200 (CEST)
Date:   Tue, 26 May 2020 10:59:48 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200526085948.GA1329@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525194443.GA11851@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 25, 2020 at 09:44:43PM +0200, Niklas Cassel wrote:
> On Mon, May 25, 2020 at 06:36:38PM +0200, Stephan Gerhold wrote:
> > On Mon, May 25, 2020 at 05:32:47PM +0200, Niklas Cassel wrote:
> > > On Wed, Apr 22, 2020 at 09:55:06PM -0700, Bjorn Andersson wrote:
> > > > > Based on the available downstream sources I guessed the defines to add
> > > > > for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
> > > > > "required-opps" to the CPU OPP table so it would vote for the appopriate
> > > > > corners (with the mapping you mentioned above).
> > > > > 
> > > > 
> > > > I was not aware it was possible to describe the dependency between the
> > > > CPU opp table and MX in this fashion. If that's the case then this looks
> > > > really good and it should be straight forward to add MSM8916 support to
> > > > the CPR driver as well.
> > > > 
> > > > > I haven't tested it yet, maybe I can get some feedback first if the code
> > > > > seems reasonable or if I'm missing something obvious? :)
> > > > > 
> > > > 
> > > > Have you tested this yet?
> > > > 
> > > > > Also: Is there a good way to validate these changes?
> > > > > I suppose I could check the genpd state but that wouldn't tell me if the
> > > > > corner was applied correctly. Maybe I can check the actual voltage
> > > > > through the SPMI interface, hm...
> > > > > 
> > > > 
> > > > Validating that S2 and VDD_MX changes appropriately in Linux would be a
> > > > pretty good test.
> > > 
> > > Like Bjorn says,
> > > 
> > > Downstream CPR on MSM8916 controls 3 things; VDD_APC, VDD_MX and MEMACC.
> > > 
> > > On QCS404 we don't have to adjust VDD_MX, therefore this is no code for
> > > this in the upstream CPR driver. It just scales VPP_APC and MEMACC.
> > > 
> > > I like Stephan's idea of scaling VDD_APC and VDD_MEM to the maximum
> > > necessary for the selected CPU frequency, until there is full CPR
> > > support for MSM8916 (if ever).
> > > 
> > > 
> > > The patch suggested so far looks good, however, I'm slightly worried
> > > that this might lead to unstable boards, since MEMACC is never scaled
> > > in the suggested patch.
> > > 
> > 
> > Yeah, I was recently looking at that. I have no idea if it's needed.
> > 
> > If I understand this correctly, on downstream this is implemented
> > separately as "mem-acc-regulator", although it is controlled by the
> > "cpr-regulator" driver.
> > 
> > The mapping seems to be fairly static:
> > Essentially it is just set to Nominal (1), SVS (2) or Turbo (3),
> > depending on the CPU frequency. (On downstream this is specified in the
> > device tree as qcom,cpr-corner-map = <1 1 2 2 3 3 3 3 3>; where each
> > value is one CPU frequency.)
> > 
> > Additionally there seem to be some fuses to eventually override
> > that behavior slightly (qcom,override-corner-acc-map).
> > See: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-regulator.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n29
> > 
> > On mainline this is currently entirely handled by the CPR driver,
> > and the register sequence for QCS404 actually looks a bit more
> > complicated... Hmm.
> 
> I agree:
> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/qcs405-regulator.dtsi?h=msm-4.14#n294
> 
> > 
> > The reason I mention all this: At least as I understand it,
> > this isn't much different from the VDD_MX scaling. Essentially it
> > doesn't strictly have something to do with the voltage scaling
> > we do for CPR (VDD_APC), but rather it seems to be just another
> > requirement when scaling the CPU frequency.
> 
> I agree.
> 
> > 
> > In other words, I wonder if we should separate this into yet another
> > power domain driver, and then reference it independently from CPR
> > as additional required-opps for both MSM8916 and QCS404.
> 
> While this sounds very nice, by simply referencing these as
> required-opps, I don't see how the OPP library will be able
> to set APC, MX and MEMACC in the correct order:
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/regulator/cpr-regulator.c?h=msm-4.14#n774
> 
> If scaling down, first MEMACC is set, then APC is set, then MX is set.
> 
> If scaling up, first MX is set, then APC is set, then MEMACC is set.
> 

Indeed, I was also thinking about this.

In general, I'm not sure if this is that much of a problem
for the following reason:

The OPP core code already has well-defined semantics to ensure required
OPPs/regulators are set before/after the frequency change, depending on
if we scale up or down, see e.g.

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/opp/core.c#n885

If you specify multiple "required-opps" I think in general the order
will be either irrelevant, or you want to do them in a particular order
for some reason.

If you want to do them in a particular order, then likely because there
is some dependency between them, i.e. here we could say (to some extent)
MEMACC depends on APC, which again depends on MX.

If there is such a dependency I think you almost certainly want to apply
required OPPs in reverse order when scaling down.

I wonder if we could just implement these semantics in the OPP core.
It should be pretty simple, just add a boolean parameter to the
_set_required_opps() function (that says if we're scaling down)
and then iterate over the required OPPs in reverse order.

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/opp/core.c#n745

This would result in the correct order iff CPR is used, because you
could set required-opps = <&mx_opp &cpr_opp &mem_acc_opp>;

When scaling up you would get MX -> CPR (APC) -> MEMACC,
when scaling down the reverse MEMACC -> CPR (APC) -> MX.

This would not result in the correct order if we use opp-microvolts
to scale VDD_APC. The regulator is handled separately, so you would
get MX -> MEMACC -> APC, APC -> MEMACC -> MX instead. Oh well.

> 
> Perhaps the easiest way is to write a minimalistic cpufreq driver,
> very similar to drivers/cpufreq/omap-cpufreq.c, that implements
> the .target_index callback, and just like omap_target(), simply
> gets the OPP using dev_pm_opp_find_freq_ceil(), and then calls
> regulator_set_voltage() (APC), clk_set_rate() (to change the clock
> frequency), dev_pm_genpd_set_performance_state() (to set MX),
> and then do that little code that needs to be done for memacc.
> 

I general I like the way these "requirements" for switching to a
particular CPU frequency can be described fully from the device tree.
The omap-cpufreq code definitely has some duplication with the code
I have seen in the OPP core.

But yes, a generic approach like the "required-opps" can only work up
to some extent - if we have too many requirements for particular order
etc a custom cpufreq driver would have probably been easier.

> Considering that CPR is not an actual power domain, CPR gives
> adjustments to VDD_APC, but I don't know of any other device
> connected to VDD_APC, other than the CPU, so in hindsight the CPR
> driver probably should have been implemented using .target_index(),
> rather than as a power domain provider using performance states.

I suppose having CPR, MEMACC etc as power domain providers is a bit
overkill, given there is just one consumer. However, at least the
"performance state" part fits quite well in my opinion. At the end
all these requirements represent some performance state that must be
set when the CPU frequency is changed.

Stephan
