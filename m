Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BA46943AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 12:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjBMLCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 06:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBMLCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 06:02:01 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBC96A71
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:01:58 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id bt8so6493954edb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHN5WcoxHFnGJr8cG9Owuk27d8b5pn7V11rRjtLrZng=;
        b=ycqFS0+ec+MYpXYTRTOJNrahnzxg9JWCkR9gmB634gclKGjofkebJlWDiDcoJ+OUtt
         OP/Rob+anyxb8FvQ1PnAtDWrbohbyGuMi0wGkldVWLu7VYTvW1v6ILUyZLtWFPHi7ZG+
         IpVaiGr65yObOxQNdbBP9NDJuO6O8MWarLWXUjeTe6d4DtuL1nZZY/Ybp0MfEoLk75Kq
         J/HVK7795YwgdQsWclOteoQPpR3SDH+j4cvRNbQs3BfvUrr0FfIn8wbsMSMkd9ZjQP0V
         k8VZAxW3o75ZLuDPcJFW3YLZLRfchln4auzr54TMbbyImt8jaD2C/ZwEpfoJtKs0d6/k
         jiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHN5WcoxHFnGJr8cG9Owuk27d8b5pn7V11rRjtLrZng=;
        b=tZSFKJhnj8qy2EFY1PBfpkfjb3PFn4LdlgcrYIRzMjMI9QkFlKtXYH+5E88VO+y0gA
         y6tfVPGyJHBfTrt2ejVFO+9NUv3GNNR4Fhcrimz1kG64LjK8AUo1Et4nJ0vVe/t/v/BW
         vB8B/bSKhkIl2Z4CVmmgQ8H2vnah8W5OkhZICX9xe9y/W4hsQSWCBZ3YtWyZw9mEtX4U
         evvhzKlFPDl+BeIVN72Al2JbUaa4wFzJJpcZrg078oNt1t5ypqCIaIuOo0Qa6aImHjTP
         3qhB0B8q7YJCesonOtwgwWhzVfyd3LPpzgwpblFtvetAhQoTI8qTAzUF3JdNiMaymVR1
         1vlg==
X-Gm-Message-State: AO0yUKVTVwFOWKUn1aDDAKfk9aUrothMfhVlHSs0UADs3bqf1zY0QlTt
        IRJ5bzFBdI8EvOr/fFQRvg4x6A==
X-Google-Smtp-Source: AK7set+D08PwYIUr/bdAmWTN2+cB1hJfFnPvE4yJTuyQg6kgpNxsm9lDC1KJsZsE8bwri5aUOSGZpg==
X-Received: by 2002:a50:d0cc:0:b0:4ac:c9ea:17b4 with SMTP id g12-20020a50d0cc000000b004acc9ea17b4mr1682429edf.41.1676286116498;
        Mon, 13 Feb 2023 03:01:56 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id u28-20020a50c05c000000b004acbe5409b4sm2632278edd.48.2023.02.13.03.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:01:56 -0800 (PST)
Message-ID: <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
Date:   Mon, 13 Feb 2023 12:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/50] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> These blocks are of variable length on different SoCs. Set the
> correct values where I was able to retrieve it from downstream
> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
> intf) otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [DB: fixed some of lengths]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Oh you fixed it quicker than I could respond!

Still, I think the 8280 sspp size should not be
2x the norm..

Konrad
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 243 +++++++++---------
>  1 file changed, 122 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index e390be4ef10b..2d53ed92de85 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1164,11 +1164,11 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>  
> -#define SSPP_BLK(_name, _id, _base, _features, \
> +#define SSPP_BLK(_name, _id, _base, _len, _features, \
>  		_sblk, _xinid, _type, _clkctrl) \
>  	{ \
>  	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x1c8, \
> +	.base = _base, .len = _len, \
>  	.features = _features, \
>  	.sblk = &_sblk, \
>  	.xin_id = _xinid, \
> @@ -1177,40 +1177,40 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>  	}
>  
>  static const struct dpu_sspp_cfg msm8998_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_MSM8998_MASK,
>  		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_MSM8998_MASK,
>  		msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_MSM8998_MASK,
>  		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_MSM8998_MASK,
>  		msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_MSM8998_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
>  static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK,
>  		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK,
>  		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK,
>  		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK,
>  		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> @@ -1221,13 +1221,13 @@ static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>  			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
>  
>  static const struct dpu_sspp_cfg sc7180_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>  		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>  };
>  
> @@ -1235,9 +1235,9 @@ static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>  				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>  
>  static const struct dpu_sspp_cfg sm6115_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>  		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>  
> @@ -1251,21 +1251,21 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
>  static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>  		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
>  		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
>  		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
>  		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> @@ -1279,21 +1279,21 @@ static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
>  static const struct dpu_sspp_cfg sm8450_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
>  		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> @@ -1309,36 +1309,36 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>  
>  static const struct dpu_sspp_cfg sm8550_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
>  		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
>  		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
> -	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
>  		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>  };
>  
>  static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
>  		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>  };
>  
> @@ -1351,22 +1351,23 @@ static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
>  static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
> +/* FIXME: check block length */
>  static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
>  		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>  		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
>  		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
>  		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
>  		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> @@ -1387,9 +1388,9 @@ static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0"
>  static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>  
>  static const struct dpu_sspp_cfg qcm2290_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
>  		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>  		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>  
> @@ -1845,10 +1846,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>  	{\
>  	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x280, \
> +	.base = _base, .len = _len, \
>  	.features = _features, \
>  	.type = _type, \
>  	.controller_id = _ctrl_id, \
> @@ -1858,85 +1859,85 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>  	}
>  
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>  
>  static const struct dpu_intf_cfg sm8350_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>  
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x38000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> -	INTF_BLK("intf_6", INTF_6, 0x3a000, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> -	INTF_BLK("intf_7", INTF_7, 0x3b000, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> -	INTF_BLK("intf_8", INTF_8, 0x3c000, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> +	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> +	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>  
>  static const struct dpu_intf_cfg sm8450_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sm8550_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	/* TODO TE sub-blocks for intf1 & intf2 */
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  /*************************************************************
