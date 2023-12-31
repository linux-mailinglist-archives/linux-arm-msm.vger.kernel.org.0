Return-Path: <linux-arm-msm+bounces-6165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48082095F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E0428352F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53E2320C;
	Sun, 31 Dec 2023 00:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLNyiqy/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D7259D
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7be1c65dso4670730e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983448; x=1704588248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfYzeOHgcS5rMFRaftvfFpeZQ1V5yhlJ0V9zRKLNji8=;
        b=BLNyiqy/MYvrrHs8ZlJClcXohQzWwqaWcMoRKphI38GjFTcRHu3n7HC99iNlsr1UKT
         vMhtWEkC3WQOmmLh2dljpiuXcOwdh7IjQaJT1j8cgb4Eq2oKwM13wGGlx7Rrr0je2947
         FOu6fEM+zoXyEXHQ43HflfBf3FXhdfIni4BW0KejgFD04gbft27JHUFcFngAibCRT4AW
         mFBwFkUfLh/w4WmPb8nZo4W6T2Spq4FPl94iejJaB4gYezWCwfOdouJ7Z+pq6fx733gx
         ZbSjhI1HA//v29tWnaqlZWSoLGYLa2VmG5mnB6gpl9kAkYpU9eOvBLgMnnZ3/EIcByK2
         wa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983448; x=1704588248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfYzeOHgcS5rMFRaftvfFpeZQ1V5yhlJ0V9zRKLNji8=;
        b=nTanasm6ym6Ye14RQZDKwFykqt8ZDn6QzpkTWqykaMQkq2eNZq0H6mZAFloBvE+Lio
         dAlFL/TlEJIxBOHnJo72SvmvyUmsSJcKuifz1gCga8Yrec5AcU3lZQ3hPw2ql00zi4MR
         fgi5ZJLudbl8+z79jRU7eesqJ0qrq1DUMC2lpRToHluqJIZNY2TFMOUVIX6L8gozLlBQ
         qvAjgCq2kJBYvM0HKm8l3l5Ac/wDF6zuDM+cZVGNxZq3lgMQVxTq14t/DTOPEa2uOmNN
         8x9L298Ct7PMFdFLyWuDoEeVZxJV4mRePu0Xb9swB2OVNRWbJ4DwbpB/JvjnMBtfNxpl
         og9g==
X-Gm-Message-State: AOJu0Yyeg0FDMv+1Wu8SeN5E1lYRg3aitP8vRrLZVxOLHcHavHclZdUO
	bkpDG8CTfkR1XVMtlzIvDFDRwGE1UIryiQ==
X-Google-Smtp-Source: AGHT+IFySGzQRGCSjG6ixBApkOm4Lcta1ozEWXk5N6wglQTrBh35tc4J3enyNJ4mmr9B72346GKhiA==
X-Received: by 2002:ac2:548b:0:b0:50e:1a9f:3c36 with SMTP id t11-20020ac2548b000000b0050e1a9f3c36mr5745924lfk.15.1703983447955;
        Sat, 30 Dec 2023 16:44:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:44:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:44:02 +0200
Subject: [PATCH v2 15/15] drm/msm/dp: drop dp_parser
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8110;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TOKAUj7wqAQ9xZhC70Z8FjrR1dl4xCheaCIfCLWs5m0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qEnd4mH14Uu/WZ52axRwgVzrnncZRNVk659HH2idMOs
 9rChfZ3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi6y+y/4/f9tGpSe7bs8WP
 ZReq8/PEc5VLWFSvz7uedLDtjX2b6MQJWbf/z41R9Uhp33s8UOai1vqbSRGrFq+8Ijjpd5VzWeM
 iMatr/CqCirOizZPlapVCAh/nHd+3rEbr/HXrs6L3ghJlzNlVtPQ4D4ZZmKUeeHWlZ4ma54ST7f
 tbVnPuOXj57qaTnx8eZ9w+a7+pgYxOdk9rnGVA/ssZM5tm+7SU3Dj47oHFs5aQg7c21novm9mv2
 ipk0xwW+4P5xrIm5v/KWXuuia45Ev5/X3yEAYf/TWllmbtJNiW8Jt25gdZxikFFbkXXoiRrVXfY
 dJSfflbL/alFKVlPsr1If69C0e4j9dyXBZiE7bniFDcCAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Finally drop separate "parsing" submodule. There is no need in it
anymore. All submodules handle DT properties directly rather than
passing them via the separate structure pointer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |  1 -
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 61 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 40 ------------------------
 9 files changed, 12 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8dbdf3fba69e..543e04fa72e3 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -127,7 +127,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_drm.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
-	dp/dp_parser.o \
 	dp/dp_audio.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 16d9b1758748..f47d591c1f54 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -16,6 +16,7 @@ void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
 
