Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A153B9D57
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 10:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhGBIN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 04:13:29 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19293 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhGBIN2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 04:13:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625213457; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FYWUVQrncpozsXLV74MYcklChO0it0+j8pO/qQyVCso=; b=kbiCDKIDyzrhKUS1plYJ6IcthRL+QaRRNHP6CyuxsfjCj4dF660/f4F9tL/oASc7tjsSiZ5z
 TgZGni+N/PBEZOYEHGsni1wsbPdVpyLb+wkgrhJnLWbT0amlpYhfw/T4ybTER/2ezlf/zQXb
 71kLc79UKCPHA8sDdnn47/sAZm8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60dec9e9ec0b18a7454324d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Jul 2021 08:10:17
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 328CCC4323A; Fri,  2 Jul 2021 08:10:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.67.21] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AB08C433F1;
        Fri,  2 Jul 2021 08:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9AB08C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v11 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        fntoth@gmail.com
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
 <1625043642-29822-5-git-send-email-wcheng@codeaurora.org>
 <YN6e8G1e9cZBBMr7@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <83237faa-9840-5d31-43da-8ce551e75067@codeaurora.org>
Date:   Fri, 2 Jul 2021 01:10:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN6e8G1e9cZBBMr7@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/1/2021 10:06 PM, Greg KH wrote:
> On Wed, Jun 30, 2021 at 02:00:41AM -0700, Wesley Cheng wrote:
>> In order to take advantage of the TX fifo resizing logic, manually add
>> these properties to the DWC3 child node by default.  This will allow
>> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
>> help with performance.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 49e6ca9..cec4f4a 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -640,6 +640,25 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>>  	return ret;
>>  }
>>  
>> +#ifdef CONFIG_OF
>> +static void dwc3_qcom_add_dt_props(struct device *dev, struct device_node *np)
>> +{
>> +	struct property		*prop;
>> +	int ret;
>> +
>> +	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
>> +	if (prop) {
>> +		prop->name = "tx-fifo-resize";
>> +		ret = of_add_property(np, prop);
>> +		if (ret < 0)
>> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");

Hi Greg,
> 
> Is that really an "informational" error?  :(
> 
>
We can remove it.  If anything we can always check the sysfs if the
property is present or not.

>> +	}
> 
> So if you can not allocate memory, you just fail quietly?  Are you sure
> that is ok?
> 
> Please properly handle errors.
> 
OK, will handle the case where we can't allocate memory for the property.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
