Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E9B6E8717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 03:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjDTBBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 21:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjDTBBf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 21:01:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BC44205
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:01:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l15so974783ljq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681952491; x=1684544491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRGH+8eyVHtAfLSjlnOB+uRyITWQT7h2HZdn2ZTq1sE=;
        b=DVAW4gKtUAioMK7djun6d0Fqnr9P7c5VZwzdA/SLJnqoCs/yt91jDTbqVSBjR+sd1h
         Z3WTU6bbh+qYd5hAxSg6x3QKfho/7xKTS45VwPFbpBUXbnAaxRJmOFL2G8DD5TTyTpu5
         4ogVlQ/iHBSL75Rk7MED/bauOaitW36rG+99E+EGCtd+BPnJ5fg/4/3rdeL+5lDncof4
         6JZQvTi8y4HN4mpbPw7ivlApaY2hTt4bjBOmXflO1YD+mAnCC+UfUPHa1R0aMQvyNfb5
         xVFACDKctwuVVDKqqpOqbezx3Y0bWQqhQ8Ow5tlRLmqo6Uhx40k3Is0E5vAgLBK3hQdH
         H/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681952491; x=1684544491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRGH+8eyVHtAfLSjlnOB+uRyITWQT7h2HZdn2ZTq1sE=;
        b=DpDaGY8pIz0etGguuSrCwekrosrFdzBGoQemOCvkJ2F57NkIbzjzwzoVYnHEnHYze4
         cjZlr0wGFJeWc/Ppin9CZoaE0o09muxWTsNCVKmzeU3C2e/muVHMp4+imY08T3b/uBFy
         5gWDZ1Qm7bnqX0q2arHrzXzBuKtkpY+10vC+QDiN2+gXLIslE+zoYB85uLUio0oDzp5+
         TfL9IhRlowS72m/qlR/BItvdUi+Gx61CHmod1A7FA+2pjLevdkh3Jj12YPUylX84tELQ
         jST+pQUrQyyzR5D71t0kugi1gBOMI2+v4o90hu6DNGdVezhGS+wGNccA+oTAZmoNSO4F
         +Efg==
X-Gm-Message-State: AAQBX9eAVbwUsNplFbREAlvjzrp6ecxNfR5+n3B2zRnjobDfirNNK+05
        HZP3qkri3qQcXeFEHaMNw9xYEA==
X-Google-Smtp-Source: AKy350b4ZIYvoX/GzBFpB3GWq1yrTpODDsgLPqAf70A2TCHCk1K973R6cbL32vy9F0UzQK998pyTnQ==
X-Received: by 2002:a2e:9a82:0:b0:2a7:75ae:3e63 with SMTP id p2-20020a2e9a82000000b002a775ae3e63mr2375020lji.27.1681952491472;
        Wed, 19 Apr 2023 18:01:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id w21-20020a2e8215000000b002a9f1b23604sm24066ljg.93.2023.04.19.18.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 18:01:31 -0700 (PDT)
Message-ID: <38030486-f08a-33e6-f8d1-3f4de379a75b@linaro.org>
Date:   Thu, 20 Apr 2023 03:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 11/17] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-11-ef76c877eb97@somainline.org>
 <20fab838-e05b-163d-aa72-bd8235df9f2c@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20fab838-e05b-163d-aa72-bd8235df9f2c@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 20.04.2023 03:00, Dmitry Baryshkov wrote:
