Return-Path: <linux-arm-msm+bounces-15817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ED9892A6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 11:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E8DC280F45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 10:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2744A1C0DD6;
	Sat, 30 Mar 2024 10:31:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A71FBA
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711794701; cv=none; b=l7EvTdu0JzdAHO+I2/k/aLqXC87Bela9bH/0YchZGbLYvncbt7HaOLzSjGqDPSkpGk6Wj6NK76HKRZVZ23NhIBh5LAzrDDJJHixt2iPvbMviHF6ua6oD0jb7EEoATo736n8TROfb9Jlyt/XB/splwQtVBbqNkchctRUgZrlKY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711794701; c=relaxed/simple;
	bh=fSsp9btLiNK+0CeJTBtTeOFKvzBMEtDkDm8AovkcVaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adXd7HqI0ovC3+N4jf79cQLYuneeYDIdafCwUBpxd+Un5wxoB1FyUpyffmeqR3n0PapMaGLFBgMzG6nO9CKyPTz0lxY6OHDt82bAVmy1Zc0tePs9DDPY1i/6x0sc63xaTzs8YY+uPEoKsS+SHMgdt8sYDlBFV29KoPUI5az4Zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A6C391F5DD;
	Sat, 30 Mar 2024 11:31:36 +0100 (CET)
Date: Sat, 30 Mar 2024 11:31:35 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Message-ID: <dosvghhvlrmmrdvd5malknbgdel6vlclvozkqcdvbmjnaw2yze@vr4pqvu3mudb>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>

On 2024-03-30 05:53:22, Dmitry Baryshkov wrote:
> There is little point in using %ps to print a value known to be NULL. On
> the other hand it makes sense to print the callback symbol in the
> 'invalid IRQ' message. Correct those two error messages to make more
> sense.
> 
> Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Agreed, this is a lot more clear:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 946dd0135dff..6a0a74832fb6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -525,14 +525,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
>  	int ret;
>  
>  	if (!irq_cb) {
> -		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> +		DPU_ERROR("IRQ=[%d, %d] NULL callback\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		DPU_ERROR("invalid IRQ=[%d, %d]\n",
> -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> +		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
>  		return -EINVAL;
>  	}
>  
> 
> ---
> base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
> change-id: 20240330-dpu-irq-messages-5cf13fd7568c
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

