Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DAA409B2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243763AbhIMRrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 13:47:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43612 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhIMRrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 13:47:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631555148; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FQM7/pY/WutvtlfFfc4iVulvOrjxzsE4ffU8N8bZXx0=; b=agM8KsJpA0TiRLzASaR73L9HKpOnXAMJfv0LKRPqwfTMt7hyGen/rHVmKEuwSei3AxVnHP5y
 g2M9RY8byAia1urbcVbbL4Xg9NoKqw93d0w9CyTYg8jBC7NeSMfryPD52LUTNI0dnRRJ098a
 3dL1whhSGcx/G5po9wv/pFk8VPw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613f8e37648642cc1c5dd7b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 17:45:27
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BEE1BC4338F; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.3] (unknown [122.163.130.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBB54C4361B;
        Mon, 13 Sep 2021 17:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DBB54C4361B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n528DuP4MiAOhYY+Du+L=OZaGM5YJm=NwWia3JF7hp7sAA@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <4697bec1-af58-53e4-9fd1-293bfd8754be@codeaurora.org>
Date:   Mon, 13 Sep 2021 23:15:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n528DuP4MiAOhYY+Du+L=OZaGM5YJm=NwWia3JF7hp7sAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/17/2021 1:53 AM, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-08-16 03:05:35)
>> Remote susbsystems notify fatal crash throught smp2p interrupt.
>> When modem/wifi crashes it can cause soc to come out of low power state
>> and may not allow again to enter in low power state until crash is handled.
>>
>> Mark smp2p interrupt wakeup capable so that interrupt handler is executed
>> and remote susbsystem crash can be handled in system  resume path.
>>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> ---
>>   drivers/soc/qcom/smp2p.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index 2df4883..646848b 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/soc/qcom/smem.h>
>>   #include <linux/soc/qcom/smem_state.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/pm_wakeirq.h>
> Please sort alphabetically by include name, 'p' before 's'.
>
>>   /*
>>    * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
>> @@ -538,9 +539,20 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>>                  goto unwind_interfaces;
>>          }
>>
>> +       /* Setup smp2p interrupt as wakeup source */
> This comment is bad. Please don't reiterate what the code is doing.
> Instead, write something like
>
> 	/*
> 	 * Treat remoteproc crashes as wakeups by default so we handle
> 	 * them sooner rather than along with the next wakeup (e.g.
> 	 * power button). This avoids leaving the system in a shallower
> 	 * suspend power state if a remoteproc crashes during suspend,
> 	 * but requires userspace to actively suspend the device after
> 	 * handling the crash, or CONFIG_PM_AUTOSLEEP to be true.
> 	 */
>
>> +       ret = device_init_wakeup(&pdev->dev, true);
> I still wonder if it's better to leave this off by default and only
> enable it if the kernel is using autosuspend (PM_AUTOSLEEP). Then
> userspace is responsible to decide if it can handle the wakeup with the
> screen off, reload the remoteproc, and go back to suspend if it isn't
> using autosuspend.

Seems like not all targets use PM_AUTOSLEEP feature, even those targets 
may require wakeup to handle

modem crash so that important modem events are not missed. I think we 
can keep wake up as default behavior

and let the user space disable it through sysfs if it doesn't want it as 
wake up source.

>> +       if (ret)
>> +               goto unwind_interfaces;
>> +
