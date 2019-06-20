Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649094D86D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 20:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfFTS0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 14:26:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35086 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfFTSGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 14:06:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C715A60CEC; Thu, 20 Jun 2019 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561053965;
        bh=xqFrw2iEUDGfrGwNGjX8WKf97VfRNbSs18+LFwCkO+4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=h1+pfyX4F+q6dq4Nh7cgxgSLcie8FSD23ddcS7kFr3JlAl8rSfvpZYyohlptGR8+U
         DmPFKU4RFQnEvi5ilanp3qUJ+Or9OEWaN4I2ZZPfhnc0w+FXdEzKR/AsQoxGTLBpid
         GxT2zeaJUtXYYPLmj5HFTBWv1XSo5Is/bacUcc1A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [157.45.245.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CAD5860ACE;
        Thu, 20 Jun 2019 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561053963;
        bh=xqFrw2iEUDGfrGwNGjX8WKf97VfRNbSs18+LFwCkO+4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fyIrHi0kTh7H+/xl5q7YA4c1k1jZjRQbz+F2RzehTRGhfvuQ2drjAd1ngvj+nt4k2
         9PulOeBcArJzpAwwS3mNYhND6rZcuzHwtvppHvqqyto41vw29dwJnOKsKt02AD6Yla
         kgVpN1slAGcfy/IPYu7CbVk2waSwQJ0fdxDVVoy4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CAD5860ACE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 1/2] coresight: Set affinity to invalid for missing CPU
 phandle
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <20190620173908.GA5581@xps15>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <64f67948-3b7f-422b-0ab7-2393b6083514@codeaurora.org>
Date:   Thu, 20 Jun 2019 23:35:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620173908.GA5581@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

Thanks for the review comments.

On 6/20/2019 11:09 PM, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Thu, Jun 20, 2019 at 07:15:46PM +0530, Sai Prakash Ranjan wrote:
>> Affinity defaults to CPU0 in case of missing CPU phandle
>> and this leads to crashes in some cases because of such
>> wrong assumption. Fix this by returning -ENODEV in
>> coresight platform for such cases and then handle it
>> in the coresight drivers.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-platform.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 3c5ceda8db24..b1ea60c210e1 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -160,15 +160,17 @@ static int of_coresight_get_cpu(struct device *dev)
>>   
>>   	if (!dev->of_node)
>>   		return 0;
> 
> An error should be returned if the above condition is true.
> 

Will do it, thanks.

>> +
> 
> Spurious newline
> 

This was on purpose, the code looks much cleaner.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
