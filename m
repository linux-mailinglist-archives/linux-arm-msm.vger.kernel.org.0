Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC653E47F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 16:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhHIOxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 10:53:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10457 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhHIOxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 10:53:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628520764; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=84DInYak3ob6ws+4P8+9QbEz8S5I95euQDi0WGUvz1I=; b=Fg2rOyiWOqpIQnMG7Ld8VQvyVDGExs60H7vyxoC6WLFsN53DCqo/8RIKypvjVWpfdidaXyK7
 pvVluB4WwZ1pXiRT9D8sVkMRxgNdnHCqphGjy4TOd9jr86hxYFzktAMVFe5YkyAAhS8Y1lYj
 zk+WeavMeUP/i3OQJiwz/yv+JGk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6111411a76c3a9a17283506c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Aug 2021 14:52:10
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E9F5C433D3; Mon,  9 Aug 2021 14:52:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.230.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B3AFC4338A;
        Mon,  9 Aug 2021 14:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B3AFC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To:     Rob Clark <robdclark@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
 <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
 <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org>
Date:   Mon, 9 Aug 2021 20:21:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/8/2021 10:22 PM, Rob Clark wrote:
> On Sun, Aug 8, 2021 at 7:33 AM Caleb Connolly <caleb.connolly@linaro.org> wrote:
>>
>>
>>
>> On 07/08/2021 21:04, Rob Clark wrote:
>>> On Sat, Aug 7, 2021 at 12:21 PM Caleb Connolly
>>> <caleb.connolly@linaro.org> wrote:
>>>>
>>>> Hi Rob, Akhil,
>>>>
>>>> On 29/07/2021 21:53, Rob Clark wrote:
>>>>> On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
>>>>> <caleb.connolly@linaro.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 29/07/2021 21:24, Rob Clark wrote:
>>>>>>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
>>>>>>> <caleb.connolly@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Hi Rob,
>>>>>>>>
>>>>>>>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
>>>>>>>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
>>>>>>>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
>>>>>>>
>>>>>>> *ohh*, yeah, ok, that would explain it
>>>>>>>
>>>>>>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
>>>>>>>> at the higher frequencies.
>>>>>>>>
>>>>>>>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
>>>>>>>> glxgear.
>>>>>>>>
>>>>>>>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
>>>>>>>> at the voltage the hardware needs to be stable.
>>>>>>>>
>>>>>>>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
>>>>>>>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
>>>>>>>>
>>>>>>>
>>>>>>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
>>>>>>> on CC and I added sboyd, maybe one of them knows better.
>>>>>>>
>>>>>>> In the short term, removing the higher problematic OPPs from dts might
>>>>>>> be a better option than this patch (which I'm dropping), since there
>>>>>>> is nothing stopping other workloads from hitting higher OPPs.
>>>>>> Oh yeah that sounds like a more sensible workaround than mine .
>>>>>>>
>>>>>>> I'm slightly curious why I didn't have problems at higher OPPs on my
>>>>>>> c630 laptop (sdm850)
>>>>>> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
>>>>>>
>>>>>> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
>>>>>> crash where yours doesn't?
>>>>>
>>>>> I've not heard any reports of similar issues from the handful of other
>>>>> folks with c630's on #aarch64-laptops.. but I can't really say if that
>>>>> is luck or not.
>>>> It looks like this affects at least the OnePlus 6 and PocoPhone F1, I've done some more poking and the following diff
>>>> seems to fix the stability issues completely, it seems the delay is required to let the update propagate.
>>>>
>>>> This doesn't feel like the right fix, but hopefully it's enough to come up with a better solution than disabling the new
>>>> devfreq behaviour on a630.
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index d7cec7f0dde0..69e2a5e84dae 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>>                    return;
>>>>            }
>>>>
>>>> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>>>> +
>>>> +       usleep_range(300, 500);
>>>> +
>>>

I am a bit confused. We don't define a power domain for gpu in dt, 
correct? Then what exactly set_opp do here? Do you think this usleep is 
what is helping here somehow to mask the issue?

I feel we should just leave the new dcvs feature (shall we call it NAP?) 
disabled for a630 (and 10ms devfreq interval), until this is root caused.

>>> Hmm, this is going to be in the critical path on idle -> active
>>> transition (ie. think response time to user-input).. so we defn don't
>>> want to do this unconditionally..
>>>
>>> If I understand the problem, we just want to limit how far we jump the
>>> gpu freq in one go.. maybe deleting the lowest (and perhaps highest)
>>> OPP would accomplish that?  Could that be done in the board(s)'s
>>> toplevel dts files?
>> That would be a workaround, however I'd really like to avoid limiting performance as a solution if I can help it,
>> especially as the fix might just be "set the opp first, wait for it to apply, then set the core clock".
>>
>> Is there a sensible way to get a callback from the opp notify chain? Or from rpmh directly? Or is this solution really
>> not the right way to go?
> 
> It does seem a bit strange to me that we are telling GMU to change
> freq before calling dev_pm_opp_set_opp()..  if dev_pm_opp_set_opp() is
> increasing voltage, it seems like you'd want to do that *before*
> increasing freq (but reverse the order when decreasing freq).. But I'm
> not an expert on the ways of the GMU..  maybe Akhil or Jordan knows
> better how this is supposed to work.

For legacy gmu, we trigger DCVS using DCVS OOB which comes later in this 
function. But the order between regulator and clock which you mentioned 
is correct.

> 
> But the delay seems like papering something over, and I'm trying to go
> in the other direction and reduce latency between user input and
> pageflip..
> 
> BR,
> -R
> 
>>>
>>> BR,
>>> -R
>>>
>>>>            gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
>>>>
>>>>            gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
>>>> @@ -158,7 +162,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>>            if (ret)
>>>>                    dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>>>>
>>>> -       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>>>>            pm_runtime_put(gmu->dev);
>>>>     }
>>>>>
>>>>> Maybe just remove it for affected devices?  But I'll defer to Bjorn.
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>
>>>> --
>>>> Kind Regards,
>>>> Caleb (they/them)
>>
>> --
>> Kind Regards,
>> Caleb (they/them)

