Return-Path: <linux-arm-msm+bounces-8476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895283E14D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05CA11F258C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9EF210F0;
	Fri, 26 Jan 2024 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJFVDlRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AB210E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293601; cv=none; b=SGtb0IXWEcGNXZQlSLI4UslWpHTIqu/HTwpEWxVKnQcVdCNrQ5v8guMbCKO47BvpHoLyKcifIsz35OGDBOrcQVXhWsf8g9P1St48qERReKxQqktUyyvTy/XiLQ9d8RL3z8lg/an75N3dyiTTX9MuWAmpGeSYKHIMTYuA7PGk0YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293601; c=relaxed/simple;
	bh=RoKpTVBsxpMASa9yoVqt3JBq00erT3eMVvT5PSXJn9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDuw41NE0L+GcKzoojsygQ0Dtq0XswQxQ2ftizhZVrqYO/0BqIiC7pp0HDqAQrHzRebiJ3mO4XTNGVn/TBHDU1B8s2POrnBAPPPpCymsVtliU/w4HQj2hWPW5Zt070PpMJeAodC0O8LqSfWE5elamkI0DNUHmipnIjm3B3byOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJFVDlRQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cdfa8e69b5so7757641fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293597; x=1706898397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ySPPPenxiGTjdzeJAw9tYqihnqIkt3gl/pAGzcWDis=;
        b=PJFVDlRQSdO9sHpjcXxWGYD3iT5/srotgtausnTbsS3O5giTpaamG0FX3pcxA1LZ6U
         HJi0lUo5qFhFDq+Loqi1EQuZ0GOIRKsvpkQi348lLpw3Wxt6j5xwPMP5wDlPBl5zn44l
         +yC23Y71BO9iKo6Yoa8c436ESRvzavRs7pBKoKZ79p/dpfX12akim849gB5AFsYKGfQz
         Z/opoizFHDWm8aqr3tABGSJST8LWIQzygI6aMsfna+Wh43fnrZ/pQhH20cIir1UBmW8H
         p5SMHiNuxU8sT8ddXHo6PvV9Nv4T48em3WNO9cAhMdKZ05GBUBxx3a6lWqDuqUjxYOc0
         s2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293597; x=1706898397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ySPPPenxiGTjdzeJAw9tYqihnqIkt3gl/pAGzcWDis=;
        b=wHBzJcOCcr0IFfsyKL4e9sghwb3JxA2HtKLxuhULC0isMRjkaxjmBCHiecyskjKsLz
         M59bxDxPOzJpO9mx1aRlY49Boa9CwthXGfIfsFMtOm6Eo9Swq7R8y1wCYJElj3CD5LwS
         lE3VM0iKbFrKCTdAAKhIvCRfR3WMGHCZ0+WtBsAZlQqWpt448j5ufgAiOOMoe6S3I6D3
         RB/1e7CEr7cJ0TZxJaN60MPVvWplKXXOd0FvmItfhSQz+5zUR0UWDBJpQhJXJbzGz1aT
         0y7GhelYf6vd1gQMosMw+8QJFqdrbqbp5h9pVIrDvg2PyB/cDcTM7VZxAfT0IdjRruhL
         F0Fw==
X-Gm-Message-State: AOJu0YzizYSRqK85Lv5qbHhgTjcnCyEALUdLWpfALFVlkwxKrzE42Nnw
	0T06v54/WEFq0pjs+9bhFHjygy1E25+gpci+UmQ8sm6WVzxicPI82PtYenO3Oi4=
X-Google-Smtp-Source: AGHT+IG8eg+HGDARfhlUc/96quaZmMcb7ILtQFcj7NUIdMtM0UZYAbOE5rX91P5YhRH13EcbWbkbOA==
X-Received: by 2002:a2e:8092:0:b0:2cd:6865:e6db with SMTP id i18-20020a2e8092000000b002cd6865e6dbmr99162ljg.46.1706293597470;
        Fri, 26 Jan 2024 10:26:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:34 +0200
Subject: [PATCH RESEND v3 15/15] drm/msm/dp: drop dp_parser
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-15-098d5f581dd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8054;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RoKpTVBsxpMASa9yoVqt3JBq00erT3eMVvT5PSXJn9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lS/j1KEcwqnqJuzaoEG/xDb8+ZssuVOs2bK
 XE+cLEsBSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UgAKCRCLPIo+Aiko
 1TrQB/44hlTnY7oryqq3wyhggdG/RWvEZN+BAdKVQbgTlwtGPWu9df7JyitlN7/Wwjivwp2sTOn
 V91EgtTKTCXBmMvwWchSmHcPiacllg4hiaBOgMwL6KathTg5E5bjbhrHeBcXicEgN+XuFcj/myb
 gnCX7/0gQsSn/eWCzk0HNYfortgz7x9ua8wpeEo422B0B+f54vQkTmPYHX7/2rYFKE/lKnAuiHR
 5NkQBuoRv9a95xwU1EcmvJtfsrHSg0D7LkxFFDE73tnTcG7ro64N6Hruao7SBihZUJc6mZmsO6W
 N3tHeQ/NDdmqd+2E6rovA6o6XXwUOwbIVICKdn5MZCdEZsQ0
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
 drivers/gpu/drm/msm/dp/dp_parser.h  | 39 ------------------------
 9 files changed, 12 insertions(+), 115 deletions(-)

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
index de1306a88748..67956e34436d 100644
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
index 38fd335d5950..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ /dev/null
@@ -1,39 +0,0 @@
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


