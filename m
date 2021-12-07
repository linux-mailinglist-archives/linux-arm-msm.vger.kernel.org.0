Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D68446C3E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 20:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbhLGTt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 14:49:28 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:15005 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236490AbhLGTt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 14:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638906358; x=1670442358;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LTzHrXnxqXOfMijepZBFKonVfcZ/M2FFngkGXTmnHME=;
  b=XI/xsLkqnDzYp7BLhkj7wQj23Nj38UoQSJwZobahobrWRQuvZxBrJdr6
   vklenGNXIVhCxs1uscd40Qeo1m2d+0baiYxyUwmXAsagN9UIEWt7JT87B
   EG5ClR4NLDoga3gehRHWlIDr43Fv4WwQzFOsOHUE9v6rwXjfffxtrkr1J
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Dec 2021 11:45:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:45:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 11:45:57 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 7 Dec 2021
 11:45:54 -0800
Message-ID: <11a9574b-cfde-c4c6-4b2b-578bcc02d4f2@quicinc.com>
Date:   Tue, 7 Dec 2021 11:45:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: simplify DPU_SSPP
 features checks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
 <20211201225140.2481577-4-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201225140.2481577-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/1/2021 2:51 PM, Dmitry Baryshkov wrote:
> Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
> DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
> bitshifts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index ad2002d75739..3c53bd03bdeb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -25,11 +25,17 @@ struct dpu_hw_pipe;
>   /**
>    * Define all scaler feature bits in catalog
>    */
> -#define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
> -	(1UL << DPU_SSPP_SCALER_QSEED2) | \
> -	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
> -	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
> -	  (1UL << DPU_SSPP_SCALER_QSEED4))
> +#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED2) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED3) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED4))
> +
> +/*
> + * Define all CSC feature bits in catalog
> + */
> +#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
> +			  BIT(DPU_SSPP_CSC_10BIT))
>   
>   /**
>    * Component indices
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c7b065b14c5c..911f5f0b41d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1010,8 +1010,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	if (DPU_FORMAT_IS_YUV(fmt) &&
>   		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
> -		 | BIT(DPU_SSPP_CSC_10BIT))))) {
> +		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
>   		DPU_DEBUG_PLANE(pdpu,
>   				"plane doesn't have scaler/csc for yuv\n");
>   		return -EINVAL;
> 
