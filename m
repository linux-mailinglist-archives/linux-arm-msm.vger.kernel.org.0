Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729C227D42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgI2RKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:10:49 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:50928 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbgI2RKr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:10:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601399445; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=e0x9qLt2z84j+ae/7FciZwmPb9Xkrkv4aYauScLPVbY=; b=qkWQJD+T4XPMwI4RYQDYg8tWAIw55agOV/gIZ1aXvZ6dpwmgZImRVeonO2CVwsNosYzUeIQ8
 AO4eQLxPj8t8EYAvKTbZ3vPrH93phhOEUAVjqBxf9EhkeUI36zv1BuFaz+vQe5vrA1VQQ8Ns
 C1ZIaXTv/6CuO64f+yH9ZEaid3U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f736a8bbebf546dbbea7930 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 17:10:35
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A46CC433C8; Tue, 29 Sep 2020 17:10:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26F18C433C8;
        Tue, 29 Sep 2020 17:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26F18C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: add voltage corners voting support base on dp link rate
Date:   Tue, 29 Sep 2020 10:10:26 -0700
Message-Id: <20200929171026.30551-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set link rate by using OPP set rate api so that CX level will be set
accordingly base on the link rate.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 33 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  8 +++---
 drivers/gpu/drm/msm/dp/dp_power.c   | 42 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_power.h   |  2 +-
 5 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2e3e1917351f..e1595d829e04 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
+#include <linux/pm_opp.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -76,6 +77,8 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct opp_table *opp_table;
+
 	struct completion idle_comp;
 	struct completion video_comp;
 };
@@ -1836,6 +1839,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_parser *parser)
 {
 	struct dp_ctrl_private *ctrl;
+	int ret;
 
 	if (!dev || !panel || !aux ||
 	    !link || !catalog) {
@@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
+
+	if (IS_ERR(ctrl->opp_table)) {
+		dev_err(dev, "invalid DP OPP table in device tree\n");
+		ctrl->opp_table = NULL;
+	} else {
+		/* OPP table is optional */
+		ret = dev_pm_opp_of_add_table(dev);
+		if (ret && ret != -ENODEV) {
+			dev_err(dev, "add DP OPP table\n");
+			dev_pm_opp_put_clkname(ctrl->opp_table);
+			ctrl->opp_table = NULL;
+		}
+	}
+
 	init_completion(&ctrl->idle_comp);
 	init_completion(&ctrl->video_comp);
 
@@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	return &ctrl->dp_ctrl;
 }
 
-void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
 {
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl)
+		return;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (ctrl->opp_table != NULL) {
+		dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_clkname(ctrl->opp_table);
+		ctrl->opp_table = NULL;
+	}
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f60ba93c8678..19b412a93e02 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
-void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 431dff9de797..be941eedf4c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -648,8 +648,10 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
+	struct device *dev = &dp->pdev->dev;
+
 	dp_debug_put(dp->debug);
-	dp_ctrl_put(dp->ctrl);
+	dp_ctrl_put(dev, dp->ctrl);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
 	dp_audio_put(dp->audio);
@@ -693,7 +695,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->power = dp_power_get(dp->parser);
+	dp->power = dp_power_get(dev, dp->parser);
 	if (IS_ERR(dp->power)) {
 		rc = PTR_ERR(dp->power);
 		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
@@ -749,7 +751,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	return rc;
 
 error_audio:
-	dp_ctrl_put(dp->ctrl);
+	dp_ctrl_put(dev, dp->ctrl);
 error_ctrl:
 	dp_panel_put(dp->panel);
 error_link:
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 17c1fc6a2d44..3d75bf09e38f 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -8,12 +8,14 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
+#include <linux/pm_opp.h>
 #include "dp_power.h"
 #include "msm_drv.h"
 
 struct dp_power_private {
 	struct dp_parser *parser;
 	struct platform_device *pdev;
+	struct device *dev;
 	struct clk *link_clk_src;
 	struct clk *pixel_provider;
 	struct clk *link_provider;
@@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
 	return 0;
 }
 
+static int dp_power_clk_set_link_rate(struct dp_power_private *power,
+			struct dss_clk *clk_arry, int num_clk, int enable)
+{
+	u32 rate;
+	int i, rc = 0;
+
+	for (i = 0; i < num_clk; i++) {
+		if (clk_arry[i].clk) {
+			if (clk_arry[i].type == DSS_CLK_PCLK) {
+				if (enable)
+					rate = clk_arry[i].rate;
+				else
+					rate = 0;
+
+				rc = dev_pm_opp_set_rate(power->dev, rate);
+			}
+
+		}
+	}
+	return rc;
+}
+
 static int dp_power_clk_set_rate(struct dp_power_private *power,
 		enum dp_pm_type module, bool enable)
 {
 	int rc = 0;
 	struct dss_module_power *mp = &power->parser->mp[module];
 
-	if (enable) {
-		rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+	if (module == DP_CTRL_PM) {
+		rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
 		if (rc) {
-			DRM_ERROR("failed to set clks rate.\n");
+			DRM_ERROR("failed to set link clks rate.\n");
 			return rc;
 		}
+	} else {
+
+		if (enable) {
+			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+			if (rc) {
+				DRM_ERROR("failed to set clks rate.\n");
+				return rc;
+			}
+		}
 	}
 
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
@@ -349,7 +382,7 @@ int dp_power_deinit(struct dp_power *dp_power)
 	return 0;
 }
 
-struct dp_power *dp_power_get(struct dp_parser *parser)
+struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 {
 	struct dp_power_private *power;
 	struct dp_power *dp_power;
@@ -365,6 +398,7 @@ struct dp_power *dp_power_get(struct dp_parser *parser)
 
 	power->parser = parser;
 	power->pdev = parser->pdev;
+	power->dev = dev;
 
 	dp_power = &power->dp_power;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 76743d755833..7d0327bbc0d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power *power);
  * methods to be called by the client to configure the power related
  * modueles.
  */
-struct dp_power *dp_power_get(struct dp_parser *parser);
+struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
 
 #endif /* _DP_POWER_H_ */

base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

