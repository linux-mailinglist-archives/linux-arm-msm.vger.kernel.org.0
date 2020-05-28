Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618041E5DC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 13:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388290AbgE1LDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 07:03:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:26676 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388281AbgE1LDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 07:03:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590663796; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Cun8HK2gcH9EvzGyJWpeBqNsioNPtJ+qdy5W+mMvL8Y=; b=ILi/pHuFwzLnq8hf7cIzzzl8V1LDf+Hh0yiVCyBmVPmx+5OzYFEp7NIks+xJCzlOK0pu6hoK
 36eZrrdgODQXaEzoWtaDGB7pIDaoqcPdDoH7iTgiq4bMv6XWXe+Gg0pj+9LQ7M1RwybUOV8s
 gaDQWcGY7UQLq4ULfbTx0trSFvE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ecf9a6a2c549984755cceec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 11:03:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D85C4C433A1; Thu, 28 May 2020 11:03:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.177.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E396C433C6;
        Thu, 28 May 2020 11:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E396C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To:     Rob Clark <robdclark@gmail.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, saravanak@google.com,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
 <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
 <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
From:   Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <46976ed1-d732-cb77-bb0c-c2c6a566b95b@codeaurora.org>
Date:   Thu, 28 May 2020 16:32:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/27/2020 9:08 PM, Rob Clark wrote:
> On Wed, May 27, 2020 at 1:47 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>> + more folks
>>
>> On 5/18/2020 9:55 PM, Rob Clark wrote:
>>> On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>>>> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
>>>>> This patches replaces the previously used static DDR vote and uses
>>>>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
>>>>> GPU frequency.
>>>>>
>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>>>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> index 2d8124b..79433d3 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>>>
>>>>>         gmu->freq = gmu->gpu_freqs[perf_index];
>>>>>
>>>>> -     /*
>>>>> -      * Eventually we will want to scale the path vote with the frequency but
>>>>> -      * for now leave it at max so that the performance is nominal.
>>>>> -      */
>>>>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>>>>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>>>>>    }
>>>> This adds an implicit requirement that all targets need bandwidth settings
>>>> defined in the OPP or they won't get a bus vote at all. I would prefer that
>>>> there be an default escape valve but if not you'll need to add
>>>> bandwidth values for the sdm845 OPP that target doesn't regress.
>>>>
>>> it looks like we could maybe do something like:
>>>
>>>     ret = dev_pm_opp_set_bw(...);
>>>     if (ret) {
>>>         dev_warn_once(dev, "no bandwidth settings");
>>>         icc_set_bw(...);
>>>     }
>>>
>>> ?
>>>
>>> BR,
>>> -R
>> There is a bit of an issue here - Looks like its not possible to two icc
>> handles to the same path.  Its causing double enumeration of the paths
>> in the icc core and messing up path votes. With [1] Since opp/core
>> already gets a handle to the icc path as part of table add,  drm/msm
>> could do either
>>
>> a) Conditionally enumerate gpu->icc_path handle only when pm/opp core
>> has not got the icc path handle. I could use something like [2] to
>> determine if should initialize gpu->icc_path*
>>
>> b) Add peak-opp-configs in 845 dt and mandate all future versions to use
>> this bindings. With this, I can remove gpu->icc_path from msm/drm
>> completely and only rely on opp/core for bw voting.
> The main thing is that we want to make sure newer dtb always works on
> an older kernel without regression.. but, hmm..  I guess the
> interconnects/interconnects-names properties haven't landed yet in
> sdm845.dtsi?  Maybe that lets us go with the simpler approach (b).
> Looks like we haven't wired up interconnect for 8916 or 8996 either,
> so probably we can just mandate this for all of them?

I checked all three 845, 820 and 8916 and none of them have the 
interconnect configs for GPU. So, I think we are good here. I'll go with 
option (b) and re-spin v3. Adding interconnects and opp-peak-kBps 
configs for previous chips can be taken up as a separate activity.

Sharat

> If we have landed the interconnect dts hookup for gpu somewhere that
> I'm overlooking, I guess we would have to go with (a) and keep the
> existing interconnects/interconnects-names properties.
>
> BR,
> -R
>
>> [1] - https://lore.kernel.org/patchwork/cover/1240687/
>>
>> [2] - https://patchwork.kernel.org/patch/11527573/
>>
>> Let me know your thoughts
>>
>> Sharat
>>
>>>> Jordan
>>>>
>>>>>    unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>>>>> --
>>>>> 2.7.4
>>>>>
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>> _______________________________________________
>>>> Freedreno mailing list
>>>> Freedreno@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/freedreno
