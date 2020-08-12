Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A187242E92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 20:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgHLSel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 14:34:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32117 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgHLSej (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 14:34:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597257278; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YMgdLCavA2gWDdGndhBu3vm0gMRoe/w366UIv1kB24I=; b=o3+qnXiafzwwqowt9dAWefENPy1MBbx6GrO2+QxhpSGzD+yNuYxvqslve4YOdzECWDIJd/l7
 EIx/eCD3sVkxJw8qDGrv2wPJXgnPTJjg2SqE2WCgW11VekrEbIlkMk9UBl3uo/GzN2e37mf6
 EHA4QZTyNn71OT0c/NAepkjY85c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f34362f2f4952907dc525ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 18:34:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52453C43391; Wed, 12 Aug 2020 18:34:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.76.76] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1F27C433C6;
        Wed, 12 Aug 2020 18:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1F27C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Felipe Balbi <balbi@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
References: <20200624022848.7765-1-wcheng@codeaurora.org>
 <20200624022848.7765-2-wcheng@codeaurora.org> <87d03yptxi.fsf@kernel.org>
 <b0c8a95b-45e3-0d79-2a7c-14c8936dd551@codeaurora.org>
 <877du5pseu.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <a55445db-91b0-c2fd-0a90-0b10870b45cb@codeaurora.org>
Date:   Wed, 12 Aug 2020 11:34:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877du5pseu.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/11/2020 12:12 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Wesley Cheng <wcheng@codeaurora.org> writes:
>> On 8/10/2020 5:27 AM, Felipe Balbi wrote:
>>> Wesley Cheng <wcheng@codeaurora.org> writes:
>>>
>>> Hi,
>>>
>>>> Some devices have USB compositions which may require multiple endpoints
>>>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>>>> sufficient for these compositions.  By utilizing flexible TX FIFO
>>>> allocation, this allows for endpoints to request the required FIFO depth to
>>>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>>>> a larger TX FIFO size results in better TX throughput.
>>>
>>> how much better? What's the impact? Got some real numbers of this
>>> running with upstream kernel? I guess mass storage gadget is the
>>> simplest one to test.
>>>
>> Hi Felipe,
>>
>> Thanks for the input.
>>
>> Sorry for not including the numbers in the patch itself, but I did
>> mention the set of mass storage tests I ran w/ the upstream kernel on
>> SM8150 in the cover letter.  Let me just share that here:
>>
>> Test Parameters:
>>  - Platform: Qualcomm SM8150
>>  - bMaxBurst = 6
>>  - USB req size = 256kB
>>  - Num of USB reqs = 16
>>  - USB Speed = Super-Speed
>>  - Function Driver: Mass Storage (w/ ramdisk)
>>  - Test Application: CrystalDiskMark
>>
>> Results:
>>
>> TXFIFO Depth = 3 max packets
>>
>> Test Case | Data Size | AVG tput (in MB/s)
>> -------------------------------------------
>> Sequential|1 GB x     |
>> Read      |9 loops    | 193.60
>> 	  |           | 195.86
>>           |           | 184.77
>>           |           | 193.60
>> -------------------------------------------
>>
>> TXFIFO Depth = 6 max packets
>>
>> Test Case | Data Size | AVG tput (in MB/s)
>> -------------------------------------------
>> Sequential|1 GB x     |
>> Read      |9 loops    | 287.35
>> 	  |           | 304.94
>>           |           | 289.64
>>           |           | 293.61
>> -------------------------------------------
> 
> awesome, thanks a lot for this :-) It's a considerable increase in your
> setup. My only fear here is that we may end up creating a situation
> where we can't allocate enough FIFO for all endpoints. This is, of
> course, a consequence of the fact that we enable one endpoint at a
> time.
> 
> Perhaps we could envision a way where function driver requests endpoints
> in bulk, i.e. combines all endpoint requirements into a single method
> call for gadget framework and, consequently, for UDC.
> 
Hi Felipe,

I agree...Resizing the txfifo is not as straightforward as it sounds :).
 Would be interesting to see how this affects tput on other platforms as
well.  We had a few discussions within our team, and came up with the
logic implemented in this patch to reserve at least 1 txfifo per
endpoint. Then we allocate any additional fifo space requests based on
the remaining space left.  That way we could avoid over allocating, but
the trade off is that we may have unused EPs taking up fifo space.

I didn't consider branching out to changing the gadget framework, so let
me take a look at your suggestion to see how it turns out.

>>>> +	if (!dwc->needs_fifo_resize)
>>>> +		return 0;
>>>> +
>>>> +	/* resize IN endpoints except ep0 */
>>>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>>>> +		return 0;
>>>> +
>>>> +	/* Don't resize already resized IN endpoint */
>>>> +	if (dep->fifo_depth)
>>>
>>> using fifo_depth as a flag seems flakey to me. What happens when someone
>>> in the future changes the behavior below and this doesn't apply anymore?
>>>
>>> Also, why is this procedure called more than once for the same endpoint?
>>> Does that really happen?
>>>
>> I guess it can be considered a bug elsewhere (ie usb gadget or function
>> driver) if this happens twice.  Plus, if we decide to keep this in the
>> dwc3 enable endpoint path, the DWC3_EP_ENABLED flag will ensure it's
>> called only once as well.  Its probably overkill to check fifo_depth here.
> 
> We could add a dev_WARN_ONCE() just to catch any possible bugs elsewhere.
> 

OK, I can add that.

>>>> +	if (remaining < fifo_size) {
>>>> +		if (remaining > 0)
>>>> +			fifo_size = remaining;
>>>> +		else
>>>> +			fifo_size = 0;
>>>> +	}
>>>> +
>>>> +	fifo_size += fifo;
>>>> +	fifo_size++;
>>>
>>> why the increment?
>>>
>> This is to account for the last +1 in the equation from the DWC3 databook:
>> fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1 <- this one
> 
> great, could you add this detail as a comment so it doesn't look as
> cryptic? :-)
> 

Sure, of course.

>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>>>>  {
>>>>  	const struct usb_ss_ep_comp_descriptor *comp_desc;
>>>> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>>>>  	int			ret;
>>>>  
>>>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>>>> +		ret = dwc3_gadget_resize_tx_fifos(dep);
>>>> +		if (ret)
>>>> +			return ret;
>>>
>>> doesn't it look odd that you're resizing every fifo every time a new
>>> endpoint is enabled? Is there a better way to achieve this?
>>>
>> We're only resizing a single fifo per call, and clearing the previous
>> fifo configuration upon receiving the set address.  In the past, I know
>> the change was to resize all fifos after receiving the set configuration
>> packet.  With that approach, I believe we saw issues with some function
>> drivers that immediately queued a USB request during their set_alt()
>> routine, followed by the dwc3 ep0 driver calling the TX fifo resize
>> API.(as the tx fifo resize was executed after we delegated the set
>> config packet to the USB composite)
> 
> I don't remember seeing such an issue. Allocating FIFOs after we know
> the entire requirements would avoid another possible situation, that of
> dwc3 exausting FIFO space before it knows there are more enpdoints to
> enable.
> 
> One possibility around this was suggested above, something along the
> lines of:
> 
> 	usb_gadget_ep_enable_bulk(struct usb_gadget *, struct
> 		usb_ep_alloc_desc *alloc_desc)
> 
> (please think of better names, I'm hopeless haha)
> 
Sorry forgot to mention that this is something we caught internally with
our testing using the older txfifo resizing change.  As mentioned above,
let me dive into this suggestion a bit more.

Thanks
Wesley

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
