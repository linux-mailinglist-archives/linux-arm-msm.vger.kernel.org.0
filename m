Return-Path: <linux-arm-msm+bounces-48770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1236A3E854
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C1B3B54E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B92265CAF;
	Thu, 20 Feb 2025 23:23:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C021D5CDD;
	Thu, 20 Feb 2025 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740093831; cv=none; b=Yc2tkUVw/zBpvhSKhXmYSXpIeMbyITXZCz6rliFssxcj5PDpNOFCfJmDcsq5sZMdxBJCsWknoX1R9BAFfw/v7fvk/UaRo66m9u+a3Q79gxiOC8ko97+pbLj8S3JCnHmE5cDa3OAyas0pjruIF8+rYg8ziRt/m1YMa76r8H1EzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740093831; c=relaxed/simple;
	bh=7plj6L20Gxo9cVQKw8RCUxWVe+D0ww3+RbiYkw7G20A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjDCr6xiuxaA+GuafOYCJ0jgXm1PbxCyOIMV6d8kjeNUbor3oiFfmAmXxpyEd0C/srSXctkj2klUpwl8MV+pDPJ5OJVEjTpVOYAupQeNkShNkLs2GzlC7OLW/bn96i6c7RKkjoVCtrxO0o83ObNwyg9gVBH6sj0SBILPcj6djLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CA2941FB6F;
	Fri, 21 Feb 2025 00:23:40 +0100 (CET)
Date: Fri, 21 Feb 2025 00:23:39 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm/dpu: pass master interface to CTL
 configuration
Message-ID: <plurs7xfefclro5cw7c5hcd3akryzx6p75owbrkntsbwzxz26n@ac2dxrbcej6w>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-3-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-3-71ca67a564f8@linaro.org>

On 2025-02-20 12:26:20, Dmitry Baryshkov wrote:
> Active controls require setup of the master interface. Pass the selected
> interface to CTL configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index e9bbccc44dad8b391cd51daf902307105b2598fc..d1e16da00529de35cf4e205077c4264bdb70de16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -59,6 +59,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  		return;
>  
>  	intf_cfg.intf = phys_enc->hw_intf->idx;
> +	if (phys_enc->split_role == ENC_ROLE_MASTER)
> +		intf_cfg.intf_master = phys_enc->hw_intf->idx;
>  	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>  	intf_cfg.stream_sel = cmd_enc->stream_sel;
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  	if (phys_enc->hw_cdm)
>  		intf_cfg.cdm = phys_enc->hw_cdm->idx;
>  	intf_cfg.intf = phys_enc->hw_intf->idx;
> +	if (phys_enc->split_role == ENC_ROLE_MASTER)
> +		intf_cfg.intf_master = phys_enc->hw_intf->idx;
>  	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> 
> -- 
> 2.39.5
> 

