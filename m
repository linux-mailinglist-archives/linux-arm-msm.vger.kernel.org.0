Return-Path: <linux-arm-msm+bounces-6865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A938E829642
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 10:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53431286D8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1AB3E47B;
	Wed, 10 Jan 2024 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvPUQsBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B83EA92;
	Wed, 10 Jan 2024 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704878651; x=1736414651;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=VF4GGDezjMD7BNAmxD35y69aoAxh53pgorC7gnT0ZLQ=;
  b=mvPUQsBbc4/tB5lbsPuFkx/+fY0pmGbinBS86cLPhUYC4MgmrhUud5Pq
   d6ajvmDUWhI0+sz2lJA9tnrd9UGkIQbdshZmjy5MDaZY7+HV1DVqyauqx
   AWinBiFkFxtvekp17s6ApxVHmmC3c1ozJLQeLAEsKzuzgbWCS+PqbrPOL
   UoStKmDMAxg0TZAJhK+YQll5lYRcNT8zogUiO8/FozzoFfr6A1BTVRtPp
   5Oy/upDaHjSkP/mthByEegGDHe/6dsrtabLlu5zR88q53xogqrIqE0S0Q
   qHZjktGJlXyUHUNRjf5BPEIOI+A+q4qg2UQoLiUvEPR16El0Z4uWPV7xl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5545830"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5545830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 01:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="16576374"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.36.240])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 01:24:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <20240104201632.1100753-3-jani.nikula@intel.com>
Date: Wed, 10 Jan 2024 11:24:01 +0200
Message-ID: <87cyu9wngu.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 04 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.

Jaroslav, Takashi, ack for merging this via the drm trees, please?

BR,
Jani.


>
> There are some files that get drm/drm_edid.h by proxy; include it where
> needed.
>
> v2-v4: Fix build (kernel test robot <lkp@intel.com>)
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
>  drivers/gpu/drm/tegra/hdmi.c               | 1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c             | 1 +
>  include/sound/hdmi-codec.h                 | 1 -
>  7 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 9663601ce098..b9205d14d943 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -18,6 +18,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index e971b75e90ad..f3f130c1ef0a 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -21,6 +21,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 52d91a0df85e..fa63a21bdd1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d37d599aec27..c8e1bbebdffe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
>  #include <drm/display/drm_dp_aux_bus.h>
> +#include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 417fb884240a..09987e372e3e 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f05e2c95a60d..34f807ed1c31 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -35,6 +35,7 @@
>  #include <drm/display/drm_scdc_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <linux/clk.h>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 9b162ac1e08e..5e1a9eafd10f 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -12,7 +12,6 @@
>  
>  #include <linux/of_graph.h>
>  #include <linux/hdmi.h>
> -#include <drm/drm_edid.h>
>  #include <sound/asoundef.h>
>  #include <sound/soc.h>
>  #include <uapi/sound/asound.h>

-- 
Jani Nikula, Intel

