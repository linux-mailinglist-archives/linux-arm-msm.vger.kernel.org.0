Return-Path: <linux-arm-msm+bounces-42865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0B9F8781
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F8C1892FEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9F41C07EC;
	Thu, 19 Dec 2024 22:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOHfKHcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2841AA1FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646081; cv=none; b=seNycyyAE0eZL6O9/WxanKXIE1QRZrKFASHEEUJu3LV5+l/PS1y8mVLBwbYh3wP1bPmWCkKRHPF2OGfuhE97z7pHCWv8OfGC8Q2ojPZi1TFjDjjOf4cBFBKt7uYbEohrBzPUj6P/S/t1B1voRn9WwZ6K3gr5W3nFZZMK/AAG1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646081; c=relaxed/simple;
	bh=05j4PmlnB2ednxH+bADWyXLdJiphFGYtQ70rpCOTLOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBHlUu3fPK/BUD0WCHSFG2VyTKSulLyP0sUIY61YT4eL2BU38mLyAa0csCjMXWFbQ7pXLmCEtDrgc7nodxdrRlD3ntDaejTwxbz/O9plSIWwMqCPWTn7LcYWqPb+SV7UtwNnnWnGVPsOvdGMiQOKQFv1V4RPXN4cCtVcL6zs4pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOHfKHcR; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3022598e213so14126781fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734646078; x=1735250878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viA/NGtLT1OG0e4oWmzRxKDtBs4ah55CzLenMyIPmPk=;
        b=wOHfKHcRVDrDiv7lo+FhRAxT2AZUrSdJORlEB34EVPqrUR8sxycOvRdurng7jBC9/S
         uoc7ie53kpkTRqirS7EZd7wYp2uAXUg+9ZrnR1iDUc1jdxqHaFG+Nxcv27epCUv4FKJM
         4FCefIzPB1uLQ/1iRt7K4CpsYpG6rFCuEzB0D1q5HWIoEeqEF6OALDu2cKkq7VDFb+Fg
         rJSBl00Jjp+crn3Cy0C84vbbE5/b9818aicRrvYIrYGOLlIWDoa87SGGfRNiT7nJw9Td
         RjdC2Awv/k1Q2f3i5IpRdRp00Wgftyn+kD+DAZVJJRya4nXx9O7DGU4FBwOfkRlHERty
         QQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734646078; x=1735250878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viA/NGtLT1OG0e4oWmzRxKDtBs4ah55CzLenMyIPmPk=;
        b=c98uCfWFFFgjwz8zbMaLE2yHb+RJyhOHfXG76A+I/17OMTvCUyHHYGhvBxf3T6iP6s
         a30K6ntrlomBzexJY6bEaEda1D/tMonopJ6tB5DS5kczY1J8SzxxTanvphEkXQvLH9RV
         en/Cg2E/dN6R3i84BzqhYshmkMpWZCvRbFQXwcf2XTfyaY4X3PIscR4Uz21O8+KW53c9
         BYNwCts3jmP4YIaNkK+28RBKbGzjYnC+E7vLRI4NHZ1n3nwzJgSXwmbLBEAdauMcHtmP
         MexZs1+Chww924FWi8QEc0SCDt5xHPuvGqaKQYK52xSiKqpqpX/gfuJ5KweSVXBbFveK
         sTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUPlVV70rFncP+D9THPCjwF6fNNv2a2+En75WIpEMODmIH9g6s7lzBk34VQWRKREtTfNeu4+oOSwr3HVtX9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4GOaNUmYrdA2NrBoUOH+M3CXrH8PHuQ8uBoDWO7/rw3Cu7O+i
	ISZ5bV2/P5eEIUh6I2BkjVw1TLFfjgmShaHWXg2WoO2z2cTwhySdn6Nig6SkYFo=
X-Gm-Gg: ASbGncsVO15/3OHmSP8Fw5bohFA+AjQKCIBCfe4oA1m377LRQE8MdygyIlgwM8NDxSX
	YM3OPH7iguiI5WmkVXMvev/FXfno19Itoom3Z+w+cEamnNvQHzExCbh1Pk3z2cnldUZeZUmSt61
	v/M/RrwBqtqSHDjICKRr7Z+DCRe+Hp0wKFI+k0fGuw2sCncmzRpmA+DOnm/MhZ39Q3o0ynszGXG
	Hq8dSerFAjjRH2P7ULntYd5BUBFrWN9488f9C5fwDcnYtBIDe5wbA7NW6shWziab6vYRSY1474O
	smHzIMgSOHiTexSilt9vZu+MqMMBHYF1NjLX
X-Google-Smtp-Source: AGHT+IGiQUfxAIZa99jPVEH/RCXenBQGPR3i4OaoiRPeSe75eqgtCqiGmVTEzjvTKNS/CwvdABExdg==
X-Received: by 2002:a05:651c:1545:b0:300:de99:fcc6 with SMTP id 38308e7fff4ca-304685dd8e0mr1809201fa.34.1734646078188;
        Thu, 19 Dec 2024 14:07:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d83sm3607591fa.39.2024.12.19.14.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:07:56 -0800 (PST)
Date: Fri, 20 Dec 2024 00:07:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] drm/msm/dpu: polish log for resource allocation
Message-ID: <hnzaxvxqg2z6g3ct3vzvvyicts2i6cdelxvekvmaili652s4ut@bsev2xwpuv2l>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:21PM +0800, Jun Nie wrote:
> Add resource type info on allocation failure.

Add where? Also describe why, not what.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 6dc3fa79e6425..cde3c5616f9bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -814,6 +814,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>  		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>  
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "none",

unknown or ???, not none

Other than that LGTM.

> +};
> +
>  /**
>   * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
>   *     assigned to this encoder

-- 
With best wishes
Dmitry

