Return-Path: <linux-arm-msm+bounces-8471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12583E148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68ABA1F25DF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5854820DC9;
	Fri, 26 Jan 2024 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncxcY8yJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3BE20DD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293597; cv=none; b=ojAq0PMZ1rS4q9u9iBGDT1Jz05kQIds/HJxDwlS8lcwA8RrfLP6QWJs8Jpl4RP9kceadAjg+t3Y0o8zrBCyDJH74XGLgeVIxhJYiDWqiOWnTfwcL79UeJA7AwPX1DZneLXFt/87Hz0aJwPMkd2GbNdPsRnzmwF2tP+0yQsFoZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293597; c=relaxed/simple;
	bh=lj8fVAqF9xjHx1KrBL3A1/vTOxjI6sPTTzeJIEKTWus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efX3QCnt415eIhG7pZ87IlUIV0d6nD63H2lp8YZxcFOG+jshl8yH50J903PDbSYQP6/0tcjs+H96t54ZKSI9XXQBkZO4rO3PGPF63+rHiIXorVDUoKBifgbXu4d1WnKUaX6TUbmZqmaY6myiOf94YNY1RIDPQbEQfdcCt4uSfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncxcY8yJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ccec119587so8366471fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293593; x=1706898393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
        b=ncxcY8yJ9ykn2Sgd4l/AAtxJS8RWCFkJFDUkw1zrk6Or0fLutCj8ioTRHNMfjgMamm
         a00mHbq8Akducg1g/JNU1El1hmp6ZLQLxY0icG9fupymyDgJl4kAdEIX19rFPA64kDmM
         74uZQh4SPT+ImHX/Zc8w1z5fw2DKQb1vNBdsYnqOVADzFPsQ2DPVYbdRMo1WMl0mS2Al
         HKaCs5xy86ujEZ5VZl5b6pHPQwF/I+op10BvZDIvQEXNdjYJPXD4Fs39WaiiU0ZA7YKp
         051bqf0e94O/MaNt4WV2WZJNWnpG/y5Dk+wXeqYtIPJPQaJV1lK7XIf+QVkfCiMFwhen
         g4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293593; x=1706898393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
        b=Cx+VNyrsgY5V1tt6Yy74QNGOjGIimqmOnB36J7JP29XTM8aNScKV9zfq2xAO6KO6vw
         SvrCIryRFRh8oEiz+SDiEx+17wX6a7mtaIutakhZVYdIqaeSgWR4LKl5vzCj34gKPbAc
         FY4o7jKIJo/ELPAJuIPIkgtYEZJa6IIwodJdB5DA2qHHScdP6iYnaNRag+mFr0mLnyvi
         Kh9zDWeZh+SyGelTuI0ChqJp5FFXbns8LJEz4nSV4IhXKkZ9/y9nszb3w5dvtldHLe4+
         y6g9chMM7o0juQ80k9IoN3UlpI++cYn9CrzomrVjAcdupqRcvTPhnC4GlX4Ii+TO7sLR
         t6sw==
X-Gm-Message-State: AOJu0Yz1Y1SoTVX08pmfECRTAzFff1DhAHL3/xOfihn7BGSjEwH2GyWO
	vfVmOGwLyYG+Ar7g3OpCa3NWIYZkoB3J8s5pxRDQ9nM51dg+5FNgumr4mDq4eQw=
X-Google-Smtp-Source: AGHT+IHmT/8FPVr4UsEYhUnTnxGmf4Tf0ZyUbxmSUo8KNUuoNIyPCgKK6nrVSykS9tFH+1x+7sDvIw==
X-Received: by 2002:a2e:9011:0:b0:2cf:81d:3abe with SMTP id h17-20020a2e9011000000b002cf081d3abemr241205ljg.33.1706293593443;
        Fri, 26 Jan 2024 10:26:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:29 +0200
Subject: [PATCH RESEND v3 10/15] drm/msm/dp: remove PHY handling from
 dp_catalog.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-10-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lj8fVAqF9xjHx1KrBL3A1/vTOxjI6sPTTzeJIEKTWus=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lRDUjtsgokGIChkNkcCSIk4Re+J4dW2QeZR
 oTatm+plwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UQAKCRCLPIo+Aiko
 1QEQB/4+8auRK/nQooym4b7t8QyIhgOBY7o+1CqLBZfzU6fdlHastDtw12FpDtfuo98fEwHPf32
 JLN95Ic0ogTDkHgJRLISoJbM7KMXEDAyEdG2V5UiyogPoyOw0eLlgR/3elhBuHfPD0oqpCw+sC5
 xNcfN2vBOiIQyBuL5LUVHOpMs7hjFRcfl+Gyj2AjXb7YdHaYQ18O9EtaBwpM/t7kYR6hxzBooba
 uKSHfeusJVVFTFw33bmR3Ar2u2L7r8uAR4PTqneNMu3tEDjmYQUf6gFqbRdHjr2FraG5zK/NIIp
 b/BMn/JrTbBlbcjqiKCJEqCDaLzDWliFkCQgKcY+SH5TzI11
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 +++++++--
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..adbd5a367395 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
@@ -23,6 +24,8 @@ struct dp_aux_private {
 	struct device *dev;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	struct mutex mutex;
 	struct completion comp;
 
@@ -336,7 +339,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
-				dp_catalog_aux_update_cfg(aux->catalog);
+				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
 		if (dp_catalog_link_is_connected(aux->catalog))
@@ -439,7 +442,7 @@ void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_update_cfg(aux->catalog);
+	phy_calibrate(aux->phy);
 	dp_catalog_aux_reset(aux->catalog);
 }
 
@@ -517,6 +520,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 }
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp)
 {
 	struct dp_aux_private *aux;
@@ -537,6 +541,7 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 
 	aux->dev = dev;
 	aux->catalog = catalog;
+	aux->phy = phy;
 	aux->retry_cnt = 0;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 511305da4f66..16d9b1758748 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -17,6 +17,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp);
 void dp_aux_put(struct drm_dp_aux *aux);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e07651768805..4c6207797c99 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -7,8 +7,6 @@
 
 #include <linux/delay.h>
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-dp.h>
 #include <linux/rational.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -243,16 +241,6 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
 	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	struct dp_io *dp_io = catalog->io;
-	struct phy *phy = dp_io->phy;
-
-	phy_calibrate(phy);
-}
-
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 {
 	u32 state;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index ba7c62ba7ca3..1f3f58d4b8de 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -84,7 +84,6 @@ int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6fbbd0f93d13..c1a51c498e01 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -729,7 +729,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
+	dp->aux = dp_aux_get(dev, dp->catalog,
+			     dp->parser->io.phy,
+			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);

-- 
2.39.2


