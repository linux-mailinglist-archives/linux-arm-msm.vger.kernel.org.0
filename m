Return-Path: <linux-arm-msm+bounces-20064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D878C9CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4315282561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD70255E6B;
	Mon, 20 May 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFT4Abd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEA54FBD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207173; cv=none; b=NV8JYOvWqs7MABCRIP1f3Q6ivVIjrzyWVvcxNni5d0TKMXtZCspcSUn6AvnU+lGcmxKUr3Ga9cldw1K5DQSS8mi2gBjOFPsJ21FnyxQyGCLj89oVqyQ+kzR7K867etjmw7enBiNEuSVMXQTcL7phhQ1FcpKNvWkkkHAXGwIrBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207173; c=relaxed/simple;
	bh=bDrKpwdiQQO/7yqHHeSqz8kQDyfWunAboKt0w5ii6fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taBehKxSvIoealkQyjqG9k3J65N4eUZQciu6OJJ8QTBv5WQeJuw8vTUYzNylwnTmUcqnw2gGWYtKDF/GKoTPXneWuSQphvj0g0ngbFJgbsME2pZUwnJRt7ylUrEJnP2C9eA5fQLLY5HPB1ZjvrhcMWXR2grHbNNxSFmtVUKmyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFT4Abd0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so5074741e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207170; x=1716811970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EngRNEegfEjPtk1lyTiOuhRxh7ZIkugIZOeBU7wBZ0k=;
        b=bFT4Abd0WwjxMpNb09Bwx0JPozMeZVdCYccypmvEZcCX/Xxw9x0MMOtMRYlBOxyker
         DfEolPJjpIUZWWJWLbTCZv3tasiVar9QUoU/dvVi3hHK5+qZ3iqO+ry11oP/88YB0LE/
         4dbJB8mJJajJZFXX1rym41IkxQV/zuFC5/+67ewdQD1W8RvRTRNdrtLQ1nCWfsuEUWUw
         hDyU+alaOEi/jz4KQJlx1ZCzPBx59H0cG+cihlpf9tukRqXpbltXv2dVRn61WPp9BEA5
         0pMdMUxRJvGGiLWO9QKGDACTFWmLaxwOXh6uKIQ0CtWjH87jCLl2viHt0NQ6tE5F5i7J
         vq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207170; x=1716811970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EngRNEegfEjPtk1lyTiOuhRxh7ZIkugIZOeBU7wBZ0k=;
        b=f+GHuVCMJYzKQUKcY96EfNN/h9rTy/WxrDEei24DQE2IvAg3W/NokQ9tfVPeJe+2dG
         DrXFB6USKFHeaDuSj24wxFVtUYfk5kvw00jv2UWt4NESWXHC1Ias7b72g3PFb0m7MUWd
         e2Nez39S2ax8DgDKUql6dUlL+1/+fIj0HvZhr0XKBqvyP4M3xquNIsYdbOKBvA8qI6ZX
         wgr5oLH4UEvKnD7GJ78G/zlKgFx0DUM1zkvX57spHB5f1h0uIiuQ8R4/BeUPtLNVmgq8
         mfMlgQh13ESHTIr8H+gQQRo2Q4z9qRXE3uHs5QTATPb0UZxpstl+UXPgkfmPi9jEFf5f
         hh4Q==
X-Gm-Message-State: AOJu0YzgWslnl+ol9Xh9j67SLlkkOMQdzPnbLyLs8RbQYosj+tqIXaj1
	5Rj5ZvTQZnbclqk9eX3N20YI7vng0AYuqgZDrF+WvW04oUxESrD4gALZPy+DzWA=
X-Google-Smtp-Source: AGHT+IEYyPQvYUPUkStl7KT7W6EBwKTLfRV+KK4qV5SWFd+bL47S1rPoRfmfxHCn1nM/BJ6/LstSyw==
X-Received: by 2002:a19:e05a:0:b0:518:ce4b:17ef with SMTP id 2adb3069b0e04-5221006cdd3mr19262792e87.60.1716207170564;
        Mon, 20 May 2024 05:12:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:47 +0300
Subject: [PATCH 5/7] drm/msm/dpu: rework vsync_source handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-5-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDrKpwdiQQO/7yqHHeSqz8kQDyfWunAboKt0w5ii6fE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz49AMFTxVsOTQ6II89mW7JkSKQZyAIvHbgJH
 GxIP0WdhFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PQAKCRCLPIo+Aiko
 1UxpB/0XrJ+wL2heNZBu+e/GS36+zBKxFzinOB9jN7LtSt7GELN2B2DbynOfvt1Z45kgyVqKx38
 UN2uXeXYzkKRWoWwfzbZw9tiKiKFA0OkCj/JCOS/Z9kGU4S0f3+/cCentspiGssxmouiLyKwG25
 0xrAfeAo5Gh8C8hnUt6uPv3BqfuaQZByJMVTOxGtGnxkgDNloIXu85lrdgWcVdVAIvYe9p+bYGx
 tL20eForFg4k6aDr7uZxZ8VrZ59t9aFKdFHNWXuFu6wmwV9FW94bVoVFqNZqLQ5BJuIPA/cLTum
 BmBjE8Lxto1irvaPzlrAICxldSLjkHnye+trSYfynhWxLR+6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The struct msm_display_info has is_te_using_watchdog_timer field which
is neither used anywhere nor is flexible enough to specify different
sources. Replace it with the field specifying the vsync source using
enum dpu_vsync_source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 ++
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd37a56b4d03..b147f8814a18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -743,10 +743,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		if (disp_info->is_te_using_watchdog_timer)
-			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
-		else
-			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		vsync_cfg.vsync_source = disp_info->vsync_source;
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 76be77e30954..cb59bd4436f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -26,15 +26,14 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
+ * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
 	enum dpu_intf_type intf_type;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
-	bool is_te_using_watchdog_timer;
+	enum dpu_vsync_source vsync_source;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..e9991f3756d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -543,6 +543,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
+		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");

-- 
2.39.2


