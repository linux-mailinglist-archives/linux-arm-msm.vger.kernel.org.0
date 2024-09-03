Return-Path: <linux-arm-msm+bounces-30511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D689699D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B3C28327D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B71AD26B;
	Tue,  3 Sep 2024 10:15:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ECB19F41A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358518; cv=none; b=HvvLU+dnPc5uClv/wY3Jkuda6GKVukO04WYTfRk7lq8yp/cm42yebpgr+BgnMxyNJVlW+etGig2fMSWJOyeMTYDZwYmUWhTW0Ch1EW7ysBjCme0zvVjMfAEwDq1zd80Vo9Hljeor4rYgER6X6pbyZJ+sPUYV+ws5vMSNrTkjqNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358518; c=relaxed/simple;
	bh=pmc2fplmWiaO/xMk8E2XzhR5b3XT9lA4YRgEcHIquko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo/5CU8/27Viza7Mh5JEs1udaf1e5jhZDXttxV+20GoL4Oi4z6wSPFyABwztgEkAVmJ2FhblSHnhlY4VYla9fu56It/UVkTbXypU1/Nyg3oepBECePTT9yP4Bpr0luXD34eRiQzz47vmCQugC29BIGSS/l48cCpIGIBtT5GYuKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1ECA03E996;
	Tue,  3 Sep 2024 11:50:36 +0200 (CEST)
Date: Tue, 3 Sep 2024 11:50:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
Message-ID: <rspuwp3zpnzwfe26hv2yezy5ad5o7wliq7ucpobyaheytvcs3j@qtshf6cewb2f>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>

On 2024-08-29 18:17:31, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> For the bonded DSI case, DSC pic_width and timing calculations should use
> the width of a single panel instead of the total combined width.

When this patch was originally proposed we already discussed [1] that this is
**not** universally true.  On my hardware a single bonded panel always receives
the full width, at least on downstream kernels, and it works [2].

[1]: https://lore.kernel.org/linux-arm-msm/eanx45rnasj7lu3r2tfhtg4qkqkcidd6zctsz6ci6jlklu4fgi@3nf73w2ka4li/T/#u
[2]: https://gitlab.freedesktop.org/drm/msm/-/issues/41

Can we please figure this out before landing this patch?

- Marijn

> Bonded DSI can be used to drive a single panel having two input
> channels, or to drive two panels with a input channel on every panel that
> behave like single panel for display controller.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         | 3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 6 +++++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 87496db203d6c..35b90c462f637 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -79,7 +79,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -					    const struct drm_display_mode *mode);
> +					    const struct drm_display_mode *mode,
> +					    bool is_bonded_dsi);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6388bb12696ff..7a4d9c071be5a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2489,7 +2489,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  }
>  
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -					    const struct drm_display_mode *mode)
> +					    const struct drm_display_mode *mode,
> +					    bool is_bonded_dsi)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	struct drm_dsc_config *dsc = msm_host->dsc;
> @@ -2499,6 +2500,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>  	if (!msm_host->dsc)
>  		return MODE_OK;
>  
> +	if (is_bonded_dsi)
> +		pic_width = mode->hdisplay / 2;
> +
>  	if (pic_width % dsc->slice_width) {
>  		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>  		       pic_width, dsc->slice_width);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca2..6e915b57e14bb 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -420,7 +420,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>  			return MODE_ERROR;
>  	}
>  
> -	return msm_dsi_host_check_dsc(host, mode);
> +	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
>  }
>  
>  static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
> 
> -- 
> 2.34.1
> 

