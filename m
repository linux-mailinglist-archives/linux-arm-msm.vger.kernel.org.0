Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCC053BEA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 21:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiFBTWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 15:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbiFBTWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 15:22:06 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E8ABB6
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654197724; x=1685733724;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+jSNvGTRr4q9BCUbtPJPdq6gs6yP0IGw6YPgO/8GEh4=;
  b=N5EJ0kOPrrB4sVxiaOFwMjYh1T5u4nXuu1aEfuhj+7p6IgIYb9L+3fuX
   cYrJ+pSOn49PZV839ZzQi/pDGszYYiogwr/vG0q0GtpYGrKswdKstHHDy
   YaZokqGNZUWZcrOJfJ9sCv1U4CDdyPl184ZQAJK7VKgRPwEVGu6qWRw8X
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 12:22:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 12:22:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 12:22:02 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 12:22:00 -0700
Message-ID: <a49bfbba-be6d-6bb7-8711-c25f08b66c0e@quicinc.com>
Date:   Thu, 2 Jun 2022 12:21:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const
 pointer
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        "kernel test robot" <lkp@intel.com>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Change dpu_mdss_cfg::dma_cfg to be a const pointer rather than embedding
> the dpu_reg_dma_cfg struct into the struct dpu_mdss_cfg.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 +-
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a7040ca5da72..5470b8b14b0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1780,7 +1780,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &sdm845_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
> @@ -1811,7 +1811,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &sc7180_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
> @@ -1844,7 +1844,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8150_regdma,
> +		.dma_cfg = &sm8150_regdma,
>   		.perf = &sm8150_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
> @@ -1875,7 +1875,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8150_regdma,
> +		.dma_cfg = &sm8150_regdma,
>   		.perf = &sc8180x_perf_data,
>   		.mdss_irqs = IRQ_SC8180X_MASK,
>   	};
> @@ -1910,7 +1910,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.wb_count = ARRAY_SIZE(sm8250_wb),
>   		.wb = sm8250_wb,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8250_regdma,
> +		.dma_cfg = &sm8250_regdma,
>   		.perf = &sm8250_perf_data,
>   		.mdss_irqs = IRQ_SM8250_MASK,
>   	};
> @@ -1965,7 +1965,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &qcm2290_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 64ed96b2fa3d..60b403ac9f0f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -859,7 +859,7 @@ struct dpu_mdss_cfg {
>   	const struct dpu_wb_cfg *wb;
>   
>   	u32 reg_dma_count;
> -	struct dpu_reg_dma_cfg dma_cfg;
> +	const struct dpu_reg_dma_cfg *dma_cfg;
>   
>   	u32 ad_count;
>   
