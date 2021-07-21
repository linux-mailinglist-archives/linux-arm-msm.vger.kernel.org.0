Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E509E3D08D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 08:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhGUFnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:43:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31324 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233523AbhGUFml (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:42:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626848595; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EXl6e0NnYNt6QhqMh3qY0wjuq0W1EMQQYn9QnynAyfE=; b=tbOTrfkOjreGrdo8+KNQhPYvm4MdPz7rNTlZXJZbJt+XxS2BwO4c2QnLmW3UGy4kKewtEwyb
 +e1N/rOCieedZCAGjwEfol4p2ikqbXuiAEVVr17Jymz3uD0q7Oey3hqht17ak+m7/pztDqDu
 /cUXueW1pocfcQDH1ITRr92nfz0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f7bd4ce31d882d1862dd6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 06:23:08
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF881C43144; Wed, 21 Jul 2021 06:23:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.40.148] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D3EEC433D3;
        Wed, 21 Jul 2021 06:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D3EEC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
 <87czrmzjym.fsf@kernel.org>
 <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
 <877dhtz9de.fsf@kernel.org>
 <6bc35b95-8386-1a6b-46dd-f33035e6dee5@codeaurora.org>
 <YPa2YL2mfffiz4i4@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b5917fc0-c916-0a51-dc4c-315d7f02cafa@codeaurora.org>
Date:   Tue, 20 Jul 2021 23:23:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPa2YL2mfffiz4i4@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/20/2021 4:41 AM, gregkh@linuxfoundation.org wrote:
> On Wed, Jul 14, 2021 at 12:30:07AM -0700, Wesley Cheng wrote:
>>
>>
>> On 7/13/2021 11:40 PM, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>>> Wesley Cheng wrote:
>>>>>>> Some devices have USB compositions which may require multiple endpoints
>>>>>>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>>>>>>> sufficient for these compositions.  By utilizing flexible TX FIFO
>>>>>>> allocation, this allows for endpoints to request the required FIFO depth to
>>>>>>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>>>>>>> a larger TX FIFO size results in better TX throughput.
>>>>>>>
>>>>>>> By introducing the check_config() callback, the resizing logic can fetch
>>>>>>> the maximum number of endpoints used in the USB composition (can contain
>>>>>>> multiple configurations), which helps ensure that the resizing logic can
>>>>>>> fulfill the configuration(s), or return an error to the gadget layer
>>>>>>> otherwise during bind time.
>>>>>>>
>>>>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>>>>> ---
>>>>>>>  drivers/usb/dwc3/core.c   |  15 +++
>>>>>>>  drivers/usb/dwc3/core.h   |  16 ++++
>>>>>>>  drivers/usb/dwc3/ep0.c    |   2 +
>>>>>>>  drivers/usb/dwc3/gadget.c | 232 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>  4 files changed, 265 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>>>> index ba74ad7..b194aecd 100644
>>>>>>> --- a/drivers/usb/dwc3/core.c
>>>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>>>> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>>>>  	u8			rx_max_burst_prd;
>>>>>>>  	u8			tx_thr_num_pkt_prd;
>>>>>>>  	u8			tx_max_burst_prd;
>>>>>>> +	u8			tx_fifo_resize_max_num;
>>>>>>>  	const char		*usb_psy_name;
>>>>>>>  	int			ret;
>>>>>>>  
>>>>>>> @@ -1282,6 +1283,13 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>>>>  	 */
>>>>>>>  	hird_threshold = 12;
>>>>>>>  
>>>>>>> +	/*
>>>>>>> +	 * default to a TXFIFO size large enough to fit 6 max packets.  This
>>>>>>> +	 * allows for systems with larger bus latencies to have some headroom
>>>>>>> +	 * for endpoints that have a large bMaxBurst value.
>>>>>>> +	 */
>>>>>>> +	tx_fifo_resize_max_num = 6;
>>>>>>> +
>>>>>>>  	dwc->maximum_speed = usb_get_maximum_speed(dev);
>>>>>>>  	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>>>>>>>  	dwc->dr_mode = usb_get_dr_mode(dev);
>>>>>>> @@ -1325,6 +1333,11 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>>>>  				&tx_thr_num_pkt_prd);
>>>>>>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>>>>>>  				&tx_max_burst_prd);
>>>>>>> +	dwc->do_fifo_resize = device_property_read_bool(dev,
>>>>>>> +							"tx-fifo-resize");
>>>>>>> +	if (dwc->do_fifo_resize)
>>>>>>> +		device_property_read_u8(dev, "tx-fifo-max-num",
>>>>>>> +					&tx_fifo_resize_max_num);
>>>>>>
>>>>>> Why is this check here? The dwc->tx_fifo_resize_max_num should store
>>>>>> whatever property the user sets. Whether the driver wants to use this
>>>>>
>>>>> Ack!
>>>>>
>>>>>> property should depend on "dwc->do_fifo_resize". Also why don't we have
>>>>>> "snps," prefix to be consistent with the other properties?
>>>>>
>>>>> Ack!
>>>>>
>>>>>> Can we enforce to a single property? If the designer wants to enable
>>>>>> this feature, he/she can to provide the tx-fifo-max-num. This would
>>>>>> simplify the driver a bit. Since this is to optimize for performance,
>>>>>> the user should know/want/test the specific value if they want to set
>>>>>> for their setup and not hoping that the default setting not break their
>>>>>> setup. So we can remove the "do_fifo_resize" property and just check
>>>>>> whether tx_fifo_resize_max_num is set.
>>>>>
>>>>> Ack!
>>>>>
>>>>> All very valid points :-)
>>>>>
>>
>> Hi Thinh/Felipe,
>>
>>>>
>>>> Looks like this series already landed in Greg's testing branch. Not sure
>>>> how we usually handle this to address some of our concerns. Add fix
>>>> patches on top of Greg's testing branch?
>>>
>>> yup, no choice anymore :-(
>>>
>>
>> Let me review your feedback, which had some good points.  We can add a
>> change addressing everything on top of what is merged on Greg's branch.

Hi Greg,

> 
> Any hint as to when these fixups will be sent?
> 

Will get something by mid-week next week.  Sorry have been occupied with
tasks on my end.

Thanks
Wesley Cheng


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
