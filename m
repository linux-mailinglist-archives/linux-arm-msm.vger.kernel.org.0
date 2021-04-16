Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7202B3629B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhDPU6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23058 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242909AbhDPU6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606673; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Fq3XSKPxo5GYxR6mtbpTVRK4RAzIQrWpMoVi0ajCYKc=; b=L2h/mdftWj38Mn7xAmrTWmdKocB1BnjqgTPa171BTW2VPDN+3u7zRhi7Wy67CncIG4VJTi0+
 Gk2HymJI65GHGN8mranH2x3Fw4h+/TUVIJBBjzQOW0cpCn1cEnZEVcbxCMpZhpipY6pzoFQB
 vj/tXdsDvrQLWRpwLut5TtwPnO4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6079fa422cc44d3aea6253b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93F2EC43461; Fri, 16 Apr 2021 20:57:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0435FC43462;
        Fri, 16 Apr 2021 20:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0435FC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 3/7] drm/msm/dsi: add API to take DSI register snapshot
Date:   Fri, 16 Apr 2021 13:57:21 -0700
Message-Id: <1618606645-19695-4-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an API to take a snapshot of DSI controller registers. This API
will be used by the msm_disp_snapshot module to capture the DSI
snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  4 ++++
 drivers/gpu/drm/msm/dsi/dsi.h      |  5 ++++-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 +++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index f68f34b..bccc006 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,4 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
+void msm_dsi_snapshot(struct msm_dsi *msm_dsi)
+{
+	msm_dsi_host_snapshot(msm_dsi->host);
+}
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7abfeab..e26223c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -15,6 +15,7 @@
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define DSI_0	0
 #define DSI_1	1
@@ -90,6 +91,8 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
+void msm_dsi_snapshot(struct msm_dsi *msm_dsi);
+
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
 /* dsi host */
@@ -146,7 +149,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
-
+void msm_dsi_host_snapshot(struct mipi_dsi_host *host);
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 316e78d..899b6fc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2488,3 +2488,18 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 	return of_drm_find_bridge(msm_host->device_node);
 }
 
+void msm_dsi_host_snapshot(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	struct drm_device *dev = msm_host->dev;
+	struct msm_disp_state *disp_state;
+
+	disp_state = msm_disp_state_get(dev);
+
+	pm_runtime_get_sync(&msm_host->pdev->dev);
+
+	msm_disp_snapshot_add_block(disp_state, msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
+			msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
+
+	pm_runtime_put_sync(&msm_host->pdev->dev);
+}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

