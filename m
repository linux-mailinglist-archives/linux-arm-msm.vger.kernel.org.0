Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91DD44C2BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 15:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbhKJOMY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 09:12:24 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:19056 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhKJOMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 09:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636553373;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QfUu8OCe6jaNhKwmF+8ZGKV54AQhvbOsoCPsnknhr0I=;
    b=tbqxtQpowNbylsFaJMJS7/nHO1QE+gQcP7vZDPrAFN5EXYrPLVi6yvbTUipMG4tXsu
    vty0F5diTffRVkzMGYxkaYPUndYfByS5nnxf+wQu6B2oSJj5XPryjmkNoiR98QKui8bl
    f2BnbjEvOdLPW0JcVU4AAEJCtWKpH3ctuwXT4k/5HUtZBLKVT02FZPqqmCQ429xJcc6g
    +Av6Gb8ZvKYWh180jJZZB6Rn5NsMf0FrccaajSag8lhplvZse9p9afV9SW5RCr+sMljE
    7LhNJHaRHXHsB5HWO1VwsbSVl9xBCS2Iw9MN4mCQ9y7/3pPNEiYb81eUZSQolQ6LMu2i
    TvbA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAAE9W51q
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 10 Nov 2021 15:09:32 +0100 (CET)
Date:   Wed, 10 Nov 2021 15:09:28 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <YYvSmEr/Fo2LPJwu@gerhold.net>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
 <20211110131507.GJ7231@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110131507.GJ7231@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 10, 2021 at 09:15:11PM +0800, Shawn Guo wrote:
> On Tue, Nov 09, 2021 at 11:26:21AM +0100, Stephan Gerhold wrote:
> > On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> > > Currently the enable state of smd-rpm clocks are not properly reported
> > > back to framework due to missing .is_enabled and .is_prepared hooks.
> > > This causes a couple of issues.
> > > 
> > > - All those unused clocks are not voted for off, because framework has
> > >   no knowledge that they are unused.  It becomes a problem for vlow
> > >   power mode support, as we do not have every single RPM clock claimed
> > >   and voted for off by client devices, and rely on clock framework to
> > >   disable those unused RPM clocks.
> > > 
> > 
> > I posted a similar patch a bit more than a year ago [1].
> 
> Ouch, that's unfortunate!  If your patch landed, I wouldn't have had to
> spend such a long time to figure out why my platform fails to reach vlow
> power mode :(
> 

Sorry, I was waiting for Stephen to reply and eventually decided to
shift focus to other things first. :)

The whole low-power topic is kind of frustrating on older platforms
because they currently still lack almost everything that is necessary to
reach those low power states. Even things that you already consider
natural for newer platforms (such as interconnect) are still very much
work in progress on all older ones.

> > Back then one
> > of the concerns was that we might disable critical clocks just because
> > they have no driver using it actively. For example, not all of the
> > platforms using clk-smd-rpm already have an interconnect driver.
> > Disabling the interconnect related clocks will almost certainly make the
> > device lock up completely. (I tried it back then, it definitely does...)
> > 
> > I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
> > back then [2] which would allow disabling most of the clocks at least.
> > Stephen Boyd had an alternative proposal to instead move the
> > interconnect related clocks completely out of clk-smd-rpm [3].
> > But I'm still unsure how this would work in a backwards compatible way. [4]
> > 
> > Since your patches are more or less identical I'm afraid the same
> > concerns still need to be solved somehow. :)
> 
> I do not really understand why smd-rpm clock driver needs to be a special
> case.  This is a very common issue, mostly in device early support phase
> where not all clock consumer drivers are ready.  Flag CLK_IGNORE_UNUSED
> and kernel cmdline 'clk_ignore_unused' are created just for that.  Those
> "broken" platforms should be booted with 'clk_ignore_unused' until they
> have related consumer drivers in place.  IMHO, properly reporting enable
> state to framework is definitely the right thing to do, and should have
> been done from day one.
> 

... And therefore I think we should be careful with such changes,
especially if they would prevent devices from booting completely.
Unfortunately the users trying to make use of old platforms are also
often the ones who might not be aware that they suddenly need
"clk_ignore_unused" just to boot a system that was previously working
(mostly) fine, except for the whole low-power topic.

I fully agree with you that disabling the unused clocks here is the
right thing to do, but I think we should try to carefully flag the most
important clocks in the driver to avoid causing too many regressions.

Thanks,
Stephan
