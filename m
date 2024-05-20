Return-Path: <linux-arm-msm+bounces-20061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E58C9CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3A3F1F21899
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A522254FA1;
	Mon, 20 May 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwFwAhN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C445E53E2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207171; cv=none; b=g+hfIh5R6beS5r8vyo4ke3H56/+oNO4qY4rXGY9Bmhh1eGpWIuMVV275F3RmORBagsU9/C0sNQsJOtt4fjt6qGFIYaG9jc8cY9SULcaEhudomoqHonNKYY+pfOirB5+wAWUyFj3jiefgZx6Y5QGAUAJSGvW+4iVz9McSAQYFNm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207171; c=relaxed/simple;
	bh=J8Xb1/I3EmuS+Y/A0WKJ5x+Y52MqFdPOqf+7n3dQ3/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHM/8lBBqGU7K9CyBQxOLpmhsUdswvZqdY1pAXVyfRrr18T0WMpIknN8me6hKcTRIcnetHtdKgfaZWdDu6YT9lNL1Cf54Vp/ocV3ICB5ULbRclBFzEWkDG9V2+1UytGhWfx6vyh7iHlYuVHzQAoxObAh3H3k+W604bpzhhkLK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wwFwAhN2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso914300e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207168; x=1716811968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azCAUbP81p6FXz3Lrf7UeBHi+32GPaYrpMLE7+SkPh0=;
        b=wwFwAhN2DG6Govlck0RQRrd6xAUrmFJE5pH/vQnaUSpLgtbukKB1gTeiqqB53F/RCv
         L//rEQoXzJewazCatC4mJeoA7epI6z8RxJCVsOhOtXCSUDSXI3vlf8xo21SMJBKEAxX7
         hAUCwe/CZPriC7H2pPr7n8mEiK3wVOtJXVzqqfRuxH/9ldzWSaWkPppDFCt6dpIK4+VM
         1tNH2fz/QxsAtbJZLhGsg/AuPGYt9fQvxbaaLEeH76/lhHYHhk58/82M9G/akq649LcN
         Aw457asw9sDTDq+jVXDmKswm5d5RQaGJsXJ8+zWTQ7mYCQq4LoxDaV5wx8tvIUSwnWok
         1iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207168; x=1716811968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azCAUbP81p6FXz3Lrf7UeBHi+32GPaYrpMLE7+SkPh0=;
        b=pSq2MgcldQ3rJihRxqeJ+oAE/H8PN7CXz0VNp6+5WDFbLtMozIvrzWKIEPFXzcvf9k
         /cUUmyNwEbF51Dm+FnGsen0wcDWYCBBgYL0ElO8bwirfAYi4LXvwi/8l4yAo1fETaFtb
         wFhS9sUkwM84PUQvM0PIKVeOrWJBZi1FIWLFIzOEp7VUtCYEgVGYskJlDnxNIWIS9Epj
         SypSa0TFLadmjM7hb5xtJWyx1iJKfeIia2bcxd8H3Lf+LyjywEIyQmN5bg0TfAm7/aca
         tFGGB8l5MqEsB0ZS0IJXnatQ6YsP4QQdffwo4cHKpa/xuMEXbrl79IrgurcBUeVhzCIm
         gu9g==
X-Gm-Message-State: AOJu0YxWGyxeFhok0cbAbGtUJE8qV5J6Ljxf6nPWNZkQKZH6dnVblejE
	9LG4l+IsxxudVP2lT+26Yejq7rrBI7bevBG4fpnzBpqLQsetehipxDGLl0NQyyg=
X-Google-Smtp-Source: AGHT+IFHXDg+EVY96/TXoydluRSvx4tfTtHcuReGqwXRhizYWJfHYfKjYmaD7LxLO00+dtpo3Ayx1g==
X-Received: by 2002:a05:6512:1386:b0:51d:aae8:646 with SMTP id 2adb3069b0e04-5220fb7671fmr24010121e87.11.1716207167999;
        Mon, 20 May 2024 05:12:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:44 +0300
