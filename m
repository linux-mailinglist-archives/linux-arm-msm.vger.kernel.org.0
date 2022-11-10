Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188EB624C46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 21:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiKJU7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 15:59:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiKJU7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 15:59:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B6B27FD1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:59:46 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p8so5377200lfu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPzwJ0PuXiUbKvsrJ06WJ6xmWxUxN1THnWmmp4034WE=;
        b=yG6nHVpQuzzFVz6yvEV3w/69bkIvo52BB/na+saBklbvjhNtuO02r0GyEbN8D7bcow
         d06VDwPpbFl6HKu8NCmP0CUrTa8L+iRRoqMNX9qfhXkjhjGATLNssvzfBz1XPmIBIWeV
         zVcHWF09XhIyhJiAwVQnMOYqoOiTyezHDTcXnhel+Puho2O18q7xa+bXnuisG4bCDMH3
         8/v5aBGeDzSgFJMjL7Qz7Ytm9Qt7ACZQArGZVOT/HcX5Mcn+DpuNAzYhoda4uBYoOBUo
         cSbPi4brWxNlDIlUHHn05srt6A3VJgdQwDRqx3B+Dm8NdSJJMNotXKWnGZvUX+k9ixYb
         uPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NPzwJ0PuXiUbKvsrJ06WJ6xmWxUxN1THnWmmp4034WE=;
        b=AwCvfaZ2AqsqC1FsCYgQKXGqNAXYnvGEWfHGNqaK/kz9ZifftcgnANfd0EQB5R00EV
         h0+z+NQun67pnXI5WbbmwAS+HTmAaYZWJfuCgY1LYfZg27jAJ+SPax8WE1bZQ6zw2FZe
         Upa7hV633Mlj61bxBhdxdM1A6jSieDA/7eGJu3+hyXZ2IhmwvihjnJ1VxUATHBULNsJR
         LFCaT90c30/Cg4ldCu/SrADXZJq3pJj6pyRTKsojBBneEDyIxiXRHdNQ1xXdlapbyfo1
         RWWkqMeDAjObbGf4S1J3qdw6zIW06DcWyUjZECsdDdlPqaMPoNba1U1evXd2TZXISKZW
         L/Xw==
X-Gm-Message-State: ACrzQf3J9TFjYDQ5PPcHJLgywLsZZ4dX03mqXrAqEKqzSNpMAvUnypUU
        G7bgvL9xuRdgoCNWtoFsdkdZ2A==
X-Google-Smtp-Source: AMsMyM6cudTLCzjmTVK3yyobzbr2fXsgVAgsu+g4SGinMovjzgJLyG7TkECfmdT/3hOD83nxJvWqNQ==
X-Received: by 2002:a05:6512:782:b0:4a2:70de:3546 with SMTP id x2-20020a056512078200b004a270de3546mr1752602lfr.420.1668113984700;
        Thu, 10 Nov 2022 12:59:44 -0800 (PST)
Received: from [192.168.1.112] (95.49.32.193.neoplus.adsl.tpnet.pl. [95.49.32.193])
        by smtp.gmail.com with ESMTPSA id o14-20020ac24e8e000000b004a93b8508edsm19683lfr.181.2022.11.10.12.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 12:59:44 -0800 (PST)
Message-ID: <5af3bed1-aa2e-3dc7-08f1-eeb39f03903a@linaro.org>
Date:   Thu, 10 Nov 2022 21:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: add support for SM8450
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-8-dmitry.baryshkov@linaro.org>
 <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
 <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2022 21:28, Dmitry Baryshkov wrote:
> On 04/11/2022 17:12, Konrad Dybcio wrote:
>>
>> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>>> Add definitions for the display hardware used on Qualcomm SM8450
>>> platform.
>>>
>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>
>>
>> Konrad
>>
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>>   4 files changed, 229 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 1ce237e18506..3934d8976833 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -124,6 +124,15 @@
>>>                 BIT(MDP_AD4_0_INTR) | \
>>>                 BIT(MDP_AD4_1_INTR))
>>> +#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +             BIT(MDP_INTF0_7xxx_INTR) | \
>>> +             BIT(MDP_INTF1_7xxx_INTR) | \
>>> +             BIT(MDP_INTF2_7xxx_INTR) | \
>>> +             BIT(MDP_INTF3_7xxx_INTR) | \
>>> +             0)
>>> +
>>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>>                BIT(DPU_WB_UBWC) | \
>>>                BIT(DPU_WB_YUV_CONFIG) | \
>>> @@ -367,6 +376,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>   };
>>> +static const struct dpu_caps sm8450_dpu_caps = {
>>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>> +    .max_mixer_blendstages = 0xb,
>>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>> +    .ubwc_version = DPU_HW_UBWC_VER_40,
>>> +    .has_src_split = true,
>>> +    .has_dim_layer = true,
>>> +    .has_idle_pc = true,
>>> +    .has_3d_merge = true,
>>> +    .max_linewidth = 5120,
>>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +};
>>> +
>>>   static const struct dpu_caps sc7280_dpu_caps = {
>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>       .max_mixer_blendstages = 0x7,
>>> @@ -504,6 +527,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>>       },
>>>   };
>>> +static const struct dpu_mdp_cfg sm8450_mdp[] = {
>>> +    {
>>> +    .name = "top_0", .id = MDP_TOP,
>>> +    .base = 0x0, .len = 0x494,
>>> +    .features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>>> +    .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>>
>> I think it's about time we handle the two-memory-configs situation..
>>
>> In my opinion, a dt property would be sane (just like downstream does 
>> it), as it's
>>
>> *really really really* unlikely that the same SKU would be shipped 
>> with 2 different memory gens.
> 
> As it's really unlikely, I think we can drop the TODO comment completely 
> until we phase a device with different memory type. WDYT?
It's really unlikely that the same device model (for example Xperia 1 
III) is shipped in 2 memory configurations that would have to be 
discerned dynamically somehow.

It is however very likely that, for example Xiaomi releases a 888 phone 
with LPDDR4X and Sony releases one with LPDDR5. So it's a per-device 
thing, not exactly per-SoC.

Konrad
> 
