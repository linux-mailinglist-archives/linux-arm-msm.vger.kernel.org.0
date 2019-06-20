Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07EE4D103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 16:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfFTOz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 10:55:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56174 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTOz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 10:55:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3384560ACE; Thu, 20 Jun 2019 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561042526;
        bh=lp+jYH159W3J3+bnQT9chGwWKrrMYUzb9E4b8qJNR9U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X/+XOmxYO7QISQ7qD7o6Mx+MqamjdNSfmn+e0JUTachlrs6/le8Zu0rxKVNECZphp
         Ypcjwd9ImM/PxC0vntjhQVyLl03Cv3vLegTX+CO/D69e5S1s09T8KtNEmWD9LSfd68
         HlkJgijH9ixoStY0jqcJYIMc1iTpBnAX7VFb0/n4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC87160ACE;
        Thu, 20 Jun 2019 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561042522;
        bh=lp+jYH159W3J3+bnQT9chGwWKrrMYUzb9E4b8qJNR9U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=flQUbIQ99CMAijIbse9AyEtVxoH+Lfj8A8LdDcc+cIZS5yWeun0d45D3iByJtmUNz
         6WfERkzKW3xvyhOHZr0T3k/gCHNeITKLCmqPaSaXt/w11n7AwgfGJx4bwYPjeTk4lZ
         HrLmC6EOn2mdXmepgiLXPcVMotVwIWmouh/ni3B4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC87160ACE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 2/2] coresight: Abort probe for missing CPU phandle
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        mathieu.poirier@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, david.brown@linaro.org,
        mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <1ddee3c1-8299-1991-eb88-151b9c3ee180@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <e3e13629-a723-8b08-cbae-5a3295170900@codeaurora.org>
Date:   Thu, 20 Jun 2019 20:25:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1ddee3c1-8299-1991-eb88-151b9c3ee180@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/20/2019 7:28 PM, Suzuki K Poulose wrote:
> 
> 
> On 20/06/2019 14:45, Sai Prakash Ranjan wrote:
>> Currently the coresight etm and cpu-debug drivers
>> assume the affinity to CPU0 returned by coresight
>> platform and continue the probe in case of missing
>> CPU phandle. This is not true and leads to crash
>> in some cases, so abort the probe in case of missing
>> CPU phandle.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-cpu-debug.c | 3 +++
>>   drivers/hwtracing/coresight/coresight-etm3x.c     | 3 +++
>>   drivers/hwtracing/coresight/coresight-etm4x.c     | 3 +++
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c 
>> b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> index 07a1367c733f..43f32fa71ff9 100644
>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> @@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>           return -ENOMEM;
>>       drvdata->cpu = coresight_get_cpu(dev);
>> +    if (drvdata->cpu == -ENODEV)
>> +        return -ENODEV;
> 
> if (drvdata->cpu < 0)
>      return drvdata->cpu;
> 
> Same everywhere below ?
> 
> Also, I would like to hear Mathieu's thoughts on this change. If he's OK
> with it:
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com> with the change 
> above.
> 
> 

Thanks, I will make the change and repost.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
