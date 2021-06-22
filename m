Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6685F3AFC9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 07:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhFVF3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 01:29:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23988 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhFVF3u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 01:29:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624339653; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=196ScZIl9y0vVrRJechOQeLJjRcd6SzSZc0O2RQdWro=; b=cTpcs0IPl9/KZot6WnBpRCiFde5PuTR5PiXqLX4W6/bQ4gdHJ+2SdxwZ4SaN0L14DrZFPz3G
 MBvEe4bJ+4DNg3b5KCIFe5HNDOhI4SJ0guoFdjz+OhQjAjpd2ZGSfn3+H6VqgrbabuiT6tOq
 UfmG8sbxmk32WQ2+YmaYWmW4N0o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60d174b0e570c05619c1a871 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 05:27:12
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD227C43217; Tue, 22 Jun 2021 05:27:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.90.136] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05A4BC433D3;
        Tue, 22 Jun 2021 05:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05A4BC433D3
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
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <012b0264-107a-5596-d73f-3a2fd20470cf@codeaurora.org>
Date:   Mon, 21 Jun 2021 22:27:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMss5tFFBjokk1k6@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/17/2021 4:07 AM, Greg KH wrote:
> On Thu, Jun 17, 2021 at 02:58:15AM -0700, Wesley Cheng wrote:
>> Ensure that the USB gadget is able to support the configuration being
>> added based on the number of endpoints required from all interfaces.  This
>> is for accounting for any bandwidth or space limitations.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>> index 15a607c..76b9983 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>  		struct usb_function *f;
>>  		struct usb_function *tmp;
>>  		struct gadget_config_name *cn;
>> +		unsigned long ep_map = 0;
>>  
>>  		if (gadget_is_otg(gadget))
>>  			c->descriptors = otg_desc;
>> @@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>  				list_add(&f->list, &cfg->func_list);
>>  				goto err_purge_funcs;
>>  			}
>> +			if (f->fs_descriptors) {
>> +				struct usb_descriptor_header **d;
>> +
>> +				d = f->fs_descriptors;
>> +				for (; *d; ++d) {

Hi Greg,

Thanks for the review and feedback.

> 
> With this check, there really is not a need to check for
> f->fs_descriptors above in the if statement, right?
> 

f->fs_descriptor will carry the table of descriptors that a particular
function driver has assigned to it.  The for loop here, will dereference
the individual descriptors within that descriptor array, so we need to
first ensure the descriptor array is present before traversing through
the individual entries/elements.

>> +					struct usb_endpoint_descriptor *ep;
>> +					int addr;
>> +
>> +					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
>> +						continue;
>> +
>> +					ep = (struct usb_endpoint_descriptor *)*d;
>> +					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
>> +						(ep->bEndpointAddress & 0x0f);
> 
> Don't we have direction macros for this type of check?
> 

I don't believe we have a macro which would be able to convert the
bEndpointAddress field into the bit which needs to be set, assuming that
the 32bit ep_map has the lower 16bits carrying OUT EPs, and the upper
16bits carrying the IN EPs.

>> +					set_bit(addr, &ep_map);
>> +				}
> 
> What is this loop trying to do?  Please document it as I can not figure
> it out at all.
> 

Sure I can add some comments to this loop.  All its trying to do is to
set corresponding EPs being used (both IN and OUT eps) by a particular
USB configuration, then passing this bit mapped value to the DWC3 gadget
to evaluate.  As mentioned in the previous comment, the upper 16 bits
carries all IN eps used, and the lower 16 bits carries all the OUT eps used.

Thanks
Wesley Cheng

> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
