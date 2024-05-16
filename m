Return-Path: <linux-arm-msm+bounces-19927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE998C7317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 10:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2AD28116B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 08:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D291420BB;
	Thu, 16 May 2024 08:43:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA776BFBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2024 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715848994; cv=none; b=PPl77KiHhQwR3u5R5p66q9AeKKsaQBUzjTpaH9NWXU1petXBE96dRbqp2DKpEVyA1OG2NnIl90yo132yCkmVAk/WvPeGosw6sfkG25Fi3EormdjUAY6cohudsyCzjhxote3BE8psPPj8r7uu4pGsOJWC8lmddDDb8ZrYqz3wwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715848994; c=relaxed/simple;
	bh=SKBv4dOuu0huRA43K4sqgTTS3dYHR3D3+/KsrfKkeUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7u+CQphc8SQMYXknR8PjiKg2/oXEBfTmn/kUHrAB6d7iA4Jabfw6HhGIxefzBB/CofTToI/yj+IDBJ8La+CXvbJOtJUya4r/xKIgx8JjOhAtzQvT+grh3vEPix2CU8XBl4+CtnXb936xqV8yO/Aqb6nSCuF6X3furhs/ZL+WSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 070501F53E;
	Thu, 16 May 2024 10:43:01 +0200 (CEST)
Date: Thu, 16 May 2024 10:43:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
Message-ID: <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>

On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> When create_address_space() fails (e.g. when smmu node is disabled)
> msm_gpu_init() silently fails:
> 
> msm_dpu c901000.display-controller: failed to load adreno gpu
> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> 
> Log create_address_space() failure.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Thanks!

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>

And, after checking the below:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 655002b21b0d5..f1e692866cc38 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
>  	else if (IS_ERR(gpu->aspace)) {
>  		ret = PTR_ERR(gpu->aspace);
> +		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);

Maybe this wasn't done before because this also includes `-EPROBE_DEFER`, so you
might want to wrap this in

	if (ret != -EPROBE_DEFER)
		DRM_DEV_ERROR...

But then dev_err_probe() was built specifically to be less verbose about this
(and track defer reasons).  While this is an init and not probe function, it's
called from struct component_ops->bind where it should be okay to call that,
as long as you have access to the component `struct device*` and not its master
(IIRC).

- Marijn

>  		goto fail;
>  	}
>  
> -- 
> 2.34.1
> 

