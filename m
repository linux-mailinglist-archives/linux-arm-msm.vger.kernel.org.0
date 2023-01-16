Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E482966C377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 16:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbjAPPUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 10:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjAPPTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 10:19:50 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A60623D81
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:12:20 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r2so27774719wrv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ckwjdIos3/d0mmSAXMiwnydgh7S9s8+5aaRpozbu8v4=;
        b=abXwcrGb1XGyXG2nIPoYBx+gujHYX2iwcnBtc41Unt9f1Rl6PkW7Ho78YiZnDOwfob
         7eU6RTtVc2+UArRouiaO8LdKQOZW/1KPgBbo7Y281wcCMmfSfT6eLDEGCWox7xG9xBWu
         dtEkjhtxaxCNWZ3NV4S9qEzvrLhZXOS9lkF3OYztSb6OmYjVpPue8Z6bi6NZVNclerlt
         bxKEaipyFnRReuceFOMUCV5njbbIacoDBH+OWY2MGpRiaoxOhwOxhphJaLmZW3GBdM+N
         pXE2rC3gURlgGro5YIgLtq3spOfR0/jmjl/8+7B1xsc648/1tq8ilME09lXaickuHNyo
         XM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckwjdIos3/d0mmSAXMiwnydgh7S9s8+5aaRpozbu8v4=;
        b=KKWt83j2x6W3Yx0Y1kZYuZ+ceAgnn472zhhuHsELyq5o6NDYcKgARfiBNg6afW+nui
         7U+10q+gLiVLcBy6nBdJgH+eRGZGanbOWw90CBuE4YYz0hk1n9vRXeMlQC6ZjufB4e44
         Yml7gx2tjsWQP9ZlsNFXnUYBQp9Uy9GLvkM0wM6s5mEQM9NafFDC21PbwXgq52k9SVEh
         n1TNovN5bXbpAwWiUzM2mWGwNR5wGfDXKuToPthhp6i8u/Uw1y2YmgIfAf58D/nlWzYp
         fIQUDNpd+Pw//IPFeIkh9eZzl3rG81Y5QslN8j+gTGSbhBGDxTWf5D39L4ALDQRhgy1h
         ap+g==
X-Gm-Message-State: AFqh2krJZOHACjrrjpKyzi/HXk9zlILAI+u0N5PNltpFaCJf+T3navTz
        /xnREeLRZdXELbySxbcgswgZkFE7ZyvlYlqx
X-Google-Smtp-Source: AMrXdXswS+2w/OvbAJmyIgpYo+ZRbwjDnfNDR6xpRG13o1+tBDmT81nIbfduGLP8VMLGxfKnMRxI9g==
X-Received: by 2002:adf:e9c9:0:b0:2bd:f782:d26d with SMTP id l9-20020adfe9c9000000b002bdf782d26dmr5658264wrn.30.1673881938968;
        Mon, 16 Jan 2023 07:12:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0? ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
        by smtp.gmail.com with ESMTPSA id co22-20020a0560000a1600b002a01e64f7a1sm3121701wrb.88.2023.01.16.07.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:12:18 -0800 (PST)
Message-ID: <eb00d3b5-bd7d-16cd-fef6-231674abe2b5@linaro.org>
Date:   Mon, 16 Jan 2023 16:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA
 SSPP clocks
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
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/01/2023 13:41, Dmitry Baryshkov wrote:
> DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
> SSPP blocks used for the cursor planes. This has lead to the confusion
> at least for the MSM8998 platform. In preparation to supporting the
> cursor SSPP blocks, use proper enum values to index DMA SSPP clock
> controls.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>   2 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ad0c55464154..b0f6e071fe4b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -522,9 +522,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -539,9 +539,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>   		.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>   		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   		.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -564,9 +564,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -602,9 +602,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2BC, .bit_off = 20},
> @@ -631,9 +631,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
>   			.reg_off = 0x2ac, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2b4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2bc, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2c4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2bc, .bit_off = 20},
> @@ -658,9 +658,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2BC, .bit_off = 20},
> @@ -676,9 +676,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   		.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>   		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   		.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -696,8 +696,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
>   	},
>   };
> @@ -724,9 +724,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
>   			.reg_off = 0x28330, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2a330, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA4] = {
>   			.reg_off = 0x2c330, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA5] = {
>   			.reg_off = 0x2e330, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2bc, .bit_off = 20},
> @@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
> @@ -1216,9 +1216,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
> @@ -1254,9 +1254,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> @@ -1282,9 +1282,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> @@ -1316,9 +1316,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
> -		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
>   	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> -		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
> @@ -1327,9 +1327,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
>   static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> @@ -1355,9 +1355,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 56d98b4dd2ac..9c96920e1849 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -513,6 +513,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_DMA1,
>   	DPU_CLK_CTRL_DMA2,
>   	DPU_CLK_CTRL_DMA3,
> +	DPU_CLK_CTRL_DMA4,
> +	DPU_CLK_CTRL_DMA5,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
