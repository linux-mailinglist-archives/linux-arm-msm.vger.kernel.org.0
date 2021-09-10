Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1312407078
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 19:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhIJRWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 13:22:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18178 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231783AbhIJRWL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 13:22:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631294460; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=dTzyfUob5Y28g9uAV7eeIpiIEDAMZS2HBT7BgJCYXGw=; b=tQwkuzIENP3rnCy1ajP45cV/4sRxHe32xqE00xSu2cTMW/Z8X76rlBrDqpGYW22Lv/1t2DhU
 q26/ot9n9hFal7nAlelkpsZ09XJED3v2OpZVBlPnHxr3TKy6W/7KqbYlD4Ur08weYqYrOrZ4
 4/Oh6TpLogQLhBdVviPinz98Vzo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 613b93f2e34848cb6acbdcbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Sep 2021 17:20:50
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6D7DC43460; Fri, 10 Sep 2021 17:20:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62F56C43460;
        Fri, 10 Sep 2021 17:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 62F56C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Fri, 10 Sep 2021 10:20:44 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Message-ID: <20210910172044.GA23733@jackp-linux.qualcomm.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <87fsueb0ko.fsf@kernel.org>
 <20210909170236.GA20111@jackp-linux.qualcomm.com>
 <8735qdatwx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735qdatwx.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 10, 2021 at 08:17:51AM +0300, Felipe Balbi wrote:
> 
> Hi Jack,
> 
> Jack Pham <jackp@codeaurora.org> writes:
> >> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> >> > index 804b50548163..c647c76d7361 100644
> >> > --- a/drivers/usb/dwc3/gadget.c
> >> > +++ b/drivers/usb/dwc3/gadget.c
> >> > @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> >> >  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> >> >  		return 0;
> >> >  
> >> > +	/* bail if already resized */
> >> > +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
> >> > +		return 0;
> >> > +
> >> 
> >> heh, not to say "I told you so", but...
> >> 
> >> That being said, your test is not very good. The whole idea for resizing
> >> the FIFOs is that in some applications we only use e.g. 2 endpoints and
> >> there is considerable FIFO space left unused.
> >> 
> >> The goal is to use that unused FIFO space to squeeze more throughput out
> >> of the pipe, since it amortizes SW latency.
> >> 
> >> This patch is essentially the same as reverting the original commit :-)
> >
> > No, it's not quite the same as nullifying the resizing algorithm.  This
> > patch is predicated on a key part of the resizing algorithm where
> > dwc3_gadget_clear_tx_fifos() occurs upon receiving Set_Configuration in
> > ep0.c.  Which means that each new connection starts off with a blank
> > slate with all the GTXFIFOSIZ(n) registers cleared.  Then each EP gets
> > resized one at a time when usb_ep_enable() is called.
> >
> > The problem this patch is fixing is avoiding *re-resizing*, the idea
> > being that if an EP was already resized once during a session (from
> > Set Configuration until the next reset or disconnect), then 
> > it should be good to go even if it gets disabled and re-enabled again.
> 
> that's not a safe assumption, though. What happens in cases where
> Configuration 1 is wildly different from Configuration 2? Say Config 1
> is a mass storage device and Config 2 is a collection of several CDC
> interfaces?

The resizing algorithm operates only on one Configuration at a time.
If a new Configuration is selected by the host, the algorithm starts
over again, so all of the endpoints in the new config will need to be
evaluated and resized again.  The number of total endpoints in a
configuration (including across multiple Alt Settings) is taken into
account to ensure there is enough room to guarantee each IN endpoint
will have a minimum amount of FIFO space, but also allowing an
opportunity for those endpoints who could benefit (based on their
MaxBurst setting) to be allocated more.

> > Since we lack any boolean state variable in struct dwc3_ep reflecting
> > whether it had already been resized, re-reading the GTXFIFOSIZ register
> 
> it might be a better idea to introduce such a flag and make the
> intention clear. But in any case, I still think the assumption you're
> making is not very good.

IMHO I think it's pretty straightforward, as the GTXFIFOSIZ(n) register
must have a valid value for the EP to be operational.  The assumption is
if it's 0, that means it was cleared by dwc3_gadget_clear_tx_fifos() and
we haven't yet visited this EP for resizing.  So the check within this
resize routine is basically a combination of the following:

 if (dwc->do_fifo_resize && DWC3_GTXFIFOSIZ(N) != 0)
    // this IN EP has been resized

But I hear you about using an explicit flag as it would make it crystal
clear to the reader.  I can prepare something for V2.

> > is the next best equivalent.  Note also that this check occurs after
> > the if (!dwc->do_fifo_resize) check so this is applicable only if the
> > entire "tx-fifo-resize" mechanism is enabled.
> 
> Right, that's fine :-)

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
