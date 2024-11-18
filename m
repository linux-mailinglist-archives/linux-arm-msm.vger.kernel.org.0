Return-Path: <linux-arm-msm+bounces-38251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EA9D18D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 20:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7E6282C3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 19:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BF71E4937;
	Mon, 18 Nov 2024 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGbJCi/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C851B0F29;
	Mon, 18 Nov 2024 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957962; cv=none; b=n8dw0X2fu4uadOlazkBCbcCpktlLh1mJwY+5FUuIevDPYyxxU/+9hg/u9oI/2jEkcMzLJd2O0+o7Yl2qTZyddu0vjUgWE3Dp+JY3s4jRPwGSP6XByQoGLX+tEDfWwt2V3JEZygKKfbM1Ic2GH9Fi0NPhY7tYUp1778KJgyNlA4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957962; c=relaxed/simple;
	bh=IvvPfEQx8+njDlP7eg+rVy3Zr9WN9X65JlqiJMcGRGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emKaT9eNrnuIG0UloXvcc/UqrJLJUXjLsNdOXM5mHwIKCqOjWK4QRy5Wm5rEvwYzildj6nCwmErGeIJhrf1ngcwo9s7DKUPeyb7Y2omWZeIEuKOCjF3st9PRsdx+k98JyXu1OOiwByGDIhUGcjgPu7jplg4twa4COBJ4kbCpUPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGbJCi/m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314f38d274so34322885e9.1;
        Mon, 18 Nov 2024 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731957958; x=1732562758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pD0Ic6pq3x9QjpEUEJLIp8QMqGQFkQZMFW6bkNDgUM=;
        b=NGbJCi/mlaXf66xjltm3wbnqgsr6gw4KnBQrEddbXgEMWaMazD4qgZzbvn+7DbXBV6
         CaLTV/L8DJRMyf4NWjsXhGlwem9noMF4V+9dW9xYoSwoDhg2EVYgmT+uS5m0jdueejks
         uW1mcA9swheFOr7nAClPVpicB/TUE3v4fShItDWPIYwF5aMJVGuu+/BZ+WGGvhVwxPXI
         G2RglzJbD9yt/GMp2I+ysQF6Umzgq0f2j0Uv0Ie5Ic95ngq7WPp5tQc2QObd+7i20zoS
         Tks+BUlz+PSOKvFHFXbKd7AySk/Id+R7RYoacW68qR5qsKsxcIt7LzIoCvWI5nMLKaBm
         7KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731957958; x=1732562758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pD0Ic6pq3x9QjpEUEJLIp8QMqGQFkQZMFW6bkNDgUM=;
        b=ggmUfgQC0qO9W9JgSo57CqeyKrlfx9wx0O8GIOrRU3+GwBdAtsNEcIqvfeI2xYGcHj
         i1coJdinvGcCjKQR06Ajh/3lpH14spA/Pv52YMSkf2b8zLdkKh9ioh7ytbli0h/8AleQ
         D+p3NVMg0EHKsImVg40ZOEHUfYgOGHswGhSHhaGP72uV2sjTddgXkvanucwzicrzJsmW
         pHSNKzOZxfgh2dL0yrKjz8zxbRrlOo9LkEUkvTjif0bYa2LaUwqxOVOsw/s9QRLt6mV2
         jqN5CFhWs4eJore9I+esSSuvyVEB5WvbEweK9OUo6Ufq8/QWsDU7FCnVzO0RkZd0b+Vi
         z7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW3g6H6yHx97QOikq+TiMr4Q40Ubd71N7BYpTaQKvuDUXTW/iR20tKT80OX4pAH0XrzmDDbZU6IgXKOuoJmH3YDlGM=@vger.kernel.org, AJvYcCWHldM0H9iHRVVxfij/uE5GjRs8i/yQRgxmfLQ/YZXB0QvZzmcg0q7iPxSGVgfTp8SxEbDWDA4Wha5esI8d@vger.kernel.org, AJvYcCX+hsNxE4Cez3taX/G8hikNI45TuqqpOhlr3n0cZzp0W3b6E2pb0XpLVL5t4g5uL/hktgBfcFEj3uu27cc=@vger.kernel.org, AJvYcCX5MtRSG2lcmES6Onf0jM/6BkkAV8vb+AB6B7usA2cUquzmEuwYTPZfG/JzG4RQ1gVMGjLOvnTM0FMD5MpB@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrTbAshYyfHyUO9mN9X7kmrn+ewd8wTd3KwdMVeW2CRD8C+S0
	l+p6ihFSL5AgyekiV+2hDO3U/IS9kNSXA0R9Vq4cLAn63RfO4f04TwLomFoT
X-Google-Smtp-Source: AGHT+IH+lcOQ8Rj8oM11CtrUWBNXK6zZA1wltL3ZBTXjDjqXIpvoTVhgtssacVRTup7RXCuDYGl00g==
X-Received: by 2002:a05:600c:1d97:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-432df78f3demr130180715e9.26.1731957957571;
        Mon, 18 Nov 2024 11:25:57 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c81sm172023915e9.39.2024.11.18.11.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 11:25:57 -0800 (PST)
Message-ID: <8a4f69dd-b393-4e84-be3c-58f8b33bd59d@gmail.com>
Date: Mon, 18 Nov 2024 20:25:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sti: hda: pass const struct drm_display_mode* to
 hda_get_mode_idx()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-3-b1b523156f71@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-3-b1b523156f71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



> Make hda_get_mode_idx() accept const struct drm_display_mode pointer
> instead of just raw struct drm_display_mode.  This is a preparation to
> converting the mode_valid() callback of drm_connector to accept const
> struct drm_display_mode argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Hi Dmitry,

Thank you for the patch.

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>


Regards,
Raphaël

