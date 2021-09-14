Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7BE40A2FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 04:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbhINCCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 22:02:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53049 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230340AbhINCCq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 22:02:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631584890; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=D7oEbfIB8SXgSpx7XH0vfIt5cIgXMAHEU8eIkv7pgo4=; b=qVPLGryetWQPIm4gKVhkwGMQweTn87wjUBuS3y2WQ08IRY2IaxvVT4RW4r/Bu/b+QU5e47nK
 vnakh9T7ewCA7VO0KUsQHojIo/JLwwjLWXF4jH8xdiTPDQYp+FGrT/JZ0pwbbdNngwOIYgiJ
 SPMcOkcnAz63c1fgBhEJ/K8mnqs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61400274b585cc7d249a52ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 02:01:24
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 947A5C43616; Tue, 14 Sep 2021 02:01:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.6] (cpe-75-80-185-151.san.res.rr.com [75.80.185.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC0DEC4338F;
        Tue, 14 Sep 2021 02:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DC0DEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
Date:   Mon, 13 Sep 2021 19:01:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/10/2021 8:08 PM, Thinh Nguyen wrote:
> Wesley Cheng wrote:
>>
>>
>> On 9/9/2021 6:15 PM, Thinh Nguyen wrote:
>>> Jack Pham wrote:
>>>> Some functions may dynamically enable and disable their endpoints
>>>> regularly throughout their operation, particularly when Set Interface
>>>> is employed to switch between Alternate Settings.  For instance the
>>>> UAC2 function has its respective endpoints for playback & capture
>>>> associated with AltSetting 1, in which case those endpoints would not
>>>> get enabled until the host activates the AltSetting.  And they
>>>> conversely become disabled when the interfaces' AltSetting 0 is
>>>> chosen.
>>>>
>>>> With the DWC3 FIFO resizing algorithm recently added, every
>>>> usb_ep_enable() call results in a call to resize that EP's TXFIFO,
>>>> but if the same endpoint is enabled again and again, this incorrectly
>>>> leads to FIFO RAM allocation exhaustion as the mechanism did not
>>>> account for the possibility that endpoints can be re-enabled many
>>>> times.
>>>>
>>>> Example log splat:
>>>>
>>>> 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
>>>> 	configfs-gadget gadget: u_audio_start_capture:521 Error!
>>>> 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
>>>>
>>>> This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
>>>> if an endpoint is already resized, avoiding the calculation error
>>>> resulting from accumulating the EP's FIFO depth repeatedly.
>>>>
>>>> Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
>>>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
>>>> ---
>>>>  drivers/usb/dwc3/gadget.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index 804b50548163..c647c76d7361 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>>>>  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>>>>  		return 0;
>>>>  
>>>> +	/* bail if already resized */
>>>> +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
>>>> +		return 0;
>>>> +
>>>>  	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>>>>  
>>>>  	if ((dep->endpoint.maxburst > 1 &&
>>>>
>>
>> Hi Thinh,
>>
>>>
>>> This seems like a workaround more than a fix. As previously pointed out,
>>> there will be problems when there are multiple alternate setting
>>> interface [2]. If we're doing this way, are we properly allocating the
>>> fifo size for the alternate setting that requires the most fifo size and
>>> not just the first alt-setting 0? Also different alt-setting can have
>>
>> Each alt interface will call usb_ep_autoconfig() which should be
>> assigned different endpoint numbers.  This would mean that if alt intf#0
>> gets selected, and EP is enabled, then we will resize the TXFIFO and map
>> that FIFO to the physical EP.  Then when/if the host requests the other
>> alt intf#1, and that calls EP enable, then the logic will then attempt
>> to resize based on the parameters, and again map that FIFO to the
>> physical EP. (since we call autoconfig on all interfaces, they should be
>> assigned different endpoints)

Hi Thinh,

> 
> That's not true. Different alt-settings of an interface can share
> endpoint numbers. This is often the case for UASP driver where
> alt-setting 0 is for BOT protocol and alt-setting 1 is UASP. When we
> switch alt-setting, we disable the current endpoints and enable the
> old/new ones.
> 

Thanks for pointing that use case out.  Maybe we can consider seeing if
we can walk through all alternate interfaces for a particular function,
and resize for the largest setting?  That might be a possible
improvement made to the check_config() function.  Let me start makign
the changes for this and verifying it.

>>
>> I agree that there is currently a limitation because we are going to
>> reserve at minimum 1 FIFO for BOTH alt interfaces, even though there is
>> only 1 interface active at a time.  The missing logic that we might be
>> missing is seeing how we can re-purpose the FIFO that is being disabled.
>>  However, I think Jack's fix here would be applicable to the improvement
>> in logic to re-use/re-assign FIFO space allocated by disabled EPs also.
>>
> 
> Improvement is always great. I just hope we don't just stop where we are
> now. Since you're working on this feature at the moment, it would be
> good to also resolve some of the outstanding issues as Jack's fix seems
> to be incomplete.
> 

If we implement the improvement mentioned above, I think Jack's fix will
be applicable there as well.  If we resize for the largest alternate
interface, then there would be no reason for us to resize again.

>>> different endpoints, the logic handling this may not be simple.
>>>
>>> There are a few review comments for Wesley. Hopefully they get resolved
>>> eventually.
>>
>> As mentioned above, there is a lot of considerations we need to make
>> when looking at the amount of combinations that can be done for a USB
>> configuration.  We obviously want to see if we can find a way to
>> re-allocate FIFO space, but it gets complicated if we run into a
>> "fragmented" situation where the RAM associated to the EP being
>> re-allocated is in between 2 that are active.
>>
> 
> I'd like to have this feature added, and it would be great if it can
> overcome some of the current limitations. At the moment, if this feature
> is enabled, it may improve some applications, but it may also cause
> regression for some. As I noted, the fix may not be simple, but I hope
> this feature can work for various applications and not just a limited few.
> 

Agreed, there are some use cases that we may not consider in our
platform, so I appreciate the input.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
