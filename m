Return-Path: <linux-arm-msm+bounces-20893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8C8D2E55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51071F225F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F69B16729B;
	Wed, 29 May 2024 07:35:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FC16728C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968117; cv=none; b=Uo/BCV2IzZFaV/srW1qwu1HT1Pt8q/ZH6rCAwl+as6eoZdkFTFqjDrzqOOwedwtikznzG+3L5LqVNlAAQWrCLlovePjGekhncFTrPLpRcipK9oIWZAuyHkUlnp9oc/RwziLUrIsbz7Bju7VOVFVkc0J8O++kP84NsQN38c9/hKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968117; c=relaxed/simple;
	bh=kNbYr8Szl5xh7JpaC8VsHuI6Og2jZTvKIc/4wjAEWnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqiHQTw08TkdbAnY37wo7adAw/Ae6oUCYgYsEcO2x0dvtTFF3W7pmbvLlnLKWvjFnLKlvStrlDDwodGnODjV/62hjJPTc+VyqIDlx6T2YLUv9yzMvUWZf+Y8ix5+ido/WDJHJx953UMMceS8w4Af8cAI+v/PKy6PegVWxTJ3s4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-77-cc79-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:77:cc79:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 04CB91F899;
	Wed, 29 May 2024 09:26:59 +0200 (CEST)
Date: Wed, 29 May 2024 09:26:58 +0200
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
	freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/3] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
Message-ID: <livf7gwhypjxncqhw73nibavga4b4xeqe3pqgoidvnk5653yzw@dssrwsfruajv>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
 <20240528-panel-sw43408-fix-v4-1-330b42445bcc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-panel-sw43408-fix-v4-1-330b42445bcc@linaro.org>

On 2024-05-28 22:39:18, Dmitry Baryshkov wrote:
> This panel driver uses DSC PPS functions and as such depends on the
> DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
> available to the driver.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Maybe good context to mention that the DSC<->DP discrepancy will be resolved in
the future, otherwise this patch is slightly unclear for anyone who isn't aware
of the current patch series and its context.  Other than that, for the change
itself:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/panel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 982324ef5a41..2ae0eb0638f3 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for LG sw43408 panel.
>  	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per
> 
> -- 
> 2.39.2
> 

