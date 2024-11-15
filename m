Return-Path: <linux-arm-msm+bounces-38090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9C9CF6CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860C8B2D8F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 21:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D131EB9FD;
	Fri, 15 Nov 2024 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBdWay5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48861E885E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 21:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704990; cv=none; b=G++zhC57ra3zugQ1VOaKx1QeJtXExEiRL2LfrGXsUb8ewr+9sjq7n1FxlZtQpQJxx9/cviAvHhLo8XBLMYlbjK1Dxa+a/JmEQhJzNQszVw1pmkP8njM8vQndk+o/hcVIjH6TrIiznQkzPbVsko6hWvvAgSvqWQxyZ0i7kEopKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704990; c=relaxed/simple;
	bh=oLY7+gEEQX5y+IrkZsspi4uhz4i0DjMFBoH6fdvMkJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNagrTH2aVy9iNSwzbCPPHsgpR1kkYcLgCYdWmqyQptxcEyTm4xIntm9IgHsbnbQFZkocEDfsnqIDsW0zDrFpKjGVSr1Sk9hGD9zSh4coO4hBuO48NzJ6sOWtIBX+rvqQ9uuFzd4gHSAtXmNvAXtvOg3sVS3Poxj2mXve1r4Wv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBdWay5Z; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ec86a67feso406762366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 13:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731704987; x=1732309787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsYKkvhpGxYN/nsXndcDcczu/pyOBha9maYVfqCaIuo=;
        b=rBdWay5Z62KLw7zeoecZgKhd2CDUPAnPm1vPOInKzlU/tQe6KNTJnNTbSeAiSVCI5W
         tSEKqrFHVNjk+EQ7ZYzx1DezYs6TjCxCO9Il6CLVqyJKIxcmgJdq15y+/vA78jEKqKD7
         jD66ObbpLyWTBjcjSwJjppdEsTMjDc1690fZLHEQnEy274hYtzIdJ+fKOllqb4fSJraX
         2HQVmbr+Iini8f6P33rsWRsSYJPUJ7PhuKM2InPmbcPcZIGfLz9dTTJOfWkjU7fBZzyt
         Z0YV3DVyZb1mZXZ3HN1A3dlxWBB3gP8x2j0GhcydZLA0ZEFVH/Vu4Xlzq+eIoje8esMx
         hTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731704987; x=1732309787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsYKkvhpGxYN/nsXndcDcczu/pyOBha9maYVfqCaIuo=;
        b=mAf+J7bMwIAzGxxWxGoLd7ENdj6FI7NxaruQbMtWRxCKAh2JEvp4+fnx9P1kCtYY8a
         hkMAlIo6OIQaHfyqDv1ViQOrOBxuOZPC+pTY8Y29flqGgkciaN8S/tv8xDDbNDzgPwYq
         AUJap9AHlZXKaSX9A6cYqwud/pdHdhNzaXynNjFaFwcyW46mImmtYmiiCv+1u4IBZrUp
         t0YiaDWV4dwThZYV5+QmNc6hhHAqYPjpyV9sRwPcpj+0BW8hTz65CB5M2Zrhv71XYfLw
         OAslPE4zzSVJXEKu04pQekB45nxOs7126iIcw+JEsAh75TBkLXugkWfeoq0bYRpbSVEX
         Nb2w==
X-Forwarded-Encrypted: i=1; AJvYcCWki0doE2JK0FWvwg6oj6AwG+ZaipvRS5pfGJInMpJV25DV5OuXMmyLqrBik9HpNjFMH/E5ThFMhtaJPqKk@vger.kernel.org
X-Gm-Message-State: AOJu0YwARGqZezclXBoPnF2+4YTckDT/A4Fbgh2AHgj9GfMv0vZET9eY
	yQK7kqWz3ucBWXVzYxl2e97JCojD5eF81DvedvXCZs5iFl0huEycZDxNfzA97vY=
X-Google-Smtp-Source: AGHT+IFDdo4Ez6qAhnttBnH0913iVcsIQD4O+jaLTiUgGyLyyVbk2JIgfGuTK7H0cxIlhnYIHXnI6A==
X-Received: by 2002:a17:907:3f8c:b0:a99:f1aa:a71f with SMTP id a640c23a62f3a-aa4833f7487mr324293366b.11.1731704986921;
        Fri, 15 Nov 2024 13:09:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 13:09:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:09:29 +0200
Subject: [PATCH 4/5] drm/connector: make mode_valid_ctx accept const struct
 drm_display_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-drm-connector-mode-valid-const-v1-4-b1b523156f71@linaro.org>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
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
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oLY7+gEEQX5y+IrkZsspi4uhz4i0DjMFBoH6fdvMkJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iIEAveRWXmQWe1stGwllWWTGsdTdE1s1iig
 2BzWZCF0MOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4iAAKCRCLPIo+Aiko
 1VHTCACzeIvQM2U7UstBpUccYyFqIL0ngRGXT9/4FmsiQcx0+H2ouTVyisjg/LLZ/vRZ+Sy9Dap
 CcwztsrQ/32zb6SYfgOsdyQRoOBbTT5d4lzTS3Pe9PABuei6dm0lj3mJUX/Od2xwaIJT3Zqa/Du
 JVKMw0vQvye08hlE3x6j/j8rF64zNh4t+0I5ejSfX+SAor0P0cJvSZQSJyi541ezhAuP0uOH1Mr
 rZ4A7KbZFucqd4yp5jfQ5ttsyivo13fQRvEsVxt7dLMmFxP7HQgPei8s2hZj530wtj+eTAExRFs
 NJFXe4LNfD5wLcUeRZiZMoWytSAqd5NxU3rpWQDXs06KLhfd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
accept const struct drm_display_mode argument. Change the mode_valid_ctx
callback of drm_connector to also accept const argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 include/drm/drm_modeset_helper_vtables.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7be8fb047b6c17cb37b9021a2dbf430f0aaecfa2..cfefd89209ca864e19771c538ca00016f9322e74 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1432,7 +1432,7 @@ static int intel_dp_mst_get_modes(struct drm_connector *connector)
 
 static int
 intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
-			    struct drm_display_mode *mode,
+			    const struct drm_display_mode *mode,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    enum drm_mode_status *status)
 {
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ec59015aec3cf3ba01510031c55df8c0b3e0b382..fa9ee6a128bec0205f501df6f7634757f5fcb9ee 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1006,7 +1006,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 */
 	int (*mode_valid_ctx)(struct drm_connector *connector,
-			      struct drm_display_mode *mode,
+			      const struct drm_display_mode *mode,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      enum drm_mode_status *status);
 

-- 
2.39.5


