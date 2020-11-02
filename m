Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70E72A23B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 04:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbgKBD6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Nov 2020 22:58:52 -0500
Received: from z5.mailgun.us ([104.130.96.5]:25585 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727461AbgKBD6w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Nov 2020 22:58:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604289531; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=80IpKFJZqI20pUuYsOb9oUNeqAVS5J3HEaMUSr0njd4=; b=p/LM0Sb0O8EtlTaa0A3lEPMnYik76McASgKlYoPzRbFg36J3XHYdNFKCIETIKCEXa3vfeCyF
 qENHlRgzJxHcxFbf1ReaX3wq4foNnR4J6yxIZcaoFhbkUpg6pa5Yhb89TJsH+PR2aT6JNi00
 Gd6XxWv2Y+atRTZHR+c5QDOhaok=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9f83fa8192df1548625a37 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 03:58:50
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3ABBBC433C8; Mon,  2 Nov 2020 03:58:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [103.116.233.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DD68C433C8;
        Mon,  2 Nov 2020 03:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5DD68C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kathirav@codeaurora.org
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
To:     Guenter Roeck <linux@roeck-us.net>,
        Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20201031121115.542752-1-robert.marko@sartura.hr>
 <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
From:   Kathiravan T <kathirav@codeaurora.org>
Message-ID: <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
Date:   Mon, 2 Nov 2020 09:28:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/31/2020 7:38 PM, Guenter Roeck wrote:
> On 10/31/20 5:11 AM, Robert Marko wrote:
>> If the watchdog hardware is enabled/running during boot, e.g.
>> due to a boot loader configuring it, we must tell the
>> watchdog framework about this fact so that it can ping the
>> watchdog until userspace opens the device and takes over
>> control.
>>
>> Do so using the WDOG_HW_RUNNING flag that exists for exactly
>> that use-case.
>>
>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for addressing the comments and now the patch looks good to me. 
One more suggestion, can we make the initcall level of the driver to 
subsys_initcall_sync so that the driver gets registered immediately 
after the watchdog_core is registered and watchdog_core starts pinging 
the WDT?

>> Cc: Luka Perkov <luka.perkov@sartura.hr>
>> ---
>> Changes in v4:
>> * Use QCOM_WDT_ENABLE macro
>>
>> Changes in v3:
>> * Drop call to stop as start already does it
>> * Update commit message
>>
>> Changes in v2:
>> * Correct authorship
>>
>>   drivers/watchdog/qcom-wdt.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index ab7465d186fd..07d399c4edc4 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -152,6 +152,13 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>>   	return 0;
>>   }
>>   
>> +static int qcom_wdt_is_running(struct watchdog_device *wdd)
>> +{
>> +	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
>> +
>> +	return (readl(wdt_addr(wdt, WDT_EN)) & QCOM_WDT_ENABLE);
>> +}
>> +
>>   static const struct watchdog_ops qcom_wdt_ops = {
>>   	.start		= qcom_wdt_start,
>>   	.stop		= qcom_wdt_stop,
>> @@ -294,6 +301,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>   	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
>>   	watchdog_init_timeout(&wdt->wdd, 0, dev);
>>   
>> +	/*
>> +	 * If WDT is already running, call WDT start which
>> +	 * will stop the WDT, set timeouts as bootloader
>> +	 * might use different ones and set running bit
>> +	 * to inform the WDT subsystem to ping the WDT
>> +	 */
>> +	if (qcom_wdt_is_running(&wdt->wdd)) {
>> +		qcom_wdt_start(&wdt->wdd);
>> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>> +	}
>> +
>>   	ret = devm_watchdog_register_device(dev, &wdt->wdd);
>>   	if (ret)
>>   		return ret;
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

