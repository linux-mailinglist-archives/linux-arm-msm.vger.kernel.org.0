Return-Path: <linux-arm-msm+bounces-48768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95EA3E835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87FE19C2208
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82BA26561C;
	Thu, 20 Feb 2025 23:17:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1621F4E3B;
	Thu, 20 Feb 2025 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740093458; cv=none; b=YDuuGnjxIBEdIladOP4E5x956fm8mN+KmeKW93wrKQvnEH1NiJu4JAcndSa4zBKQRSr22lttGRrxAXx16vszgnfBMg3isC9fQw6+GYRGZDF2VMGKQDQxIO2Z4GL+g0RIOfgxd4KSLwVf2rVn0CC57elFXzYM/jCaQQjvwtVHlQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740093458; c=relaxed/simple;
	bh=Ksv6rXwNT0Tae1pM/e3Atoeuf3TBrGkDeeU1xQQn5Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsySTmx56yskrtg1G4wq0os4pjss4Unx0DvnYBOJ+gk3n9WXCwkka2BMFSXUUefZ/psPHmdjmGLuOV6E6GJVPxx2ubVS854JUVORWHWH7FlV340QLxc0aVoPNTMWD79BHEZyZiQiVppk4+E3xvcL47/T25Az+lQ8LVgKJwlLoaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BA80C1F88B;
	Fri, 21 Feb 2025 00:17:26 +0100 (CET)
Date: Fri, 21 Feb 2025 00:17:25 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
Message-ID: <ox5yirb5sxfn5e56khlm32we5rfspsnex3dbbtzkyicp5c6kpz@j5bjhujjntqs>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-1-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-1-71ca67a564f8@linaro.org>

On 2025-02-20 12:26:18, Dmitry Baryshkov wrote:
> In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
> might use more that one MERGE_3D block for a single output.  Follow the
> pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
> simply writing new value there. Currently at most one MERGE_3D block is
> being used, so this has no impact on existing targets.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4893f10d6a5832521808c0f4d8b231c356dbdc41..321a89e6400d2824ebda2c08be5e6943cb0f6b11 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -548,6 +548,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	u32 dsc_active = 0;
>  	u32 wb_active = 0;
>  	u32 mode_sel = 0;
> +	u32 merge_3d_active = 0;
>  
>  	/* CTL_TOP[31:28] carries group_id to collate CTL paths
>  	 * per VM. Explicitly disable it until VM support is
> @@ -562,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>  	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>  	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
>  
>  	if (cfg->intf)
>  		intf_active |= BIT(cfg->intf - INTF_0);
> @@ -572,14 +574,16 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	if (cfg->dsc)
>  		dsc_active |= cfg->dsc;
>  
> +	if (cfg->merge_3d)
> +		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
> +
>  	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>  	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>  	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>  	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
>  
>  	if (cfg->merge_3d)
> -		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> -			      BIT(cfg->merge_3d - MERGE_3D_0));
> +		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);

No other writes (except the new CDM, strangely) are done conditionally, since
the value does not change.  Let's keep it consistent with the other register
writes and maybe clean this up in the future when this function gets a single
view of all "connected" INTFs at once rather than doing many read-update-writes?

After that:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  
>  	if (cfg->cdm)
>  		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> 
> -- 
> 2.39.5
> 

