Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7E31A1C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 09:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDHHJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 03:09:16 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12833 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgDHHJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 03:09:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586329754; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NrED2xtLUvxCV8eFeyJOX2iWBud2d45F2W2UntyzGM4=; b=alnSaxdsjVYEyEMOsXITT8xd4Btnks8Jj8sSCG6U4CnIa+BGd4HTQ7kSQEl2OlGt3OKCUHyR
 /7OLztZbL9hcV9Jf//qcRaOsBzzPrAgzU4mpb52KZXugVZbpi33g6iRderFIegEyAeDNrBto
 sAhNmh3en2yKO9uCBVBrQtMsxs8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8d788b.7f8e8a1c8ce0-smtp-out-n02;
 Wed, 08 Apr 2020 07:08:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA133C433F2; Wed,  8 Apr 2020 07:08:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.204.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B416C433D2;
        Wed,  8 Apr 2020 07:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B416C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
 <158631424318.216820.1843109743502322053@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8553ce0f-6dda-b0e0-d67a-f76ce3c0f945@codeaurora.org>
Date:   Wed, 8 Apr 2020 12:38:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158631424318.216820.1843109743502322053@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/8/2020 8:20 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-05 23:32:19)
>> Add changes to invoke rpmh flush() from CPU PM notification.
>> This is done when the last the cpu is entering power collapse and
>> controller is not busy.
>>
>> Controllers that do have 'HW solver' mode do not need to register
> Controllers that have 'HW solver' mode don't need to register? The 'do
> have' is throwing me off.
Okay i will remove 'do' from this line.
>> for CPU PM notification. They may be in autonomous mode executing
>> low power mode and do not require rpmh_flush() to happen from CPU
>> PM notification.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   drivers/soc/qcom/rpmh-internal.h |  25 +++++---
>>   drivers/soc/qcom/rpmh-rsc.c      | 123 +++++++++++++++++++++++++++++++++++----
>>   drivers/soc/qcom/rpmh.c          |  26 +++------
>>   3 files changed, 137 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index b718221..fbe1f3e 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -6,6 +6,7 @@
> [...]
>> +
>> +static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>> +                                   unsigned long action, void *v)
>> +{
>> +       struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
>> +       int ret = NOTIFY_OK;
>> +
>> +       spin_lock(&drv->pm_lock);
>> +
>> +       switch (action) {
>> +       case CPU_PM_ENTER:
> I thought CPU_PM notifiers weren't supposed to be used anymore? Or at
> least, the genpd work that has gone on for cpuidle could be used here in
> place of CPU_PM notifiers?

genpd was used in v3 and v4 of this series, where from pd's .power_off  
function, rpmh_flush() was invoked.

genpd can be useful if target firmware supports PSCI's OSI mode, while 
sc7180 is non-OSI target.

The current approch (using cpu pm notification) can be used for both OSI 
and non-OSI targets to invoke rpmh_flush() when last cpu goes to power down.

> And so this isn't actually any different
> than what was proposed originally to use genpd for this?
>
>> +               cpumask_set_cpu(raw_smp_processor_id(),
> Why do we need to use raw_smp_processor_id()? smp_processor_id() should
> work just as well?
Yes, seems it will work as well. I will change to use smp_processor_id().
>
>> +                               &drv->cpus_entered_pm);
>> +
>> +               if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
>> +                       goto exit;
>> +               break;
>> +       case CPU_PM_ENTER_FAILED:
>> +       case CPU_PM_EXIT:
>> +               cpumask_clear_cpu(raw_smp_processor_id(),
>> +                                 &drv->cpus_entered_pm);
>> +               goto exit;
>> +       }
>> +
>> +       ret = rpmh_rsc_ctrlr_is_busy(drv);
>> +       if (ret) {
>> +               ret = NOTIFY_BAD;
>> +               goto exit;
>> +       }
>> +
>> +       ret = rpmh_flush(&drv->client);
>> +       if (ret)
>> +               ret = NOTIFY_BAD;
>> +       else
>> +               ret = NOTIFY_OK;
>> +
>> +exit:
>> +       spin_unlock(&drv->pm_lock);
>> +       return ret;
>> +}
>> +
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
