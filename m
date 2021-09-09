Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54C3405BAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbhIIREB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 13:04:01 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51384 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234524AbhIIREA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 13:04:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631206971; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=qrLWpwJqydDyGvQEH1EuVqU9HUIie2BZyQM8A4ufF9w=; b=TKDkBtYnVpnwkpXpSELN7bogc1hI7xvh9+V2iMYSl/DWNE2I51IqdeNOVjJ84ir/aXM0BeM8
 +mvpeeUP6TySFw7U9ojTKwBoLHAhIfnzRJRdANZzl7gNrNtIkd8p9YlehNb4wYaUKkVlepx4
 Kh02I7HY3b8IdS6D+ci5VyGJ6Bw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 613a3e32aa8996eab7db370a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:02:42
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3EA46C4360D; Thu,  9 Sep 2021 17:02:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EDEDEC43460;
        Thu,  9 Sep 2021 17:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EDEDEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 9 Sep 2021 10:02:36 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Message-ID: <20210909170236.GA20111@jackp-linux.qualcomm.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <87fsueb0ko.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsueb0ko.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

On Thu, Sep 09, 2021 at 11:41:38AM +0300, Felipe Balbi wrote:
> Jack Pham <jackp@codeaurora.org> writes:
> 
> > Some functions may dynamically enable and disable their endpoints
> > regularly throughout their operation, particularly when Set Interface
> > is employed to switch between Alternate Settings.  For instance the
> > UAC2 function has its respective endpoints for playback & capture
> > associated with AltSetting 1, in which case those endpoints would not
> > get enabled until the host activates the AltSetting.  And they
> > conversely become disabled when the interfaces' AltSetting 0 is
> > chosen.
> >
> > With the DWC3 FIFO resizing algorithm recently added, every
> > usb_ep_enable() call results in a call to resize that EP's TXFIFO,
> > but if the same endpoint is enabled again and again, this incorrectly
> > leads to FIFO RAM allocation exhaustion as the mechanism did not
> > account for the possibility that endpoints can be re-enabled many
> > times.
> >
> > Example log splat:
> >
> > 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
> > 	configfs-gadget gadget: u_audio_start_capture:521 Error!
> > 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
> >
> > This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
> > if an endpoint is already resized, avoiding the calculation error
> > resulting from accumulating the EP's FIFO depth repeatedly.
> >
> > Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/gadget.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 804b50548163..c647c76d7361 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> >  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> >  		return 0;
> >  
> > +	/* bail if already resized */
> > +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
> > +		return 0;
> > +
> 
> heh, not to say "I told you so", but...
> 
> That being said, your test is not very good. The whole idea for resizing
> the FIFOs is that in some applications we only use e.g. 2 endpoints and
> there is considerable FIFO space left unused.
> 
> The goal is to use that unused FIFO space to squeeze more throughput out
> of the pipe, since it amortizes SW latency.
> 
> This patch is essentially the same as reverting the original commit :-)

No, it's not quite the same as nullifying the resizing algorithm.  This
patch is predicated on a key part of the resizing algorithm where
dwc3_gadget_clear_tx_fifos() occurs upon receiving Set_Configuration in
ep0.c.  Which means that each new connection starts off with a blank
slate with all the GTXFIFOSIZ(n) registers cleared.  Then each EP gets
resized one at a time when usb_ep_enable() is called.

The problem this patch is fixing is avoiding *re-resizing*, the idea
being that if an EP was already resized once during a session (from
Set Configuration until the next reset or disconnect), then 
it should be good to go even if it gets disabled and re-enabled again.
Since we lack any boolean state variable in struct dwc3_ep reflecting
whether it had already been resized, re-reading the GTXFIFOSIZ register
is the next best equivalent.  Note also that this check occurs after
the if (!dwc->do_fifo_resize) check so this is applicable only if the
entire "tx-fifo-resize" mechanism is enabled.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
