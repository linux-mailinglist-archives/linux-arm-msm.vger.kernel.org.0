Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492CF2940FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 19:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395084AbgJTRA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 13:00:29 -0400
Received: from z5.mailgun.us ([104.130.96.5]:61733 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395035AbgJTRA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 13:00:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603213229; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=UvDGTaz8J2/Cnaz46As0MAOMJxrv3yTPNC6RTt8QiVA=; b=fW8SfExNRhXio+QRY4J83nbDEUUBfSzPsQw2bkOypij/sElrsh1T/EsMEtw0PrN1qOeR3uzU
 fT3p5SCtOLls5FoRfq2WJYxQhaZ5rdqRkhgF3ABWqlKJrDYIB+3uWUPijGl0O7omaG2khofy
 3ZTY4+hisie2hTzj3DFEwCGd3II=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f8f179fef891f1ee26aa2b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 17:00:15
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73E81C433FF; Tue, 20 Oct 2020 17:00:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B748EC433FE;
        Tue, 20 Oct 2020 17:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B748EC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
Date:   Tue, 20 Oct 2020 09:59:59 -0700
Message-Id: <20201020165959.7441-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No need to check LINK_STATuS_UPDATED bit before
return 6 bytes of link status during link training.
This patch also fix phy compliance test link rate
conversion error.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
 drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
 2 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bdaec778c4c..76e891c91c6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
 				    u8 *link_status)
 {
-	int len = 0;
-	u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_STATUS;
-	u32 link_status_read_max_retries = 100;
-
-	while (--link_status_read_max_retries) {
-		len = drm_dp_dpcd_read_link_status(ctrl->aux,
-			link_status);
-		if (len != DP_LINK_STATUS_SIZE) {
-			DRM_ERROR("DP link status read failed, err: %d\n", len);
-			return len;
-		}
+	int ret = 0, len;
 
-		if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
-			return 0;
+	len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+	if (len != DP_LINK_STATUS_SIZE) {
+		DRM_ERROR("DP link status read failed, err: %d\n", len);
+		ret = len;
 	}
 
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index c811da515fb3..58d65daae3b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -773,7 +773,8 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
 			link->request.test_lane_count);
 
 	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
-	link->dp_link.link_params.rate = link->request.test_link_rate;
+	link->dp_link.link_params.rate =
+		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
 	return 0;
 }
@@ -939,20 +940,17 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
  */
 static int dp_link_process_link_status_update(struct dp_link_private *link)
 {
-	if (!(get_link_status(link->link_status,
-				DP_LANE_ALIGN_STATUS_UPDATED) &
-				DP_LINK_STATUS_UPDATED) ||
-			(drm_dp_clock_recovery_ok(link->link_status,
-					link->dp_link.link_params.num_lanes) &&
-			drm_dp_channel_eq_ok(link->link_status,
-					link->dp_link.link_params.num_lanes)))
-		return -EINVAL;
+	bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
+			link->dp_link.link_params.num_lanes);
+
+	bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
+			link->dp_link.link_params.num_lanes);
 
 	DRM_DEBUG_DP("channel_eq_done = %d, clock_recovery_done = %d\n",
-			drm_dp_clock_recovery_ok(link->link_status,
-			link->dp_link.link_params.num_lanes),
-			drm_dp_clock_recovery_ok(link->link_status,
-			link->dp_link.link_params.num_lanes));
+			channel_eq_done, clock_recovery_done);
+
+	if (channel_eq_done && clock_recovery_done)
+		return -EINVAL;
 
 	return 0;
 }

base-commit: 0855cb4b31953b8c539e57b970da8146bcd4405a
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

