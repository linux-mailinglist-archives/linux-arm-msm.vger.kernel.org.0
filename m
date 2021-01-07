Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547F52ECEB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 12:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbhAGL0w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 06:26:52 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:44051 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbhAGL0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 06:26:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610018790; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SVp3EE48Z37VWqjMxRrDG8VYW88ikDNyzR8RzMIITUQ=; b=FK9yQ7pxgeErk7rcmisJOLelQ6wqOwRPL2/7Oqazs/2zC9MfOLS0b+fvnjJPDCzBABUUcqcl
 NtLKKyYZlgQHbaoKuoy6n6u7UD3M2koxqGaWxCZICSXPx/WMbB1bgg1596MZVqqtNLdPLCPY
 u/ygXewFi0c7TagOX/YhITzFUbM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ff6efcb661021aa28898a65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 11:26:03
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BAF1FC43463; Thu,  7 Jan 2021 11:26:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.65.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67142C433CA;
        Thu,  7 Jan 2021 11:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67142C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: rpmh: Conditionally check
 lockdep_assert_irqs_disabled()
To:     Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org
References: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
 <1606385898-8609-4-git-send-email-mkshah@codeaurora.org>
 <160697890733.2717324.809961029114008005@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3a04025d-db94-4dfc-b056-b586c9136ca9@codeaurora.org>
Date:   Thu, 7 Jan 2021 16:55:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <160697890733.2717324.809961029114008005@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 12/3/2020 12:31 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-11-26 02:18:18)
>> lockdep_assert_irqs_disabled() was added to check rpmh_flush()
>> can only be invoked when irqs are disabled, this is true for
>> APPS RSC as the last CPU going to deepest low power mode is
>> writing sleep and wake TCSes.
>>
>> However for RSCs that support solver mode, drivers can invoke
>> rpmh_write_sleep_and_wake() to immediately write cached sleep
>> and wake sets to TCSes from any CPU. Conditionally check if RSC
>> controller supports 'HW solver' mode then do not check for irqs
>> disabled as such RSCs can write sleepand wake TCSes at any point.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh-internal.h |  5 +++++
>>   drivers/soc/qcom/rpmh-rsc.c      |  3 +++
>>   drivers/soc/qcom/rpmh.c          | 26 ++++++++++++++++++++++----
>>   3 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
>> index 79486d6..39fa3c5 100644
>> --- a/drivers/soc/qcom/rpmh-internal.h
>> +++ b/drivers/soc/qcom/rpmh-internal.h
>> @@ -17,6 +17,9 @@
>>   #define MAX_TCS_NR                     (MAX_TCS_PER_TYPE * TCS_TYPE_NR)
>>   #define MAX_TCS_SLOTS                  (MAX_CMDS_PER_TCS * MAX_TCS_PER_TYPE)
>>   
>> +/* CTRLR specific flags */
>> +#define SOLVER_PRESENT                 1
>> +
>>   struct rsc_drv;
>>   
>>   /**
>> @@ -78,6 +81,7 @@ struct rpmh_request {
>>    * @cache_lock: synchronize access to the cache data
>>    * @dirty: was the cache updated since flush
>>    * @in_solver_mode: Controller is busy in solver mode
>> + * @flags: Controller specific flags
>>    * @batch_cache: Cache sleep and wake requests sent as batch
>>    */
>>   struct rpmh_ctrlr {
>> @@ -85,6 +89,7 @@ struct rpmh_ctrlr {
>>          spinlock_t cache_lock;
>>          bool dirty;
>>          bool in_solver_mode;
>> +       u32 flags;
> Maybe unsigned long is more appropriate? Do we rely on 32-bits vs.
> 64-bits?
We don't rely on 32-bits vs. 64-bits, u32 should be fine.
>
>>          struct list_head batch_cache;
>>   };
>>   
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index ffb4ca7..4caaddf 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -1031,6 +1031,9 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>>          if (!solver_config) {
>>                  drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
>>                  cpu_pm_register_notifier(&drv->rsc_pm);
>> +               drv->client.flags &= ~SOLVER_PRESENT;
>> +       } else {
>> +               drv->client.flags |= SOLVER_PRESENT;
> It looks like this could be tested by checking for
> drv->rsc_pm.notifier_call being non-NULL?
It may for now, but going forward we may have different flags to 
indicate various functions supported by RSC.
>
>>          }
>>   
>>          /* Enable the active TCS to send requests immediately */
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 725b8f0..604d511 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -83,6 +83,9 @@ static int check_ctrlr_state(struct rpmh_ctrlr *ctrlr, enum rpmh_state state)
>>          if (state != RPMH_ACTIVE_ONLY_STATE)
>>                  return ret;
>>   
>> +       if (!(ctrlr->flags & SOLVER_PRESENT))
>> +               return ret;
>> +
>>          /* Do not allow sending active votes when in solver mode */
>>          spin_lock(&ctrlr->cache_lock);
>>          if (ctrlr->in_solver_mode)
>> @@ -468,12 +471,24 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>          struct cache_req *p;
>>          int ret = 0;
>>   
>> -       lockdep_assert_irqs_disabled();
>> +       /*
>> +        * For RSC that don't have solver mode,
>> +        * rpmh_flush() is only called when we think we're running
>> +        * on the last CPU with irqs_disabled.
>> +        *
>> +        * For RSC that have solver mode,
>> +        * rpmh_flush() can be invoked with irqs enabled by any CPU.
>> +        *
>> +        * Conditionally check for irqs_disabled only when solver mode
>> +        * is not available.
>> +        */
>> +
>> +       if (!(ctrlr->flags & SOLVER_PRESENT))
>> +               lockdep_assert_irqs_disabled();
> Can we have a different function that is called for the case where
> solver mode is present and where solver mode isn't present? It would be
> good to clearly show that rpmh_flush() thinks it is being called from
> the last CPU vs. from some other random place because the code is
> assuming solver vs. non-solver enabled state. It would be clearer from
> the call site too.
Hmm, we can. Patch 2 of this series already added different function 
which will be called where solver is present.
Let me modify this to indicate whether called from last cpu or not.

Thanks,
Maulik

>
>>   
>>          /*
>> -        * Currently rpmh_flush() is only called when we think we're running
>> -        * on the last processor.  If the lock is busy it means another
>> -        * processor is up and it's better to abort than spin.
>> +        * If the lock is busy it means another transaction is on going,
>> +        * in such case it's better to abort than spin.
>>           */
>>          if (!spin_trylock(&ctrlr->cache_lock))
>>                  return -EBUSY;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

