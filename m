Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EE74942E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 23:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357535AbiASWQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 17:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbiASWQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 17:16:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCB9C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 14:16:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m1so14004239lfq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 14:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MaH74lAPFB94rvoRLnoCINSe/zAn5J4I3TK8snN4wpk=;
        b=X5fF//tkvEpGxn2hVfNJtIiyDsqyrQxyFaOJzJcLqKj/o22nKbwqw/h2hYqKfFWtXG
         WK4gQ8ag59IMoGwKwPogNFeIMRf+XmVKUJKlmHr6Jp2P0GrUpku1LwSMyD6kW2wq+Vmm
         OelsS1aSGI4dRwFFR+QuDPdAdKvrjeFsMYqG5xFeHUXw4obpKlxn2hIQKqF6/H3W8NZZ
         63M649vE18QlQH/NQvq08xDp9LyF8qQxTorw+cluJQrD4UBhcnmNG9u1ueWfEYU9/TZe
         T5CylqsCxYnekCJtox1YvtBr9hCWGsM4ooJnWq8RVXn1r+2rewAzZ3oj9gmPwcIbelIs
         O1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MaH74lAPFB94rvoRLnoCINSe/zAn5J4I3TK8snN4wpk=;
        b=zeQT6tDCqU5gqJaKQ1x7isZfLfkmBGa531wx4CJc8NF1qJ2h3ZYr0Xq3FpKnr+RrgB
         d5Pfv/4aPp3Zx02TLiq2hd8ZjcKF+B8zT7igByCZ6okvT0UJo/OHD51B0AtQ883SrPuH
         lhaQsd70CZUR+t5xFb7X3JBrdKhMz1xZ9ahLmzf3q+Ej09jHpZjbuggGRfD9qKwXtPX/
         13uBrpDXnf/cADTEtvOtdPhIDYHnmZ/U8NTfrtnk9IzLI1XSr8p2k0XlhqZPLliySCvn
         rwx8COZOa1fiKHC9qzXEDViNlf4HGPCyAJDbPkNxbCTNi0rlYE+S1nvvLDOJqK2WiysP
         ASWg==
X-Gm-Message-State: AOAM531J8PYpXTvZYN6v9UZj+k6FlEKNNQ/pBEP5+qGr0PyIt6REoxo7
        69qvSJ6y4RGsczceLhIR7XtJTQ==
X-Google-Smtp-Source: ABdhPJyixX36V4D8mmTv4m9Lv4Y8tHF0I5BrfjYvm7iek2VWdR+tn4MwKohy7lSoY2F5dw82TJ+sow==
X-Received: by 2002:a05:6512:3406:: with SMTP id i6mr21254140lfr.637.1642630580646;
        Wed, 19 Jan 2022 14:16:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b11sm89053lfb.277.2022.01.19.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 14:16:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/msm/dp: rewrite dss_module_power to use bulk clock functions
Date:   Thu, 20 Jan 2022 01:16:16 +0300
Message-Id: <20220119221616.3089119-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to simplify DP code, drop hand-coded loops over clock arrays,
replacing them with clk_bulk_* functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile         |   1 -
 drivers/gpu/drm/msm/dp/dp_clk_util.c | 120 ---------------------------
 drivers/gpu/drm/msm/dp/dp_clk_util.h |  38 ---------
 drivers/gpu/drm/msm/dp/dp_ctrl.c     |  19 ++---
 drivers/gpu/drm/msm/dp/dp_parser.c   |  21 ++++-
 drivers/gpu/drm/msm/dp/dp_parser.h   |  17 +++-
 drivers/gpu/drm/msm/dp/dp_power.c    |  82 +++++++++++-------
 7 files changed, 95 insertions(+), 203 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index e9cc7d8ac301..ac31f85e0699 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -102,7 +102,6 @@ msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
 
 msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
