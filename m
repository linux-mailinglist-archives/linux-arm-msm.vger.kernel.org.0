Return-Path: <linux-arm-msm+bounces-43947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D38A01C32
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2025 23:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3F23A21A8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2025 22:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4201D5170;
	Sun,  5 Jan 2025 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szm/MIks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1192146D57
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jan 2025 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736117235; cv=none; b=dbhGtv775xrS/o0PAWbU7zFaibhqfkBTdsPn+8T4kjdYlU3uGeYRxCOhIixFBZJImwaOynBDcpwYOnVwwvjzoaAi37WFZ9LC787GhD+SRaTBaDV+E6nINjQ5ptDdlcTC4Bklq4UYbBJIC2ZK+lelt0Q+xqZ8Y5Uu921o50Q7Lew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736117235; c=relaxed/simple;
	bh=BMYDPdXSb2p42GtUdkIiijZF1go73+F4fVLY33Fiw28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdSmv74FZ7wBltT291B2C+JXJtFKVVUATdFTrY9ZHP4xUQtQjgH0yH2oJtVVS19mWu1WWw1h7tlpi66HYUJLXoLoc63y4NOuihWFXGuw1eTjM+L7rysgiG3BqQRrIso+ZRH39EvJX1huz1TJigVORohLmIUZMQM1jfYvS53jPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szm/MIks; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30219437e63so156465361fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736117231; x=1736722031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TUw/Qsx3e/Vb/fGVkhPXMOTG1JvaasLeNnFxwC0uDdk=;
        b=szm/MIksrH41KDdmZlmqV2Su9kmCme4VQ6H75xN+6DyXIl6rDPBMr4hko2N53j4Iw5
         1xFB6VzsrfGNjLoYnrldD/klsFoYskBuKiP6m08m6648o73NM4q9X6g47Q2vsM41vc71
         pO5LP4r0aZXNzt4iLLso/v+0NNmPjBzw0S4mZWC2y7q2MGcMiZT6oNJIhv9G7D7ZHkGj
         M0nN09gUBNk6kTr6sXxd05BAxHgQ8Aqy18lNlHSkj1CeoA6biQxihIponHNiluW/hLcG
         eBGpXDr7QH3XAAMVaeIvRDKMbhOYPYAucbVNgAyFTceyD4DUuhnGbNHtMKCnE4kp6/Gd
         st4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736117231; x=1736722031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUw/Qsx3e/Vb/fGVkhPXMOTG1JvaasLeNnFxwC0uDdk=;
        b=kW203tnl1Wy69CD8mIpzQlMvaHzt/QEIfRG7aXjeVQRLl4M/mr/4/CUFBqyFHsbLx4
         GzQIgPocOXjMEXN2djq+UhJCUomjym0p9B+Map1eF3bUmYteuDb32Kh3yLLL+lzP2NrX
         Vmq4MEk3U6ZuSSa5INLzydJXB/gveqdTFaW79qcxNMBegj4C1hQoBdWUSvNjHW9mvtei
         MlBEom662zWeSDZpmD/r7hx27FPqj9xO0QNf7SXAhbMGTOelQuDnvps0PMWf/FNyyQhr
         zYVf1jOtJDZyMnjnJwqYNjVtQM3+uigEkx2i+YCRQ8cDTHKjC0aswkZlApwLLKEL0XcC
         d8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnHgqC4OCn9AtgNPJYy+HEpB0crYVMSyN79MX2rVzxvNSonX8aMZ+h8EWqBHc+Gb2DNEGzUVDOeNkl9dsw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxya0Q8ez2611qup/1lHTRuOiWHVSV/WiGKskQHmvwVc0NWgCF7
	Z3TdfXQpdEWqiPG0SYFGY0Eapwy/JsLnLA9antLjApa6MNZChhzDK/Zc6wJqNrI=
X-Gm-Gg: ASbGnctO57+j1ObEH4PunzRRidIilgqllD/b9Mmo9xavYWNBt1EVrb+sR01CN89hAFe
	2UN4t2f9ne1sqz082fvwXgTUilfcwYI9oJDYsvkkPiJ5Wtqek5O8LCOH133KxYoxPbBK1JhOKAZ
	hF5frWgV3ze6pALPXgemTadDEFUTB6Ok72IvuvSQKXaMZlXmRB6uXweyqyJGtAPFbtNcC0gPOwV
	KaWu4ivVtk5wVz43X17q4/fiVYUJtQRwXWt0XHJU8PdAIWAmWm3wkwdaOFGK/hbVKuUPfB9g0qG
	qmix8YmwMxviiRE8nuDvj5xS3T2QifR6VJ3p
X-Google-Smtp-Source: AGHT+IGdeC3kJKQByRSkP8PFuxEiAQLE0VDeCxWNLmf8WlobNvqOtqUKt3Qejko5pkmOL0gzpID7uQ==
X-Received: by 2002:a2e:a78a:0:b0:302:4a8f:428b with SMTP id 38308e7fff4ca-304583eca3fmr125244721fa.15.1736117231020;
        Sun, 05 Jan 2025 14:47:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b09669csm54711531fa.120.2025.01.05.14.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 14:47:09 -0800 (PST)
Date: Mon, 6 Jan 2025 00:47:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>

On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
> While working on the generic mode_valid() implementation for the HDMI
> Connector framework I noticed that unlike other DRM objects
> drm_connector accepts non-const pointer to struct drm_display_mode,
> while obviously mode_valid() isn't expected to modify the argument.
> 
> Mass-change the DRM framework code to pass const argument to that
> callback.
> 
> The series has been compile-tested with defconfig for x86-64, arm and
> arm64.
> 
> Note: yes, I understand that this change might be hard to review and
> merge. The only viable option that I foresee is to add new callback,
> having the const argument and migrate drivers into using it one by one.

Colleagues, I'd like to graciously ping regarding this series. Should it
be merged as is (possibly requiring more R-B's)? Or should I rework it
adding something like .mode_valid_new() callback which takes const
argument?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Rebased on top of linux-next
> - Replaced 'accept const argument' with 'take a const arugment'
>   (Laurent)
> - Link to v1: https://lore.kernel.org/r/20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org
> 
> ---
> Dmitry Baryshkov (5):
>       drm/encoder_slave: make mode_valid accept const struct drm_display_mode
>       drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
>       drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
>       drm/connector: make mode_valid_ctx take a const struct drm_display_mode
>       drm/connector: make mode_valid take a const struct drm_display_mode
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
>  drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
>  drivers/gpu/drm/display/drm_bridge_connector.c           |  2 +-
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c          |  2 +-
>  drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
>  drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
>  drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
>  drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
>  drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
>  drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
>  drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
>  drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
>  drivers/gpu/drm/tegra/dsi.c                              |  2 +-
>  drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
>  drivers/gpu/drm/tegra/sor.c                              |  2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h              |  2 +-
>  include/drm/drm_encoder_slave.h                          |  2 +-
>  include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
>  71 files changed, 92 insertions(+), 93 deletions(-)
> ---
> base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

