Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71B7436E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 01:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhJUX02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 19:26:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63143 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230280AbhJUX02 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 19:26:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634858651; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eGXgAl/rLL3eeoTt7waQiUbv56ry1MTX0RnCfcNJG2M=;
 b=r+l0PYbhXGTM5hFswMBRuVjAxuE3NpxlF8fxIAUK79mmAlOTZDRfjjVO+70WThZJ2kYhriOm
 0XARBnBn6jPOwFVDnItK8OhNwg0IQy10x9ChNnRcMOZjAeNBjJyIrUtDEeA+p5Xm2MSaXTnF
 9oCdXfhVyjzQ1Hl/MJZPb3glc+s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6171f69b67f107c611735236 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:24:11
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19E7BC43616; Thu, 21 Oct 2021 23:24:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BED1C4338F;
        Thu, 21 Oct 2021 23:24:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 16:24:10 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 09/11] drm/msm/dpu: don't cache
 pipe->cap->features in dpu_plane
In-Reply-To: <20210930140002.308628-10-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-10-dmitry.baryshkov@linaro.org>
Message-ID: <632c6142a27970e43affee67d379fe18@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 07:00, Dmitry Baryshkov wrote:
> Do not cache hw_pipe's features in dpu_plane. Use
> pdpu->pipe_hw->cap->features directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d3ae0cb2047c..af403c0d3d7d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -100,7 +100,6 @@ struct dpu_plane {
>  	struct mutex lock;
> 
>  	enum dpu_sspp pipe;
> -	uint32_t features;      /* capabilities from catalog */
> 
>  	struct dpu_hw_pipe *pipe_hw;
>  	uint32_t color_fill;
> @@ -644,7 +643,7 @@ static const struct dpu_csc_cfg
> *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>  	if (!DPU_FORMAT_IS_YUV(fmt))
>  		return NULL;
> 
> -	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
> +	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
>  		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>  	else
>  		csc_ptr = &dpu_csc_YUV2RGB_601L;
> @@ -1012,8 +1011,8 @@ static int dpu_plane_atomic_check(struct 
> drm_plane *plane,
>  	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> 
>  	if (DPU_FORMAT_IS_YUV(fmt) &&
> -		(!(pdpu->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
> +		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> +		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
>  		 | BIT(DPU_SSPP_CSC_10BIT))))) {
>  		DPU_DEBUG_PLANE(pdpu,
>  				"plane doesn't have scaler/csc for yuv\n");
> @@ -1439,8 +1438,8 @@ static int _dpu_plane_init_debugfs(struct
> drm_plane *plane)
>  				plane->dev->primary->debugfs_root);
> 
>  	/* don't error check these */
> -	debugfs_create_x32("features", 0600,
> -			pdpu->debugfs_root, &pdpu->features);
> +	debugfs_create_xul("features", 0600,
> +			pdpu->debugfs_root, (unsigned long 
> *)&pdpu->pipe_hw->cap->features);
> 
>  	/* add register dump support */
>  	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
> @@ -1613,7 +1612,6 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  	}
> 
>  	/* cache features mask for later */
> -	pdpu->features = pdpu->pipe_hw->cap->features;
>  	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
>  	if (!pdpu->pipe_sblk) {
>  		DPU_ERROR("[%u]invalid sblk\n", pipe);
