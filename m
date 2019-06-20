Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F4D4CB52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 11:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfFTJvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 05:51:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53788 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbfFTJvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 05:51:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 47DD6609CD; Thu, 20 Jun 2019 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561024300;
        bh=FTnHHkOBPI2GvO4kz1UX298AWCMk0yT9kwHdT2vRHA8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lGxJlS9nxtxDOo6b2LwI3fxourcUrm+3EY5gG//GMKF01lTy8qCpui7hMIrtVwNt4
         O3JdNknR8iqcbLWt1W9rZq76vIQiR6keWM2IMYgRLFHvSBh6Qv0/67xd88gBDxXK4s
         VYZIGWXrDr84xlqiSIuUMFzLswJ8yiOMSFV+GvG0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E4D260300;
        Thu, 20 Jun 2019 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561024299;
        bh=FTnHHkOBPI2GvO4kz1UX298AWCMk0yT9kwHdT2vRHA8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pFVj2IK9p+xx6oLjwIOp6q4A3iPx7JS824D3ETVdvNPYMwDB08WJNQxnsoj212OjI
         TLyAlcdl/Wvm+amB4zZeRz0iuvHk/dBZ6O/BB3Pe8sCVTOetw66N4Txl8fCNep2O3o
         iUIeQMVki2vaggmK8Q+p8N43kGKPOgwvm7vtYC5w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E4D260300
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     Suzuki K Poulose <suzuki.poulose@arm.com>, stephan@gerhold.net,
        mathieu.poirier@linaro.org
Cc:     david.brown@linaro.org, sibis@codeaurora.org,
        rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.leach@linaro.org
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
 <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <78b67245-9053-6175-9f9e-dbb12e5fb55c@codeaurora.org>
Date:   Thu, 20 Jun 2019 15:21:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 6/20/2019 2:36 PM, Suzuki K Poulose wrote:
> 
> 
> We are not yet there in the Coresight driver and we crash at AMBA bus layer
> trying to read the PID of the CoreSight device. So I doubt if this is an
> issue your patch trying to address. I still think this is a debug power 
> domain
> issue. More your patch below.

Yes, I suppose you are right. Just for testing, I had disabled psci
enable method for non boot cpus on msm8916 and it just crashed without
any traces. So, I thought maybe that could have been a reason for 
Stephan's crash as well.

> 
>> like cpu affinity issue. Can you please try out this patch and let us
>> know?
> 
> In general I am for the patch, breaking the "assumption" that a missing CPU
> phandle gives you the affinity of "0".
> 
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> index e8819d750938..9acf9f190d42 100644
>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> @@ -579,7 +579,11 @@ static int debug_probe(struct amba_device *adev,
>> const struct amba_id *id)
>>        if (!drvdata)
>>            return -ENOMEM;
>>
>> -    drvdata->cpu = np ? of_coresight_get_cpu(np) : 0;
>> +    drvdata->cpu = np ? of_coresight_get_cpu(np) : -ENODEV;
> 
> 
> of_coresight_get_cpu() must be modified to return -ENODEV, rather than
> defaulting to 0. This is something that is required by the CTI driver too.
> And lets not bring up something and assume it belongs to CPU0.
> 
>> +    if (drvdata->cpu == -ENODEV) {
>> +        return -ENODEV;
>> +    }
>> +
>>        if (per_cpu(debug_drvdata, drvdata->cpu)) {
>>            dev_err(dev, "CPU%d drvdata has already been initialized\n",
>>                drvdata->cpu);
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>> index 8bb0092c7ec2..660432acbac0 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>> @@ -1107,7 +1107,10 @@ static int etm4_probe(struct amba_device *adev,
>> const struct amba_id *id)
>>
>>        spin_lock_init(&drvdata->spinlock);
>>
>> -    drvdata->cpu = pdata ? pdata->cpu : 0;
> 
> I believe, we should simply abort when we don't have pdata. There is no 
> point
> in registering this ETM unless we know where this is connected to.
> 

I did not understand this comment since I am returning with ENODEV here
and not registering this ETM.

>> +    drvdata->cpu = pdata ? pdata->cpu : -ENODEV;
>> +    if (drvdata->cpu == -ENODEV) {
>> +        return -ENODEV;
>> +       }
> 
>>
>>        cpus_read_lock();
>>        etmdrvdata[drvdata->cpu] = drvdata;
>> diff --git a/drivers/hwtracing/coresight/of_coresight.c
>> b/drivers/hwtracing/coresight/of_coresight.c
>> index 7045930fc958..8c1b90ba233c 100644
>> --- a/drivers/hwtracing/coresight/of_coresight.c
>> +++ b/drivers/hwtracing/coresight/of_coresight.c
>> @@ -153,14 +153,14 @@ int of_coresight_get_cpu(const struct device_node
>> *node)
>>        struct device_node *dn;
>>
>>        dn = of_parse_phandle(node, "cpu", 0);
>> -    /* Affinity defaults to CPU0 */
>> +    /* Affinity defaults to invalid */
>>        if (!dn)
>> -        return 0;
>> +        return -ENODEV;
>>        cpu = of_cpu_node_to_id(dn);
>>        of_node_put(dn);
>>
>> -    /* Affinity to CPU0 if no cpu nodes are found */
>> -    return (cpu < 0) ? 0 : cpu;
>> +    /* Affinity to invalid if no cpu nodes are found */
>> +    return (cpu < 0) ? -ENODEV : cpu;
> 
>      return cpu ?
> 
> If you split this into 3 different patches, I would be happy to Ack them.
>

Sure, I will ready the patches.

Thanks,
Sai

> Mathieu,
> 
> What do you think ?
> 
> 
> Cheers
> Suzuki

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
