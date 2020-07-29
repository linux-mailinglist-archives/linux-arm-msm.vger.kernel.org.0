Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEBB2318DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 07:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgG2FEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 01:04:15 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38014 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726445AbgG2FEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 01:04:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595999053; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uy1CHEEp/QDUXfLSRvgW4cSL35sMtji9dnF2rf/Lqn0=;
 b=k6PtViZVnBmN0lNb3uW6J54+wHKLUMt91fZZKAkKvlvpVs/W+n22hTd5JrJCQ9PbrO/hUTjJ
 BnfqJLgIv0jw08Fs0LiIxCo26cnmUTgaBV8SZ+KDzMU40VVMARMwHTC/hEWfeU/e40gHs6vV
 ZEJyBk3FKmldpd0Ya0gANkzFq9g=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f210340fcbecb3df1c197f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 05:04:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB8D1C43395; Wed, 29 Jul 2020 05:03:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2026C433C6;
        Wed, 29 Jul 2020 05:03:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Jul 2020 10:33:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv2] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
In-Reply-To: <CAJ9a7VjQCEJ80+7AZnZ-Mv5-EUzOZHnnYr2HeFpm7aktYt5fHA@mail.gmail.com>
References: <20200728075102.30807-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VjQCEJ80+7AZnZ-Mv5-EUzOZHnnYr2HeFpm7aktYt5fHA@mail.gmail.com>
Message-ID: <08767949db1c9e142d29e8d3ab16bd1f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-07-29 01:46, Mike Leach wrote:
> Hi Sai,
> 
> On Tue, 28 Jul 2020 at 08:51, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> etm4_count keeps track of number of ETMv4 registered and on some 
>> systems,
>> a race is observed on etm4_count variable which can lead to multiple 
>> calls
>> to cpuhp_setup_state_nocalls_cpuslocked(). This function internally 
>> calls
>> cpuhp_store_callbacks() which prevents multiple registrations of 
>> callbacks
>> for a given state and due to this race, it returns -EBUSY leading to 
>> ETM
>> probe failures like below.
>> 
>>  coresight-etm4x: probe of 7040000.etm failed with error -16
>> 
>> This race can easily be triggered with async probe by setting probe 
>> type
>> as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
>> "arm,coresight-loses-context-with-cpu".
>> 
>> Prevent this race by moving cpuhp callbacks to etm driver init since 
>> the
>> cpuhp callbacks doesn't have to depend on the etm4_count and can be 
>> once
>> setup during driver init. Similarly we move cpu_pm notifier 
>> registration
>> to driver init and completely remove etm4_count usage.
>> 
>> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup 
>> in probe() function")
>> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug 
>> state machine")
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> Changes in v2:
>>  * Rearrange cpuhp callbacks and move them to driver init (Suzuki K 
>> Poulose)
>> 
>> ---
>>  drivers/hwtracing/coresight/coresight-etm4x.c | 51 
>> ++++++++++---------
>>  1 file changed, 27 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c 
>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>> index 6d7d2169bfb2..adb71987a1e3 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>> @@ -48,8 +48,6 @@ module_param(pm_save_enable, int, 0444);
>>  MODULE_PARM_DESC(pm_save_enable,
>>         "Save/restore state on power down: 1 = never, 2 = 
>> self-hosted");
>> 
>> -/* The number of ETMv4 currently registered */
>> -static int etm4_count;
>>  static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>>  static void etm4_set_default_config(struct etmv4_config *config);
>>  static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
>> @@ -1403,12 +1401,9 @@ static int etm4_pm_setup_cpuslocked(void)
>>  {
> 
> consider renaming this to etm4_pm_setup() and handing any cpu locking
> inside the function.
> In the circumstances - as part of the driver init rather than probe it
> may be sufficient to call the cpuhp_setup functions without the
> _cpuslocked suffix and allow the calls to lock the cpus as they are
> made.
> i.e. cpuhp_setup_state_nocalls_cpuslocked() => 
> cpuhp_setup_state_nocalls()

Sure, will make this change.

> 
>>         int ret;
>> 
>> -       if (etm4_count++)
>> -               return 0;
>> -
>>         ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
>>         if (ret)
>> -               goto reduce_count;
>> +               return ret;
>> 
>>         ret = 
>> cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
>>                                                    
>> "arm/coresight4:starting",
>> @@ -1432,17 +1427,11 @@ static int etm4_pm_setup_cpuslocked(void)
>> 
>>  unregister_notifier:
>>         cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>> -
>> -reduce_count:
>> -       --etm4_count;
>>         return ret;
>>  }
>> 
>>  static void etm4_pm_clear(void)
>>  {
>> -       if (--etm4_count != 0)
>> -               return;
>> -
>>         cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>>         cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>>         if (hp_online) {
>> @@ -1498,22 +1487,12 @@ static int etm4_probe(struct amba_device 
>> *adev, const struct amba_id *id)
>>         if (!desc.name)
>>                 return -ENOMEM;
>> 
>> -       cpus_read_lock();
>>         etmdrvdata[drvdata->cpu] = drvdata;
>> 
>>         if (smp_call_function_single(drvdata->cpu,
>>                                 etm4_init_arch_data,  drvdata, 1))
>>                 dev_err(dev, "ETM arch init failed\n");
>> 
>> -       ret = etm4_pm_setup_cpuslocked();
>> -       cpus_read_unlock();
>> -
>> -       /* etm4_pm_setup_cpuslocked() does its own cleanup - exit on 
>> error */
>> -       if (ret) {
>> -               etmdrvdata[drvdata->cpu] = NULL;
>> -               return ret;
>> -       }
>> -
>>         if (etm4_arch_supported(drvdata->arch) == false) {
>>                 ret = -EINVAL;
>>                 goto err_arch_supported;
>> @@ -1560,7 +1539,6 @@ static int etm4_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>> 
>>  err_arch_supported:
>>         etmdrvdata[drvdata->cpu] = NULL;
>> -       etm4_pm_clear();
>>         return ret;
>>  }
>> 
>> @@ -1598,4 +1576,29 @@ static struct amba_driver etm4x_driver = {
>>         .probe          = etm4_probe,
>>         .id_table       = etm4_ids,
>>  };
>> -builtin_amba_driver(etm4x_driver);
>> +
>> +static int __init etm4x_init(void)
>> +{
>> +       int ret;
>> +
>> +       cpus_read_lock();
>> +       ret = etm4_pm_setup_cpuslocked();
>> +       cpus_read_unlock();
> 
> See my comment above about rename and use of cpus_read_lock
> 

Yes, thanks for the review Mike.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
