Return-Path: <linux-arm-msm+bounces-22615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABF90794C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A661F2499D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07F414A0B6;
	Thu, 13 Jun 2024 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWDm4q7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002EE1474D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298313; cv=none; b=Ujmw1IEvupiM/BBvQ4T/qeoem32M02rUsIQ7y4uIi2g9aWjC8xz6/GISIYkW1WuQK1omNy+qfMdqVTYcpi7rFaaB+2vmskgF+O/B89sD/ReQtXYvNk84NNxyuChVKq8xvb/amQ90mml+TU9i+NbyihMK9MIxVw/MztBwCJNn+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298313; c=relaxed/simple;
	bh=0Iv1DFyBhdoY+/Sz6mfuH/zko7qqu85Tsijz4fV/RPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+ruCQ/QXre+bsDowoZC1Go0DNNZNAFIqPbBNzUFoWW34naDeNnyZ+uZL7NXPpY2hVceUBy6t31yx2BaMyxZBfE0Yy09xB/oaHYXiSOXXSDJBUo8wM3mzw+PrnD3jSonWEHMW9XAE3PXLcBkuEGfCagi01CVLypTLKC25fMnR6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWDm4q7Z; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c8973ff29so1319809e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298310; x=1718903110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ9HURv6FH09oBoBFNfJEOvMeQCHI23ql7MJjHP3eXs=;
        b=mWDm4q7Zs6J3X+EZgU0mLYsv8/05aMF7dbdYDwE1gQaRrzwmoommAXKS2xCuERZfei
         XfhzKiJepz36kWP5rnMoCOSRoVfb1KJgA1IlJ7I94zygIRHr5lWqcOlSAF2OPxVvuzZV
         XOyMQ+CAGtXhnRDbeCHaUh5oFtiaPGiynf8XiqdhVrt4Nwa0+tQnI5Qu4yynfeYwet8p
         zhJIuKmz9+Re6eMsUQSAGS2ZWt/fSjneKwyYmdOcihOCGV8E1dsHuQjgHg35yczCQZ0l
         Gl09gbtpsjd2vG1fMyjfcA85m3BtRxcLI0V5Uzcrqpt29ArwLP0oMij3DC3oTTqfEEjt
         9FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298310; x=1718903110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ9HURv6FH09oBoBFNfJEOvMeQCHI23ql7MJjHP3eXs=;
        b=BoeiY/YOWdnc2ul1jA9WKrGQSE++dfoqQzJEznV0UcPq3AaJ8f70zxOlJwMZqKcKM5
         FCY80tAddMI8WcVfWjAz+lusvWSbdzSAy/agxQMQeJzmR756Tc5jELkE5fEKTbQ56VVn
         sAfBPgjRJRjNuSvFwqdJv8i6N1yvjUiQYc9nmGgZx073KcsTN70Ir0mIf/G75CtYlK7u
         00qpaCa1dX73sC7C9M/JZbgJ6MNq1QljXwEDc6cxYsriHTLW+tF5NophGTX3eakRPIEo
         YyvmX4s7ATHytUh9fsJ4vDqZfkH0falNcxVfRNkfPXsrykfmXo+MwOLSiVFdsxJmTyHe
         QcJg==
X-Gm-Message-State: AOJu0Yw0Zy0me1ibkkoT5hdhjTYHllHgNNl25qT7Z7mogGgspEKwwKmK
	TsfGoYtP4zzabvtjrDvFlzEtqzwEdK+CfWei0t+N7BGg3q+JZ1HNN1kQUB0JiLQ=
X-Google-Smtp-Source: AGHT+IEn6Gn4ud9W6STspA6/L/OaJl+wN3z75c1efnwBhw6nqEM6i8VOzaj9WosELZ+SOH/HPkB3lg==
X-Received: by 2002:a19:f709:0:b0:52c:89b6:6b82 with SMTP id 2adb3069b0e04-52ca6e6546emr269609e87.27.1718298310349;
        Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:08 +0300
Subject: [PATCH v2 5/8] drm/msm/dpu: rework vsync_source handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
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
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0Iv1DFyBhdoY+/Sz6mfuH/zko7qqu85Tsijz4fV/RPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybB/fvZLcXlwp6Sd6UVZoGCW1bqWg7hqV1I+
 WAgW9ocJneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1a02B/9eIc6+2K7PRVJf1MS1yHmWo3kw4wsfl3I0ZDcGMcrG914sOgEKHz04At6PIzmFVB03jHf
 Z2rl/6FoKCLL5F0vldvdOOhcUGme47GVp3TN16Fi9fkJd38v7J+AYOCNyQvpd1BgmVQ/e2EqJ/V
 VXd98uLTLkCze+c43pmvYfiIWCzwRxHdcodjcRAKAOy4dbfeT9JqGGSl/Qa70Ovs+QK3m9c+I/W
 sCNMYZlHKsYKtUpHZ7lZZLqpw7ON9lei9AIzNLm1sgF5se8YAYk4J8s/8veM5PRx7vTu52+J4Kg
 DTcTeBCMWsDpDNv1Ea321rw7wjIrvARf/1VXOtJy0NJOVJl9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The struct msm_display_info has is_te_using_watchdog_timer field which
is neither used anywhere nor is flexible enough to specify different
sources. Replace it with the field specifying the vsync source using
enum dpu_vsync_source.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