Subject: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J8Xb1/I3EmuS+Y/A0WKJ5x+Y52MqFdPOqf+7n3dQ3/c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48m8V7fkZ7xpTmWfwckD/lkB5CTS/3Sbupp
 RcBptnAar6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1aacCACnwDVWWZYxOsZbcmthWWJS6loboPeeug/ROWmbTwwjN10uUUwWW0eu2lybLGygqkmy3W7
 QKHxF1p+W5nO1sh5Pa9Qk2HeYNDXpFR+nrq75nOspJ9zpcKzhxzykvT0q1XVWdPo6lXPFXoaZM5
 PQzA9UnhBW/7FBKuXtWXsDy3fmw0eJTOQqPuan8YbS8tWku9NL4nrSUJfS2WUkv63KFVHVGmMMW
 58CcML6DyJhjjSF1QwtdOrMVHno/dZK98oNQ+9z8SeVvK8FOcTIKZSSFVMcB6R2JXOTQyvdjYmH
 oJes68AqV53eIzoJrLnSt1TL26CHugIboG9SW4bvDRnXGZp3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add enum dpu_vsync_source instead of a series of defines. Use this enum
to pass vsync information.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..4988a1029431 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		if (disp_info->is_te_using_watchdog_timer)
 			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
 		else
-			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
+			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..96f6160cf607 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-		u32 vsync_source)
+				  enum dpu_vsync_source vsync_source)
 {
 	struct dpu_hw_blk_reg_map *c;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f9015c67a574..ac244f0b33fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
 
 	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
 
-	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
+	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
 
 	/**
 	 * Disable autorefresh if enabled
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 66759623fc42..a2eff36a2224 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -54,18 +54,20 @@
 #define DPU_BLEND_BG_INV_MOD_ALPHA	(1 << 12)
 #define DPU_BLEND_BG_TRANSP_EN		(1 << 13)
 
-#define DPU_VSYNC0_SOURCE_GPIO		0
-#define DPU_VSYNC1_SOURCE_GPIO		1
-#define DPU_VSYNC2_SOURCE_GPIO		2
-#define DPU_VSYNC_SOURCE_INTF_0		3
-#define DPU_VSYNC_SOURCE_INTF_1		4
-#define DPU_VSYNC_SOURCE_INTF_2		5
-#define DPU_VSYNC_SOURCE_INTF_3		6
-#define DPU_VSYNC_SOURCE_WD_TIMER_4	11
-#define DPU_VSYNC_SOURCE_WD_TIMER_3	12
-#define DPU_VSYNC_SOURCE_WD_TIMER_2	13
-#define DPU_VSYNC_SOURCE_WD_TIMER_1	14
-#define DPU_VSYNC_SOURCE_WD_TIMER_0	15
+enum dpu_vsync_source {
+	DPU_VSYNC_SOURCE_GPIO_0,
+	DPU_VSYNC_SOURCE_GPIO_1,
+	DPU_VSYNC_SOURCE_GPIO_2,
+	DPU_VSYNC_SOURCE_INTF_0 = 3,
+	DPU_VSYNC_SOURCE_INTF_1,
+	DPU_VSYNC_SOURCE_INTF_2,
+	DPU_VSYNC_SOURCE_INTF_3,
+	DPU_VSYNC_SOURCE_WD_TIMER_4 = 11,
+	DPU_VSYNC_SOURCE_WD_TIMER_3,
+	DPU_VSYNC_SOURCE_WD_TIMER_2,
+	DPU_VSYNC_SOURCE_WD_TIMER_1,
+	DPU_VSYNC_SOURCE_WD_TIMER_0,
+};
 
 enum dpu_hw_blk_type {
 	DPU_HW_BLK_TOP = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 6f3dc98087df..5c9a7ede991e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -64,7 +64,7 @@ struct dpu_vsync_source_cfg {
 	u32 pp_count;
 	u32 frame_rate;
 	u32 ppnumber[PINGPONG_MAX];
-	u32 vsync_source;
+	enum dpu_vsync_source vsync_source;
 };
 
 /**

-- 
2.39.2


