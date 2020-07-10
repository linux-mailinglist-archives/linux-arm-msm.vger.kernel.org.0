Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CF221BF12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 23:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgGJVNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 17:13:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:45755 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgGJVNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 17:13:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594415627; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Y1rBBSjHn58KkYWcfa8FN19qXT4mpd6FmEsIOBn/G4I=; b=Onb4YcaMgtkqlxl+6rprGtZkKp+YRup3s8fzF7WYXeP0o0mh6iwJFGJBOZsg8FEv5UdSC6nN
 +/lhN2hloR97988GVBpzGqtgr2MJmdwXGvqPcNm3Y3IJGw1l/KmSmAZSP1GYiDn2+PKVEpxc
 I/olgANzN5WsyrjfefiNM9Ok0LI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f08d9e57c8ca473a82dccfb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 21:13:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2269EC433CB; Fri, 10 Jul 2020 21:13:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.185.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66CF0C433C8;
        Fri, 10 Jul 2020 21:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66CF0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through hfi
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, saravanak@google.com,
        linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dri-devel@freedesktop.org, viresh.kumar@linaro.org,
        sibis@codeaurora.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
 <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <40f6df1d-f524-c612-9215-591fd7f16e3b@codeaurora.org>
Date:   Sat, 11 Jul 2020 02:43:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/10/2020 1:34 AM, Jonathan Marek wrote:
> On 7/9/20 4:00 PM, Akhil P Oommen wrote:
>> Newer targets support changing gpu frequency through HFI. So
>> use that wherever supported instead of the legacy method.
>>
>
> It was already using HFI on newer targets. Don't break it in one 
> commit then fix it in the next.

Oops. I somehow got confused. Will fix and resend.

-Akhil

>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 233afea..b547339 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -121,6 +121,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, 
>> struct dev_pm_opp *opp)
>>           if (gpu_freq == gmu->gpu_freqs[perf_index])
>>               break;
>>   +    if (!gmu->legacy) {
>> +        a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
>> +        icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> +        return;
>> +    }
>> +
>>       gmu->current_perf_index = perf_index;
>>       gmu->freq = gmu->gpu_freqs[perf_index];
>>   @@ -893,10 +899,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>       enable_irq(gmu->hfi_irq);
>>         /* Set the GPU to the current freq */
>> -    if (gmu->legacy)
>> -        a6xx_gmu_set_initial_freq(gpu, gmu);
>> -    else
>> -        a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
>> +    a6xx_gmu_set_initial_freq(gpu, gmu);
>>         /*
>>        * "enable" the GX power domain which won't actually do 
>> anything but it
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
