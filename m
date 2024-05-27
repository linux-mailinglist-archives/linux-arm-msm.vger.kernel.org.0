Return-Path: <linux-arm-msm+bounces-20628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E0B8D04CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 16:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BFF91C20CED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DFC15FD0E;
	Mon, 27 May 2024 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3GtWWKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537815FD04
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819813; cv=none; b=dAw2lAqLFHTTUIN+QC5MzrQOdG08BhEsmABHT7fbVoyDb910NBEqgPvgu+jVAtBzHpyb773/qitEzh4LmBMI4nBuc6WcgtPaNnKOVAFGiLUPdLQ99+JMDZvgG5j7qjRmt0fEfTB6NqgE6tZql9OzFoBDHsLmbNAqB5fnMZ3pWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819813; c=relaxed/simple;
	bh=BZ7wX/Bpz8n5eiAQ97O63A8D6o9XzCiQVYKk5arzCtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xh8gNSQRH2BHxjpo9+teG1Q/77gybefm/Cw5HjRlmtnRw7UPA1+TCtrn4xu/gJ0Hv2xkcEBDNPvwaRQ4arfF7uckdl/9Xspl88uwW+PQepNsZEnMNA52HygQ0nPcA8bxEPa0FRWkXvCAjT2w+O/ojuDhw8WxZaGtZxKr9V3KMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3GtWWKF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f8ea5e3812so2699322b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716819811; x=1717424611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Z/Xi90npJWSANZU6vr3ADO8xKaQ7p/btP/dc1GbEs=;
        b=S3GtWWKF1w+mvPHjgS/yHLj1jDYj+ueRDpc2XTay793WH7vXSW69X9tgMfNYGaaSPn
         KOcyE4tJ9eYRWh65tQv7IScD4KjRK0lgAqL4tr3XxVo7/2pb/RFj89nAOngQLiTEnBCo
         L4U6obaIhYs1HtYSgs8HjrFu0Sj9ceueJ20viEJSwKSgW2q5+T17f20LSA46MjlTPDyF
         Shs6elhuYIXF/zW1d22q7xy+VpCvXa0veQMKGpojUqAVUMQX+cHENAktx3NC/zdc3dLM
         3qsA6vg9oUzBxB82x5ac7PWbJK0ri4vWTGXwTXS4Q6ud5JHA1IaFBR7GRoGecYBngff2
         Cstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819811; x=1717424611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Z/Xi90npJWSANZU6vr3ADO8xKaQ7p/btP/dc1GbEs=;
        b=e3l7OivJYE5t4HPaQJFH9y/2c6An4Slofy0uFooUn/iGzrqHzMvD8fhvpSBWTMKEHB
         mW6eyQAreYiB68pCaBc3jfO8Fn48GLjU3b/yLNnfyVn3xAHt939Oet/6bJCnIlceRfgE
         caFVKdvMwh1p/qcnFLPF6kXhF30llna79YQgEpq163J55X/LbWBuosphXFW20P9mAGtU
         vyLSIg44aA6wFqNsZzTcfW43jZG/qA7Jkz3rP11tvmwnoy9D7xv603sxXPGb4F/mz6sy
         qJsqKlYhSbtqkQhfHaASCjjREc/MBDrMvGehYTtpQI95yuJahG/5cvVR24jrlA8eDGVT
         35Ng==
X-Gm-Message-State: AOJu0Yz7N+y0gPN5+l9wXJAb0p6P+3Ll+hEdhHKsTJhmKQptFtMjAeDm
	QkUk7IVJCYXwo7oXxND3GF37oZEWVfXDnQMLyTqPXiev8u3ymJyDSMah7no6Zfo=
X-Google-Smtp-Source: AGHT+IGUEW9adF5QWmGNx1DovOuHLsKxPisVNvPhcbc2Cq/jloQiLoZPjjpF/w4GkgiCUaAOTK1iYA==
X-Received: by 2002:a05:6a00:28cd:b0:6f6:7c17:704f with SMTP id d2e1a72fcca58-6f8f2c626e6mr9680863b3a.5.1716819811597;
        Mon, 27 May 2024 07:23:31 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:23:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:47 +0800
Subject: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=3468;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=pcO3EpSEffMXfzg3qm9/56HyKCoO+GZpl6408uIpjZY=;
 b=1A5BlK6c1bwwAerpYBl8UlV6cF5n3ZbY3fE8Nds6gp7rWU/K/IBq1VVN1PiZ+uWBQGtopy1WL
 PbEDmwmC249DHdk1GblzbVPzt8mM+9JWPyReTQIY1dC8ARwGDqrxOZy
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Add width change in DPU timing for DSC compression case to work with
DSI video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..48cef6e79c70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
-static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..2167c46c1a45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC config
+ *   used for this encoder.
+ * @drm_enc: Pointer to encoder structure
+ */
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_get_drm_fmt - return DRM fourcc format
  * @phys_enc: Pointer to physical encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..925ec6ada0e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -11,6 +11,7 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_managed.h>
 
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
@@ -115,6 +116,23 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
+	 * is compressed into bits of 1 pixel.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		struct drm_dsc_config *dsc =
+		       dpu_encoder_get_dsc_config(phys_enc->parent);
+		/*
+		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
+		 * fractional part if there is fraction
+		 */
+		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
+				(dsc->bits_per_component * 3);
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)

-- 
2.34.1


