Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 417C36F82AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 14:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjEEMLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 08:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjEEMLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 08:11:49 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028081A10C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 05:11:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4eff50911bfso1900670e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683288706; x=1685880706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2h/CWEwyJq3P5FCMXAryqXO9WR4aBfMB6PjoKhzl8U4=;
        b=Zbu8EzgqpkD96pt/0mSDWzGiFSmWODcuaUmVyreABq7m1znvVzYxy3l3faRkivY2vY
         oLDI2Z5XuRhTnKbuFBXLPc79Hw/MPZxeUXAQnNwDtXe14aQjma+HI0G1sbW7eDeTzzEv
         ET9OzwJbVh4F0fVY55KUrnh73Q4nFx6eiftAoxcso4H8tEn0IhBMqdm5mBrn4c6XKXWU
         aYEgXzNvaiCEIbvMqEm/CYVmSXbLBHRsfCj5feqRL4dfICy7bloK6AgaXukl9ki6l80Z
         qywFsTyxuplXRXKuaqUoh1JXnQdVgz6mEfvzQ40jCwV+5MiGVQDFUocZaHQ7RJY3r3C4
         dEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683288706; x=1685880706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2h/CWEwyJq3P5FCMXAryqXO9WR4aBfMB6PjoKhzl8U4=;
        b=bT7Qih0E+Nr3NL+Eumu2HRYaeXcwfUbJdwGvnC8pJYLML/si2rGlpqp87kRX2CZOdu
         JVyuEDdkdOw9Cmee+mMf/vdJ2hijaIE1fYCuD/4MGyo/WkdznMDVCCOWwF43Utw9p6BM
         Sgjt2zR95mFsvnWHvtWWNSUFh38487oQ1Xn6oRl2vPkcolXiqQE7KSHkE96QkmvSg9d0
         Yz5LK6vFHVxR9NQrfqTnR9QuuGlq1GrUGS43wq73u/NjKcg0Ab84Aol5zAreqCkELOM4
         CXpaucdhB55+U1d4gSehZsoZ5ayXnERwX1HTIpqLbXYMZKJAwZPiuwN23+vIHGuAhV73
         1ytw==
X-Gm-Message-State: AC+VfDzi/Ope+Mk4qeZFhuYJANY8RMBsgRppv2iTymDSBEf4yij5TqvP
        ShoM45i59GEOOOE+L3qxFUAI7g==
X-Google-Smtp-Source: ACHHUZ65oVZBAu9sTHfvlhswi1d1wC5/971YPvE+M2PAFaQfj7qir5wd68R9OeFyzxYBUMg/1QjD6w==
X-Received: by 2002:ac2:5108:0:b0:4f1:1de7:1aab with SMTP id q8-20020ac25108000000b004f11de71aabmr554324lfb.44.1683288706252;
        Fri, 05 May 2023 05:11:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b21-20020ac25635000000b004f13633c260sm264975lff.145.2023.05.05.05.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:11:45 -0700 (PDT)
Message-ID: <91a390b2-db3d-90f4-a2e2-6ccb75303d04@linaro.org>
Date:   Fri, 5 May 2023 15:11:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2023 18:37, Marijn Suijten wrote:
> On 2023-04-21 00:31:16, Konrad Dybcio wrote:
>> Add SM6350 support to the DPU1 driver to enable display output.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> After addressing the comments from Dmitry (CURSOR0->DMA1 and
> CURSOR1->DMA2), this is:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> See below for some nits.

[...]

>> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
>> +	{
>> +	.name = "top_0", .id = MDP_TOP,
>> +	.base = 0x0, .len = 0x494,
>> +	.features = 0,
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
>> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>> +	},
>> +};
>> +
>> +static const struct dpu_ctl_cfg sm6350_ctl[] = {
>> +	{
>> +	.name = "ctl_0", .id = CTL_0,
>> +	.base = 0x1000, .len = 0x1dc,
>> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +	},
>> +	{
>> +	.name = "ctl_1", .id = CTL_1,
>> +	.base = 0x1200, .len = 0x1dc,
>> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +	},
>> +	{
>> +	.name = "ctl_2", .id = CTL_2,
>> +	.base = 0x1400, .len = 0x1dc,
>> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +	},
>> +	{
>> +	.name = "ctl_3", .id = CTL_3,
>> +	.base = 0x1600, .len = 0x1dc,
>> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +	},
>> +};
>> +
>> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
>> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>> +		 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>> +};
>> +
>> +static const struct dpu_lm_cfg sm6350_lm[] = {
>> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> 
> These two entries are indented with two tabs and have one character too
> many to align with the opening parenthesis on the previous line.  Can we
> please settle on a single style, as this commit mostly uses tabs+spaces
> to align with the opening parenthesis?
> 
> Dmitry vouched for `cino=(0` (when in unclosed parenthesis, align next
> line with zero extra characters to the opening parenthesis), but I find
> double tabs more convenient as it doesn't require reindenting when
> changing the name of the macro (which happened too often in my INTF TE
> series).

I mainly vote for 'cino=(0' for indenting conditions (where double tab 
is confusing) and for function calls. I do not have a strong opinion 
about macros expansions. We have been using double-tab there, which is 
fine with me.

Another option (which I personally find more appealing, but it doesn't 
play well with the current guidelines) is to have all macro arguments in 
a single line. It makes it easier to compare things.

And another option would be to expand these macros up to some point. 
Previous experience with clock and interconnect drivers showed that 
expanding such multi-arg acros makes it _easier_ to handle the data. 
Counterintuitive, but true.

> 
>> +};
>> +
>> +static const struct dpu_dspp_cfg sm6350_dspp[] = {
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +		 &sm8150_dspp_sblk),
>> +};
>> +
>> +static struct dpu_pingpong_cfg sm6350_pp[] = {
>> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +	       -1),
>> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +	       -1),

[skipped the rest]

-- 
With best wishes
Dmitry

