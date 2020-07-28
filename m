Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3055E2305B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 10:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgG1IrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 04:47:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42965 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728176AbgG1IrT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 04:47:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595926038; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ov/MCTEZuyfgMKbGRufVJeV9XrK0K72sSxzij8exncc=;
 b=lOSu2yCV0bYzmsSLUkjbZzaK4dTUwcff10zndJYQ5sxNungD2y7n00X3C89XY6/pZ3uLpIoR
 KHMp1ocipWpHlF1QaFkuJYGnS0dIpO7qhfjsI9GzAsL+iI6/e3BpEdDM6EJmHS9DOHp9Uaaa
 sjjhwPFM3HYmqjIIWuSC+boYjzs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f1fe612ca57a65d47cbd086 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 08:47:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE80BC4339C; Tue, 28 Jul 2020 08:47:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14F51C433C6;
        Tue, 28 Jul 2020 08:47:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 14:17:14 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
In-Reply-To: <159592494608.1360974.13925720722764973592@swboyd.mtv.corp.google.com>
References: <20200728075102.30807-1-saiprakash.ranjan@codeaurora.org>
 <159592494608.1360974.13925720722764973592@swboyd.mtv.corp.google.com>
Message-ID: <e3bb9a0bec27d769b0ff6284e6cd8ef3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-28 13:59, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-07-28 00:51:02)
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
> 
> Is this only called from __init now? If so please mark it as __init
> then.
> 

Yes, will change it.

>>  {
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
> 
> This is __init too?
> 

Will change.

>>  {
>> -       if (--etm4_count != 0)
>> -               return;
>> -
>>         cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>>         cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>>         if (hp_online) {
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
>> +
>> +       /* etm4_pm_setup_cpuslocked() does its own cleanup - exit on 
>> error */
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = amba_driver_register(&etm4x_driver);
>> +       if (ret) {
>> +               pr_info("Error registering etm4x driver\n");
> 
> Use pr_err() please.
> 

Yes indeed, will change.

>> +               goto err_init;
>> +       }
>> +
>> +       return ret;
>> +
>> +err_init:
> 
> Why is this a goto?
> 
>> +       etm4_pm_clear();
>> +       return ret;
> 
> Instead of just putting this in the if (ret) arm?
> 

Will change.

>> +}
>> +module_init(etm4x_init);
> 
> It was device_initcall before with builtin_amba_driver(), best to not
> change that.

Sure.

I will wait to see if there are any more comments on this patch and then 
post a v3.
Thanks for the review Stephen.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
