Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586C624CE3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 08:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgHUGtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 02:49:11 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35308 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgHUGtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 02:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597992546;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=V1ysYwsBw9cTeNCdgwcpfFak0p/RNbnJO+auxIHEaGg=;
        b=kQKpurwaJ6xNVxALMVF4XadXxg1cKG9d4VsvdOJu3qwYG8vGmVVRM0KyQLeRa8C1Bn
        qy08hWRAeytJ/+hMPG33l61rY/9/W+IZB0BdFAIyO8LSHfY5Ibzu0MYv3ToD+tcUiAxU
        RUO6WkUONHblKC226UYHDESWKXLzB9NIMR8/ywP+z14wdQtR6eeXRV09lIocGtxjdJSh
        BobWTgObzfgKg5+FywLv8yWVigu6b02gPsESEYUyNk8r7AYL+Qk/1Fu5M4K/cRtIjXXB
        QKe5ZkuQTADjwKupeplG+xJ4SFoPh4jJC9SiDGi/h/LwgZJvEVui85n2hRlf2tlAo3PM
        cwtA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7L6n3Hqg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 21 Aug 2020 08:49:03 +0200 (CEST)
Date:   Fri, 21 Aug 2020 08:48:57 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
Message-ID: <20200821064857.GA905@gerhold.net>
References: <20200817140908.185976-1-stephan@gerhold.net>
 <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
 <20200818080738.GA46574@gerhold.net>
 <159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 20, 2020 at 04:27:35PM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2020-08-18 01:07:38)
> > Hi Jeffrey,
> > 
> > On Mon, Aug 17, 2020 at 08:52:46AM -0600, Jeffrey Hugo wrote:
> > > So essentially, when the clk framework goes through late init, and
> > > decides to turn off clocks that are not being used, it will also turn
> > > off these clocks?
> > > 
> > > I think this is going to break other targets where other subsystems
> > > happen to rely on these sorts of votes from Linux inorder to run/boot
> > > (not saying it's a good thing, just that is how it is and since we
> > > can't change the FW on those....).
> > > 
> > 
> > After thinking about it some more I realized there are definitely some
> > of the clocks we shouldn't disable even when unused, for example the
> > interconnect clocks. With interconnect drivers disabled the system
> > basically locked up entirely once the clock core disabled the clocks.
> 
> The interconnect clks should be moved out of the RPM clk drivers. It's
> over-engineering to have the RPM interconnect drivers talk to the RPM
> clk drivers to change the frequency of interconnects based on a
> calculation in the interconnect driver. It makes sense from a logical
> perspective to express that these are clks, and they have frequencies,
> etc., but when you look closer at it you see that it's nonsense.
> 
> The RPMh interconnect driver should be able to talk directly to the RPM

Note: I'm talking about the clk-smd-rpm (+ SMD RPM interconnect)
drivers here (not RPMh), but I guess the same applies for that as well.

> and turn knobs as it see fit. Nobody else is going to use those clks
> from the RPM clk driver. Any potential consumer is going to go through
> the interconnect layer to change frequencies. So now we've got two
> frameworks interfacing with the same wire protocol and remote processor,
> when we could have only one. And furthermore to the point, the RPM
> interconnect clks are all parented to nothing, so putting them behind
> the clk APIs provides practically zero benefits, like managing the clk
> tree or determining rates down the tree.
> 

That makes sense to me since it would also prevent these clocks from
getting "disabled" when unused.

> Honestly I'd like to see all the various RPM drivers combined into one
> driver that knows what is going on between regulators, interconnects,
> and clks, etc. Carving it up into these different drivers spread across
> the tree helps us review the code and logically split the device into
> pieces, but the flip side is that nobody sees the big picture that a
> call into a framework here boils down to a couple RPM messages sent over
> the wire to the same device.
> 

I'm not sure, most of the RPM drivers are basically pretty much just
long struct definitions for the available regulators, clks,
interconnects, ... of one SoC. Combining this all into one driver would
likely become rather "messy"...

> > For now I fixed this by marking all of DEFINE_CLK_SMD_RPM() as
> > CLK_IGNORE_UNUSED (essentially restoring the current behavior of the
> > driver). For MSM8916 these are exactly the interconnect clocks, but on
> > other platforms there are further clocks that might not need
> > CLK_IGNORE_UNUSED. This could be still optimized later.
> > 
> > > I think this needs to be validated on every single qcom platform using
> > > this driver.
> > > 
> > 
> > After running into the issue above I kind of agree with you. While
> > problems should be limited by marking the "rate" clocks as
> > CLK_IGNORE_UNUSED, it's also possible that one of the platforms requires
> > one of the branch clocks to stay on to boot successfully.
> > 
> > I know for sure that this works properly on MSM8916, so maybe I should
> > make it opt-in and then we add it for each platform after validating it?
> > 
> 
> No! Instead of putting band-aids on this broken mess, please just move
> the interconnect clks out of the clk driver and into the interconnect
> driver.
> 

Hmm, I'm not sure how to implement this in a backwards compatible way.
In particular, clk-smd-rpm supports SoCs that:

  - Have no interconnect driver at all (MSM8998, SDM660, ...)
  - Had the interconnect device nodes added much later than rpmcc
    (MSM8916, MSM8974, ...)
  - Have some clocks that are not covered by the interconnect drivers yet,
    e.g. RPM_SMD_GFX3D_CLK_SRC (Is this even interconnect? Not sure...)

In all those cases they likely (implicitly) rely on rpmcc to keep all
clocks at maximum rate, even if unused. If we were to move the
interconnect clock management to the interconnect drivers, we would
still need to handle the clocks somewhere in all those cases.

How would this work?

Thanks,
Stephan