+struct phy;
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 			      struct phy *phy,
 			      bool is_edp);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 989e4c4fd6fa..a724a986b6ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -8,7 +8,6 @@
 
 #include <drm/drm_modes.h>
 
-#include "dp_parser.h"
 #include "disp/msm_disp_snapshot.h"
 
 /* interrupts */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 6e9f375b856a..fa014cee7e21 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -9,7 +9,6 @@
 #include "dp_aux.h"
 #include "dp_panel.h"
 #include "dp_link.h"
-#include "dp_parser.h"
 #include "dp_catalog.h"
 
 struct dp_ctrl {
@@ -17,6 +16,8 @@ struct dp_ctrl {
 	bool wide_bus_en;
 };
 
+struct phy;
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
 void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 6c281dc095b9..ac68554801a4 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -9,7 +9,6 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
 
-#include "dp_parser.h"
 #include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_ctrl.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 03e9c5c3bd46..5df6d9761c31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -9,12 +9,12 @@
 #include <linux/debugfs.h>
 #include <linux/component.h>
 #include <linux/of_irq.h>
+#include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
-#include "dp_parser.h"
 #include "dp_ctrl.h"
 #include "dp_catalog.h"
 #include "dp_aux.h"
@@ -87,7 +87,6 @@ struct dp_display_private {
 	struct drm_device *drm_dev;
 	struct dentry *root;
 
-	struct dp_parser  *parser;
 	struct dp_catalog *catalog;
 	struct drm_dp_aux *aux;
 	struct dp_link    *link;
@@ -704,14 +703,11 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
+	struct phy *phy;
 
-	dp->parser = dp_parser_get(dp->dp_display.pdev);
-	if (IS_ERR(dp->parser)) {
-		rc = PTR_ERR(dp->parser);
-		DRM_ERROR("failed to initialize parser, rc = %d\n", rc);
-		dp->parser = NULL;
-		goto error;
-	}
+	phy = devm_phy_get(dev, "dp");
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
 
 	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
@@ -722,7 +718,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->aux = dp_aux_get(dev, dp->catalog,
-			     dp->parser->phy,
+			     phy,
 			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
@@ -753,7 +749,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
-			       dp->parser->phy);
+			       phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 70759dd1bfd0..234dada88687 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -10,6 +10,8 @@
 #include <sound/hdmi-codec.h>
 #include "disp/msm_disp_snapshot.h"
 
+#define DP_MAX_PIXEL_CLK_KHZ	675000
+
 struct msm_dp {
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
deleted file mode 100644
index f95ab3c5c72c..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/of_gpio.h>
-#include <linux/phy/phy.h>
-
-#include <drm/drm_of.h>
-#include <drm/drm_print.h>
-#include <drm/drm_bridge.h>
-
-#include "dp_parser.h"
-#include "dp_reg.h"
-
-static int dp_parser_ctrl_res(struct dp_parser *parser)
-{
-	struct platform_device *pdev = parser->pdev;
-
-	parser->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(parser->phy))
-		return PTR_ERR(parser->phy);
-
-	return 0;
-}
-
-static int dp_parser_parse(struct dp_parser *parser)
-{
-	int rc = 0;
-
-	if (!parser) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	rc = dp_parser_ctrl_res(parser);
-	if (rc)
-		return rc;
-
-	return 0;
-}
-
-struct dp_parser *dp_parser_get(struct platform_device *pdev)
-{
-	struct dp_parser *parser;
-	int ret;
-
-	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
-	if (!parser)
-		return ERR_PTR(-ENOMEM);
-
-	parser->pdev = pdev;
-
-	ret = dp_parser_parse(parser);
-	if (ret) {
-		dev_err(&pdev->dev, "device tree parsing failed\n");
-		return ERR_PTR(ret);
-	}
-
-	return parser;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
deleted file mode 100644
index 2b39b1c394ae..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_PARSER_H_
-#define _DP_PARSER_H_
-
-#include <linux/platform_device.h>
-
-#include "msm_drv.h"
-
-#define DP_MAX_PIXEL_CLK_KHZ	675000
-
-/**
- * struct dp_parser - DP parser's data exposed to clients
- *
- * @pdev: platform data of the client
- * @io: Display Port controller mapped memory address
- * @phy: PHY handle
- */
-struct dp_parser {
-	struct platform_device *pdev;
-	struct phy *phy;
-};
-
-/**
- * dp_parser_get() - get the DP's device tree parser module
- *
- * @pdev: platform data of the client
- * return: pointer to dp_parser structure.
- *
- * This function provides client capability to parse the
- * device tree and populate the data structures. The data
- * related to clock, regulators, pin-control and other
- * can be parsed using this module.
- */
-struct dp_parser *dp_parser_get(struct platform_device *pdev);
-
-#endif

-- 
2.39.2


