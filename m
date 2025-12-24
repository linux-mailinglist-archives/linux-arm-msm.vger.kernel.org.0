Return-Path: <linux-arm-msm+bounces-86545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10548CDBF00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5391A3014A00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A332D448;
	Wed, 24 Dec 2025 10:10:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E32C11E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571040; cv=none; b=tLHXzwWZzw96nVYzhe2lhblkYTeZ+OMhKntqwWSI8fdBLRbuSTDinqahI/N1mVicD9IIpcS3SKfIWAbwsqJjVL95vawuY8tBVKSUFOxAJIQiNxRqbutgON9b5wTw4QBYcsNK7dVtbgul+T9KYbJ4wE0FiBT0f6bGOVGOhM2mkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571040; c=relaxed/simple;
	bh=RK6f30+jXrMk9mUctctYmrZkbuxJwRvJ+F8upiL1DJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av2Kj54OffR1dCvVTMtMGOvh2traid8uWXe2kQ2fEIUBORJl2qt3gkDkFxZ6E+Hi9mpMNsf4f/VVXieUzLuEnPvQp4fVSKZQpgAXJbfqR/zNEqiJjDOT7y2KBgO+l1B5/V86by7Nmu7FVia8s0Xo9C93EaR+wS6S3iHZq6i2KEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6DE8420833;
	Wed, 24 Dec 2025 11:10:36 +0100 (CET)
Date: Wed, 24 Dec 2025 11:10:35 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <aUu5vZdr9RJ-VML8@SoMainline.org>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>

On 2025-11-21 14:02:08, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued

typo: executed.

> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
> Changes in v2:
> - Corrected commit message suggested by Dmitry Baryshkov.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d1cfe81a3373..f468d054f5bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */

Unnecessary comment, it's clear from the code flow that vsync_cfg.vsync_source
is passed down into both functions.

Perhaps we should pass disp_info->vsync_source directly into
hw_intf->ops.vsync_sel() and only initialize vsync_cfg when hw_mdptop has the
function, to make this clear.

> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> +	}
>  
> -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;

This change is not mentioned in the commit description.  While true that
pp_count is only used by dpu_hw_setup_vsync_sel(), that is still a valid
function to be called on DPU < 5; it denotes the amount of ppnumber[i] array
entries are used above.

> -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);

Same, also not mentioned in the commit description.  frame_rate
is used by dpu_hw_setup_wd_timer() on DPU < 8.

> -
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
> -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);

But all of the above comments don't matter if the call to setup_vsync_source()
is removed entirely - it didn't move anywhere else.  This is not described in
the commit message.

- Marijn

> -
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			phys_enc = dpu_enc->phys_encs[i];
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		phys_enc = dpu_enc->phys_encs[i];
>  
> -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -						vsync_cfg.vsync_source);
> -		}
> +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +					vsync_cfg.vsync_source);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

