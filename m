Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6A128B9F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 16:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730309AbgJLNf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 09:35:59 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:17582 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730812AbgJLNf1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 09:35:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602509726; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yJVu2nYtW7tgXAqxi6u1cPfPKhnG3l6c6j29s6R7Esg=; b=deEPPL01fjZK/Aw6c5ZYHnspy49PGLJagMSKuB5ZoPHiC3NA6ZUZ7UTpBw+oDHlsz+MFtJef
 Aqpe8bs/ReTDvd/93oWf5IWx5QNHaE1e46+angwnvb3EK6QNuQtJBWrVzfmmsRySewr30frx
 jRYzoVo2gLwhjdSW8ECdr34Og8k=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f845b45ad37af35ec9f4854 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 13:33:57
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79C8DC43382; Mon, 12 Oct 2020 13:33:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.180.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1344FC43391;
        Mon, 12 Oct 2020 13:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1344FC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
To:     mka@chromium.org
Cc:     freedreno@lists.freedesktop.org, robh@kernel.org,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org, linux-kernel@vger.kernel.org
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
Date:   Mon, 12 Oct 2020 19:03:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009183640.GB1292413@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> Hi Akhil,
> 
> On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
>> Register GPU as a devfreq cooling device so that it can be passively
>> cooled by the thermal framework.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
>>   drivers/gpu/drm/msm/msm_gpu.h |  2 ++
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 55d1648..93ffd66 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -14,6 +14,7 @@
>>   #include <generated/utsrelease.h>
>>   #include <linux/string_helpers.h>
>>   #include <linux/devfreq.h>
>> +#include <linux/devfreq_cooling.h>
>>   #include <linux/devcoredump.h>
>>   #include <linux/sched/task.h>
>>   
>> @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>>   	if (IS_ERR(gpu->devfreq.devfreq)) {
>>   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
>>   		gpu->devfreq.devfreq = NULL;
>> +		return;
>>   	}
>>   
>>   	devfreq_suspend_device(gpu->devfreq.devfreq);
>> +
>> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
>> +			gpu->devfreq.devfreq);
>> +	if (IS_ERR(gpu->cooling)) {
>> +		DRM_DEV_ERROR(&gpu->pdev->dev,
>> +				"Couldn't register GPU cooling device\n");
>> +		gpu->cooling = NULL;
>> +	}
>>   }
>>   
>>   static int enable_pwrrail(struct msm_gpu *gpu)
>> @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   
>>   	msm_devfreq_init(gpu);
>>   
>> -
>>   	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>>   
>>   	if (gpu->aspace == NULL)
>> @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>>   		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>>   		msm_gem_address_space_put(gpu->aspace);
>>   	}
>> +
>> +	devfreq_cooling_unregister(gpu->cooling);
> 
> Resources should be released in reverse order, otherwise the cooling device
> could use resources that have already been freed.
> Why do you think this is not the correct order? If you are thinking 
about devfreq struct, it is managed device resource.

-Akhil
