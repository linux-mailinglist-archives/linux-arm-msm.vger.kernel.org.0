Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFB443698D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 19:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhJURrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 13:47:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52937 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhJURpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 13:45:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634838206; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=kMFb9ZVoikffIU0mbMBdnz5hSJA8sUX95BWY8GtEFi4=; b=TKZoDfJbknRA363S78/gWR23yavl2T4bt/YXKFbeWrjo4xOWxzQxcDCT0nGzhgtFCmcKUd6K
 vrh202GoqzwNw8dF1NoOB/EwRvNWain0NEpH2flXqflfqctMo31YkyT1Nhes58+KoC79QWex
 yajRQVcuVM1lo2bvTg1ASmsqiFg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6171a6bdb03398c06c0930b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 17:43:25
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C127FC4361B; Thu, 21 Oct 2021 17:43:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F8D1C4314B;
        Thu, 21 Oct 2021 17:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6F8D1C4314B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 21 Oct 2021 10:43:17 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Message-ID: <20211021174316.GA2357@jackp-linux.qualcomm.com>
References: <20211019004123.15987-1-jackp@codeaurora.org>
 <YXFGWPMmmdyaSOPg@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXFGWPMmmdyaSOPg@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 21, 2021 at 12:52:08PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 18, 2021 at 05:41:23PM -0700, Jack Pham wrote:
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
> > Add another bit DWC3_EP_TXFIFO_RESIZED to dep->flags to keep track of
> > whether an EP had already been resized in the current configuration.
> > If so, bail out of dwc3_gadget_resize_tx_fifos() to avoid the
> > calculation error resulting from accumulating the EP's FIFO depth
> > repeatedly.  This flag is retained across multiple ep_disable() and
> > ep_enable() calls and is cleared when GTXFIFOSIZn is reset in
> > dwc3_gadget_clear_tx_fifos() upon receiving the next Set Config.
> > 
> > Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> > v2: Added explicit flag to dep->flags and check that instead of directly
> >     reading the GTXFIFOSIZn register.
> > 
> >  drivers/usb/dwc3/core.h   | 1 +
> >  drivers/usb/dwc3/gadget.c | 8 +++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 5612bfdf37da..f033063f6948 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -723,6 +723,7 @@ struct dwc3_ep {
> >  #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
> >  #define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
> >  #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
> > +#define DWC3_EP_TXFIFO_RESIZED	BIT(12)
> 
> Any specific reason this isn't lined up properly?

The preceding macros admittedly aren't consistent either :-P.  Here's
the whole section with my change:

	unsigned int            flags;
#define DWC3_EP_ENABLED		BIT(0)
#define DWC3_EP_STALL		BIT(1)
#define DWC3_EP_WEDGE		BIT(2)
#define DWC3_EP_TRANSFER_STARTED BIT(3)
#define DWC3_EP_END_TRANSFER_PENDING BIT(4)
#define DWC3_EP_PENDING_REQUEST	BIT(5)
#define DWC3_EP_DELAY_START	BIT(6)
#define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
#define DWC3_EP_IGNORE_NEXT_NOSTREAM	BIT(8)
#define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
#define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
#define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
#define DWC3_EP_TXFIFO_RESIZED	BIT(12)

The macros for the earlier bits 0-2, 5 and 6 have shorter names and
therefore use one or two tabs to line up at an earlier tab stop.  But
the ones with the longer names for bits 7-11 use a single tab which bump
out the definition to the next tab column.  Since the macro I'm adding
in my patch has a shorter name I thought I'd follow the precedent of the
earlier bits and use a single tab which aligns with the earlier bits but
I agree it does look strange overall.  Especially with bits 3 & 4 which
aren't lined up at all.

I guess a patch to fix the rest of the earlier macros wouldn't hurt but
I'd also like this to go to stable too.  Should I send this as a 2-part
series: 1/2 being my change (with correct alignment and cc:stable) and
2/2 as a cleanup for bits 0-6?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