-	dp/dp_clk_util.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
deleted file mode 100644
index 44a4fc59ff31..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.c
+++ /dev/null
@@ -1,120 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2012-2015, 2017-2018, The Linux Foundation.
- * All rights reserved.
- */
-
-#include <linux/clk.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/err.h>
-#include <linux/delay.h>
-#include <linux/of.h>
-
-#include <drm/drm_print.h>
-
-#include "dp_clk_util.h"
-
-void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
-{
-	int i;
-
-	for (i = num_clk - 1; i >= 0; i--) {
-		if (clk_arry[i].clk)
-			clk_put(clk_arry[i].clk);
-		clk_arry[i].clk = NULL;
-	}
-}
-
-int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk)
-{
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		clk_arry[i].clk = clk_get(dev, clk_arry[i].clk_name);
-		rc = PTR_ERR_OR_ZERO(clk_arry[i].clk);
-		if (rc) {
-			DEV_ERR("%pS->%s: '%s' get failed. rc=%d\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name, rc);
-			goto error;
-		}
-	}
-
-	return rc;
-
-error:
-	for (i--; i >= 0; i--) {
-		if (clk_arry[i].clk)
-			clk_put(clk_arry[i].clk);
-		clk_arry[i].clk = NULL;
-	}
-
-	return rc;
-}
-
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk)
-{
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
-			if (clk_arry[i].type != DSS_CLK_AHB) {
-				DEV_DBG("%pS->%s: '%s' rate %ld\n",
-					__builtin_return_address(0), __func__,
-					clk_arry[i].clk_name,
-					clk_arry[i].rate);
-				rc = clk_set_rate(clk_arry[i].clk,
-					clk_arry[i].rate);
-				if (rc) {
-					DEV_ERR("%pS->%s: %s failed. rc=%d\n",
-						__builtin_return_address(0),
-						__func__,
-						clk_arry[i].clk_name, rc);
-					break;
-				}
-			}
-		} else {
-			DEV_ERR("%pS->%s: '%s' is not available\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-			rc = -EPERM;
-			break;
-		}
-	}
-
-	return rc;
-}
-
-int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
-{
-	int i, rc = 0;
-
-	if (enable) {
-		for (i = 0; i < num_clk; i++) {
-			DEV_DBG("%pS->%s: enable '%s'\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-			rc = clk_prepare_enable(clk_arry[i].clk);
-			if (rc)
-				DEV_ERR("%pS->%s: %s en fail. rc=%d\n",
-					__builtin_return_address(0),
-					__func__,
-					clk_arry[i].clk_name, rc);
-
-			if (rc && i) {
-				msm_dss_enable_clk(&clk_arry[i - 1],
-					i - 1, false);
-				break;
-			}
-		}
-	} else {
-		for (i = num_clk - 1; i >= 0; i--) {
-			DEV_DBG("%pS->%s: disable '%s'\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-
-			clk_disable_unprepare(clk_arry[i].clk);
-		}
-	}
-
-	return rc;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
deleted file mode 100644
index 067bf87f3d97..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2012, 2017-2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DP_CLK_UTIL_H__
-#define __DP_CLK_UTIL_H__
-
-#include <linux/platform_device.h>
-#include <linux/types.h>
-
-#define DEV_DBG(fmt, args...)   pr_debug(fmt, ##args)
-#define DEV_INFO(fmt, args...)  pr_info(fmt, ##args)
-#define DEV_WARN(fmt, args...)  pr_warn(fmt, ##args)
-#define DEV_ERR(fmt, args...)   pr_err(fmt, ##args)
-
-enum dss_clk_type {
-	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
-	DSS_CLK_PCLK,
-};
-
-struct dss_clk {
-	struct clk *clk; /* clk handle */
-	char clk_name[32];
-	enum dss_clk_type type;
-	unsigned long rate;
-	unsigned long max_rate;
-};
-
-struct dss_module_power {
-	unsigned int num_clk;
-	struct dss_clk *clk_config;
-};
-
-int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
-void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
-int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
-#endif /* __DP_CLK_UTIL_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0bde9d..db9f43949c58 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1304,20 +1304,19 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 			enum dp_pm_type module, char *name, unsigned long rate)
 {
+	int i;
 	u32 num = ctrl->parser->mp[module].num_clk;
-	struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
-
-	while (num && strcmp(cfg->clk_name, name)) {
-		num--;
-		cfg++;
-	}
 
 	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
 
-	if (num)
-		cfg->rate = rate;
-	else
-		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
+	for (i = 0; i < num; i++) {
+		if (!strcmp(ctrl->parser->mp[module].clocks[i].id, name)) {
+			ctrl->parser->mp[module].clk_config[i].rate = rate;
+			return;
+		}
+	}
+
+	DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
 				name, rate);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index a7acc23f742b..0fe726913b4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -162,6 +162,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	core_power->num_clk = core_clk_count;
+	core_power->clocks = devm_kcalloc(dev,
+			core_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!core_power->clocks)
+		return -ENOMEM;
 	core_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * core_power->num_clk,
 			GFP_KERNEL);
@@ -175,6 +180,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	ctrl_power->num_clk = ctrl_clk_count;
+	ctrl_power->clocks = devm_kcalloc(dev,
+			ctrl_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!ctrl_power->clocks)
+		return -ENOMEM;
 	ctrl_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * ctrl_power->num_clk,
 			GFP_KERNEL);
@@ -190,6 +200,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 	}
 
 	stream_power->num_clk = stream_clk_count;
