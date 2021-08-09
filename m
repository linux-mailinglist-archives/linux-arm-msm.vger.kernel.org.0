Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC4D3E445E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 13:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbhHILFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 07:05:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41607 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbhHILFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 07:05:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628507129; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=waegmgo6QVQ1/McQqZLS8wmP4jIGobm/fYg8pmRr6gA=; b=jgdwoNwN5gD3TOtkkbXCQgHZ9Alxj0iZRalAway3RlHw2UnaGZwnGGWeO1yM2DeWqGDGMYuX
 F2/lltJjIlPEB0G+gW8cChcmWcp36QzrareZ9m7/5WPj77AHfQAvz5eRqZp/eukW+J4390RJ
 Jq7E016olJigh6f1orlzZWQIhtU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61110becb4dfc4b0ef405649 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Aug 2021 11:05:16
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85E7AC4338A; Mon,  9 Aug 2021 11:05:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.3] (unknown [106.202.252.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B7FEC433F1;
        Mon,  9 Aug 2021 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B7FEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org>
Date:   Mon, 9 Aug 2021 16:35:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/6/2021 1:10 AM, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
>> Some use cases require SMP2P interrupts to wake up the host
>> from suspend.
> Please elaborate on this point so we understand what sort of scenarios
> want to wakeup from suspend.

Once such scenario is where WiFi/modem crashes and notifies crash to 
local host through smp2p

if local host is in suspend it should wake up to handle the crash and 
reboot the WiFi/modem.

>> Mark smp2p interrupt as wakeup capable to abort
>> the suspend.
>>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> ---
>>   drivers/soc/qcom/smp2p.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index 2df4883..f8659b0 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/soc/qcom/smem.h>
>>   #include <linux/soc/qcom/smem_state.h>
>>   #include <linux/spinlock.h>
>> +#include <linux/pm_wakeirq.h>
>>
>>   /*
>>    * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
>> @@ -538,9 +539,19 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>>                  goto unwind_interfaces;
>>          }
>>
>> +       ret = device_init_wakeup(&pdev->dev, true);
> Is smp2p supposed to wake up the device by default? If not, then this
> should be device_set_wakeup_capable() instead so that userspace can
> decide if it wants to get the wakeup.
yes, we want smp2p to be wake up capable by default.
>> +       if (ret)
>> +               goto unwind_interfaces;
>> +
>> +       ret = dev_pm_set_wake_irq(&pdev->dev, irq);
>> +       if (ret)
>> +               goto set_wakeup_failed;
> Otherwise this looks good to me.
>
>>          return 0;
>>
>> +set_wakeup_failed:
>> +       device_init_wakeup(&pdev->dev, false);
>> +
>>   unwind_interfaces:
>>          list_for_each_entry(entry, &smp2p->inbound, node)
>>                  irq_domain_remove(entry->domain);
