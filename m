Return-Path: <linux-arm-msm+bounces-56918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E41AABE37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 11:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B323B49DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3857265623;
	Tue,  6 May 2025 09:02:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09453264615
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522175; cv=none; b=AW88r6GuJXHlt/SFt/lgaoH0Bom/AHfNoRrgJatwNl8oeQUdwKcoxgZtsWCvBWnUvcVx+fQjfIsJZpxOlgV3TqqCuiB+NjVKxfefX5XZK5FIJ1Ev7qPUSt7ew4FzbA1MOug/zkjZUbI+DKdMtvj9/DKPJ4Z1TQXTnWcQ42MdSDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522175; c=relaxed/simple;
	bh=12vh6IK8I0AkdMWsFqMov1eE4gd1N/LKfwlbPkUGbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq08Tn+R7p6UZ5dg7k3FL9h7DaytS8CnXWgpS9SRO1gQTMBd8fF1Zr4sxIb6SEe+WYUAzV05n+ctm6pSHGIVoZZMiFef22+wIBD+o4rXUR+vBnelK5WNvu4Hogus+VAcy2v7SHgRegCcxZPByCBpeVmLUmrIvpKv11zmbM5Xo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B25F4404A1;
	Tue,  6 May 2025 10:47:14 +0200 (CEST)
Date: Tue, 6 May 2025 10:47:13 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
Message-ID: <wykubtbdukui3lmqraq2yklu3obeutcczuw24idhslyaunyb2e@iandx2xswmu6>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-1-5d20655f10ca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-dpu-active-ctl-v3-1-5d20655f10ca@linaro.org>

On 2025-03-07 08:24:49, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
> might use more that one MERGE_3D block for a single output.  Follow the
> pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
> simply writing new value there. Currently at most one MERGE_3D block is
> being used, so this has no impact on existing targets.

Too late now that this patch has already been merged, but good to
track for posterity: it'd be nice if the commit message mentions that
dpu_hw_ctl_reset_intf_cfg_v1() already takes this approach, and only unsets the
merge_3d bit provided in dpu_hw_intf_cfg, and doesn't clear the whole register
to zero :)

- Marijn

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 411a7cf088eb72f856940c09b0af9e108ccade4b..cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -563,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	u32 wb_active = 0;
>  	u32 cwb_active = 0;
>  	u32 mode_sel = 0;
> +	u32 merge_3d_active = 0;
>  
>  	/* CTL_TOP[31:28] carries group_id to collate CTL paths
>  	 * per VM. Explicitly disable it until VM support is
> @@ -578,6 +579,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>  	cwb_active = DPU_REG_READ(c, CTL_CWB_ACTIVE);
>  	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
>  
>  	if (cfg->intf)
>  		intf_active |= BIT(cfg->intf - INTF_0);
> @@ -591,15 +593,15 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	if (cfg->dsc)
>  		dsc_active |= cfg->dsc;
>  
> +	if (cfg->merge_3d)
> +		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
> +
>  	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>  	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>  	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>  	DPU_REG_WRITE(c, CTL_CWB_ACTIVE, cwb_active);
>  	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> -
> -	if (cfg->merge_3d)
> -		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> -			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>  
>  	if (cfg->cdm)
>  		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> 
> -- 
> 2.39.5
> 

