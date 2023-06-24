Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A082D73CABA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 14:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbjFXMOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 08:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjFXMOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 08:14:09 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A2A2112
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 05:14:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b4636bb22eso24278371fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687608846; x=1690200846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VI1Fg38Q9a+dz/3NduqJOgR+d4n2fTGjm3DQyw8QkHw=;
        b=DWeC9Bmu0p9wGMkH1oOLHkFihXoteV3H891n+mPVXXXPMsc4mnqupiB0lvii8FwD51
         Ve+bsJRhcxcsLqzKAsCN4iYHpPCccPKIUFCanhvNa4e2Tbr+1OK1Gq+SrhkwqU+J0WEy
         EQ0xH+/b6zbrQw6LVEbo7vR5ldg0dJWxmpTDaMGudRiJPALZeN3YGzsxi9RzNdduzlho
         QxyT6o5SghGJjrT5QpjyybcBRCL52g12ZgYLkr5cCVVq0z/IHXMIpb1Q2Jw3NdPGwBdy
         sIGMwclfNwCFJZ16F7uwtgNRh41bVzEw0E3h4W88J14N6735wraAuXFGi+ZK97UI2+0l
         Qbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687608846; x=1690200846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VI1Fg38Q9a+dz/3NduqJOgR+d4n2fTGjm3DQyw8QkHw=;
        b=iysg0/xt++2Ye55pt0Lj6+4wvT0gXTR0HYbZPu8R2SHJMmeSP+b8iaj4nHR4sw5Ny7
         KzPjwVU1/0q+68qsJAieIl1gaamBhjtiNsmXKEcoQUrWEdBUiCKC9ezuAAwpQhdlUB45
         cVnfNcIK0312gV9RfBvCYUVzOwbnIilSXSoKxQ4XO5ibIdhMs5jCJwoJ1IC8JqOa83Ds
         YDjieFVanjcpvg/zP2BkulNcF72/8ytM4dbbunzvjH6JW0e3ENHV9wdntSGxfLh58c0F
         6Tvg+L5bpXYdLTDyaJ2nMNSel8R8TupIZAaT7XuS3vQftgLE3fe0A7I3ItXW1GRrrfrS
         Hoog==
X-Gm-Message-State: AC+VfDw4srOCufHP0lAzWpxuiqk4UnI9JGqazqV52k8Ilcz5SCSEXCcC
        iIzlFUojGn9hs2qnAG7wqXcY2A==
X-Google-Smtp-Source: ACHHUZ4eUR3poyWqHpOWkotS3B48cq/ydqeuP9Mftes3bEXnaihEgo17n54sCgQTf/FPEqz7pcNxsA==
X-Received: by 2002:a2e:9085:0:b0:2b5:bc27:d6eb with SMTP id l5-20020a2e9085000000b002b5bc27d6ebmr586877ljg.8.1687608845818;
        Sat, 24 Jun 2023 05:14:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d19-20020a2e3313000000b002b1e6a78d3esm260246ljc.82.2023.06.24.05.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 05:14:05 -0700 (PDT)
Message-ID: <4db7ea27-4e87-b02b-aac8-9e1c1242dc59@linaro.org>
Date:   Sat, 24 Jun 2023 15:14:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
 <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
 <55d783d5-ef47-8c2e-d3ac-598e686e53fe@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <55d783d5-ef47-8c2e-d3ac-598e686e53fe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/06/2023 04:23, Jessica Zhang wrote:
