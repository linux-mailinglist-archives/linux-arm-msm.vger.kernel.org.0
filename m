Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541D63BDE64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 22:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhGFUW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 16:22:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17187 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhGFUW1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 16:22:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625602788; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bVsxEM7GBkgihUbSf5tSkkwxcoMoVHENciajGKiwiQA=; b=FftymLY8DZBXAhJKJU3FhBEFDpa0D3wjA6ztG4dE9XtpfIvurxi++TvavF3WvcGVf80Q3o9L
 v9VUzL0GIDe4qYMlzSOIUruO7cF2XGSAWcQNb3OwzXQb3Qy5HBMs3Uxoi16CTVoJ+I3vqDhY
 6F9JRC0PSvpXQaekPYK9b0yKLVo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e4bae0f30429861410fb7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 20:19:44
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2ED16C4360C; Tue,  6 Jul 2021 20:19:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.78.185] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4A73C4360C;
        Tue,  6 Jul 2021 20:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4A73C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v12 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        robh+dt@kernel.org, frowand.list@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com
References: <1625218655-14180-1-git-send-email-wcheng@codeaurora.org>
 <1625218655-14180-4-git-send-email-wcheng@codeaurora.org>
 <YOSdRKTy3+CdV/UF@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <2ee71465-d921-8904-2009-1e46ad1a988b@codeaurora.org>
Date:   Tue, 6 Jul 2021 13:19:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOSdRKTy3+CdV/UF@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/6/2021 11:13 AM, Greg KH wrote:
> On Fri, Jul 02, 2021 at 02:37:32AM -0700, Wesley Cheng wrote:
>> Some devices have USB compositions which may require multiple endpoints
>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>> sufficient for these compositions.  By utilizing flexible TX FIFO
>> allocation, this allows for endpoints to request the required FIFO depth to
>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>> a larger TX FIFO size results in better TX throughput.
>>
>> By introducing the check_config() callback, the resizing logic can fetch
>> the maximum number of endpoints used in the USB composition (can contain
>> multiple configurations), which helps ensure that the resizing logic can
>> fulfill the configuration(s), or return an error to the gadget layer
>> otherwise during bind time.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/core.c   |   9 ++
>>  drivers/usb/dwc3/core.h   |  15 ++++
>>  drivers/usb/dwc3/ep0.c    |   2 +
>>  drivers/usb/dwc3/gadget.c | 221 ++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 247 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index e0a8e79..a7bcdb9d 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	u8			rx_max_burst_prd;
>>  	u8			tx_thr_num_pkt_prd;
>>  	u8			tx_max_burst_prd;
>> +	u8			tx_fifo_resize_max_num;
>>  	const char		*usb_psy_name;
>>  	int			ret;
>>  
>> @@ -1282,6 +1283,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	 */
>>  	hird_threshold = 12;
>>  
>> +	tx_fifo_resize_max_num = 6;
>> +

Hi Greg,
> 
> No comment as to why 6 was picked, like the other defaults in this
> function?
> 
> Why was 6 picked?
> 
> 
Talked with Thinh about this sometime back about why 6 was picked.  It
was just an arbitrary setting we decided on throughout our testing, as
that was what provided the best tput numbers for our system.  Hence why
it was suggested to have a separate property, so other vendors can set
this to accommodate their difference in HW latencies.

>>  	dwc->maximum_speed = usb_get_maximum_speed(dev);
>>  	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>>  	dwc->dr_mode = usb_get_dr_mode(dev);
>> @@ -1325,6 +1328,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				&tx_thr_num_pkt_prd);
>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>  				&tx_max_burst_prd);
>> +	dwc->do_fifo_resize = device_property_read_bool(dev,
>> +							"tx-fifo-resize");
>> +	device_property_read_u8(dev, "tx-fifo-max-num",
>> +				&tx_fifo_resize_max_num);
> 
> So you overwrite the "max" with whatever is given to you?  What if
> tx-fifo-resize is not enabled?
>
If tx-fifo-resize is not enabled, then there shouldn't be anything that
will reference this property.  As mentioned in the previous comment, HW
vendors may not need a FIFO size of 6 max packets for their particular
system, so they should be able to program this to their needs.

If someone programs to this a large number, the logic works where it
will allocate based off the space left after ensuring enough space for 1
FIFO per ep.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
