Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8862073CAAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 14:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjFXMH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 08:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjFXMH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 08:07:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FE62112
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 05:07:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b46cfde592so24779011fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687608474; x=1690200474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhB7gO41s6RkTIX9B+mUm/3DyCsWmE8KY3H2vl6K7Yo=;
        b=czAJe/3Oa1kuRQTtvewFIdfyYHou1G0kNyuYoDxXVlQvBJToB68u6OsyOa56X4iM+a
         RnmzaxB/Iv/SW5+U62RETn1N5FArQT8y2ia13WQCblIgbej/Hfh3vVX0qD7RxA6aduJr
         W/TMuSXeS6eEXhw48mXZVnzO5elr0JGjUljWt/BU1o4VigIZ2iTS3Os3jVGClWBSKlcy
         7hSo3uym7nkpJm2IZMp6h1OyFJuUFR3VeqwF3b49D8KSTVT8upjIw03u+Cv+Cu78xNQk
         crpqmMK/TAf5q4/S5W4FtP1fVxp6BlqgvXvNcNHiFWkY+gleHzFbkCJQVAc/MVOB99s7
         xh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687608474; x=1690200474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhB7gO41s6RkTIX9B+mUm/3DyCsWmE8KY3H2vl6K7Yo=;
        b=HKmdI0m3fqkHGAHe+yhLJcf37srBtQ1V7hjAmnRcxFenzXasiIvS+6CCDZtB0bIgSQ
         ypQ26jq98b0oyO4GQ5iOL+A3aCkQsOLaJ7U6mgJqh54nMWaFoxlJOQjuB6aHXR5JTo9n
         J9XOR71RkV9Q2YVmTWXMq3kmjsNgf4KUkvdwGIulnllSmqN2/aSkOkxpj2mkl12HC1JS
         gQi360Lval7ZrI6eMl2TuUUVhZ/ZWQ88izIYaWtOYNjiMnoIv1lG0451s/rVG4V2WwKT
         0spKv48umsia2has6H3vuNd+Xr5b1k+6PuBU+2zkapVAXB39mz0nfm5cvau3JO6Zjiu4
         j29w==
X-Gm-Message-State: AC+VfDzd2W1bcaoe17/xG2We1gB4q1Ew7D5W/SmzVhBLZl4k4mSbFKzy
        UUgxJ3YXTWFckmM0qvG+tFsaow==
X-Google-Smtp-Source: ACHHUZ5EUcWz4Bkd9KV9wW+T+pNBBh8PesWiqS6TbSRjDaH5t3TeGZPvWwypTx9M7lxdoDj1lX0zqw==
X-Received: by 2002:a2e:95d5:0:b0:2b4:852d:8747 with SMTP id y21-20020a2e95d5000000b002b4852d8747mr10406353ljh.30.1687608473517;
        Sat, 24 Jun 2023 05:07:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g7-20020a2e9e47000000b002b1b92910c8sm258409ljk.86.2023.06.24.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 05:07:52 -0700 (PDT)
Message-ID: <412f68a3-e3cc-f26e-2e3d-59727e5c48d8@linaro.org>
Date:   Sat, 24 Jun 2023 15:07:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
 <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
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

On 24/06/2023 03:09, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
>> On 23/06/2023 02:48, Ryan McCann wrote:
>>> Currently, the device core dump mechanism does not dump registers of sub
>>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>>> function to dump hardware blocks that contain sub blocks.
>>>
>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>>> +++++++++++++++++++++++++++-----
>>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index aa8499de1b9f..9b1b1c382269 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms 
>>> *kms)
>>>       return 0;
>>>   }
>>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>>> *disp_state,
>>> +                       void __iomem *mmio, void *blk,
>>> +                       enum dpu_hw_blk_type blk_type)
>>
>> No. Such multiplexers add no value to the code. Please inline it.
>>
>> Not to mention that this patch is hard to review. You both move 
>> existing code and add new features. If it were to go, it should have 
>> been split into two patches: one introducing the multiplexer and 
>> another one adding subblocks.
>>
> 
> Ok. we can split this into:
> 
> 1) adding the multiplexer
> 2) adding sub-blk parsing support inside the multiplexer

I'd say, drop the multiplexer completely. It adds no value here. It is 
only used from dpu_kms_mdp_snapshot(). If the code there was complex 
enough, it would have made sense to _split_ the function. But even in 
such case there would be no point in having multiplexer. We do not 
enumerate block by type.

