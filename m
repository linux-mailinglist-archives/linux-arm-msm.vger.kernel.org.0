Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612831E3C8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 10:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388169AbgE0Ir6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 04:47:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13839 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388166AbgE0Ir6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 04:47:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590569276; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: Cc: References: To:
 Subject: Sender; bh=uae7yIbf7LkvKzwAx7OZgJqnIs4z8A3JvYEC3/kjvas=; b=Gi0/PIZaQh8MPUmZEhBBVda8zuNvIavnGHtA/ydJcNEyX2up7dxvbcGe/HL0mAgjyUguEVZa
 QaH5rysuByJ3Db/zv9a3/SwQKaw43QxYKh+oCHUjzrhs1k7x0cnnK7c5SAiAVlvM9YbokV3t
 labQGGIHYGBL2NAhUQQ/+3shTlU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ece292d44a25e0052c0c368 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 08:47:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79D87C433C9; Wed, 27 May 2020 08:47:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.179.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6D3AC433C6;
        Wed, 27 May 2020 08:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6D3AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To:     Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
Cc:     viresh.kumar@linaro.org, saravanak@google.com,
        sibis@codeaurora.org, rnayak@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
Date:   Wed, 27 May 2020 14:17:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ more folks

On 5/18/2020 9:55 PM, Rob Clark wrote:
> On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
>>> This patches replaces the previously used static DDR vote and uses
>>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
>>> GPU frequency.
>>>
>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 2d8124b..79433d3 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>
>>>        gmu->freq = gmu->gpu_freqs[perf_index];
>>>
>>> -     /*
>>> -      * Eventually we will want to scale the path vote with the frequency but
>>> -      * for now leave it at max so that the performance is nominal.
>>> -      */
>>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>>>   }
>> This adds an implicit requirement that all targets need bandwidth settings
>> defined in the OPP or they won't get a bus vote at all. I would prefer that
>> there be an default escape valve but if not you'll need to add
>> bandwidth values for the sdm845 OPP that target doesn't regress.
>>
> it looks like we could maybe do something like:
>
>    ret = dev_pm_opp_set_bw(...);
>    if (ret) {
>        dev_warn_once(dev, "no bandwidth settings");
>        icc_set_bw(...);
>    }
>
> ?
>
> BR,
> -R

There is a bit of an issue here - Looks like its not possible to two icc 
handles to the same path.  Its causing double enumeration of the paths 
in the icc core and messing up path votes. With [1] Since opp/core 
already gets a handle to the icc path as part of table add,  drm/msm 
could do either

a) Conditionally enumerate gpu->icc_path handle only when pm/opp core 
has not got the icc path handle. I could use something like [2] to 
determine if should initialize gpu->icc_path*

b) Add peak-opp-configs in 845 dt and mandate all future versions to use 
this bindings. With this, I can remove gpu->icc_path from msm/drm 
completely and only rely on opp/core for bw voting.

[1] - https://lore.kernel.org/patchwork/cover/1240687/

[2] - https://patchwork.kernel.org/patch/11527573/

Let me know your thoughts

Sharat

>
>> Jordan
>>
>>>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>>> --
>>> 2.7.4
>>>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno
