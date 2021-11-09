Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170FA44B3B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 21:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242871AbhKIUJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 15:09:28 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:36764 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241827AbhKIUJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 15:09:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636488401; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0qpZdumH7UDsW2izS6M3tyL1Qg8q84i2R13GYtwCLgw=;
 b=qOEZ6lZhm+fu1D5re4hKASTnDvxD3vlcZNmwuwlK2Rr7RH1vwikwj2B6923dFx8/mhlChPCo
 iaP1P3ULq7FS/n0O73Z6anyO14PednA3u5XGGBM9OUPRze2RpB8cuMMasVWZlNxezyQiCHvs
 cJoZG3d7sitjxv3GShJky0uJIVE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 618ad4c7a06361a25439aa2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 20:06:31
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9122C43619; Tue,  9 Nov 2021 20:06:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18DB2C4338F;
        Tue,  9 Nov 2021 20:06:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Nov 2021 12:06:30 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 15/22] drm/msm/dpu: simplify DPU_SSPP
 features checks
In-Reply-To: <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
Message-ID: <5ddd16ddb7270fe81582be12540852ef@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
> DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
> bitshifts.
> 
This can go independent of the multi-rect series, so can you please take 
this with the
first half of the series which was going to be taken separately?

With that,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 264a9d0d5fca..00098e33391e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -25,11 +25,17 @@ struct dpu_hw_pipe;
>  /**
>   * Define all scaler feature bits in catalog
>   */
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
>  /**
>   * Component indices
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 34ecd971cbbb..8ed7b8f0db69 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -983,8 +983,7 @@ static int dpu_plane_atomic_check(struct drm_plane 
> *plane,
> 
>  	if (DPU_FORMAT_IS_YUV(fmt) &&
>  		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
> -		 | BIT(DPU_SSPP_CSC_10BIT))))) {
> +		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
>  		DPU_DEBUG_PLANE(pdpu,
>  				"plane doesn't have scaler/csc for yuv\n");
>  		return -EINVAL;
