Return-Path: <linux-arm-msm+bounces-6108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E930820276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30F71C21949
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18EA15496;
	Fri, 29 Dec 2023 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3AAQ9ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59FB154A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e766937ddso5122910e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890622; x=1704495422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhZbvYBmBtp3dXbbR1Su3wNlm3QfQ4rgOwLn0YBowvk=;
        b=M3AAQ9okuX53iaePogV3DX3VZKkJQEmYEaXhbax0TGZDJ0DCPm7CoYMH5XvXIdgxEC
         H5i5pTpJN/hwB+zXkXr8iYnBEN13+7Xr0Pvfbpqhtwn5ITGGOCNJvczS6RFyuNbK9gwb
         AX6QN9zJ33yW/EPWlPMslKWFR8YjpDjc2zSUQNav2DUozuLz5MPIIt8Tz4n4KwqSTEQT
         teDeE/LpG8KEmbCJxNqGM5P6f5oQzSAgMFVhxbwUSkIqaCupcsM/Hs2p9+YIkOHR1AoB
         LkNMLg2DfFEeGdlhPm7oO5sTy45J9xKsVPwWYUsUQGV83k4sBzMSyRbrqc/8H8ElQCZ/
         MYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890622; x=1704495422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhZbvYBmBtp3dXbbR1Su3wNlm3QfQ4rgOwLn0YBowvk=;
        b=f2azNBXBkGEq4FagQgJkoTEOwoJkcwda0IbuKP774DVnHORdvu58j2q+rA/As0u1nV
         oRXuiBVZg4Lc1v6igZJXC1MsyfcbLJV0Fo+N9gTduQ4hPR9tDZVpI/TzxsVtB48ktvuj
         Ydj2a3YvpsG9/35a2DAYGM2Mw9PziVOkUWLK02TzTwcNA0at/niDH9/isLpvN8XYUUIB
         A34DtRXC9n7dCpzu/eKmUy+uQsIee8915aD46JaxUTZuarR7z8OMjBe2qw9jB5RTkGWm
         q46IObw9u+5+pdN+L4VozbFGQj6bQM6Y7EJaYK1T7ACwHRf86/FQFl0QEyjz31je+ULH
         Xt1g==
X-Gm-Message-State: AOJu0Yyqi9Ye47poGEpDFHLYIlco5hEHN9XW+piij4msUQBEV3hmEmXQ
	xmSTjKgsRv5biAfgRG3RE13o1rN9WBD/Mg==
X-Google-Smtp-Source: AGHT+IFT/a5JMsk4vVrPZ/RJlDkbdaxvIUxip0cgYWifQTrKbSVQo0ZtuFq05nW8ZPsJXPh3rsORGA==
X-Received: by 2002:ac2:4259:0:b0:50e:3c2a:fd5e with SMTP id m25-20020ac24259000000b0050e3c2afd5emr4671731lfl.134.1703890622124;
        Fri, 29 Dec 2023 14:57:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:57:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 14/14] drm/msm/dp: drop dp_parser
Date: Sat, 30 Dec 2023 00:56:50 +0200
Message-Id: <20231229225650.912751-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 61 -----------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 40 -------------------
 9 files changed, 12 insertions(+), 116 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h

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
index f801774fa8a8..4e3795409cd8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -9,7 +9,6 @@
 #include "dp_aux.h"
 #include "dp_panel.h"
 #include "dp_link.h"
-#include "dp_parser.h"
 #include "dp_catalog.h"
 
 struct dp_ctrl {
@@ -23,6 +22,8 @@ enum dp_pm_type {
 	DP_MAX_PM
 };
 
+struct phy;
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
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
index 923df47efcc9..58b93dc2bc7a 100644
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