> 
>>> +{
>>> +    u32 base;
>>> +
>>> +    switch (blk_type) {
>>> +    case DPU_HW_BLK_TOP:
>>> +    {
>>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>>> +
>>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>> +            msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>> +                            mmio + top->base, "top");
>>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>>> MDP_PERIPH_TOP0_END,
>>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>>> +                            "top_2");
>>> +        } else {
>>> +            msm_disp_snapshot_add_block(disp_state, top->len, mmio + 
>>> top->base, "top");
>>> +        }
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_LM:
>>> +    {
>>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + 
>>> mixer->base, "%s",
>>> +                        mixer->name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_CTL:
>>> +    {
>>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>>> ctl->base, "%s",
>>> +                        ctl->name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_INTF:
>>> +    {
>>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio + 
>>> intf->base, "%s",
>>> +                        intf->name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_WB:
>>> +    {
>>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>>> wb->base, "%s",
>>> +                        wb->name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_SSPP:
>>> +    {
>>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
>>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>>> +
>>> +        base = sspp_block->base;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, 
>>> mmio + base, "%s",
>>> +                        sspp_block->name);
>>> +
>>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>> +            msm_disp_snapshot_add_block(disp_state, 
>>> sblk->scaler_blk.len,
>>> +                            mmio + base + sblk->scaler_blk.base, 
>>> "%s_%s",
>>> +                            sspp_block->name, sblk->scaler_blk.name);
>>
>> Actually, it would be better to:
>> - drop name from all sblk instances (and use known string instead of 
>> the sblk name here)
>> - Use sblk->foo_blk.len to check if it should be printed or not.
>>
> 
> No, I dont agree. If we drop the names from the sub_blk in the catalog, 
> we will end up using "sub_blk_name" string here in the code to indicate 
> which blk that is in the dump.
> 
> If we add more sub_blks in the catalog in the future we need to keep 
> changing the code over here. Thats not how it should be.
> 
> Leaving the names in the catalog ensures that this code wont change and 
> only catalog changes when we add a new sub_blk either for an existing or 
> new chipset.
> 
> catalog is indicating the new blk, and dumping code just prints it.
> 
> with your approach, dumping code will or can keep changing with chipsets 
> or sub_blks. Thats not how it should be.

Well, we do not enumerate sub-blocks in any way, they are not indexed. 
So even with sblk->blk.name in place, adding new sub-block would require 
adding new code here. That's why I wrote that the calling code knows 
which sub-block it refers to.

Let me extract the relevant code (skipping all the conditions for now):

msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio + base, "%s",
			    sspp_block->name);

if (have_scaler)
	msm_disp_snapshot_add_block(disp_state, sblk->scaler_blk.len,
				    mmio + base + sblk->scaler_blk.base, "%s_%s",
				    sspp_block->name, sblk->scaler_blk.name);

if (have_csc)
	msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
				    mmio + base + sblk->csc_blk.base, "%s_%s",
				    sspp_block->name, sblk->csc_blk.name);

Consider adding new sub-block, "baz". We would still require manual 
addition of the following code:

	msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
				    mmio + base + sblk->baz_blk.base, "%s_%s",
				    sspp_block->name, sblk->baz_blk.name);


Compare this with:

	msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
				    mmio + base + sblk->baz_blk.base, "%s_baz",
				    sspp_block->name);

Moreover, if we follow the style of dpu_kms_mdp_snapshot() (which 
doesn't use name), it should be:

	msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
				    mmio + base + sblk->baz_blk.base, "sspp%d_baz", idx);



> 
>>> +
>>> +        if (sspp_block->features & BIT(DPU_SSPP_CSC) || 
>>> sspp_block->features
>>> +                    & BIT(DPU_SSPP_CSC_10BIT))
>>
>> A very bad use of indentation. In future please split logically rather 
>> than just filling the line up to the line width.
>>
>>> +            msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
>>> +                            mmio + base + sblk->csc_blk.base, "%s_%s",
>>> +                            sspp_block->name, sblk->csc_blk.name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_DSPP:
>>> +    {
>>> +        struct dpu_dspp_cfg *dspp_block = (struct dpu_dspp_cfg *)blk;
>>> +
>>> +        base = dspp_block->base;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, dspp_block->len, 
>>> mmio + base, "%s",
>>> +                        dspp_block->name);
>>> +
>>> +        if (dspp_block->features & BIT(DPU_DSPP_PCC))
>>> +            msm_disp_snapshot_add_block(disp_state, 
>>> dspp_block->sblk->pcc.len,
>>> +                            mmio + base + dspp_block->sblk->pcc.base,
>>> +                            "%s_%s", dspp_block->name,
>>> +                            dspp_block->sblk->pcc.name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_PINGPONG:
>>> +    {
>>> +        struct dpu_pingpong_cfg *pingpong_block = (struct 
>>> dpu_pingpong_cfg *)blk;
>>> +        const struct dpu_pingpong_sub_blks *sblk = 
>>> pingpong_block->sblk;
>>> +
>>> +        base = pingpong_block->base;
>>> +
>>> +        msm_disp_snapshot_add_block(disp_state, pingpong_block->len, 
>>> mmio + base, "%s",
>>> +                        pingpong_block->name);
>>> +
>>> +        if (pingpong_block->features & BIT(DPU_PINGPONG_TE2))
>>> +            msm_disp_snapshot_add_block(disp_state, sblk->te2.len,
>>> +                            mmio + base + sblk->te2.base, "%s_%s",
>>> +                            pingpong_block->name, sblk->te2.name);
>>> +
>>> +        if (pingpong_block->features & BIT(DPU_PINGPONG_DITHER))
>>> +            msm_disp_snapshot_add_block(disp_state, sblk->dither.len,
>>> +                            mmio + base + sblk->dither.base, "%s_%s",
>>> +                            pingpong_block->name, sblk->dither.name);
>>> +        break;
>>> +    }
>>> +    case DPU_HW_BLK_DSC:
>>> +    {
>>> +        struct dpu_dsc_cfg *dsc_block = (struct dpu_dsc_cfg *)blk;
>>> +
>>> +        base = dsc_block->base;
>>> +
>>> +        if (dsc_block->features & BIT(DPU_DSC_HW_REV_1_2)) {
>>> +            struct dpu_dsc_blk enc = dsc_block->sblk->enc;
>>> +            struct dpu_dsc_blk ctl = dsc_block->sblk->ctl;
>>> +
>>> +            /* For now, pass in a length of 0 because the DSC_BLK 
>>> register space
>>> +             * overlaps with the sblks' register space.
>>> +             *
>>> +             * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW 
>>> catalog where
>>> +             * applicable.
>>
>> Nice catch, thank you. We should fix that.
>>
> 
> Yes and we would have fixed that ourself if you wanted that with this 
> series as another patch.

This is not relevant to this series, so it should be fixed in a separate 
series.

-- 
With best wishes
Dmitry

