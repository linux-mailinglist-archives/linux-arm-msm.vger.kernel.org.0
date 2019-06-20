Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902ED4D84C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 20:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfFTSH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 14:07:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36546 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfFTSH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 14:07:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6ED3061215; Thu, 20 Jun 2019 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561054076;
        bh=7oF5FYVB4lfqoUS0Whfvt1/H7DjfkYY/IRM8xOGXllU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZEoATi2NY3mmajhG/7O9iXBPacMeW6VD1Oubpnmld7rQE/vcTJOa4ZqpA+kbax24f
         d7qXwOFoi5FbB3tSRKAIqG7EiQAzmQKk027S5VQpPMkjFMcm7M9jbKKGWiPpa+9fCy
         IjthsOiW/Hq5NL12PcJ3S3SjMjOIz2ZqWuxuHHVQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4309760E57;
        Thu, 20 Jun 2019 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561054074;
        bh=7oF5FYVB4lfqoUS0Whfvt1/H7DjfkYY/IRM8xOGXllU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=agu9uSKcqLRU1u8dTJcRsoe5C4M6B+ntgNfLUgVMBz+jj2LE6WkQBaXE3SkqP0MRu
         rf/B6aRW/MyrsRTed2F2jFmJj/pBTu8sUwSSjIn4CfprmjyP0nhwACjGX/x33JPI5O
         CinIvimXEuZa97ng+wQ2GNtkrUmfHVtjjgP3ZopA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4309760E57
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 2/2] coresight: Abort probe for missing CPU phandle
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
 <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <20190620174308.GB5581@xps15>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <94bd685a-1c03-f234-7d3c-e5df0856845b@codeaurora.org>
Date:   Thu, 20 Jun 2019 23:37:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620174308.GB5581@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

Thanks for the review comments.

On 6/20/2019 11:13 PM, Mathieu Poirier wrote:
> On Thu, Jun 20, 2019 at 07:15:47PM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> index 07a1367c733f..43f32fa71ff9 100644
>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> @@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>>   		return -ENOMEM;
>>   
>>   	drvdata->cpu = coresight_get_cpu(dev);
>> +	if (drvdata->cpu == -ENODEV)
>> +		return -ENODEV;
> 
> As Suzuki pointed out, simply return the error message conveyed by
> coresight_get_cpu().
> 
> Also please merge both patches together to avoid bisect nightmare.

Sure, will do it.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
