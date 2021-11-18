Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655AE455ADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 12:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344177AbhKRLtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 06:49:35 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:42455 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344380AbhKRLse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 06:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637235935; x=1668771935;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cISyEGAsMJQM8NdfhvC1TwyQRYsH3j/ZOtqURpc7aUM=;
  b=NPKRnWEkppeilR9xc5tHjtzx42oavYjA5x3pr4iuoiMA56w3TmFGG1SV
   LSIYo/gvP9QdBOPJLlcRiIB5XI+HOFJTX4Rksxm/cfx8S0fUK3/2Rc8Nl
   l00pR/SdYz7o6kcPERXHRer5JVRD64TM8bitpqnq/FdK4ae3ufOz4mwmb
   M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Nov 2021 03:45:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 03:45:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 03:45:33 -0800
Received: from [10.216.28.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 18 Nov
 2021 03:45:28 -0800
Subject: Re: [PATCH v9 4/5] usb: dwc3: qcom: Change the IRQ flag for DP/DM hs
 phy irq
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-5-git-send-email-quic_c_sanm@quicinc.com>
 <YYAWfSSD7FCXPo8d@ripper>
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Message-ID: <0a27ac22-5a80-4885-9344-7e6b9a9480f3@quicinc.com>
Date:   Thu, 18 Nov 2021 17:15:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YYAWfSSD7FCXPo8d@ripper>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/1/2021 10:01 PM, Bjorn Andersson wrote:
> On Mon 01 Nov 00:53 PDT 2021, Sandeep Maheswaram wrote:
>
>> Change the IRQ flags for DP/DM hs phy irq to avoid interrupt
>> triggering during system suspend.
>>
> Why does replacing HIGH with RISING change this behavior, or do you get
> a RISING interrupt just before hitting suspend which you ignore?
>
> I think it would be nice to have the commit message for this (or per
> below request the DTS change) include some details about what's really
> happening on the irq line.

When we use IRQF_TRIGGER_HIGH we get interrupt during PM suspend and 
causes resume.

[  119.743083] Resume caused by IRQ 101, qcom_dwc3 DP_HS

>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 54461f1..356f4f8 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -473,7 +473,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>>   		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>>   		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>>   					qcom_dwc3_resume_irq,
>> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> IRQF_TRIGGER_* should be omitted from the driver and supplied by the DT.
>
> The dtbs out there should all have IRQ_TYPE_LEVEL_HIGH at this time, so
> simply dropping that from this list and updating the dts would be the
> right thing to do.
>
> Regards,
> Bjorn
Ok. Dropping IRQF_TRIGGER_*  solved the resume issue during PM suspend.
>>   					"qcom_dwc3 DP_HS", qcom);
>>   		if (ret) {
>>   			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
>> @@ -488,7 +488,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>>   		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>>   		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>>   					qcom_dwc3_resume_irq,
>> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>>   					"qcom_dwc3 DM_HS", qcom);
>>   		if (ret) {
>>   			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
>> -- 
>> 2.7.4
>>
