Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2534883A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 06:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhCYFGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 01:06:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17480 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhCYFGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 01:06:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616648768; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QRkGP8oNQ4HUG6AhWC1iZNjpu8Q5Rb4eb4prWpYL2Dc=; b=k/bYgwPyiS93eWbKNisIQetjgSvIhP/N/0vyJ+7Zu+Tlv9jv8hrONvVZwfsZsw3KyJGLh7oF
 ry6WpDCO3p3zXN8OxpaiSiCp9OL2jf8uwkNjsOLS9Du176VZ2eYG/eHy3kkxgqSXvjk9DT3u
 SJO+Bcxa45zB1TMjogaxobfoth4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 605c1a3a4db3bb6801149e47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 05:06:02
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4A2AC43462; Thu, 25 Mar 2021 05:06:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [124.123.189.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39A0FC433C6;
        Thu, 25 Mar 2021 05:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39A0FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
To:     Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
 <161655669850.3012082.11672497224863339022@swboyd.mtv.corp.google.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <ea2da8e3-c0f6-5785-02e3-eb37e364631e@codeaurora.org>
Date:   Thu, 25 Mar 2021 10:35:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161655669850.3012082.11672497224863339022@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/24/2021 9:01 AM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2021-03-23 12:27:32)
>> This patch adds a shutdown callback to USB DWC core driver to ensure that
>> it is properly shutdown in reboot/shutdown path. This is required
>> where SMMU address translation is enabled like on SC7180
>> SoC and few others. If the hardware is still accessing memory after
>> SMMU translation is disabled as part of SMMU shutdown callback in
>> system reboot or shutdown path, then IOVAs(I/O virtual address)
>> which it was using will go on the bus as the physical addresses which
>> might result in unknown crashes (NoC/interconnect errors).
>>
>> Previously this was added in dwc3 qcom glue driver.
>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
>> But observed kernel panic as glue driver shutdown getting called after
>> iommu shutdown. As we are adding iommu nodes in dwc core node
>> in device tree adding shutdown callback in core driver seems correct.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>>   drivers/usb/dwc3/core.c | 26 +++++++++++++++++++-------
>>   1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 94fdbe5..777b2b5 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1634,11 +1634,9 @@ static int dwc3_probe(struct platform_device *pdev)
>>          return ret;
>>   }
>>   
>> -static int dwc3_remove(struct platform_device *pdev)
>> +static void __dwc3_teardown(struct dwc3 *dwc)
>>   {
>> -       struct dwc3     *dwc = platform_get_drvdata(pdev);
>> -
>> -       pm_runtime_get_sync(&pdev->dev);
>> +       pm_runtime_get_sync(dwc->dev);
>>   
>>          dwc3_debugfs_exit(dwc);
>>          dwc3_core_exit_mode(dwc);
>> @@ -1646,19 +1644,32 @@ static int dwc3_remove(struct platform_device *pdev)
>>          dwc3_core_exit(dwc);
>>          dwc3_ulpi_exit(dwc);
>>   
>> -       pm_runtime_disable(&pdev->dev);
>> -       pm_runtime_put_noidle(&pdev->dev);
>> -       pm_runtime_set_suspended(&pdev->dev);
>> +       pm_runtime_disable(dwc->dev);
>> +       pm_runtime_put_noidle(dwc->dev);
>> +       pm_runtime_set_suspended(dwc->dev);
>>   
>>          dwc3_free_event_buffers(dwc);
>>          dwc3_free_scratch_buffers(dwc);
>>   
>>          if (dwc->usb_psy)
>>                  power_supply_put(dwc->usb_psy);
>> +}
>> +
>> +static int dwc3_remove(struct platform_device *pdev)
>> +{
>> +       struct dwc3     *dwc = platform_get_drvdata(pdev);
>> +
>> +       __dwc3_teardown(dwc);
>>   
>>          return 0;
>>   }
>>   
>> +static void dwc3_shutdown(struct platform_device *pdev)
>> +{
>> +       struct dwc3     *dwc = platform_get_drvdata(pdev);
>> +
>> +       __dwc3_teardown(dwc);
>> +}
> Can't this be
>
> 	static void dwc3_shutdown(struct platform_device *pdev)
> 	{
> 	       dwc3_remove(pdev);
> 	}
>
> and then there's nothing else to change? Basically ignore return value
> of dwc3_remove() to make shutdown and remove harmonize. I also wonder if
> this is more common than we think and a struct driver flag could be set
> to say "call remove for shutdown" and then have driver core swizzle on
> that and save some duplicate functions.

I was referring to similar patch 
https://patchwork.kernel.org/project/linux-usb/patch/20190817174140.6394-1-vicencb@gmail.com/

>>   #ifdef CONFIG_PM
>>   static int dwc3_core_init_for_resume(struct dwc3 *dwc)
>>   {
>> @@ -1976,6 +1987,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
>>   static struct platform_driver dwc3_driver = {
>>          .probe          = dwc3_probe,
>>          .remove         = dwc3_remove,
>> +       .shutdown   = dwc3_shutdown,
