Return-Path: <linux-arm-msm+bounces-38139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF89D0606
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 22:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2F92821F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 21:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6461DDA24;
	Sun, 17 Nov 2024 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nuFuE4AM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFC1DD89F;
	Sun, 17 Nov 2024 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731877326; cv=none; b=iXNUmwdAI+7f4osTxA8a0BR2BWk7AB5upm/LJ5CUvlrk/QhJIVaKU6HcEUqig6agVKt1Lnfswfvckf1WNgyYvj+Y9rf2sn1/KPKuiff60NkfJZJeDhxIqmGMMVbuIHu8y3KruARYn8c97I+5PzSDvnsgQQSvL9JVoPdGi5ebB+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731877326; c=relaxed/simple;
	bh=gn60uRI7cPoOu0aZqxhm0cizQyiIvGbnUSQmXYtqG/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkN6fWUQcEzxeNK3Vh0CMsHOZdAIe+2Nrh14tY+XmoX43o25WZCVqo09KbJPYyg8bbeIlMQh/Jmzqa8fzN3EY40HvlfbavZ2eoeuEhA/DR84gNjZG24gFouHD4uLFp+wIT82fjIKXG+K5UbJTTn8dHomJAPGkKAf+PRMoAvWpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nuFuE4AM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A71AC7CA;
	Sun, 17 Nov 2024 22:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731877305;
	bh=gn60uRI7cPoOu0aZqxhm0cizQyiIvGbnUSQmXYtqG/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuFuE4AMBPsFBGqHFQd4ggjkJ+QzgBQXXkXgyRh2K8mqddIBNVuq2ZOYkN5jrTPyP
	 0WX5eUs1aOXhoq+JyTrup3B+WxggSFrP1A9YGQlL7Qrf7yElE6n/eQNleyHUg4vja4
	 xktQSbx1VHUUMaFQHwFRkF+ZmnHJ73iJ+P2eE6pc=
Date: Sun, 17 Nov 2024 23:01:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/amdgpu: don't change mode in
 amdgpu_dm_connector_mode_valid()
Message-ID: <20241117210153.GF12409@pendragon.ideasonboard.com>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-2-b1b523156f71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-2-b1b523156f71@linaro.org>

Hi Dmitry,

Thank you for the patch.

On Fri, Nov 15, 2024 at 11:09:27PM +0200, Dmitry Baryshkov wrote:
> Make amdgpu_dm_connector_mode_valid() duplicate the mode during the
> test rather than modifying the passed mode. This is a preparation to
> converting the mode_valid() callback of drm_connector to accept const
> struct drm_display_mode argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 75d6b90104f8fe196df06383b20ee88196a700bf..d0ca905e91eafe6c53f3f2ebdf3f2ae9589d7f89 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7381,6 +7381,7 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>  {
>  	int result = MODE_ERROR;
>  	struct dc_sink *dc_sink;
> +	struct drm_display_mode *test_mode;
>  	/* TODO: Unhardcode stream count */
>  	struct dc_stream_state *stream;
>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> @@ -7405,11 +7406,16 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>  		goto fail;
>  	}
>  
> -	drm_mode_set_crtcinfo(mode, 0);
> +	test_mode = drm_mode_duplicate(connector->dev, mode);
> +	if (!test_mode)
> +		goto fail;
> +
> +	drm_mode_set_crtcinfo(test_mode, 0);

I wonder if things could be refactored further to avoid the need to
duplicate the mode here, but that seems out of scope for this patch
series.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
> -	stream = create_validate_stream_for_sink(aconnector, mode,
> +	stream = create_validate_stream_for_sink(aconnector, test_mode,
>  						 to_dm_connector_state(connector->state),
>  						 NULL);
> +	drm_mode_destroy(connector->dev, test_mode);
>  	if (stream) {
>  		dc_stream_release(stream);
>  		result = MODE_OK;
> 

-- 
Regards,

Laurent Pinchart

