Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E434F246F63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 19:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731501AbgHQRq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 13:46:28 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:15381 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388768AbgHQQOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 12:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597680831;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rKeNPXXZ5MJgiDN6W3hRxeQoXyTtsWjLXvZBTsWM7s8=;
        b=KNcbpMse6Bn5w8fyYXwcvSaJITEp5bsH0IKVI/gr7WRdt5y6bFeekLbICfAZ+arhBU
        oJKbwDndT4kBgRy548ahqvqtVX3BfKmzmoOVAzV1C7aR1iwpua57aitWILSFKA1yK/zr
        G67w88zamwIX3HpOysktLmo7lmRfGjR+MQ4O4h79btBMxq7UPhRdjnmAm4mHTseBu6mu
        hLhYWubAenSciYrd2d1i+zrV3ztkuoq0M7LEilFjlDyk4VWjc9nw3kceY7uPA4zytHDH
        yZkwX2bB7hIW5vkatLYPj3q4TCoxdyKR235MM01CRt23zxKT87pLMI4X3SQ+VG7rmwt4
        ClpA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew7HGDnInN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Aug 2020 18:13:49 +0200 (CEST)
Date:   Mon, 17 Aug 2020 18:13:44 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
Message-ID: <20200817161344.GA1446@gerhold.net>
References: <20200817140908.185976-1-stephan@gerhold.net>
 <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
 <20200817152848.GA836@gerhold.net>
 <CAOCk7NpyiWO_DHidDWbwdBYbzJMrv26CmWOR4foTGRL_pQVbUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NpyiWO_DHidDWbwdBYbzJMrv26CmWOR4foTGRL_pQVbUQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 09:46:08AM -0600, Jeffrey Hugo wrote:
> > > So essentially, when the clk framework goes through late init, and
> > > decides to turn off clocks that are not being used, it will also turn
> > > off these clocks?
> > >
> >
> > With this patch: yes.
> >
> > > I think this is going to break other targets where other subsystems
> > > happen to rely on these sorts of votes from Linux inorder to run/boot
> > > (not saying it's a good thing, just that is how it is and since we
> > > can't change the FW on those....).
> > >
> >
> > As far as I can tell the behavior implemented in this patch (= force
> > clocks on during boot but disable them when unused) is the same on that
> > is used on the downstream kernel. Most FW is probably written with the
> > downstream kernel in mind, so I don't think this is going to cause trouble.
> 
> Based on my experience with 8998, I disagree.  I would need to dig up
> the history for specifics.
> 

I don't know anything about 8998, so it's possible.
My statement was based on a quick look at the downstream code:

For some reason there is an entirely separate MSM clock framework
downstream:

 1. During msm_clock_register() [1] it calls __handoff_clk()
    for all the clocks.

 2. __handoff_clk() [2] calls clk->ops->handoff(clk) and if that returns
    success (HANDOFF_ENABLED_CLK) it adds the clock to a "handoff_list".
    -> rpm_clk_handoff() [3] forces the clock on similar to mainline.

 3. In a late init call (clock_late_init()) [4] it iterates over
    "handoff_list" and reduces the prepare_count again and eventually
    disables the clock.

In this patch I implement something equivalent to (3).

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/clk/msm/clock.c?h=LA.UM.7.2.r2-06200-8x98.0#n985
[2]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/clk/msm/clock.c?h=LA.UM.7.2.r2-06200-8x98.0#n873
[3]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/clk/msm/clock-rpm.c?h=LA.UM.7.2.r2-06200-8x98.0#n263
[4]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/clk/msm/clock.c?h=LA.UM.7.2.r2-06200-8x98.0#n1351

> >
> > > Also, out of curiosity, how are you validating that BB_CLK2 is
> > > actually off after this change?
> > >
> >
> > Since BB_CLK1/2 and RF_CLK1/2 are part of the PMIC (at least on MSM8916)
> > I used the regmap debugfs interface to read the clock registers
> > through SPMI from Linux.
> >
> > From the "PM8916 Hardware Register Description" [1] I got the registers
> > mentioned in the table, e.g. for BB_CLK2:
> >
> > 0x5208: BB_CLK2_STATUS1
> >         BIT(7): CLK_OK (Indicates Hardware or Software enable and
> >                         includes warmup delay)
> >                 0x0: BBCLK_OFF
> >                 0x1: BBCLK_ON
> >
> > I read the registers from /sys/kernel/debug/regmap/0-00/registers:
> >
> > Without this patch:
> >         5108: 80
> >         5208: 80
> >         5408: 80
> >         5508: 80
> >
> > With this patch (and with clk-smd-rpm entirely disabled):
> >         5108: 80
> >         5208: 00
> >         5408: 00
> >         5508: 00
> >
> > Stephan
> >
> > [1]: https://developer.qualcomm.com/download/sd410/pm8916-hardware-register-description.pdf
> 
> Hmm, 8916 is probably old enough where you can actually do that.  For
> the modern SoCs, you'll have to go through jtag to get an accurate
> view of the clocks.

I guess I was lucky then :)

Stephan