+	stream_power->clocks = devm_kcalloc(dev,
+			stream_power->num_clk, sizeof(struct clk_bulk_data),
+			GFP_KERNEL);
+	if (!stream_power->clocks)
+		return -ENOMEM;
 	stream_power->clk_config = devm_kzalloc(dev,
 			sizeof(struct dss_clk) * stream_power->num_clk,
 			GFP_KERNEL);
@@ -236,21 +251,21 @@ static int dp_parser_clock(struct dp_parser *parser)
 				core_clk_index < core_clk_count) {
 			struct dss_clk *clk =
 				&core_power->clk_config[core_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			core_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			clk->type = DSS_CLK_AHB;
 			core_clk_index++;
 		} else if (dp_parser_check_prefix("stream", clk_name) &&
 				stream_clk_index < stream_clk_count) {
 			struct dss_clk *clk =
 				&stream_power->clk_config[stream_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			stream_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			clk->type = DSS_CLK_PCLK;
 			stream_clk_index++;
 		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
 			struct dss_clk *clk =
 				&ctrl_power->clk_config[ctrl_clk_index];
-			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			ctrl_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
 			ctrl_clk_index++;
 			if (dp_parser_check_prefix("ctrl_link", clk_name) ||
 			    dp_parser_check_prefix("stream_pixel", clk_name))
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 094b39bfed8c..f16072f33cdb 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -10,7 +10,6 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 
-#include "dp_clk_util.h"
 #include "msm_drv.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
@@ -106,6 +105,22 @@ struct dp_regulator_cfg {
 	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
 };
 
+enum dss_clk_type {
+	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
+	DSS_CLK_PCLK,
+};
+
+struct dss_clk {
+	enum dss_clk_type type;
+	unsigned long rate;
+};
+
+struct dss_module_power {
+	unsigned int num_clk;
+	struct clk_bulk_data *clocks;
+	struct dss_clk *clk_config;
+};
+
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index b48b45e92bfa..8cf2e723dff1 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -105,59 +105,74 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	ctrl = &power->parser->mp[DP_CTRL_PM];
 	stream = &power->parser->mp[DP_STREAM_PM];
 
-	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
+	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CORE_PM), rc);
 		return rc;
 	}
 
-	rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
+	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CTRL_PM), rc);
-		msm_dss_put_clk(core->clk_config, core->num_clk);
 		return -ENODEV;
 	}
 
-	rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
+	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
 			dp_parser_pm_name(DP_CTRL_PM), rc);
-		msm_dss_put_clk(core->clk_config, core->num_clk);
 		return -ENODEV;
 	}
 
 	return 0;
 }
 
