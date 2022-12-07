Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0EE6450A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiLGAvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiLGAvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:51:16 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D836743848
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:51:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b3so26310835lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyCiEehhg3AvK47XRuRV3OgUlLAe89kYvEl1PGK0zH8=;
        b=j1Fp1sQbLBxakIyAwAB+au8WHjL5ln0feTRryZHp8L6MFO5WbZWl/DJyXUZ8GVxpW2
         WCMBuxUpVkUK1bHouifp0oC8MaE99MEYwEKatpsiNNCCfyGigPzKnZhz8DXw0L5amgEI
         Br0Dxgg9jkviQ/vutEq3tdkpNaL2vjC3Mx30tLCr51fnwU4h6CkWfMICIgmThi87AhUz
         pmtgcOzMKYBBolUsW1UGeHvVx8dhccL2XKm3zPQ4io4B+Fw/5i4HdfsMnyFWOZSIXc58
         f20bjBISkPfKiU53ofXOG3XgfXBAhBUu5u1/92XPMDAENqU+ITdulEdosZOaI8w8ITNu
         cUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyCiEehhg3AvK47XRuRV3OgUlLAe89kYvEl1PGK0zH8=;
        b=GOX8F2oAfZ7Xaj9U6AnmI3JcTjSfi6yaZLvMPghov8cLvq6uvqh2iBYRz6zwdC9BGE
         gonZnKiRMwHf1TPzGx1GpkAeGpDpQNJ6TWLzeVNtAIX7aZtrX/acFq3trXVB4S7VHfi9
         cPfm9zggjrK/MU3Bf1DAqeJYrlyA91chCAbWFng1m35MiQ7BT0DvVTFwpTYHf2xOEgUi
         N2FfY3hmx3RZhoBPaNXr2z+xNS5RQ5cK9WqZFc9aHY/ldtRjfOnZ7f6Z3slC/Tvcbgz/
         wuPpSMHHu6VKPE6uDVTR1ANFpkimcmxuq5FbDj+HaG+sWd5xNJJNjlOZgQxJHKTkTvpb
         WjDw==
X-Gm-Message-State: ANoB5pmVw6YQGin/GsID2oqv7obM2HTzzYY8Ww5GN3nvLCVxuJb/bL6Y
        Gwg25yswKLzqsu2AZGZQKMNadQ==
X-Google-Smtp-Source: AA0mqf70FwA/7pUTk06J/iRiWlaxYX9OW/dUZSt0KyKZ59fVoWgXvLLspoXRehLOXBDC59c5Ta9cmw==
X-Received: by 2002:a19:7b0f:0:b0:4a2:3bed:2008 with SMTP id w15-20020a197b0f000000b004a23bed2008mr31770961lfc.88.1670374272930;
        Tue, 06 Dec 2022 16:51:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u11-20020a056512040b00b004a2386b8cf5sm2645240lfk.215.2022.12.06.16.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 16:51:12 -0800 (PST)
Message-ID: <be1521b6-101d-5909-6436-f042806eb642@linaro.org>
Date:   Wed, 7 Dec 2022 02:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 08/10] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
 <20221123210403.3593366-9-dmitry.baryshkov@linaro.org>
 <5eab17ea-0688-f63d-ab73-fe4c15db7092@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5eab17ea-0688-f63d-ab73-fe4c15db7092@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 08:01, Abhinav Kumar wrote:
> 
> 
> On 11/23/2022 1:04 PM, Dmitry Baryshkov wrote:
>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>> these registers during snapshot.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 38aa38ab1568..8da4c5ba6dc3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -82,6 +82,8 @@ enum {
>>    * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
>>    *                         compression initial revision
>>    * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
>> + * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 
>> block results
>> + *               in a failure
> shouldnt this be that "indicates that the top register block is not 
> contiguous and the two sub-blocks are separated by an offset"

Not so sure. Your suggestion is closer to the dynamic case, where all 
the sizes are dynamic in catalog. Since the patch uses fixed offsets, 
I'd mention periph0 instead (like the downstream does).

>>    * @DPU_MDP_MAX            Maximum value
>>    */
>> @@ -92,6 +94,7 @@ enum {
>>       DPU_MDP_UBWC_1_0,
>>       DPU_MDP_UBWC_1_5,
>>       DPU_MDP_AUDIO_SELECT,
>> +    DPU_MDP_PERIPH_0_REMOVED,
>>       DPU_MDP_MAX
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index f3660cd14f4f..4ac14de55139 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
> 
> I recall one of the comments from konrad that this should come from the 
> catalog rather than a hard-coded offset which you wanted to keep it for 
> a later time. I am fine with that.
> 
> But instead of a hard-coded offset, do you want to have a macro so that 
> atleast we know what the value means and can fix it in the future? 
> Otherwise it would end up being one of those numbers which someone later 
> on wouldnt understand where it comes from and what it means.

Yes, I macro makes sense to me. I'll fix in v6.

> 
>> +    } else {
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }

-- 
With best wishes
Dmitry

