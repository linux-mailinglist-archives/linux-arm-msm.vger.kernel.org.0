Return-Path: <linux-arm-msm+bounces-38204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7109D0DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9348D1F228E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A62197A82;
	Mon, 18 Nov 2024 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbZhR4WY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D1194C6F;
	Mon, 18 Nov 2024 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924726; cv=none; b=l996AAettv+sInuG74O1YzEdV6Zxg0C8QiAq5ZSYRfr5xdSHrdqgppHr9206QxNhIddSJWFNdQjXioWG9e3c2HatLnHofuZRedNwDGxOPZOSXwLrAAr3uHCgicF9zWor+SLiCfJQo9ogHGfi3he6IWLmOTlhp+f7OTcxonwxwdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924726; c=relaxed/simple;
	bh=tvZh19UrT7RhLG31esa3Q+Wb623PF1oP3Z3DIP8DHuU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uz3MbpbmJEaAhydc+G2BMwcWoJPsA0wzuK9ubAjF8lWF7yeHb+LGwoRa+wCQVGSBstKKZBVlOFzzMid/LhMrnz8eGzZSyD52dhCjDYISr+opi+sROcJwPV6XP31EljgXmaJdYGtyrbg6TLtUtrKXNjr7pS81ZY2OpwhTApJMSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbZhR4WY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731924726; x=1763460726;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=tvZh19UrT7RhLG31esa3Q+Wb623PF1oP3Z3DIP8DHuU=;
  b=FbZhR4WYmb6BRRIbUciN7k3vn5BVeUVu5jIKVFyAhtt39SYujaptTVGl
   cJXEuKJE2n4x3BkzVsmAby3w1e3DzKPqn3Cf9Rjl5bHS8mNWkzolPk8lf
   arULmNOIChx8gO1hx744ziuZiyK6o/SfABU+FnOA1YGbITAgGTjnTFmdT
   TXKvLv7knRvFdJXag4tHxtFLQ0YwgTnWcDnG5Y5fbGbWCZxBZe/5pNCR9
   /Y2VSwNbjCt/4tYlL4zIzIihMu0NA40bje0HJVM9pH2/xFYEgJPZQG2oF
   m0zsgqCS+j2aSOuoLks6zKeES+anChyCvvSGvzuFNiAnZ2tmXSy/M9G6z
   Q==;
X-CSE-ConnectionGUID: r9oZE2MdTEmlIez4SUoi8w==
X-CSE-MsgGUID: j85yFea8TqKFeyQWpMvq2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31723849"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31723849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:12:05 -0800
X-CSE-ConnectionGUID: YDbs2x0ITtmplL0jZe8pGw==
X-CSE-MsgGUID: U7Vin29dRNK1mgt6lMVUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89100237"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:11:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Karol
 Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo
 Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, Martyn Welch
 <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang
 <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Mikko
 Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?=
 Canal
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/connector: make mode_valid accept const struct
 drm_display_mode
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-5-b1b523156f71@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-5-b1b523156f71@linaro.org>
Date: Mon, 18 Nov 2024 12:11:37 +0200
Message-ID: <87jzd04zs6.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 15 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> accept const struct drm_display_mode argument. Change the mode_valid
> callback of drm_connector to also accept const argument.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

