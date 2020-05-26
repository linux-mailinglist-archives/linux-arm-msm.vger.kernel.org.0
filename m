Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F461E308A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404394AbgEZUyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 16:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404383AbgEZUyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 16:54:13 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31525C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 13:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590526450;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=n/xXewTn5ODlt8wXGuujR6xFKz4yabxamt0S0V5X5nA=;
        b=jCTwNVmvGpPDg6z+k0uRgb/vaqK+7I0kEL9KITO+wPaG87S8oHHezch3fFtJCdIf1q
        8Aoo9itqSboQ8UUuYlJd/jylmYAj1aAFKqBuEFNb0ZTvGw7QhisnMRu8U6xJ25IrnIsf
        CfSIcHBrrTWmcLBfmMTiirNg5XT2boO1xdfBAllTBW0lJVrd3RfrgI/9pdKht0H9J+5l
        yg5sIX90xXGZwNVB4Zz9vez7pr6Zos9jYvl6oR1kPOApb2OEFWm9sQTMxJGJgGAWEQIq
        ZQFJVv8s6faWCyJcJ9j7QmGKPnMyWpuwHCgtc1Si7yXQeGKlvkSJjrZ7Z7xcruHeGTpC
        Qf4w==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/HYoo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id C07db0w4QKs9hnH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 26 May 2020 22:54:09 +0200 (CEST)
Date:   Tue, 26 May 2020 22:54:03 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200526205403.GA7256@gerhold.net>
References: <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200525153246.GA9224@flawful.org>
 <20200525163638.GA41001@gerhold.net>
 <20200525194443.GA11851@flawful.org>
 <20200526085948.GA1329@gerhold.net>
 <20200526155419.GA9977@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526155419.GA9977@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 26, 2020 at 05:54:20PM +0200, Niklas Cassel wrote:
> On Tue, May 26, 2020 at 10:59:48AM +0200, Stephan Gerhold wrote:
> > > Considering that CPR is not an actual power domain, CPR gives
> > > adjustments to VDD_APC, but I don't know of any other device
> > > connected to VDD_APC, other than the CPU, so in hindsight the CPR
> > > driver probably should have been implemented using .target_index(),
> > > rather than as a power domain provider using performance states.
> > 
> > I suppose having CPR, MEMACC etc as power domain providers is a bit
> > overkill, given there is just one consumer. However, at least the
> > "performance state" part fits quite well in my opinion. At the end
> > all these requirements represent some performance state that must be
> > set when the CPU frequency is changed.
> > 
> 
> For MX, it makes sense to model it as a power domain provider, and for
> it to have its own OPP table, since this actually is a power domain.
> 
> For CPR, I think that the target_index() model of just giving an index
> in a frequency table is much better, the OPP library can still be used
> to get the frequencies/frequency_table.
> Since at least for Qualcom CPU's, the corner (opp-level) is defined as
> an increasing number 1,2,3,4, without skips.
> 
> Even if it wasn't always without skips, we could just put opp-level in
> the CPU opp table, and get it from there.
> 
> The only thing that the corner is used for really, is to use it as an
> index the local drv->corner array, which is where the (current) VDD_APC
> voltage is stored for each index/corner.
> 
> For CPR, the .target_index() in cpufreq-dt.c gets called, which is
> supplied with an index, but the index gets converted to a frequency.
> This frequency is then sent to the OPP library, and is then converted
> back to an index of the same value (just increased by one), before
> cpr_set_performance_state() is called (which then has to subtract one).
> In this case, all the extra overhead of going via genpd is totally
> unnecessary.
> 
> This is totally correct when setting a performance state on a power
> domain like MX, since for an actual power domain you might have
> multiple consumers, so you need to go via genpd.
> 
> Considering that CPR is not a power domain, I wish the driver wasn't
> designed around performance states, which, _for the CPR case_,
> is misleading, unnecessary, and adds extra overhead for no reason.
> 
> I realize the irony of me criticizing my own code.
> I simply know better now, and wish I had designed it differently :)
> 

I see what you mean. I'm not sure how much of a problem the "genpd
overhead" really is in practice (although I assume it's called quite
frequently with a dynamic CPU frequency governor). There is also the
argument of it being slightly misleading (because CPR is not actually
a real power domain).

Speaking of the current solution, I also have to say that (IMO) the
device tree binding for "required-opps" is rather confusing
and potentially misleading.

e.g. for VDD_MX scaling I use

	required-opps = <&rpmpd_opp_nom>;

but looking at just the OPP table absolutely nothing tells me this is
supposed to apply to VDD_MX. You actually need to go search for the cpu@
device tree node and then know that some of the power domains there
(in some order) are eventually going to be used for the required-opps
there. The order is only defined by the qcom-nvmem-cpufreq driver.

It took me a few hours to get that right... :)

Nevertheless I guess we need a solution for scaling MEMACC without CPR
for now. :) I'm not sure if rewriting all this is very realistic
(if even possible). So I guess we might be stuck with the genpd approach?

Thanks,
Stephan
