Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC41D42E57A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhJOAxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:53:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50057 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229693AbhJOAxu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:53:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634259105; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=X/n96l6/6gzU38IsmnzyVmbcy6Kb1syRDS8t9lY4vOM=; b=PczANRNMdMGQaFzpfEm0ikiGeKhdDo012OUWG82Y31TftAtrFNg6WMaIGOCWcyEQzaT7vgbQ
 B1imwIBXqxNzbw13aAgDjDGSepvuG5te1o6RJqmn6yrV4cwHf0ofUMPgtjxvtp7gnpAKfo7i
 3gkedDVL3EhAQ1LIEd0S3ZdOTqU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6168d07cf3e5b80f1f344bec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 00:51:08
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C93CC43616; Fri, 15 Oct 2021 00:51:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62B76C4338F;
        Fri, 15 Oct 2021 00:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 62B76C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 14 Oct 2021 17:51:01 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Message-ID: <20211015005101.GA16586@jackp-linux.qualcomm.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 08, 2021 at 12:07:20AM +0000, Thinh Nguyen wrote:
> Wesley Cheng wrote:
> > 
> > 
> > On 9/10/2021 8:08 PM, Thinh Nguyen wrote:
> >> Wesley Cheng wrote:
> >>>
> >>>
> >>> On 9/9/2021 6:15 PM, Thinh Nguyen wrote:
> >>>> Jack Pham wrote:
> >>>>> Some functions may dynamically enable and disable their endpoints
> >>>>> regularly throughout their operation, particularly when Set Interface
> >>>>> is employed to switch between Alternate Settings.  For instance the
> >>>>> UAC2 function has its respective endpoints for playback & capture
> >>>>> associated with AltSetting 1, in which case those endpoints would not
> >>>>> get enabled until the host activates the AltSetting.  And they
> >>>>> conversely become disabled when the interfaces' AltSetting 0 is
> >>>>> chosen.
> >>>>>
> >>>>> With the DWC3 FIFO resizing algorithm recently added, every
> >>>>> usb_ep_enable() call results in a call to resize that EP's TXFIFO,
> >>>>> but if the same endpoint is enabled again and again, this incorrectly
> >>>>> leads to FIFO RAM allocation exhaustion as the mechanism did not
> >>>>> account for the possibility that endpoints can be re-enabled many
> >>>>> times.
> >>>>>
> >>>>> Example log splat:
> >>>>>
> >>>>> 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
> >>>>> 	configfs-gadget gadget: u_audio_start_capture:521 Error!
> >>>>> 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
> >>>>>
> >>>>> This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
> >>>>> if an endpoint is already resized, avoiding the calculation error
> >>>>> resulting from accumulating the EP's FIFO depth repeatedly.
> >>>>>
> >>>>> Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> >>>>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> >>>>> ---
> >>>>>  drivers/usb/dwc3/gadget.c | 4 ++++
> >>>>>  1 file changed, 4 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> >>>>> index 804b50548163..c647c76d7361 100644
> >>>>> --- a/drivers/usb/dwc3/gadget.c
> >>>>> +++ b/drivers/usb/dwc3/gadget.c
> >>>>> @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> >>>>>  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> >>>>>  		return 0;
> >>>>>  
> >>>>> +	/* bail if already resized */
> >>>>> +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
> >>>>> +		return 0;
> >>>>> +
> >>>>>  	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> >>>>>  
> >>>>>  	if ((dep->endpoint.maxburst > 1 &&
> >>>>>
> >>>
> >>> Hi Thinh,
> >>>
> >>>>
> >>>> This seems like a workaround more than a fix. As previously pointed out,
> >>>> there will be problems when there are multiple alternate setting
> >>>> interface [2]. If we're doing this way, are we properly allocating the
> >>>> fifo size for the alternate setting that requires the most fifo size and
> >>>> not just the first alt-setting 0? Also different alt-setting can have
> >>>
> >>> Each alt interface will call usb_ep_autoconfig() which should be
> >>> assigned different endpoint numbers.  This would mean that if alt intf#0
> >>> gets selected, and EP is enabled, then we will resize the TXFIFO and map
> >>> that FIFO to the physical EP.  Then when/if the host requests the other
> >>> alt intf#1, and that calls EP enable, then the logic will then attempt
> >>> to resize based on the parameters, and again map that FIFO to the
> >>> physical EP. (since we call autoconfig on all interfaces, they should be
> >>> assigned different endpoints)
> > 
> > Hi Thinh,
> > 
> >>
> >> That's not true. Different alt-settings of an interface can share
> >> endpoint numbers. This is often the case for UASP driver where
> >> alt-setting 0 is for BOT protocol and alt-setting 1 is UASP. When we
> >> switch alt-setting, we disable the current endpoints and enable the
> >> old/new ones.
> >>
> > 
> > Thanks for pointing that use case out.  Maybe we can consider seeing if
> > we can walk through all alternate interfaces for a particular function,
> > and resize for the largest setting?  That might be a possible
> > improvement made to the check_config() function.  Let me start makign
> > the changes for this and verifying it.
> > 
> 
> Thanks!
> 
> Currently the gadget configures early and informs the gadget driver of
> how many endpoints are available, which doesn't leave much room for the
> gadget to do optimization/reconfiguration.
> 
> If there's an option for the composite layer to inform the controller
> driver of the entire configuration, then we can take advantage of more
> dwc3 controller capability/flexibility (not just resizing txfifo).
> 
> >>>
> >>> I agree that there is currently a limitation because we are going to
> >>> reserve at minimum 1 FIFO for BOTH alt interfaces, even though there is
> >>> only 1 interface active at a time.  The missing logic that we might be
> >>> missing is seeing how we can re-purpose the FIFO that is being disabled.
> >>>  However, I think Jack's fix here would be applicable to the improvement
> >>> in logic to re-use/re-assign FIFO space allocated by disabled EPs also.
> >>>
> >>
> >> Improvement is always great. I just hope we don't just stop where we are
> >> now. Since you're working on this feature at the moment, it would be
> >> good to also resolve some of the outstanding issues as Jack's fix seems
> >> to be incomplete.
> >>
> > 
> > If we implement the improvement mentioned above, I think Jack's fix will
> > be applicable there as well.  If we resize for the largest alternate
> > interface, then there would be no reason for us to resize again.
> > 
> As long as you have the above as part of your roadmap, I don't mind
> Jack's fix for now.

Thanks for your input as always Thinh.  Does the patch still look ok in
its current state?  Last time I had responded to Felipe that I would try
to entertain adding an explicit flag to keep track of whether an EP had
been resized yet or not.  When trying to implement this as another
DWC3_EP_* bit for dep->flags we'd then need to retain this flag across
ep_disable/enable calls, so it looks a tiny bit cumbersome because
dep->flags isn't neatly 0 anymore :-P.

So ep_disable() would need to look something like this:

 static int __dwc3_gadget_ep_disable(struct dwc3_ep *dep)
 {
 ...
	dep->stream_capable = false;
	dep->type = 0;
-	dep->flags = 0;
+	dep->flags &= DWC3_EP_TXFIFO_RESIZED;

	return 0;
 }

The flag would be initially set in dwc3_gadget_resize_tx_fifos() and
also would need to be checked there as well to avoid re-resizing.  It
would then get cleared in dwc3_gadget_clear_tx_fifos().

Is this still preferable to the current patch with just the single
register read?

> Depends on your implementation, Jack's fix may not
> be applicable. Regardless, ultimately it's up to Felipe. :)

Felipe, what do you think?  Wesley is already working on improving the
scheme to better handle endpoints that get activated only when switching
AltSettings.  But I'd still like to get my patch in as an incremental
fix though since it does take care of an existing issue with disabling
and re-enabling endpoints within the same Configuration & AltSetting.

Thanks,
Jack

> 
> >>>> different endpoints, the logic handling this may not be simple.
> >>>>
> >>>> There are a few review comments for Wesley. Hopefully they get resolved
> >>>> eventually.
> >>>
> >>> As mentioned above, there is a lot of considerations we need to make
> >>> when looking at the amount of combinations that can be done for a USB
> >>> configuration.  We obviously want to see if we can find a way to
> >>> re-allocate FIFO space, but it gets complicated if we run into a
> >>> "fragmented" situation where the RAM associated to the EP being
> >>> re-allocated is in between 2 that are active.
> >>>
> >>
> >> I'd like to have this feature added, and it would be great if it can
> >> overcome some of the current limitations. At the moment, if this feature
> >> is enabled, it may improve some applications, but it may also cause
> >> regression for some. As I noted, the fix may not be simple, but I hope
> >> this feature can work for various applications and not just a limited few.
> >>
> > 
> > Agreed, there are some use cases that we may not consider in our
> > platform, so I appreciate the input.
> > 
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
