Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5805F6D04CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjC3MeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjC3MeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:34:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A617A8F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:34:10 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id e21so19423808ljn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i48jJzn2IyDQoX2kT0LcGqDihpg5LxvjlkwBjdOOktY=;
        b=SpivFsXm3H0vaqtLMAU7nMOKTVhNiAo+O9tYGR/kXc0WAHbmqYa5Owuh/XEXqPss5P
         sDfE9XFmls3e9L71Szg330gVwnHa0OBqShJeLqhKpfBO/m578LXIZL86HHHioff3XAtl
         51IaaUehW4bEzuendW21nYDbYVBm6xQbeId5p1pzbZORlVSI0tyAMxZmp0BAV50Gzk7N
         3hlxchnPY4nJyKku44EPbGbO2n95BrjgNwjKekXWJ//xgOEZzTsR3jJnIwsxZPm5S95Q
         Z3XXjoFp2IM6NmZ0mlkmhp0JMJafywrG4Sl0rKSVO2aEDEgOqhjD39HhLQkuSzRB+9C7
         wCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i48jJzn2IyDQoX2kT0LcGqDihpg5LxvjlkwBjdOOktY=;
        b=AjzBUDCh7PZ1qT6WSnuSQElaRrOEssrFAhXFEYI9ularsrI0sJEdYgq+ErGv+P9d6l
         Tu6l5LRwzW3lkUe8PIX5yWlvUZFmSGJkECPHe2aCRgsIlmz5pqKTbAB3sNbrrdaREhWJ
         3TWhj45F2g4wkA7TfQkyDvRkkPzMBLIqqmDXzc3ONSQ5ZD5543YJX5ACO/kqeSdQY6hL
         8HrYt8zFhM69IxeJ6Yc4/l626ctAeZ7WEXxkDDtLsmCQCB0tEtM/AqVMflbGpykKr5/h
         25o3iW4DHof1Dk78Eej7qUAZJyhGBssrP43i5dM7C8YdUEqwM2ziwfd5S5JjpavePsQb
         sCbA==
X-Gm-Message-State: AAQBX9eq3dZmjRdor7bOJZUbx2fKIDnu9xChs5pXp8/A9PNJmsCzrzaP
        KpZ2txKoFXhf/DeChYyIOm0PFw==
X-Google-Smtp-Source: AKy350ZXXDkw3xlollD6Vn1TxcqBWbyJ1otnHERQ4FXpuX5+p4CT6otpgF2VnkaC0BQm20Q3MSvEKQ==
X-Received: by 2002:a2e:88ca:0:b0:2a6:199a:bd4a with SMTP id a10-20020a2e88ca000000b002a6199abd4amr693072ljk.46.1680179648967;
        Thu, 30 Mar 2023 05:34:08 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e3216000000b0029e84187ce2sm4335292ljy.139.2023.03.30.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:34:08 -0700 (PDT)
Message-ID: <d5289fcc-baf9-b156-4640-8b34dcba7512@linaro.org>
Date:   Thu, 30 Mar 2023 14:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,39/50] drm/msm/dpu: drop duplicate vig_sblk instances
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> After fixing scaler version we are sure that sm8450 and sc8280xp vig
> sblk's are duplicates of sm8250_vig_sblk and thus can be dropped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 ++++----
>  .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
>  3 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 094876b1019b..05b7ae3f0343 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -85,13 +85,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  /* FIXME: check block length */
>  static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>  	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>  	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>  	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>  	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>  		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 3d95f2472e7a..d4f710481b78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>  
>  static const struct dpu_sspp_cfg sm8450_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>  	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>  	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>  	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>  	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d84f8eb8f88a..5091cec30bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -411,15 +411,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>  				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> @@ -431,15 +422,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>  
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>  #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>  	{ \
>  	.maxdwnscale = SSPP_UNITY_SCALE, \
