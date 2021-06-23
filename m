Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D9C3B22AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 23:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFWVrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 17:47:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34165 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhFWVrO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 17:47:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624484696; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5BGEMURobcJs1YRJdsd1p1jqwtDiwEb1TOrMlLDJyMw=; b=vZJFBEi9XxE5UIOMKxJB3sGWZwERdMIx81m/njjcz7jLAlcNDzsJTzsgZh+1/2zvC07QerUp
 vtRohTLFZkR55sfztRfm82Mqimj8Y22VKlF+Mh2mIYpHx8XYoP/876JL6x/G7LTHytskz/5l
 PrItJh2/G+cidfINSu12cV8k73Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60d3ab43d2559fe392a771c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 21:44:35
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB0BFC4338A; Wed, 23 Jun 2021 21:44:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.66.189] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3535DC433F1;
        Wed, 23 Jun 2021 21:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3535DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 2/6] usb: gadget: configfs: Check USB configuration
 before adding
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
 <YMss5tFFBjokk1k6@kroah.com>
 <012b0264-107a-5596-d73f-3a2fd20470cf@codeaurora.org>
 <YNF9kv0kWAz6Pp00@kroah.com>
 <afe0c718-1c16-1b20-4b0c-d8592a13af42@codeaurora.org>
 <YNMcnISDv2e7bze1@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <e7d70e8c-4574-808c-80f6-ae469937f35d@codeaurora.org>
Date:   Wed, 23 Jun 2021 14:44:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNMcnISDv2e7bze1@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/23/2021 4:35 AM, Greg KH wrote:
> On Wed, Jun 23, 2021 at 02:38:55AM -0700, Wesley Cheng wrote:
>>
>>
>> On 6/21/2021 11:05 PM, Greg KH wrote:
>>> On Mon, Jun 21, 2021 at 10:27:09PM -0700, Wesley Cheng wrote:
>>>>
>>>>
>>>> On 6/17/2021 4:07 AM, Greg KH wrote:
>>>>> On Thu, Jun 17, 2021 at 02:58:15AM -0700, Wesley Cheng wrote:
>>>>>> Ensure that the USB gadget is able to support the configuration being
>>>>>> added based on the number of endpoints required from all interfaces.  This
>>>>>> is for accounting for any bandwidth or space limitations.
>>>>>>
>>>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>>>> ---
>>>>>>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
>>>>>>  1 file changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>>>>>> index 15a607c..76b9983 100644
>>>>>> --- a/drivers/usb/gadget/configfs.c
>>>>>> +++ b/drivers/usb/gadget/configfs.c
>>>>>> @@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>>>>>  		struct usb_function *f;
>>>>>>  		struct usb_function *tmp;
>>>>>>  		struct gadget_config_name *cn;
>>>>>> +		unsigned long ep_map = 0;
>>>>>>  
>>>>>>  		if (gadget_is_otg(gadget))
>>>>>>  			c->descriptors = otg_desc;
>>>>>> @@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>>>>>  				list_add(&f->list, &cfg->func_list);
>>>>>>  				goto err_purge_funcs;
>>>>>>  			}
>>>>>> +			if (f->fs_descriptors) {
>>>>>> +				struct usb_descriptor_header **d;
>>>>>> +
>>>>>> +				d = f->fs_descriptors;
>>>>>> +				for (; *d; ++d) {
>>>>
>>>> Hi Greg,
>>>>
>>>> Thanks for the review and feedback.
>>>>
>>>>>
>>>>> With this check, there really is not a need to check for
>>>>> f->fs_descriptors above in the if statement, right?
>>>>>
>>>>
>>>> f->fs_descriptor will carry the table of descriptors that a particular
>>>> function driver has assigned to it.  The for loop here, will dereference
>>>> the individual descriptors within that descriptor array, so we need to
>>>> first ensure the descriptor array is present before traversing through
>>>> the individual entries/elements.
>>>
>>> Ah, it's a dereference of an array element.  Subtle.  Tricky.  Messy :(
>>>
>>>>>> +					struct usb_endpoint_descriptor *ep;
>>>>>> +					int addr;
>>>>>> +
>>>>>> +					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
>>>>>> +						continue;
>>>>>> +
>>>>>> +					ep = (struct usb_endpoint_descriptor *)*d;
>>>>>> +					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
>>>>>> +						(ep->bEndpointAddress & 0x0f);
>>>>>
>>>>> Don't we have direction macros for this type of check?
>>>>>
>>>>
>>>> I don't believe we have a macro which would be able to convert the
>>>> bEndpointAddress field into the bit which needs to be set, assuming that
>>>> the 32bit ep_map has the lower 16bits carrying OUT EPs, and the upper
>>>> 16bits carrying the IN EPs.
>>
>> Hi Greg,
>>
>>>
>>> We have macros to tell if an endpoint is IN or OUT, please use those.
>>>
>>> And this "cram the whole thing into 64 bits" is not obvious at all.
>>> Just pass around the original pointer to the descriptors if someone
>>> wants to use it or not, don't make up yet-another-data-structure here
>>> for no good reason.  We aren't so memory constrained we need to pack
>>> stuff into bits here.
>>>
>>
>> Hmm ok, what I can do is to move this logic into the check_config()
>> callback itself, which is implemented by the UDC driver.  So now, the
>> DWC3 will have to do something similar to what is done here, ie loop the
>> EP descriptors for each function to determine the number of IN endpoints
>> being used.

Hi Greg,

> 
> We have common USB core functions for this, why can't you just use them?
> 

So, I've tried to use pre-existing mechanisms there in the USB core, but
they are not populated correctly at the time of function binding.  I
will highlight some of the things I've tried, and why they do not work.
 If possible, if you could point which core functions can achieve what
we are trying to do here, that would help as well.

  - f->endpoints - This is a bitmap which carries the endpoints used by
a particular function driver.  This does not work, as this is set during
receiving the SET_CONFIG packet.  (we need this during the function
driver binding stage)

  - gadget->in_epnum/gadget->out_epnum - This carries the count of
endpoints used per configuration.  This would be perfect, but this count
is only incremented when we are not matching EPs using the EP name.  So
in designs where the EP name is used to match, it can not be used.

 - gadget->ep_list - I can use this now in the check_config() to iterate
through the list of eps to see which ones have been claimed for a
particular configuration.

So just to re-iterate, the TXFIFO resize logic kicks in when the host
sends the SET_CONFIG packet, which is the "end" of USB enumeration.  We
had discussed a concern previously where, what if we run the resize
logic, and there is not enough internal memory.  We'd end up with an
enumerated device w/ certain functions broken.

This is where the check_config() comes into the picture.  It uses the
number of endpoints collected during the bind() stage, and checks to
make sure the resize logic can at least allocate 1 TXFIFO per endpoint.
 If it can not, then it will fail the bind sequence.

Thanks
Wesley Cheng
> Please do not take data that we already have in one format, and convert
> it to another one just for a single driver to consume.  That's
> pointless.
> 
> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
