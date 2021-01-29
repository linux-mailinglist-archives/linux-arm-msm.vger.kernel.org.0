Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E265308E8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 21:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhA2UhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 15:37:13 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:31881 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232887AbhA2UhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 15:37:13 -0500
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Jan 2021 15:37:12 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611952607; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=drmkmIL2SroI4KkHMKq3UPc/T4ZxaQH66OmhxBJF2Rc=; b=BAoRNUPDM7UjuAwHr3Pu6vWUIma37dKIV6RMRKoYFddkAeJIkgj5wlC2jMVe6psK0e2tkXXW
 dxjeoKbgETw+IHmd19MRA+R/NDjI71oHpqzzQfnjDXrph7fy7ttlT6SQMKk/3jin27NCZr8B
 o50G+knVSqgsHWOY6D4ceN1FEkA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601470547a21b36a9d0347a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 20:30:12
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A74D5C43461; Fri, 29 Jan 2021 20:30:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.127.29] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36F25C433C6;
        Fri, 29 Jan 2021 20:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36F25C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v7 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
To:     Jack Pham <jackp@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
 <1611895604-4496-5-git-send-email-wcheng@codeaurora.org>
 <20210129092418.GA1879@jackp-linux.qualcomm.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b9143845-0c40-392f-8c36-a11c0074f52e@codeaurora.org>
Date:   Fri, 29 Jan 2021 12:30:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129092418.GA1879@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/29/2021 1:24 AM, Jack Pham wrote:
> Hi Wesley,
> 
> On Thu, Jan 28, 2021 at 08:46:43PM -0800, Wesley Cheng wrote:
>> In order to take advantage of the TX fifo resizing logic, manually add
>> these properties to the DWC3 child node by default.  This will allow
>> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
>> help with performance.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d803ee9..4ea6be3 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -564,6 +564,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>>  
>>  static const struct property_entry dwc3_qcom_acpi_properties[] = {
>>  	PROPERTY_ENTRY_STRING("dr_mode", "host"),
>> +	PROPERTY_ENTRY_BOOL("tx-fifo-resize"),
>>  	{}
>>  };
>>  
>> @@ -634,6 +635,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>>  	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
>>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
>>  	struct device		*dev = &pdev->dev;
>> +	struct property		*prop;
>>  	int			ret;
>>  
>>  	dwc3_np = of_get_child_by_name(np, "dwc3");
>> @@ -642,6 +644,14 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>>  		return -ENODEV;
>>  	}
>>  
>> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
>> +	if (prop) {
>> +		prop->name = "tx-fifo-resize";
>> +		ret = of_add_property(dwc3_np, prop);
>> +		if (ret < 0)
>> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");
> 
> You'll need to kfree(prop) both in case of error here as well as in the
> driver's .remove() callback. Maybe easier to devm_kzalloc()?

Hi Jack,

Thanks for the catch, will fix this with the devm variant.

Hi Bjorn,

Just wanted to see what you thought about this approach?  This way we
can just keep the dt binding w/o having to re-add it in the future, as
well as not needing to enable this property on every qcom platform with
dwc3.

Tested on my set up, and removed the change which added the property
from the DTSI node.

Thanks
Wesley Cheng

> 
> Jack
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
