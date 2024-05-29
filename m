Return-Path: <linux-arm-msm+bounces-20892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355478D2E54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671821C2061A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721061E86E;
	Wed, 29 May 2024 07:35:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324516728D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968117; cv=none; b=GYZwaffG3uRLaFw8U4GKgd5AwPaCaf+2/JdHy0FQAveUZ8ySiq678TWxQbZIL04erB/dXS62SL+XXNj1JX0M3PB+IQNUGHmu77TdpIeULtphfGOlRq5Ev5zbAZ6LgAieSwhUr1GY5kCvlTEleY0sfoAfr2KDseANJGH2QBeDQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968117; c=relaxed/simple;
	bh=WIrKkfWB9mUTmEf6z4WjJTAXw9ftK94d7qWGvNCTcno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rot+dKjdIJBK0ZrQy1K7627ApL3KhmCnh8p34ZR/yYlLx4iauByoJuHi3MG1CEIh50HcMnhUEPs/04EFZGWBdYOPWbPjY7fjiN95ugXMLR4kT4duLkX4OOXAb3J6OwlJGMaKyL7igpJqLe2owVQtpryzRvPATa2ON0JddlNM5V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-77-cc79-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:77:cc79:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8C5771FE87;
	Wed, 29 May 2024 09:27:36 +0200 (CEST)
Date: Wed, 29 May 2024 09:27:35 +0200
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
Subject: Re: [PATCH v4 2/3] drm/panel/lg-sw43408: mark sw43408_backlight_ops
 as static
Message-ID: <anspa5kgrmfvv2c23mjlukc7vrsctyk34yzud7cffjiljccisz@v7mazfwaxhu6>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
 <20240528-panel-sw43408-fix-v4-2-330b42445bcc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-panel-sw43408-fix-v4-2-330b42445bcc@linaro.org>

On 2024-05-28 22:39:19, Dmitry Baryshkov wrote:
> Fix sparse warning regarding symbol 'sw43408_backlight_ops' not being
> declared.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404200739.hbWZvOhR-lkp@intel.com/
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 115f4702d59f..2b3a73696dce 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -182,7 +182,7 @@ static int sw43408_backlight_update_status(struct backlight_device *bl)
>  	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>  }
>  
> -const struct backlight_ops sw43408_backlight_ops = {
> +static const struct backlight_ops sw43408_backlight_ops = {
>  	.update_status = sw43408_backlight_update_status,
>  };
>  
> 
> -- 
> 2.39.2
> 

