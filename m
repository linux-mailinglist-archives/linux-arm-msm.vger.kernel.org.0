Return-Path: <linux-arm-msm+bounces-6530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306182579C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 17:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B880828260D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C7A2E823;
	Fri,  5 Jan 2024 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4p4Rl/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71D2E637;
	Fri,  5 Jan 2024 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc20b4595bso959515a34.0;
        Fri, 05 Jan 2024 08:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704470667; x=1705075467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whv4GannslDB5rLdYo9kigOWmeo7QZDRfIfNrJXqKEw=;
        b=F4p4Rl/RNfr7WQJzhwayD5vfsuY4CSDw50awZ5dfOwJISHMsFKoNWBvWeA31AT/kfY
         VeBEIhHyl2Dc2WqGAu4fJxtRplw9wjN8eOP0kc/W4GZU7W3ty68Yynti9AoZwwWGtcLe
         2sRMUS5Cb40mJT53m5Vh7XEKq3XO2FNaO2U2mciHqJ7m2FD6uEnRpcR7bRn4wW7zdmDc
         8280+qpPQ18R6XWqO73xIX6PVApzI9a3GbZiUVLCpoTF7PM1/dPf3mtiO78yFwLvKs47
         I3/wa2iMALnNd30PIuimsy1vBiHOoCsKFGaEqHf1tK/DRjaFFk/4mpIl62CKF8jixeET
         ytnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470667; x=1705075467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whv4GannslDB5rLdYo9kigOWmeo7QZDRfIfNrJXqKEw=;
        b=OapOlw8BlGZqx+5dBgpPx5YZjjyAlWYQp2CntpOriTXo9zYu3Z/NQSJ4juAR7Yxxwg
         GMoPnbvUtr4p+pEBFhsbRYvONxUofJbTGTLRvu51uu16iac6yfyDQmW63wgORf32PFbF
         R+aYVzRugMYDjflNi6x2RZUdu9jBD6jnwkF1m/gfK69+mitaFZmGlMJeHibkytWiXAQt
         wX6FV8mfsWFQFs38uacfZxZRFfjAvgQ+Gl1YGA+MInCz1ALKiDFpdq34rkR4cffoRtnU
         ZtdnQ4SVfiMQV63HcDxGnrKYTmiWlwFV7FXemQsIUEV2eXXR5izZ4ThkqZ+dRJchid/V
         urRg==
X-Gm-Message-State: AOJu0YwoP1o6g4PIIugv/pvlIk2HqjG00FyMmML+9L89RJp8YKamC4lH
	1Azj2vLNTePVHRhu+ceSPLU9qPNpCnv1IXcS9PU=
X-Google-Smtp-Source: AGHT+IEyWFcej5XGL9+gHh+h2IKOiy8VOKFo3RMc9yjKxFm8wxHp0Hv+8oSB86SBuzomapKqFUADrLdZsYPC/g2EVRs=
X-Received: by 2002:a05:6870:a118:b0:205:c4d3:ef8d with SMTP id
 m24-20020a056870a11800b00205c4d3ef8dmr2376611oae.104.1704470666931; Fri, 05
 Jan 2024 08:04:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104201632.1100753-1-jani.nikula@intel.com> <20240104201632.1100753-3-jani.nikula@intel.com>
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jan 2024 11:04:15 -0500
Message-ID: <CADnq5_OBNc8TOErS+sXMB2OuaqT0PdOU7O0+MHGU2pEKF10GTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org, 
	Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
	linux-sound@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Takashi Iwai <tiwai@suse.com>, 
	Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 3:17=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.
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

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

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
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
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
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
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
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
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
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
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
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
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
> --
> 2.39.2
>

