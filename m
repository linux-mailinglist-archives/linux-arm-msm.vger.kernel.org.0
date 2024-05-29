Return-Path: <linux-arm-msm+bounces-20897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F88D2E7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B744328296D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E62167D87;
	Wed, 29 May 2024 07:40:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B92167D80
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968418; cv=none; b=aUijb6Hqs5QIHRFXW58qagXyBNIfMGbBvUDWz9sLqTgKsBm3o4iRICyZMMnr4EjF5zMyqcaKHuE7YJ1VorIW7SGOWB8wT3ArRc7UZhl6Ls6fmVBg6bgFPeH6KOaAIMSAgA+m/CZidgXIyDuiRh4kd5JcS0OHjgX5AS7IpwbysPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968418; c=relaxed/simple;
	bh=zHUZ3rqsFBRispMR7PUdN9kD316fvW83L93XSnpGX7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTWL8ZNc7MkKpu4QFACDU0dKRVROjL6NuQb08W3q9TWIobKKwmP6kPqi66bUigGl8x2rtnmfM5dD5DqjSk+JoBVSd0uVLuC7xcYG+Z0HOsk/WlSjW6qT9c/dV/xoMCBW30uLUO8Tx37OzB8w1gdQACM1vs9NJrb3DGIkaQjzNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-77-cc79-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:77:cc79:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 013031F8E2;
	Wed, 29 May 2024 09:31:52 +0200 (CEST)
Date: Wed, 29 May 2024 09:31:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>, 
	Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 3/3] drm/display: split DSC helpers from DP helpers
Message-ID: <nfo5qbqwuq6zlywayt5pt2xh63wvg6eofjusz2wlelzi76busf@tuj5kaubcznl>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
 <20240528-panel-sw43408-fix-v4-3-330b42445bcc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-panel-sw43408-fix-v4-3-330b42445bcc@linaro.org>

On 2024-05-28 22:39:20, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>  drivers/gpu/drm/display/Kconfig    | 6 ++++++
>  drivers/gpu/drm/display/Makefile   | 3 ++-
>  drivers/gpu/drm/i915/Kconfig       | 1 +
>  drivers/gpu/drm/msm/Kconfig        | 1 +
>  drivers/gpu/drm/panel/Kconfig      | 6 +++---
>  6 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 4232ab27f990..5933ca8c6b96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -6,6 +6,7 @@ config DRM_AMDGPU
>  	depends on !UML
>  	select FW_LOADER
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 864a6488bfdf..f524cf95dec3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
>  
>  	  If in doubt, say "N".
>  
> +config DRM_DISPLAY_DSC_HELPER
> +	bool
> +	depends on DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
> +
>  config DRM_DISPLAY_HDCP_HELPER
>  	bool
>  	depends on DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17d2cc73ff56..2ec71e15c3cb 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
>  	drm_dp_dual_mode_helper.o \
>  	drm_dp_helper.o \
> -	drm_dp_mst_topology.o \
> +	drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
>  	drm_dsc_helper.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
>  	drm_dp_tunnel.o
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 5932024f8f95..117b84260b1c 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -11,6 +11,7 @@ config DRM_I915
>  	select SHMEM
>  	select TMPFS
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1931ecf73e32..6dcd26180611 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -111,6 +111,7 @@ config DRM_MSM_DSI
>  	depends on DRM_MSM
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_DSC_HELPER
>  	default y
>  	help
>  	  Choose this option if you have a need for MIPI DSI connector
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2ae0eb0638f3..3e3f63479544 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -340,7 +340,7 @@ config DRM_PANEL_LG_SW43408
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for LG sw43408 panel.
> @@ -549,7 +549,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Raydium RM692E5-based
> @@ -907,7 +907,7 @@ config DRM_PANEL_VISIONOX_R66451
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Visionox
> 
> -- 
> 2.39.2
> 

