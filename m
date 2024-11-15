Return-Path: <linux-arm-msm+bounces-38088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1549CF6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D0C1F2464F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 21:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B851E571C;
	Fri, 15 Nov 2024 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkntcCHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108B1E3DF1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704983; cv=none; b=SgFUP4ArQDvpdNJswm551lFQr7pYAiXrv4zo+ndy8xDtGEGXxt4eUxUJr9DjbIZ0xoLT2GGBYkFr1mj8Gw15sq9zqHCDZwvgZKx2k/CMxgWlAlJnmzDGmGyDrGLW5puNqmdO7Yt2BTTaknf/0iwghWPRdXoMEeLgh52DqE+duZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704983; c=relaxed/simple;
	bh=8PHqNvYNhd077+yMZGdRVPVQtJwqcuP4Sa84pHByMBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVzL658RMag7MNWOgtUc73M/xji6Fku3VFjPZttQdjqaPxwGQiDBPaa5L29Xj1g5q/qcTgNFqG05BNQE1dd+5ifLcBhPKgf52/5+T6J7z3+5fClGCFa+rsvJ0Mv2Hejpnl4vbIU4jR7vLMVHnv/K867M8FDoTF8IlI9/yEhXBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkntcCHO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so6598a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731704980; x=1732309780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uHMCkPLDPF5XZhqTYsDkYOtTqtnVR38dCpXI61ABZc=;
        b=JkntcCHO/4sptLT1ROv63/XQSbqFZi3bW8HKLXVmuP4qY+eA3/B9mSXucdrX9NnPar
         6YaXSdA9gWy6xcyrvOdCHVfZouMMyPd2rBx52Z9/u2ud69icu3GPc/aFoqwmMcFyAJj1
         vjAm/TIxn4B0QPZuTKSu5TS+U5l0pfi/QPLSgpr3ZtNv1J/7vtS6wYaJkxjSddYT+lvy
         ULiFzJYGNrW+LpCzji5QG8NSWI3L/mTXljaedv4KVynEozetkmnAzg/5vyuG+ZPdDi6h
         dwzhkGvkMgloTCbCMt8SUQeR6Flql0ONTOgMlxlqDkGM8sBjagVqyWFzHjatRqp2Ylon
         FKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731704980; x=1732309780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uHMCkPLDPF5XZhqTYsDkYOtTqtnVR38dCpXI61ABZc=;
        b=AbeYkdL0tipq4gNNGEzxAF8BSs98xz7RsPHvjuu/AYiWUfIBgQU2j3XDSG8vFllQBM
         cR12RlIIcSwB6X2Lj7uL6fmYtp4CaB1omI7bg1rz2dsXefs3+YUyqb0JTtQFqaeg5SXG
         1P4SbloR/3/xC+SHPiPHoH8/8fWkLGqYzn1ccrl+4k0pOBhhrIZk4hFFNOpI8tJSwSoj
         2eJf5ePtZ0VTHrsSP8O4CfmsH04uhs+X1KXzoRhD82aet2vJjp+FcIF9E62MNswKWQFx
         P4qqBw3FcdEOLsn6G+8TQWun+z7gHtbQnoc9tG2VyloToCZfj6aO37ENRjr5ZWwZEKqz
         ZE+w==
X-Forwarded-Encrypted: i=1; AJvYcCUJqv/GKC+v7tdYcEFc5R/+anj+mCy8hL4dhsyK/FYMCbwNq8xkDv1gnUa6MBc9yn5o+fmCNcdJutwZ1y8O@vger.kernel.org
X-Gm-Message-State: AOJu0YxfI7WUA0APNAUTjKhowvXWz3I4X68iaWZhqwkQFi6uYGaTW4G5
	xnZjPnSh4HBFWTGptqvxQeK1tzQNx7/YLfAvokiPm7WP7EBNNekxHIuClZbZVek=
X-Google-Smtp-Source: AGHT+IGxHaf9fcl9XH3Yy4K6OzfNJb+yIGPjb6McxskUEb9IogL1YLwYggNBzkIhim2sOLfufDW+VA==
X-Received: by 2002:a17:906:ef08:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-aa483528a6fmr360455366b.42.1731704979697;
        Fri, 15 Nov 2024 13:09:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 13:09:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:09:27 +0200
Subject: [PATCH 2/5] drm/amdgpu: don't change mode in
 amdgpu_dm_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-drm-connector-mode-valid-const-v1-2-b1b523156f71@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8PHqNvYNhd077+yMZGdRVPVQtJwqcuP4Sa84pHByMBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iIkCEBV+I5bR4TS78RU0e2MvivZF+Q9IyXw
 EixhTur0JyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4iAAKCRCLPIo+Aiko
 1RrDCACt21MZrMiNUMyxvhABQ0cPHvM9U/AgIbDDO7KsAj2vwEdyLShml6B1R559Jq8voETjEL9
 +078yb1nu6CV+kEVMsCLyWFw6UxeB+cYhzNHLNY0XaEijGUK9+P7bqa1vk5P0ciW3yNlxIBE4bG
 Pbi3ypuJJQOMFd2qx/gt5R3ZNRVS0e/OjOmoRuxABzzNp/GA862gAioxCBoETiqKvawiyBMRFOi
 2ofeAeyKDJWD0PfvL2vatCO6Dh4kmfG8TJG7CkGnJtYNGqCMpr+WoR8TW/0eoaN+Rs47pTYqp9X
 88uGqYaDw6lWG+6NGKvhI0epp0XANid8bh3EOloIMBAU71W4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make amdgpu_dm_connector_mode_valid() duplicate the mode during the
test rather than modifying the passed mode. This is a preparation to
converting the mode_valid() callback of drm_connector to accept const
struct drm_display_mode argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 75d6b90104f8fe196df06383b20ee88196a700bf..d0ca905e91eafe6c53f3f2ebdf3f2ae9589d7f89 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7381,6 +7381,7 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 {
 	int result = MODE_ERROR;
 	struct dc_sink *dc_sink;
+	struct drm_display_mode *test_mode;
 	/* TODO: Unhardcode stream count */
 	struct dc_stream_state *stream;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
@@ -7405,11 +7406,16 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	drm_mode_set_crtcinfo(mode, 0);
+	test_mode = drm_mode_duplicate(connector->dev, mode);
+	if (!test_mode)
+		goto fail;
+
+	drm_mode_set_crtcinfo(test_mode, 0);
 
-	stream = create_validate_stream_for_sink(aconnector, mode,
+	stream = create_validate_stream_for_sink(aconnector, test_mode,
 						 to_dm_connector_state(connector->state),
 						 NULL);
+	drm_mode_destroy(connector->dev, test_mode);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;

-- 
2.39.5