-static int dp_power_clk_deinit(struct dp_power_private *power)
+static int dp_clk_set_rate(struct dss_module_power *mp)
 {
-	struct dss_module_power *core, *ctrl, *stream;
-
-	core = &power->parser->mp[DP_CORE_PM];
-	ctrl = &power->parser->mp[DP_CTRL_PM];
-	stream = &power->parser->mp[DP_STREAM_PM];
+	struct dss_clk *clk_arry = mp->clk_config;
+	int num_clk = mp->num_clk;
+	int i, rc = 0;
 
-	if (!core || !ctrl || !stream) {
-		DRM_ERROR("invalid power_data\n");
-		return -EINVAL;
+	for (i = 0; i < num_clk; i++) {
+		if (mp->clocks[i].clk) {
+			if (clk_arry[i].type != DSS_CLK_AHB) {
+				DRM_DEBUG("%pS->%s: '%s' rate %ld\n",
+					__builtin_return_address(0), __func__,
+					mp->clocks[i].id,
+					clk_arry[i].rate);
+				rc = clk_set_rate(mp->clocks[i].clk,
+					clk_arry[i].rate);
+				if (rc) {
+					DRM_ERROR("%pS->%s: %s failed. rc=%d\n",
+						__builtin_return_address(0),
+						__func__,
+						mp->clocks[i].id, rc);
+					break;
+				}
+			}
+		} else {
+			DRM_ERROR("%pS->%s: '%s' is not available\n",
+				__builtin_return_address(0), __func__,
+				mp->clocks[i].id);
+			rc = -EPERM;
+			break;
+		}
 	}
 
-	msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
-	msm_dss_put_clk(core->clk_config, core->num_clk);
-	msm_dss_put_clk(stream->clk_config, stream->num_clk);
-	return 0;
+	return rc;
 }
-
 static int dp_power_clk_set_link_rate(struct dp_power_private *power,
-			struct dss_clk *clk_arry, int num_clk, int enable)
+			struct dss_module_power *mp, int enable)
 {
+	struct dss_clk *clk_arry = mp->clk_config;
+	int num_clk = mp->num_clk;
 	u32 rate;
 	int i, rc = 0;
 
 	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
+		if (mp->clocks[i].clk) {
 			if (clk_arry[i].type == DSS_CLK_PCLK) {
 				if (enable)
 					rate = clk_arry[i].rate;
@@ -168,7 +183,12 @@ static int dp_power_clk_set_link_rate(struct dp_power_private *power,
 				if (rc)
 					break;
 			}
-
+		} else {
+			DRM_ERROR("%pS->%s: '%s' is not available\n",
+				__builtin_return_address(0), __func__,
+				mp->clocks[i].id);
+			rc = -EPERM;
+			break;
 		}
 	}
 	return rc;
@@ -181,7 +201,7 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 	struct dss_module_power *mp = &power->parser->mp[module];
 
 	if (module == DP_CTRL_PM) {
-		rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
+		rc = dp_power_clk_set_link_rate(power, mp, enable);
 		if (rc) {
 			DRM_ERROR("failed to set link clks rate\n");
 			return rc;
@@ -189,7 +209,7 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 	} else {
 
 		if (enable) {
-			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+			rc = dp_clk_set_rate(mp);
 			if (rc) {
 				DRM_ERROR("failed to set clks rate\n");
 				return rc;
@@ -197,10 +217,14 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 		}
 	}
 
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
-	if (rc) {
-		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
-		return rc;
+	if (enable) {
+		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
+		if (rc) {
+			DRM_ERROR("failed to enable clks, err: %d\n", rc);
+			return rc;
+		}
+	} else {
+		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
 	}
 
 	return 0;
@@ -336,9 +360,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	dp_power_clk_deinit(power);
 	pm_runtime_disable(&power->pdev->dev);
-
 }
 
 int dp_power_init(struct dp_power *dp_power, bool flip)
-- 
2.34.1

