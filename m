Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9923081B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 00:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhA1XJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 18:09:34 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:34171 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229828AbhA1XJd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 18:09:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611875348; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=O8kFXrZt93Vjk8mo2c8C6NAXhyoA4VuHGdA2XbbyiBY=; b=hVU4Ztka/+5u1Et3chC1ojLzd7LPUv4RlI2LJbIhY1woPOoeNu3RMsB/I7RTEH7O+T2KG4Qg
 cZwmLqf1cUcY1wuWqYGQDCBcFKHZ9lcAnEIhoeEMi79Adr0FHJGoEOmJ4iBY6mI6djw8gzcH
 2CB+9hqfRk24BWpPkZFg2vApryc=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601343f8bcde412162da6a38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 23:08:40
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97D82C43461; Thu, 28 Jan 2021 23:08:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.127.29] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A11AC433C6;
        Thu, 28 Jan 2021 23:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2A11AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v6 3/4] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.chen@nxp.com,
        jackp@codeaurora.org
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
 <YAsHbj/mITeiY5Cq@builder.lan>
 <724cb274-36ce-fb48-a156-4eaf9e686fdf@codeaurora.org>
 <20210126015543.GB1241218@yoga>
 <99dd9419-a8fd-9eb2-9582-d24f865ecf70@codeaurora.org>
 <YA+lVFWlBDvN4MTF@builder.lan>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <dec42f26-6b67-56ec-74a5-feae5e5c5df5@codeaurora.org>
Date:   Thu, 28 Jan 2021 15:08:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YA+lVFWlBDvN4MTF@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/25/2021 9:15 PM, Bjorn Andersson wrote:
> On Mon 25 Jan 22:32 CST 2021, Wesley Cheng wrote:
>> On 1/25/2021 5:55 PM, Bjorn Andersson wrote:
>>> On Mon 25 Jan 19:14 CST 2021, Wesley Cheng wrote:
>>>
>>>>
>>>>
>>>> On 1/22/2021 9:12 AM, Bjorn Andersson wrote:
>>>>> On Thu 21 Jan 22:01 CST 2021, Wesley Cheng wrote:
>>>>>
>>>>
>>>> Hi Bjorn,
>>>>>
>>>>> Under what circumstances should we specify this? And in particular are
>>>>> there scenarios (in the Qualcomm platforms) where this must not be set?
>>>>> The TXFIFO dynamic allocation is actually a feature within the DWC3
>>>> controller, and isn't specifically for QCOM based platforms.  It won't
>>>> do any harm functionally if this flag is not set, as this is meant for
>>>> enhancing performance/bandwidth.
>>>>
>>>>> In particular, the composition can be changed in runtime, so should we
>>>>> set this for all Qualcomm platforms?
>>>>>
>>>> Ideally yes, if we want to increase bandwith for situations where SS
>>>> endpoint bursting is set to a higher value.
>>>>
>>>>> And if that's the case, can we not just set it from the qcom driver?
>>>>>
>>>> Since this is a common DWC3 core feature, I think it would make more
>>>> sense to have it in DWC3 core instead of a vendor's DWC3 glue driver.
>>>>
>>>
>>> I don't have any objections to implementing it in the core driver, but
>>> my question is can we just skip the DT binding and just enable it from
>>> the vendor driver?
>>>
>>> Regards,
>>> Bjorn
>>>
>>
>> Hi Bjorn,
>>
>> I see.  I think there are some designs which don't have a DWC3 glue
>> driver, so assuming there may be other platforms using this, there may
>> not always be a vendor driver to set this.
>>
> 
> You mean that there are implementations of dwc3 without an associated
> glue driver that haven't yet realized that they need this feature?
> 
> I would suggest then that we implement the core code necessary, we
> enable it from the Qualcomm glue layer and when someone realize that
> they need this without a glue driver it's going to be trivial to add the
> DT binding.
>>
> The alternative is that we're lugging around a requirement to specify
> this property in all past, present and future Qualcomm dts files - and
> then we'll need to hard code it for ACPI anyways.
> 
Hi Bjorn,

Can we utilize the of_add_property() call to add the "tx-fifo-resize"
property from the dwc3_qcom_register_core() API?  That way at least the
above concern would be addressed.

I'm not too familiar with the ACPI design, but I do see that the
dwc3-qcom does have an array carrying some DWC3 core properties.  Looks
like we can add the tx-fifo-resize property here too.

static const struct property_entry dwc3_qcom_acpi_properties[] = {
	PROPERTY_ENTRY_STRING("dr_mode", "host"),
	{}
};


Thanks
Wesley Cheng

> Regards,
> Bjorn
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
