Return-Path: <linux-arm-msm+bounces-30510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCC9699CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CC9C1F2381B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEF545003;
	Tue,  3 Sep 2024 10:12:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C219CC27
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358373; cv=none; b=MkMy6UB9k02aJ/FEx8JSiwzEhbL8Nxp/+/H7pvrUy6q3NI03Z/hCcXlvrlCv0ZEqrf8T8mEi2g0hpfsF5yQG2v5FYqCH6rrha05w8yaCv2jBxLXsUgE9tOd++aXRJs4Y2YlPqOnXQSKjJPsqt+TY3MeWnRhWk3ych0cft488u64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358373; c=relaxed/simple;
	bh=9zyLZkZi3WvUWzvDtDcI/uI3OMpeVONHVVckewC3Twc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6EdDxo3B1h/4g8Qmsov7hXedj1zHvqfMKqJK8gMIE5LpB1DMh5jguJU2M7pri4emzJEYW/R5tSWvsK8kkJrSb+uuuJMoOj4uW1kkP3tXtLzGJFgfEJ0b3Ifn1n4JdTyob09SgYfq7/6vUXigTN8qJ8avlxfz9MrVyvCBzJM+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7D02E3EDDE;
	Tue,  3 Sep 2024 12:12:47 +0200 (CEST)
Date: Tue, 3 Sep 2024 12:12:46 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
Message-ID: <6kecwqe5npysc3rup5tkij5iepgk3pf5erattfv25caedixaml@6zev3sdwjjbu>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>

On 2024-08-29 18:17:32, Jun Nie wrote:
> Data width for dsc engine is aligned with pipe, not with whole screen
> width. Because the width may be halved in DSI bonded case.
> 
> The dsc width is not related to the timing with back front porch in
> later stage, so update dsc timing earlier.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

I already sent a patch for this:
https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org/

And then came up with a better solution, outlined in:
https://lore.kernel.org/linux-arm-msm/7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v/

Would you mind dropping this patch so that I can send a better solution?

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7a4d9c071be5a..5abade8f26b88 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			return;
>  		}
>  
> -		dsc->pic_width = mode->hdisplay;
> +		dsc->pic_width = hdisplay;

The other part of this already happened in patch 02/21?

- Marijn

>  		dsc->pic_height = mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>  
> @@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		if (ret)
>  			return;
>  
> +		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +			dsi_update_dsc_timing(msm_host, false, hdisplay);
> +		else
> +			dsi_update_dsc_timing(msm_host, true, hdisplay);
> +
>  		/*
>  		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
>  		 * enabled, bus width is extended to 6 bytes.
> @@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  	}
>  
>  	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -		if (msm_host->dsc)
> -			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> -
>  		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>  			DSI_ACTIVE_H_START(ha_start) |
>  			DSI_ACTIVE_H_END(ha_end));
> @@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>  			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>  	} else {		/* command mode */
> -		if (msm_host->dsc)
> -			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> -
>  		/* image data and 1 byte write_memory_start cmd */
>  		if (!msm_host->dsc)
>  			wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
> 
> -- 
> 2.34.1
> 

