Return-Path: <linux-arm-msm+bounces-48771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F7A3E891
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB601188A81C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC9320D504;
	Thu, 20 Feb 2025 23:34:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A832B9AA;
	Thu, 20 Feb 2025 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094458; cv=none; b=Zw4ayuyMoOo1O+cq7PArui25+VIyhafnV77+txUP9nyI5WPRawPRx0rJ7AG0X3xa/BV16PM0QL3Gy4wTR/tjQ/4LwMCSVOBA3ZOqK+AyBsFgnLgQkJ2xv1V/FJqQnFh1fDzF73bu+Y5FIn0GoxK4csaNzsRYN6j7iFf6Vp0SuME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094458; c=relaxed/simple;
	bh=s0iZBvANHFL4ziCPH3pCpYHfFyxTqs8Dm2mcRvgM3xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUAxGg0cp6QIgePvZsITDo2vGN45DRoF730Jeumio97KDQV/fjCCpqqqzO8sbG8NvuYUoRgzzoNqBGY5l069ecg7Az/Ws7rAPwM2MjucSq9jTYANM6gjcUxL4hzrDeYFIwoU/Ia/vZk4qESMWliNpyi4PjQeDccvpCsYHguSpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5E7661FB92;
	Fri, 21 Feb 2025 00:34:13 +0100 (CET)
Date: Fri, 21 Feb 2025 00:34:12 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
Message-ID: <4aix26abutkas2fpj6ubu2hbqeljpgr5e3m24akeb3jz33limj@c7rymwz6zmft>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>

On 2025-02-20 12:26:23, Dmitry Baryshkov wrote:
> Unlike previous generation, since DPU 5.0 it is possible to use just one
> CTL to handle all INTF and WB blocks for a single output. And one has to
> use single CTL to support bonded DSI config. Allocate single CTL for
> these DPU versions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
>  	/* Clear, setup lists */
>  	memset(rm, 0, sizeof(*rm));
>  
> +	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
> +
>  	/* Interrogate HW catalog and create tracking items for hw blocks */
>  	for (i = 0; i < cat->mixer_count; i++) {
>  		struct dpu_hw_mixer *hw;
> @@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	if (rm->has_legacy_ctls) {
> +		/* each hw_intf needs its own hw_ctrl to program its control path */
> +		num_ctls = top->num_intf;
>  
> -	needs_split_display = _dpu_rm_needs_split_display(top);
> +		needs_split_display = _dpu_rm_needs_split_display(top);
> +	} else {
> +		/* use single CTL */
> +		num_ctls = 1;
> +		needs_split_display = false;
> +	}
>  
>  	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
>  		const struct dpu_hw_ctl *ctl;
> @@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
>  
>  		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
>  
> -		if (needs_split_display != has_split_display)
> +		if (rm->has_legacy_ctls &&
> +		    needs_split_display != has_split_display)

I deduced a long time ago that the check for rm->has_legacy_ctls is not needed.

needs_split_display is always false on DPU >= 5, and neither of those SoCs has
DPU_CTRL_SPLIT_DISPLAY which means false != false is false, and this condition
never triggers on active CTLs even without checking has_legacy_ctls.

Other than that, this is all successfully tested and:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  			continue;
>  
>  		ctl_idx[i] = j;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -24,6 +24,7 @@ struct dpu_global_state;
>   * @dspp_blks: array of dspp hardware resources
>   * @hw_sspp: array of sspp hardware resources
>   * @cdm_blk: cdm hardware resource
> + * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
>   */
>  struct dpu_rm {
>  	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> @@ -37,6 +38,7 @@ struct dpu_rm {
>  	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>  	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
>  	struct dpu_hw_blk *cdm_blk;
> +	bool has_legacy_ctls;
>  };
>  
>  struct dpu_rm_sspp_requirements {
> 
> -- 
> 2.39.5
> 

