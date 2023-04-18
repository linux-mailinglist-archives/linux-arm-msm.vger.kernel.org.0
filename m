Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1847B6E6550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjDRNEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 09:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjDRNEg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 09:04:36 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132D717930
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 06:04:19 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e8so12060050ljn.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681823057; x=1684415057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Yc6LTAEZhmuLnJ7WyNu99S0Duk5M2rbCPMLm1EuTak=;
        b=etDxoIx9LgXMJbf2SADqPirbt7bfOU1fUKHQyFKqxImWAgXjWqvaHq7dIDs6R6jsmN
         xZ4e67rZ/NczTgD4/CEtSVA1XL12IHVpBkuD3shvl5IE/ClcpH6UJeIq3RyWfjd5gDIh
         y3kgqhZMc81Qejkzoa6blyRG399aufsNyFa9bz4yqwssOMkIIfc69rFuSVsNiexAq4pr
         4C72XQv/TZbok4gxV56z8iCzDKI9X7n/nNfNCzgTch1gjHlMh6jWwHq4LkJyS/+E3ShN
         ajslnkUaFcdLQGtQKf1eXWnIRJTRS9PKyfDPn8Rh3gshiZRPucV5gAyVIlHrKtJkW0xS
         k2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681823057; x=1684415057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Yc6LTAEZhmuLnJ7WyNu99S0Duk5M2rbCPMLm1EuTak=;
        b=ABsPRqURIU/fSdncg2G9hb+SdnP6/k/ODZu6YdfsHD1oSgvD3mhVFxO5zc1Bqw7HKS
         wcN3Exfu7ivRWwhg0xEI4zRjMTaG3+PShL7BwW9IgKp5/Q8mVd5UcZJCzULhdyWwO7vA
         JDS/Ayv0k/NxxA02ky1RsnDT4rjk11syb5LHUjjRsUQM8ljq0MzUXf/v4cEwdeVJGWNq
         5GKs70CBN6MV2n841Kqq0Akx8C7yWIlEIqmi67tuctqgwpmuZ4jG1Q/K0eRran3eDOEx
         yetJikHiJ9bRgApT544vJ5W+fmUuMtvXja8QZdVwRBT8KzuZ6LlWsVdE++6dZHz8UHYM
         OWUg==
X-Gm-Message-State: AAQBX9eEkOaWTyAnNnWNHcJTALHYZ0vUIzpGhziYl8OozpG0u6j0SpGv
        V0ssS86HLQVp18amKN2SdsGlbg==
X-Google-Smtp-Source: AKy350bLrfZS+UpHnllU/uNdjb65rda4NjE4SqenkATHtNVwi4J5jczZcPkr2AcTqEfxX4Eng+/CKw==
X-Received: by 2002:a2e:a385:0:b0:2a7:7ff7:9215 with SMTP id r5-20020a2ea385000000b002a77ff79215mr572862lje.10.1681823057030;
        Tue, 18 Apr 2023 06:04:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id a23-20020a2e8317000000b002a79d7ceb93sm2580173ljh.9.2023.04.18.06.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 06:04:16 -0700 (PDT)