> On 17/04/2023 23:21, Marijn Suijten wrote:
>> Since hardware revision 5.0.0 the TE configuration moved out of the
>> PINGPONG block into the INTF block, including vsync source selection
>> that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
>> register has no effect anymore and is omitted downstream via the
>> DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
>> blocks used by hardware prior to 5.0.0.
>>
>> The code that writes to these registers in the INTF block will follow in
>> subsequent patches.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  2 +-
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         | 52 +++++++++++++++-------
>>   4 files changed, 41 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index b7845591c384..6906f8046b9e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -30,7 +30,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>>       {
>>       .name = "top_0", .id = MDP_TOP,
>>       .base = 0x0, .len = 0x458,
>> -    .features = 0,
>> +    .features = BIT(DPU_MDP_VSYNC_SEL),
>>       .clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>>       .clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
>>       .clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index 5b9b3b99f1b5..14ce397800d5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -30,7 +30,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>>       {
>>       .name = "top_0", .id = MDP_TOP,
>>       .base = 0x0, .len = 0x45c,
>> -    .features = BIT(DPU_MDP_AUDIO_SELECT),
>> +    .features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
>>       .clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>>       .clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
>>       .clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 71584cd56fd7..599e177b89dd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -48,6 +48,8 @@ enum {
>>    * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
>>    * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
>>    *               in a failure
>> + * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
>> + *                         (moved into INTF block since DPU 5.0.0)
>>    * @DPU_MDP_MAX            Maximum value
>>      */
>> @@ -59,6 +61,7 @@ enum {
>>       DPU_MDP_UBWC_1_5,
>>       DPU_MDP_AUDIO_SELECT,
>>       DPU_MDP_PERIPH_0_REMOVED,
>> +    DPU_MDP_VSYNC_SEL,
>>       DPU_MDP_MAX
>>   };
>>   diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> index 2bb02e17ee52..9ea15a647a66 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> @@ -126,28 +126,16 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
>>       status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
>>   }
>>   -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>> +static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
>>           struct dpu_vsync_source_cfg *cfg)
> 
> In my opinion _v1 is not really descriptive here. Could you please rename it to dpu_hw_setup_vsync_source_no_vsync_sel() ?
v1 refers to the CTL rev 100 a.k.a 1.0.0 a.k.a 1, but that's not
yet very well formulated upstream.. if we even need it..

Konrad
> 
> Or maybe rename dpu_hw_setup_vsync_source() to dpu_hw_setup_vsync_source_vsync_sel() and drop _v1 from this function.
> 
> Up to you.
> 
> 
>>   {
>>       struct dpu_hw_blk_reg_map *c;
>> -    u32 reg, wd_load_value, wd_ctl, wd_ctl2, i;
>> -    static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
>> +    u32 reg, wd_load_value, wd_ctl, wd_ctl2;
>>   -    if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
>> +    if (!mdp || !cfg)
>>           return;
>>         c = &mdp->hw;
>> -    reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
>> -    for (i = 0; i < cfg->pp_count; i++) {
>> -        int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
>> -
>> -        if (pp_idx >= ARRAY_SIZE(pp_offset))
>> -            continue;
>> -
>> -        reg &= ~(0xf << pp_offset[pp_idx]);
>> -        reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
>> -    }
>> -    DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>>         if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
>>               cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_0) {
>> @@ -194,6 +182,33 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>>       }
>>   }
>>   +static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>> +        struct dpu_vsync_source_cfg *cfg)
>> +{
>> +    struct dpu_hw_blk_reg_map *c;
>> +    u32 reg, i;
>> +    static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
>> +
>> +    if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
>> +        return;
>> +
>> +    c = &mdp->hw;
>> +
>> +    reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
>> +    for (i = 0; i < cfg->pp_count; i++) {
>> +        int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
>> +
>> +        if (pp_idx >= ARRAY_SIZE(pp_offset))
>> +            continue;
>> +
>> +        reg &= ~(0xf << pp_offset[pp_idx]);
>> +        reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
>> +    }
>> +    DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>> +
>> +    dpu_hw_setup_vsync_source_v1(mdp, cfg);
>> +}
>> +
>>   static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
>>           struct dpu_danger_safe_status *status)
>>   {
>> @@ -241,7 +256,12 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>       ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>       ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>       ops->get_danger_status = dpu_hw_get_danger_status;
>> -    ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>> +
>> +    if (cap & BIT(DPU_MDP_VSYNC_SEL))
>> +        ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>> +    else
>> +        ops->setup_vsync_source = dpu_hw_setup_vsync_source_v1;
>> +
>>       ops->get_safe_status = dpu_hw_get_safe_status;
>>         if (cap & BIT(DPU_MDP_AUDIO_SELECT))
>>
> 
