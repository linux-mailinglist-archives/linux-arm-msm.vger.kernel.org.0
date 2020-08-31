Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF88257461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 09:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgHaHfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 03:35:04 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:10748 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728103AbgHaHfB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 03:35:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598859300; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=jgiqhD6mEWmgkZ8iCooIwuov0Mq1aYTRhNXeEovmpSI=; b=diis3OUmJatmlZ/vRdLxup7ZQ0N3fJVSGpkDnflrzbAS1Omr2JrqfjIp8wEtO01WfbThtNSG
 7uuV976r/UtsN5DBz5Hh6bEvuAQAtoxWB9XTendI8My84qOezuziZdTQdHLtbefv72W6FiC8
 6pk9JXcSGa6CGIiKZtACyUqiU/o=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f4ca81ea816b7fb48d07ee4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 07:34:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A6EEC43395; Mon, 31 Aug 2020 07:34:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.39.192] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F497C433CA;
        Mon, 31 Aug 2020 07:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0F497C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v5 4/6] usb: gadget: configfs: Check USB configuration
 before adding
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
References: <20200829055846.19034-1-wcheng@codeaurora.org>
 <20200829055846.19034-5-wcheng@codeaurora.org>
 <20200831022825.GA15756@b29397-desktop>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <2631cd0b-66d4-aabc-dc41-9ae5e84fa90d@codeaurora.org>
Date:   Mon, 31 Aug 2020 00:34:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200831022825.GA15756@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/30/2020 7:29 PM, Peter Chen wrote:
> On 20-08-28 22:58:44, Wesley Cheng wrote:
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
>> index 56051bb97349..7c74c04b1d8c 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -1361,6 +1361,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>  		struct usb_function *f;
>>  		struct usb_function *tmp;
>>  		struct gadget_config_name *cn;
>> +		unsigned long ep_map = 0;
>>  
>>  		if (gadget_is_otg(gadget))
>>  			c->descriptors = otg_desc;
>> @@ -1390,7 +1391,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>>  				list_add(&f->list, &cfg->func_list);
>>  				goto err_purge_funcs;
>>  			}
>> +			if (f->ss_descriptors) {
>> +				struct usb_descriptor_header **d;
>> +
>> +				d = f->ss_descriptors;
>> +				for (; *d; ++d) {
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
> ">> 3" or "<< 3?
> 

Hi Peter,

Thanks for your comments.  It should be ">> 3" as we want to utilize the
corresponding USB_DIR_IN bit in the bitmap to set the correct bit.
(USB_DIR_IN = 0x80)

>> +					set_bit(addr, &ep_map);
> 
> You want to record all endpoints on ep_map? Considering there are
> four EP_IN (1-4), and four EP_OUT (1-4), what the value of ep_map
> would like?
> 

So for example, if a configuration uses EP8IN and EP9OUT, then the
ep_map will look like:

EP8-IN:
addr = ((0x88 & 0x80) >> 3) | (0x88 & 0xf) --> 0x18

EP9-OUT:
addr = ((0x9 & 0x80) >> 3) | (0x9 & 0xf) --> 0x9

ep_map = ep_map = 0x01000200

The lower 16 bits will carry the OUT endpoints, whereas the upper 16
bits are the IN endpoints. (ie bit16 = ep0in, bit0 = ep0out)

>> +				}
>> +			}
>>  		}
>> +		ret = usb_gadget_check_config(cdev->gadget, ep_map);
>> +		if (ret)
>> +			goto err_purge_funcs;
>> +
> 
> You may move this patch after your 4nd patch to avoid "git bisect"
> issue.
> 

Sure, thanks for the suggestion, will do that in the next rev.

Thanks
Wesley

>>  		usb_ep_autoconfig_reset(cdev->gadget);
>>  	}
>>  	if (cdev->use_os_string) {
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
