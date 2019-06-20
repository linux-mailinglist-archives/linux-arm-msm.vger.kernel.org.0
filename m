Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 746514D0FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 16:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFTOy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 10:54:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54642 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfFTOy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 10:54:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 65BBF609CD; Thu, 20 Jun 2019 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561042468;
        bh=pMqbryRRbIU4AIh4v96MaC9JtLkGuFViwuA1Q/TdhH8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZAl+pOXYBGO7whhGuWHJc4btecmjFZ/53wZvCO5XkGpRYwPCSFzuqq6VHJsbV3HGx
         az/aX0jZPsp/ZqgoFQK9p3M8GbsOrdDm1SxaHPrqpQAMq17AVi3LC1dB0a4LRAqPNu
         EKJntTC+hf8yK7OqihIDPW6iIzdp0Z3CPXOVoXLc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94B6A608BA;
        Thu, 20 Jun 2019 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561042467;
        bh=pMqbryRRbIU4AIh4v96MaC9JtLkGuFViwuA1Q/TdhH8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AR65EvCstzMeE5tDxoWxP15ede45s1/eKvpOiavIWK/aCqSi5jeazJ8BS3UAHLxUd
         PPIwOW0Y+rAPUB7FM8z3/hA5yXnXIqyxuAnBFStp+YBoypeD/rRsnbiJTx9pxlQZ0R
         +YvfJAEgKc1Lthg0wn0GRgqy2j6Y6ZNCpbuzzpNY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94B6A608BA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 1/2] coresight: Set affinity to invalid for missing CPU
 phandle
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        mathieu.poirier@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, andy.gross@linaro.org,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <f7a3592b-7ed7-b011-9ae1-dc2ca0e49ae4@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <fc72dab8-d287-38d4-1abd-faca02c09118@codeaurora.org>
Date:   Thu, 20 Jun 2019 20:24:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f7a3592b-7ed7-b011-9ae1-dc2ca0e49ae4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

Thanks for the review.

On 6/20/2019 7:25 PM, Suzuki K Poulose wrote:
> 
> Sai,
> 
> Thanks for the patch. Please could you change the subject to :
> 
> "coresight: Do not default to CPU0 for missing CPU phandle"
> 

Sure.

> On 20/06/2019 14:45, Sai Prakash Ranjan wrote:
>> Affinity defaults to CPU0 in case of missing CPU phandle
>> and this leads to crashes in some cases because of such
>> wrong assumption. Fix this by returning -ENODEV in
> 
> Thats not the right justification. Causing crashes is due to
> bad DT/firmware. I would be happy with something like :
> 
> "Coresight platform support assumes that a missing \"cpu\" phandle
> defaults to CPU0. This could be problematic and unnecessarily binds
> components to CPU0, where they may not be. Let us make the DT binding
> rules a bit stricter by not defaulting to CPU0 for missing "cpu"
> affinity information."
> 
> Also, you must
> 
> 1) update the devicetree/bindings document to reflect the same.
> 2) update the drivers to take appropriate action on the missing CPU
>     where they are expected (e.g, CPU-debug, etm*), to prevent
>     breaking a bisect.
> 
> 

Sure will do it and repost.

>> coresight platform for such cases and then handle it
>> in the coresight drivers.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-platform.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 3c5ceda8db24..b1ea60c210e1 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -160,15 +160,17 @@ static int of_coresight_get_cpu(struct device *dev)
>>       if (!dev->of_node)
>>           return 0;
>> +
>>       dn = of_parse_phandle(dev->of_node, "cpu", 0);
>> -    /* Affinity defaults to CPU0 */
>> +
>> +    /* Affinity defaults to invalid if no cpu nodes are found*/
> 
> The code is self explanatory here. You could drop the comment.
> 

Sure.

>>       if (!dn)
>> -        return 0;
>> +        return -ENODEV;
>> +
>>       cpu = of_cpu_node_to_id(dn);
>>       of_node_put(dn);
>> -    /* Affinity to CPU0 if no cpu nodes are found */
>> -    return (cpu < 0) ? 0 : cpu;
>> +    return cpu;
>>   }
> 
> Suzuki

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