> 
> 
> On 6/23/2023 5:09 PM, Abhinav Kumar wrote:
>>
>>
>> On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
>>> On 23/06/2023 02:48, Ryan McCann wrote:
>>>> Currently, the device core dump mechanism does not dump registers of 
>>>> sub
>>>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>>>> function to dump hardware blocks that contain sub blocks.
>>>>
>>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>>>> +++++++++++++++++++++++++++-----
>>>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index aa8499de1b9f..9b1b1c382269 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms 
>>>> *kms)
>>>>       return 0;
>>>>   }
>>>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>>>> *disp_state,
>>>> +                       void __iomem *mmio, void *blk,
>>>> +                       enum dpu_hw_blk_type blk_type)
>>>
>>> No. Such multiplexers add no value to the code. Please inline it.
>>>
>>> Not to mention that this patch is hard to review. You both move 
>>> existing code and add new features. If it were to go, it should have 
>>> been split into two patches: one introducing the multiplexer and 
>>> another one adding subblocks.
>>>
>>
>> Ok. we can split this into:
>>
>> 1) adding the multiplexer
>> 2) adding sub-blk parsing support inside the multiplexer
>>
>>>> +{
>>>> +    u32 base;
>>>> +
>>>> +    switch (blk_type) {
>>>> +    case DPU_HW_BLK_TOP:
>>>> +    {
>>>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>>>> +
>>>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>> +            msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>>> +                            mmio + top->base, "top");
>>>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>>>> MDP_PERIPH_TOP0_END,
>>>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>>>> +                            "top_2");
>>>> +        } else {
>>>> +            msm_disp_snapshot_add_block(disp_state, top->len, mmio 
>>>> + top->base, "top");
>>>> +        }
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_LM:
>>>> +    {
>>>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + 
>>>> mixer->base, "%s",
>>>> +                        mixer->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_CTL:
>>>> +    {
>>>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>>>> ctl->base, "%s",
>>>> +                        ctl->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_INTF:
>>>> +    {
>>>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio + 
>>>> intf->base, "%s",
>>>> +                        intf->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_WB:
>>>> +    {
>>>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>>>> wb->base, "%s",
>>>> +                        wb->name);
>>>> +        break;
>>>> +    }
>>>> +    case DPU_HW_BLK_SSPP:
>>>> +    {
>>>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
>>>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>>>> +
>>>> +        base = sspp_block->base;
>>>> +
>>>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, 
>>>> mmio + base, "%s",
>>>> +                        sspp_block->name);
>>>> +
>>>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>>> +            msm_disp_snapshot_add_block(disp_state, 
>>>> sblk->scaler_blk.len,
>>>> +                            mmio + base + sblk->scaler_blk.base, 
>>>> "%s_%s",
>>>> +                            sspp_block->name, sblk->scaler_blk.name);
>>>
>>> Actually, it would be better to:
>>> - drop name from all sblk instances (and use known string instead of 
>>> the sblk name here)
> 
> Hey Dmitry,
> 
> FWIW, I second Abhinav's points about the sblk names. For example, if in 
> the future we want to add a "_rot" suffix specifically to the 
> VIG_SBLK_ROT.scaler name, it would be easier to just make that change in 
> the HW catalog.

But why? The scaler is the same qseed3 scaler. We do not dump features, 
they are constant for the platform in question.

> 
>>> - Use sblk->foo_blk.len to check if it should be printed or not.
>  From my understanding, your suggestion is to replace the feature flag 
> checks with a sblk.len > 0 check.
> 
> I don't think that would be good because it wouldn't be correct to 
> assume that the sblk will always be present. For example, for 
> DPU_HW_BLK_DSC, the sblks will only be present for DSC_BLK_1_2.

I don't consider sub-block as being always present. But if it present, 
it has non-zero length. If its length is zero, we have nothing to dump 
for it.

> In addition, it is possible for sblks, like pp_sblk_te.te2, to have a 
> len of 0. While the register space of that specific sblk will not be 
> printed, I'd prefer the devcore dump to reflect what is present within 
> the HW catalog so that the user knows which pingpong blks have the TE2 
> sblk.

I'd consider this as dumping the feature instead of dumping the 
registers. If you think it is necessary to ease decoding of the dump, 
consider adding block.features to the dump instead.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>>
>>
>> No, I dont agree. If we drop the names from the sub_blk in the 
>> catalog, we will end up using "sub_blk_name" string here in the code 
>> to indicate which blk that is in the dump.
>>
>> If we add more sub_blks in the catalog in the future we need to keep 
>> changing the code over here. Thats not how it should be.
>>
>> Leaving the names in the catalog ensures that this code wont change 
>> and only catalog changes when we add a new sub_blk either for an 
>> existing or new chipset.
>>
>> catalog is indicating the new blk, and dumping code just prints it.
>>
>> with your approach, dumping code will or can keep changing with 
>> chipsets or sub_blks. Thats not how it should be.
>>

-- 
With best wishes
Dmitry