Message-ID: <e91df2e2-58a1-fdba-1d8b-803b088ca207@linaro.org>
Date:   Tue, 18 Apr 2023 15:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 14/17] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20230411-dpu-intf-te-v2-14-ef76c877eb97@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-14-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.04.2023 22:21, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
> the PINGPONG block and into the INTF block.  Wire up these interrupts
> and IRQ masks on all supported hardware.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 12 ++++++----
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 12 ++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 12 ++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  8 ++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  8 ++++---
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  8 ++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 ++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++--
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 12 ++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 12 ++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 12 ++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 15 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  6 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 27 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  4 ++++
>  15 files changed, 125 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index e0f62f84b3cf..e8d25a45d6b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -236,7 +238,9 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_INTR) | \
>  		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF2_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_INTR) | \
>  		     BIT(MDP_AD4_0_INTR) | \
>  		     BIT(MDP_AD4_1_INTR),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index fbcfbbd74875..62857288ad91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
>  	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> @@ -218,7 +220,9 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_INTR) | \
>  		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF2_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_INTR) | \
>  		     BIT(MDP_INTF4_INTR) | \
>  		     BIT(MDP_INTF5_INTR) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index b63d244224f0..f77329ab397d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -166,12 +166,14 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -244,7 +246,9 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_INTR) | \
>  		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF2_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_INTR) | \
>  		     BIT(MDP_INTF4_INTR),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 9994b3aa1bb0..279e14d9fabc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -88,9 +88,10 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  };
>  
>  static const struct dpu_wb_cfg sc7180_wb[] = {
> @@ -154,7 +155,8 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR),
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 88a0d6119ad5..5509ceb5d55b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -67,9 +67,10 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
>  
>  static const struct dpu_intf_cfg sm6115_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  };
>  
>  static const struct dpu_perf_cfg sm6115_perf_data = {
> @@ -124,7 +125,8 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR),
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index cd6f4048f286..22b8a173d214 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -64,9 +64,10 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  };
>  
>  static const struct dpu_perf_cfg qcm2290_perf_data = {
> @@ -114,7 +115,8 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR),
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 9b99ec6eb78d..220ba7bdeb20 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -157,12 +157,14 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -227,7 +229,9 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_7xxx_INTR) | \
>  		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 56bd2ec8ca54..91f056fb1247 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -97,9 +97,10 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>  	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> @@ -158,6 +159,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_7xxx_INTR) | \
>  		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF5_7xxx_INTR),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 49fa6eda9c7d..adb519bd0c2c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -228,7 +230,9 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_7xxx_INTR) | \
>  		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_7xxx_INTR) | \
>  		     BIT(MDP_INTF4_7xxx_INTR) | \
>  		     BIT(MDP_INTF5_7xxx_INTR) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 31fec8fc98f2..5d8f381e1708 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -235,7 +237,9 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_7xxx_INTR) | \
>  		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 55c72419964d..dcec15dd630f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -170,12 +170,14 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>  	/* TODO TE sub-blocks for intf1 & intf2 */
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> @@ -240,7 +242,9 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>  		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>  		     BIT(MDP_INTF0_7xxx_INTR) | \
>  		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>  		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d3eda7192908..db558a9ae36e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -553,6 +553,21 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.prog_fetch_lines_worst_case = _progfetch, \
>  	.intr_underrun = _underrun, \
>  	.intr_vsync = _vsync, \
> +	.intr_tear_rd_ptr = -1, \
> +	}
> +
> +/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
> +#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = _len, \
> +	.features = _features, \
> +	.type = _type, \
> +	.controller_id = _ctrl_id, \
> +	.prog_fetch_lines_worst_case = _progfetch, \
> +	.intr_underrun = _underrun, \
> +	.intr_vsync = _vsync, \
> +	.intr_tear_rd_ptr = _tear_rd_ptr, \
>  	}
>  
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 599e177b89dd..756bff1d2185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -629,8 +629,9 @@ struct dpu_dsc_cfg {
>   * @type:              Interface type(DSI, DP, HDMI)
>   * @controller_id:     Controller Instance ID in case of multiple of intf type
>   * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
> - * @intr_underrun:	index for INTF underrun interrupt
> - * @intr_vsync:	        index for INTF VSYNC interrupt
> + * @intr_underrun:     index for INTF underrun interrupt
> + * @intr_vsync:        index for INTF VSYNC interrupt
> + * @intr_tear_rd_ptr:  index for INTF TEAR_RD_PTR interrupt
>   */
>  struct dpu_intf_cfg  {
>  	DPU_HW_BLK_INFO;
> @@ -639,6 +640,7 @@ struct dpu_intf_cfg  {
>  	u32 prog_fetch_lines_worst_case;
>  	s32 intr_underrun;
>  	s32 intr_vsync;
> +	s32 intr_tear_rd_ptr;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 85c0bda3ff90..fb1eda1bda79 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -27,6 +27,11 @@
>  #define INTF_INTR_EN			0x1c0
>  #define INTF_INTR_STATUS		0x1c4
>  #define INTF_INTR_CLEAR			0x1c8
> +#define MDP_INTF_1_TEAR_OFF		0x6D800
> +#define MDP_INTF_2_TEAR_OFF		0x6D900
> +#define INTF_INTR_TEAR_EN		0x000
> +#define INTF_INTR_TEAR_STATUS		0x004
> +#define INTF_INTR_TEAR_CLEAR		0x008
>  #define MDP_AD4_0_OFF			0x7C000
>  #define MDP_AD4_1_OFF			0x7D000
>  #define MDP_AD4_INTR_EN_OFF		0x41c
> @@ -34,7 +39,9 @@
>  #define MDP_AD4_INTR_STATUS_OFF		0x420
>  #define MDP_INTF_0_OFF_REV_7xxx             0x34000
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> +#define MDP_INTF_1_TEAR_OFF_REV_7xxx        0x35800
>  #define MDP_INTF_2_OFF_REV_7xxx             0x36000
> +#define MDP_INTF_2_TEAR_OFF_REV_7xxx        0x36800
>  #define MDP_INTF_3_OFF_REV_7xxx             0x37000
>  #define MDP_INTF_4_OFF_REV_7xxx             0x38000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> @@ -105,6 +112,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>  		MDP_INTF_5_OFF+INTF_INTR_EN,
>  		MDP_INTF_5_OFF+INTF_INTR_STATUS
>  	},
> +	[MDP_INTF1_TEAR_INTR] = {
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
> +	[MDP_INTF2_TEAR_INTR] = {
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
>  	[MDP_AD4_0_INTR] = {
>  		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>  		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
> @@ -125,11 +142,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>  		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>  		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>  	},
> +	[MDP_INTF1_7xxx_TEAR_INTR] = {
> +		MDP_INTF_1_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_1_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_EN,
> +		MDP_INTF_1_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_STATUS
> +	},
>  	[MDP_INTF2_7xxx_INTR] = {
>  		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
>  		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
>  		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
>  	},
> +	[MDP_INTF2_7xxx_TEAR_INTR] = {
> +		MDP_INTF_2_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_2_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_EN,
> +		MDP_INTF_2_TEAR_OFF_REV_7xxx+INTF_INTR_TEAR_STATUS
> +	},
>  	[MDP_INTF3_7xxx_INTR] = {
>  		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
>  		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 425465011c80..fda7f8c9caec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -23,11 +23,15 @@ enum dpu_hw_intr_reg {
>  	MDP_INTF3_INTR,
>  	MDP_INTF4_INTR,
>  	MDP_INTF5_INTR,
> +	MDP_INTF1_TEAR_INTR,
> +	MDP_INTF2_TEAR_INTR,
>  	MDP_AD4_0_INTR,
>  	MDP_AD4_1_INTR,
>  	MDP_INTF0_7xxx_INTR,
>  	MDP_INTF1_7xxx_INTR,
> +	MDP_INTF1_7xxx_TEAR_INTR,
>  	MDP_INTF2_7xxx_INTR,
> +	MDP_INTF2_7xxx_TEAR_INTR,
>  	MDP_INTF3_7xxx_INTR,
>  	MDP_INTF4_7xxx_INTR,
>  	MDP_INTF5_7xxx_INTR,
> 
