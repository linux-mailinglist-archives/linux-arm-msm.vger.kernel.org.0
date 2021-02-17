Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501A231DDC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 17:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234297AbhBQQ7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 11:59:41 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:63924 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234284AbhBQQ7k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 11:59:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613581162; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=B5AXYKuDNSG0opzkSoixITlEQXeGyUfALGQ8770qpOg=; b=TgVu2b8cGYMDykLvMBY7JTefwwEV9+ge63CDztX/0vuR6wMQ81MezeaEoojoWbUN+pqQjBKY
 5UtVJf44vUjuExMgrQXhruxyoOdDNAlLyg869Rr95VYvOrenEasvFriuf/ABvZdPVRSQRwBZ
 Fn5sNRZCXzVfvW4NKMm0LkWsPIs=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602d4b4ed2def62f1e0026ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 16:58:54
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 547BFC43461; Wed, 17 Feb 2021 16:58:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC7FCC433CA;
        Wed, 17 Feb 2021 16:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC7FCC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: add support of HBR3 link rate
Date:   Wed, 17 Feb 2021 08:58:42 -0800
Message-Id: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add hbr3_hbr2 voltage and pre-emphasis swing table to support
HBR3 link rate

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c   |  4 ----
 drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++--
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc8166..63112fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -76,10 +76,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
 		link_info->num_lanes = dp_panel->max_dp_lanes;
 
-	/* Limit support upto HBR2 until HBR3 support is added */
-	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
-		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
-
 	DRM_DEBUG_DP("version: %d.%d\n", major, minor);
 	DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
 	DRM_DEBUG_DP("lane_count=%d\n", link_info->num_lanes);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 0939a9e..cc5ef59 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2965,6 +2965,21 @@ static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
 	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
+
+static u8 const qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
+        {0x00, 0x0C, 0x15, 0x1A},
+        {0x02, 0x0E, 0x16, 0xFF},
+        {0x02, 0x11, 0xFF, 0xFF},
+        {0x04, 0xFF, 0xFF, 0xFF}
+};
+
+static u8 const qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {
+        {0x02, 0x12, 0x16, 0x1A},
+        {0x09, 0x19, 0x1F, 0xFF},
+        {0x10, 0x1F, 0xFF, 0xFF},
+        {0x1F, 0xFF, 0xFF, 0xFF}
+};
+
 static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x00, 0x0c, 0x14, 0x19 },
 	{ 0x00, 0x0b, 0x12, 0xff },
@@ -3000,8 +3015,13 @@ static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
 		drvr_en = 0x10;
 	}
 
-	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
-	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+	if (dp_opts->link_rate <= 2700) {
+		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+	} else {
+		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
+	}
 
 	/* TODO: Move check to config check */
 	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

