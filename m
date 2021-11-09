Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F8C44AB76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 11:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245310AbhKIK3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 05:29:17 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:32727 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239354AbhKIK3Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 05:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636453586;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=RiExFva19iXpcbPI5dAYFzRkXGmUkKhn82LlovdHwDo=;
    b=FBVBdfyvQYtX6+LPASWG4S84/a1D4AJY+5Xo18NJumgpGW1aUEGBqs0CXCnLHsfc9t
    0ZrfkeT5JYp7G2u7OS6+AfJdDMEwxw/TP2OC4SRmJqfdOn8A6l4Ys9ntDqJPI2NPHK2a
    1Jn/9k2FTU+Wl7spuKVaTleM0TjRcEEjQCyWLydiRu0NrUXFrIiwtyRLD+CpqPfyjGW5
    WgqOWY7Js7S7zUURkojmWoX4VD5EL+mDz1/Shxa3o9EylF1/bCbHJVOIdCrcMTUPQhwL
    /dzdfBZKz3cLXA1fgKch6PnHV8x4FmQFSmTSP6hDNWDbGDSXSyO2RIbp++GSgvuu4q8K
    Yb2w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.1 SBL|AUTH)
    with ESMTPSA id Q0a97bxA9AQPXZ3
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 9 Nov 2021 11:26:25 +0100 (CET)
Date:   Tue, 9 Nov 2021 11:26:21 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <YYpMzau3CWRQYlkJ@gerhold.net>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109022558.14529-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> Currently the enable state of smd-rpm clocks are not properly reported
> back to framework due to missing .is_enabled and .is_prepared hooks.
> This causes a couple of issues.
> 
> - All those unused clocks are not voted for off, because framework has
>   no knowledge that they are unused.  It becomes a problem for vlow
>   power mode support, as we do not have every single RPM clock claimed
>   and voted for off by client devices, and rely on clock framework to
>   disable those unused RPM clocks.
> 

I posted a similar patch a bit more than a year ago [1]. Back then one
of the concerns was that we might disable critical clocks just because
they have no driver using it actively. For example, not all of the
platforms using clk-smd-rpm already have an interconnect driver.
Disabling the interconnect related clocks will almost certainly make the
device lock up completely. (I tried it back then, it definitely does...)

I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
back then [2] which would allow disabling most of the clocks at least.
Stephen Boyd had an alternative proposal to instead move the
interconnect related clocks completely out of clk-smd-rpm [3].
But I'm still unsure how this would work in a backwards compatible way. [4]

Since your patches are more or less identical I'm afraid the same
concerns still need to be solved somehow. :)

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20200817140908.185976-1-stephan@gerhold.net/
[2]: https://lore.kernel.org/linux-arm-msm/20200818080738.GA46574@gerhold.net/
[3]: https://lore.kernel.org/linux-arm-msm/159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com/
[4]: https://lore.kernel.org/linux-arm-msm/20200821064857.GA905@gerhold.net/
