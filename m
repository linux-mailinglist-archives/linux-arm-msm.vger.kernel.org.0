Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB52A3629BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242909AbhDPU6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60081 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243411AbhDPU6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606677; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=G6CQLOBQIi4Gy5wUxG0VfjUwX2vOW9xn3qClSNuKHGU=; b=XkudzpQ4UizkmzTDS3/sVHATx5UWl2ru9OFQPEhjg39v18haD7P2lmHa/eF5b7Gz9pVMT7DV
 KBaNQfuBogZ72a8Soy9sJmW1z3pduU9ncWcsg5yhYk/qxECGLOXwBJ5U1WEakIZYbeh9NNIx
 2mzbXhAmCNOYFsqFvdF4zlTvtf0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6079fa45a817abd39ab3d931 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:41
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9AE81C43463; Fri, 16 Apr 2021 20:57:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38BF9C43461;
        Fri, 16 Apr 2021 20:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38BF9C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 4/7] drm/msm/dp: add API to take DP register snapshot
Date:   Fri, 16 Apr 2021 13:57:22 -0700
Message-Id: <1618606645-19695-5-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an API to take a snapshot of DP controller registers. This API
will be used by the msm_disp_snapshot module to capture the DP
snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++++
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 4 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b..99f4fd8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -62,6 +62,15 @@ struct dp_catalog_private {
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
 
+void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+			struct dp_catalog_private, dp_catalog);
+
+	msm_disp_snapshot_add_block(disp_state, catalog->io->dp_controller.len,
+			catalog->io->dp_controller.base, "dp_ctrl");
+}
+
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
 	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 176a902..e7e8b13 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -9,6 +9,7 @@
 #include <drm/drm_modes.h>
 
 #include "dp_parser.h"
+#include "disp/msm_disp_snapshot.h"
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
@@ -71,6 +72,9 @@ struct dp_catalog {
 	u32 audio_data;
 };
 
+/* Debug module */
+void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
+
 /* AUX APIs */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..6670558 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1009,6 +1009,35 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 		dp_display->link->test_video.test_bit_depth);
 }
 
+void msm_dp_snapshot(struct msm_dp *dp)
+{
+	struct dp_display_private *dp_display;
+	struct drm_device *drm;
+	struct msm_disp_state *disp_state;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	drm = dp->drm_dev;
+	disp_state = msm_disp_state_get(drm);
+
+	/*
+	 * if we are reading registers we need the link clocks to be on
+	 * however till DP cable is connected this will not happen as we
+	 * do not know the resolution to power up with. Hence check the
+	 * power_on status before dumping DP registers to avoid crash due
+	 * to unclocked access
+	 */
+	mutex_lock(&dp_display->event_mutex);
+
+	if (!dp->power_on) {
+		mutex_unlock(&dp_display->event_mutex);
+		return;
+	}
+
+	dp_catalog_snapshot(dp_display->catalog, disp_state);
+
+	mutex_unlock(&dp_display->event_mutex);
+}
+
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ac206c1..9c40bac 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -367,6 +367,7 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
+void msm_dp_snapshot(struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

