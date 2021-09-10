Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161EC4066AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 07:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhIJFVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 01:21:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230037AbhIJFV3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 01:21:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52C2B61051;
        Fri, 10 Sep 2021 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631251219;
        bh=FuY8GwM3s/D3E8hKfy4XmEywqcKGkGW5boPlme8HgLk=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=WyOKtj4Dv978O9862QIRpX5gXUXtg1SYfuRf/TNYcefJhXPCatW02kCgwK7JlADh7
         KELPnIB5qbGHD9x+3l5UDiYfdx4SXvknVY+6KPd3gY6vpvbsoQS8uQVyybZ9p2wVK6
         /nzF70LrEKgFcrSsMtDg1hOWehKFmAgMwC0HEdn26ldWvvt0eVsDM26b+lHUVWGk1a
         wbnILPqNNpbnwbSaFHWwNwgNNPrihDqnNoLhbdXx7mIuvAghN5EhduiyJI/BG69/IG
         oogXZi9CXapFMUn9fA3ILwdmueMbgAv49/8PeW4lLsj5sovfboddj8b6stZY/NjHKq
         jTkCz/DquhZTQ==
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <87fsueb0ko.fsf@kernel.org>
 <20210909170236.GA20111@jackp-linux.qualcomm.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Date:   Fri, 10 Sep 2021 08:17:51 +0300
In-reply-to: <20210909170236.GA20111@jackp-linux.qualcomm.com>
Message-ID: <8735qdatwx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Jack,

Jack Pham <jackp@codeaurora.org> writes:
>> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> > index 804b50548163..c647c76d7361 100644
>> > --- a/drivers/usb/dwc3/gadget.c
>> > +++ b/drivers/usb/dwc3/gadget.c
>> > @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>> >  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>> >  		return 0;
>> >  
>> > +	/* bail if already resized */
>> > +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
>> > +		return 0;
>> > +
>> 
>> heh, not to say "I told you so", but...
>> 
>> That being said, your test is not very good. The whole idea for resizing
>> the FIFOs is that in some applications we only use e.g. 2 endpoints and
>> there is considerable FIFO space left unused.
>> 
>> The goal is to use that unused FIFO space to squeeze more throughput out
>> of the pipe, since it amortizes SW latency.
>> 
>> This patch is essentially the same as reverting the original commit :-)
>
> No, it's not quite the same as nullifying the resizing algorithm.  This
> patch is predicated on a key part of the resizing algorithm where
> dwc3_gadget_clear_tx_fifos() occurs upon receiving Set_Configuration in
> ep0.c.  Which means that each new connection starts off with a blank
> slate with all the GTXFIFOSIZ(n) registers cleared.  Then each EP gets
> resized one at a time when usb_ep_enable() is called.
>
> The problem this patch is fixing is avoiding *re-resizing*, the idea
> being that if an EP was already resized once during a session (from
> Set Configuration until the next reset or disconnect), then 
> it should be good to go even if it gets disabled and re-enabled again.

that's not a safe assumption, though. What happens in cases where
Configuration 1 is wildly different from Configuration 2? Say Config 1
is a mass storage device and Config 2 is a collection of several CDC
interfaces?

> Since we lack any boolean state variable in struct dwc3_ep reflecting
> whether it had already been resized, re-reading the GTXFIFOSIZ register

it might be a better idea to introduce such a flag and make the
intention clear. But in any case, I still think the assumption you're
making is not very good.

> is the next best equivalent.  Note also that this check occurs after
> the if (!dwc->do_fifo_resize) check so this is applicable only if the
> entire "tx-fifo-resize" mechanism is enabled.

Right, that's fine :-)

-- 
balbi
