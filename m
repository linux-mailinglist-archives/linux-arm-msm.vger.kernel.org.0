Return-Path: <linux-arm-msm+bounces-36627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D789B859C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC571F254F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B669A1D0157;
	Thu, 31 Oct 2024 21:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/BvgOIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B01CC8AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730411062; cv=none; b=VBSYriqGJdsmQU53uqhSesPl96/KXRr9McMpDfJCF59ir1Hh9RJFEL0M/jsYxCihswmjQX9O7jqrfdza/TJFFy4qs/0I6A9f26jH4y2a0Y2LjrL+kgFXKf194q/ZVxSOhhVFhDUYINV5m0udN3jZCVyFUyz/88zND3Cmm5wP/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730411062; c=relaxed/simple;
	bh=3gmgqvAjzCSSavAjV5jJg0GKqDw6X9/s8Cl9bedoQdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYdoYqi79L+Y5kXr0gnL59qjWcWgUw1oj9rgCQmbRczfvQSVRdXfaEp1r6j2OAj3XUgffIJp0EHn4gR4FziDKnS3NB8FZrZt6FZcfJg9jykKQPWTlJnLVxN+mLMU//AwUinzknW7O0t2gBVc62AQdYfasQsvTvKZ0emfKR48prM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/BvgOIJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f72c913aso2254967e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730411055; x=1731015855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
        b=Y/BvgOIJLnvOsl4cAAb4ak9WGwkknmEMc+7k4WtKvxtSm1YHH6wUTtS4xJDU6eErQL
         MsQtIY5UiDlwBXiNKsttvgN+sVCtqx1TmhpJP5IZRGUdSx/z6bDpTmysCV8r/YbZPBf9
         edlNDBlmpPJZCGqRcFyOH4x3pS3laXKQxbI0I0XQrNlozfr6TIiRJMgcWyXB0b5SfHuy
         4KkkUyP5zBLSKHNklFLc4+8CMT3V2CppASEYbt0ZG8nSoyuBR/iBwzkCBQqT3Qhlkb+G
         L1FFRtzfQc6ox2bJMSEOJ0UXq+SNWdUVBEnLFDlM9dZvOawL8rD9TdXqymYhftNKgOe4
         DA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730411055; x=1731015855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
        b=kR+9eX4o+/tQmBSbM4cUINIZVsLLbTniUPrdK6BBx4iL6wrIPoXvh3SrjBuoj9Bgfv
         JUKLL8QXosy0VwxILsCdsJ7sX1bCi5kS2MW0Ms8wWuuh+GMCNMLpJQ5HO7cBf3YZrSOD
         GNitEH6yak+/T/M2xEaWoqm26iGTEDkIDrv6zHjEk1kcTRSkFhW6fpiecHL03DU0pfLW
         8kOE9cm3/qYpE8Y7ciw4yAYywm8ieMCkImpJcN7xfhNbEJJANzysII+uoANnnUAMvtXs
         HjtAS0fybmtLIIM64KYETXQw+iemJaT/ckd8liTCUSOStXbpHupBRDvdh/2amkAJ+wsn
         8+CQ==
X-Gm-Message-State: AOJu0Yym7kL0uwpZWobXCALYs+/dA7E1uF9lhlInFyUX8fY8omRamw8v
	wVZWqU/0sTfEVNf/+cp73MkcNsUy6UIaTbg6Yken/AoXwpWdAjfllj1CDovG8Ms=
X-Google-Smtp-Source: AGHT+IHwHI39pMLKJYKB/wJbzqMugbwMOcaMVOgXGw6qMYzh2l8oGIsERY8Roc/3xeyAXemPUVpnHw==
X-Received: by 2002:a05:6512:3b1e:b0:539:f37f:bed9 with SMTP id 2adb3069b0e04-53b348c38d4mr10744771e87.8.1730411054650;
        Thu, 31 Oct 2024 14:44:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 14:44:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 23:44:06 +0200
Subject: [PATCH 1/3] drm/msm: move msm_display_topology to the DPU driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-dpu-move-topology-v1-1-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3gmgqvAjzCSSavAjV5jJg0GKqDw6X9/s8Cl9bedoQdA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opyJCRQfXjqH5VCLGGgyhtrc2f1DqM69JuU
 HJU3VI5uniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1f+jCACrvoUEvzZiGZj7CBTSY3ijv0NmWwvH4XePIES1czqYUu6Z+pxY1CCBpm1SLUQZd1qDCC3
 dDcLfo7lktlCYzwkNA/N0fiycFu8tzXvBKIiKQ/MBlbdOdcUok+NkoeP3KsvEctlWeBei9QB2U4
 r+zSJD2mRsj81j3kxzDwgoG0GvsOtfOJ4Ph+TKn4a/steVHjOijVUMJNJit7mo9sjIt6hZ81jp4
 xy763WiGofpM9ofjrzNQMo9ut3d43pWs00jd7RknOTmg9pujEGu1TsmU/W6pPcbIQyqpk1Dii+9
 jWLamaVNSz59rGQUbw0kwUzjftva87JP8IS6i/jZBqNf1rtc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The struct msm_display_topology is only used by the DPU driver. Remove
it from the global header and move it to DPU-specific header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 16 ++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h          | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e63db8ace6b9..14220ba04a78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -37,6 +37,22 @@ struct dpu_rm {
 	struct dpu_hw_blk *cdm_blk;
 };
 
+/**
+ * struct msm_display_topology - defines a display topology pipeline
+ * @num_lm:       number of layer mixers used
+ * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
+ * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ */
+struct msm_display_topology {
+	u32 num_lm;
+	u32 num_intf;
+	u32 num_dspp;
+	u32 num_dsc;
+	bool needs_cdm;
+};
+
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 133e47bea7d5..ae3adb0f68a8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -73,22 +73,6 @@ enum msm_dsi_controller {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
-/**
- * struct msm_display_topology - defines a display topology pipeline
- * @num_lm:       number of layer mixers used
- * @num_intf:     number of interfaces the panel is mounted on
- * @num_dspp:     number of dspp blocks used
- * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
- */
-struct msm_display_topology {
-	u32 num_lm;
-	u32 num_intf;
-	u32 num_dspp;
-	u32 num_dsc;
-	bool needs_cdm;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;

-- 
2.39.5


