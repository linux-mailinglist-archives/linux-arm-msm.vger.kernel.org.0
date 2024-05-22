Return-Path: <linux-arm-msm+bounces-20174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C198CBB38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 08:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3CAB21AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 06:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569B07BAFF;
	Wed, 22 May 2024 06:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaefPGFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8778C97
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359161; cv=none; b=J0McEOGRafCZGNZi+DugmqlmMepX+Xu9fuiP1jUQrp7a1cywsDduRMHqzMw9vwms/cFUQE18lc4ThgiEFGAJ4PwB7UAhKqxMLbzyYrZkUVCV3HRtzxnW/sGxhADXANK3s1j3P9DCSsbv/8yxzpLfZuS7ikAW92kV24Nlpi5NoRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359161; c=relaxed/simple;
	bh=fH+OSt9OM8UNGfwVeAJVCDuCmITk5njhlKqnGjulroc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYxYrKpXmO//h5AKZvHtGLrsRZuRNpmg+J2uz1qoc8gz3cE1iZWYLc3Vdb9ahKcLMoMiyZOnV+7+IHy5Jfa/sXmUsP9IW3jr1966D05LIUgPgs+iNdh0mkpqXfbuu/XVW3Dbs15haUBv980OEgQiexEI5WufNpxvv73ZrwIeG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaefPGFo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5238b5c080cso7619827e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716359156; x=1716963956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTZe1zFzdkSYzyWKCJT5gwUK2Y3k8Ui8hrHsuYKTseY=;
        b=zaefPGFotmjyw8qeisgrXWZElZhBYoJpkUaz6YkQGu2UyxKkEHVhCfE7d2lQrsd2Hw
         13o3imJC+Ebz4aCWZKFXL8Qoj70klwTfYYktsSSw3jUcyHtv8hfkt+lMefmWCEW9pLTJ
         YtcgEEiJsJWDXHA7pNbNmuOHBnG1SvhREMQ843tfYJXod+mk0E2/zrs6mnjsEINc6vz3
         vrsLOwcOp2X61bT6wDthh/RxzBtiqWlBR7hCMviE7UiDZ1ZJMcLnGnLCUCWtQHNDZghk
         aR9NSTWWjRBhl7tRf4Oe/sjceGOmfl5KANv63F8jUpcdlPYBDQcWLzwrDZOffXUe563G
         otsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716359156; x=1716963956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTZe1zFzdkSYzyWKCJT5gwUK2Y3k8Ui8hrHsuYKTseY=;
        b=GBchiGtnK/rfZLOEB8wc63G8afPQQfPvO1YJkPxY2JQwpt0CUsOylFyn63IuDC1v7D
         3xXu3iR2drDWh9SG2bVmBhodR08HnPGmwoUfbGneP7IMUEpBsrMpBGwdouYgT05uNayU
         2r1VQ8B7w2kEC/8h5uYcSg3oGPPhz6t9awCz6AsJ4A03foTKrHUWv8J/z4U7DW8JToLL
         iqxBJvWXVy8qJvPnjN64lApqxLG9hEKEArnKV2U7MNG5DbdInlkwypxIzSZAa8iT4qB+
         9xUpQYtvw6+hLynwZ1MeR2CTU3tTzKpIcD5FeDg71zCCLBWUxAG/zmKEWKhdrKkfuBVx
         7Pmg==
X-Forwarded-Encrypted: i=1; AJvYcCV6KOm/at9emU/EIR9kbQKgWDpuCXzJym40Ne3m8lq3SXNVasSLZ6wwpA/y+QlyKc2uWej0epyIj9hLyNEyC7XNYgdlef14P/AGZ2ow/w==
X-Gm-Message-State: AOJu0Yyw3gd2zsocxu3XU0L8fxzXICDJsMCU/lfr7oRYjcxKXvv3fIjB
	QJXXQri+71mdkUpvdQRaHnHR4XhSoldtMjbfh174gJuuzANdZk2OJbW/4h70LBg=
X-Google-Smtp-Source: AGHT+IEZVRrZq3oUNpZjU4i32YjLGKPNJhpf5AHOlxwiYYT4wZFdXFFUQnh0fUb6PaX1Toq7HkSnFg==
X-Received: by 2002:a05:6512:1cb:b0:51e:f2bb:158a with SMTP id 2adb3069b0e04-526bfc02c09mr459245e87.64.1716359156371;
        Tue, 21 May 2024 23:25:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 23:25:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 09:25:53 +0300
Subject: [PATCH v3 1/3] drm/display: split DSC helpers from DP helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-panel-sw43408-fix-v3-1-6902285adcc0@linaro.org>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
In-Reply-To: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fH+OSt9OM8UNGfwVeAJVCDuCmITk5njhlKqnGjulroc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/xRFUSLJsGA2LrooHaFUmFf6vDxUFO1mrq0
 vHNzs2ntYeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8QAKCRCLPIo+Aiko
 1cRVB/41qAd9/BJy4mTQfxR1VHMssNg03EIjqlJi4ZoifXTNOaJ87ZjhtvO6fPhmqozbkGBdXzA
 WBAsNnLMXnytQg5E9GBa7zA+nAOpO4L4s2Ux5PjB5GWlKF3D1hsfrwbjRJeAnfpvvELjaxqhPvZ
 7Fe73Ovu0fDwIV2mhOQJmx2RAUi0q2C13z+fKgZ6QAfKK8IPstuoSH9/NwifZBKQdbGGMPqXIes
 w8JePzXY3EkOY3fbAQiYgiXNgFQ7ATcBQW6dkJNpUUYeqD74T+dKNjgJq4tK5un2zi68dX9X+2J
 0qkcRw7g74nfGjN1F14uHrkALsZqPa0MqlcusfZVfIXzh2DQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently the DRM DSC functions are selected by the
DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
code (both panel and host drivers) end up selecting the seemingly
irrelevant DP helpers. Split the DSC code to be guarded by the separate
DRM_DISPLAY_DSC_HELPER Kconfig symbol.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 drivers/gpu/drm/display/Kconfig    | 6 ++++++
 drivers/gpu/drm/display/Makefile   | 3 ++-
 drivers/gpu/drm/i915/Kconfig       | 1 +
 drivers/gpu/drm/msm/Kconfig        | 1 +
 drivers/gpu/drm/panel/Kconfig      | 4 ++--
 6 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef527..b69d5c4a5367 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -6,6 +6,7 @@ config DRM_AMDGPU
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 864a6488bfdf..f524cf95dec3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 	  If in doubt, say "N".
 
+config DRM_DISPLAY_DSC_HELPER
+	bool
+	depends on DRM_DISPLAY_HELPER
+	help
+	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
+
 config DRM_DISPLAY_HDCP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17d2cc73ff56..2ec71e15c3cb 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
-	drm_dp_mst_topology.o \
+	drm_dp_mst_topology.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 	drm_dp_tunnel.o
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5932024f8f95..117b84260b1c 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -11,6 +11,7 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1931ecf73e32..6dcd26180611 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -111,6 +111,7 @@ config DRM_MSM_DSI
 	depends on DRM_MSM
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
 	  Choose this option if you have a need for MIPI DSI connector
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 982324ef5a41..4a2f621433ef 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -547,7 +547,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
@@ -905,7 +905,7 @@ config DRM_PANEL_VISIONOX_R66451
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox

-- 
2.39.2


