Return-Path: <linux-arm-msm+bounces-40109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 777499E277E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AF27B67DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D77C1F706C;
	Tue,  3 Dec 2024 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W88BdBj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE313B5B6;
	Tue,  3 Dec 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733237784; cv=none; b=M6Zo+Rv993IOdqdESiQxZtK4OpPTHAeyJ9YK3oKz7cAY6BY2O+0fTobIshOD+oP8wtXVkzDTlHMKSdOgeKQf1PVvGX4F0qmnKasVJHX7xXZ87vRd5FYccAv6xvPmvqDMtdJbG3KM8mEmIoCCIn4K9KFnj92OgNSU9fijibVQgPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733237784; c=relaxed/simple;
	bh=nr9bqAPsYmVIpKYgeN/1T2895DfBpqXXw8ki35XQrNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hLBJUqQfWDGVuzNfnNE6BXCSmhvsCXT/NSKJHVgIrnTUgGwhE0AQgNw6S5TeZETUsyrivoOXSGczOoSEjo5+SiycUeShP+iooM5U67xKW+5uqBUb1YKAWF8/wIXaKNDbBKpUG2vcV93ZGWdrqKwAOFax+1NpbmQ9upnaREeRWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W88BdBj2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733237782; x=1764773782;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=nr9bqAPsYmVIpKYgeN/1T2895DfBpqXXw8ki35XQrNY=;
  b=W88BdBj2Y6FNTGFFVAp8nVfFGFKBM0KGajMvEGYMYEIbQt7d0OZhmJxd
   K77qQzqJovVmAfk+Cwo/dQtB8CosiWAYuc358NznUjo/twzCajJR2q/jo
   ZAxoR2Ypb8wHZCInVj8P0PKXvuLKy1mT8RsBuvYaBGSt9o6jPKsEoszqr
   HEOgjVug4juk9cVlB1qIIsaehAIt/cgLcgpRd5rUYAG78nlZyDdzkW5wZ
   JfkN3CTLuTxRglvcwnMG7/FVtsx4OPCfR1ECHf94kZFvt/4QjHk9ToY0S
   K4JzMpZ0MwlevVczJ8Ug9siGeUW6Zaz9f1IUEsHP09lmQjvHskn5ObDy0
   w==;
X-CSE-ConnectionGUID: FQ9dhUJzS+SXQJYDh3ymeg==
X-CSE-MsgGUID: FfbATpKLSeS75hkgeYrFvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37391896"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="37391896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:56:20 -0800
X-CSE-ConnectionGUID: Tre4A+gIQ0+OsOTsF+JqxA==
X-CSE-MsgGUID: /jaX+ZgoRZKGdDviMXmvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93921130"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:56:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/10] drm/i915/audio: use eld_mutex to protect access
 to connector->eld
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
Date: Tue, 03 Dec 2024 16:56:04 +0200
Message-ID: <874j3k4xyz.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree you find best.



> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 32aa9ec1a204d2ecde46cad36598aa768a3af671..3902ab8431139c3ff4dc17b841d94b6d3241dec3 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -699,10 +699,12 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
>  
> +	mutex_lock(&connector->eld_mutex);
>  	if (!connector->eld[0]) {
>  		drm_dbg_kms(&i915->drm,
>  			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
>  			    connector->base.id, connector->name);
> +		mutex_unlock(&connector->eld_mutex);
>  		return false;
>  	}
>  
> @@ -710,6 +712,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>  
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
> +	mutex_unlock(&connector->eld_mutex);
>  
>  	return true;
>  }

-- 
Jani Nikula, Intel

