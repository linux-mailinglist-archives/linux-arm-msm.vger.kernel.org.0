Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC0B708A55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 23:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjERVVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 17:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjERVVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 17:21:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D3910D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:21:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af16426065so15231831fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684444895; x=1687036895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ne0CBuH0zjj78muqOd6R3pN+R3bEYTrlVu/BAC21qjA=;
        b=WzfcUPgFq7FTAqECnrUW6Q5fRuRqmlX5j/aRIuPzcQPBSfKL9PvUX/GRw/OPe6NxuN
         94HQc9B8HOg11ExiqHdkvGsXuQrIy79i+zlLGvTKYOe7wM9jhQYKOkJLn8olt731NmQ8
         YGhbyyjcG+2Ou4thxIw47e3PbkgUvasvFVJgCr9IFP+zSXm58o0CmdWGe1j6hl5BBtqS
         goYQCYIQ4MwrcBeHYIT27V2XewnM4WKnyh+4pLgWDDEUTJqJU8uUfHRt5HttjgusfiJq
         RGAFooZEdqIuiEx+DTAngirJn305x9C/GbKkgaSWgGkiSdGd5OeXBAWgTFcQpa86cP4f
         6rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684444895; x=1687036895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne0CBuH0zjj78muqOd6R3pN+R3bEYTrlVu/BAC21qjA=;
        b=NIZ/ppu5QyWD8jzklaRv6irhZqFy7J0gB42k4Zl5vZyx40PGs79Xu+apOGNOFV4gQF
         O8u/SisX16oDjuJ/u+qMOH/lUZnjh836GBt7j+HtsFq6S1wSAu3pkesAsZmWNNK+DD+7
         OzeaTOaDZHCqN4CRlvhuiCV0OuP9Quzbrj83OQLaKaQQZAzeO0JeHLzOUjpPhr9tV7Qn
         L2TAH6ZlVsLQLuqWdnTTexZN3itlDzkK7z7PfJrCWjx2PHlsNzTzFZ5lNRWeZkyILszS
         2In/R2dun+oA+kyaSrw94mw9NgqWMVa9+16Pf8f6ll4m7xtTXepo6sJtg3UAZAo1TyRE
         d6Ew==
X-Gm-Message-State: AC+VfDz5pvaseBsZwpqhGvNzlbRA5mi/MpgJ1MCYYPoYVOwprGPVzzWx
        bHECYehtOjOzgZ23kZ5dsS01dg==
X-Google-Smtp-Source: ACHHUZ6Gq3N2jwWufqKr6XW8Ud3J/F+FMeFoKmfTEbkhG6Xvwj7EVVx3QO9vEu9OgyzWj5dD47g47g==
X-Received: by 2002:a2e:80c4:0:b0:2af:c2b:40c1 with SMTP id r4-20020a2e80c4000000b002af0c2b40c1mr2751706ljg.3.1684444895438;
        Thu, 18 May 2023 14:21:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b004f00189e1dasm369214lfg.143.2023.05.18.14.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 14:21:34 -0700 (PDT)
Message-ID: <a11fd14a-995c-4f79-5754-a22b77995ba9@linaro.org>
Date:   Fri, 19 May 2023 00:21:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <fd2f43eb-aa10-eaf4-62f8-945a3152a28a@linaro.org>
 <4da9bd19-9403-812e-4554-847b18df78c9@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4da9bd19-9403-812e-4554-847b18df78c9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 02:05, Konrad Dybcio wrote:
> 
> 
> On 21.04.2023 00:41, Dmitry Baryshkov wrote:
>> On 21/04/2023 01:31, Konrad Dybcio wrote:
>>> Add SM6350 support to the DPU1 driver to enable display output.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> [...]
> 
>>> +
>>> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>>> +         sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>> +         sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>>> +         sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>>
>> DPU_CLK_CTRL_DMA0
>>
>>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>>> +         sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>>
>> DPU_CLK_CTRL_DMA2
> _DMA1?
> 
> 
>>
>>
>>> +};
>>> +
> 
>>> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>>> +    {.fl = 0, .lut = 0x0011223344556677 },
>>> +    {.fl = 0, .lut = 0x0011223445566777 },
>>
>> Do we need two equal entries here?
> Hmm.. looks like the SDE driver dropped the fill level
> logic in 4.19 times and that might have thrown me off
> when porting this Since the [0] entry has what looks
> like a lower LUT value, should I give it .fl=1?
> 
> 
>>
>> Also please push the qos to the dpu_hw_catalog.c, I want to take another look at these structures and it is easier if all of them are beneath one's eyes.
> Will do.
> 
>>
>>> +};
>>> +
>>> +static const struct dpu_perf_cfg sm6350_perf_data = {
>>> +    .max_bw_low = 4200000,
>>> +    .max_bw_high = 5100000,
>>> +    .min_core_ib = 2500000,
>>> +    .min_llcc_ib = 0,
>>> +    .min_dram_ib = 1600000,
>>> +    .min_prefill_lines = 35,
>>> +    /* TODO: confirm danger_lut_tbl */
>>> +    .danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> [...]
> 
> 
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -320,6 +320,8 @@ enum dpu_qos_lut_usage {
>>>        DPU_QOS_LUT_USAGE_LINEAR,
>>>        DPU_QOS_LUT_USAGE_MACROTILE,
>>>        DPU_QOS_LUT_USAGE_NRT,
>>> +    DPU_QOS_LUT_USAGE_CWB,
>>> +    DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>>
>> This should probably be removed. It would be nice to clean these things up, but not as a part of sm6350.
> Well, I won't be able to fill in the danger LUT table otherwise!

danger/safe LUT tables have two entries for portrait/landscape (which we 
do not support). Please choose either of them for now.

These two entries should be dropped for now (it was known for some time 
that MACROTILE_QSEED != MACROTILE. And CWB is not supported yet).

> 
> Konrad
>>
>>>        DPU_QOS_LUT_USAGE_MAX,
>>>    };
>>>    @@ -880,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>>> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>>    extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 0e7a68714e9e..46be7ad8d615 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>>        { .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>>>        { .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>>        { .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>>> +    { .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>>        { .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>>        { .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>>        { .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>>
>>

-- 
With best wishes
Dmitry

