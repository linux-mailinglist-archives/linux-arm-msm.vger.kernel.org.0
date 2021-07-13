Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC703C73A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237194AbhGMP5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:57:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55813 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237214AbhGMP5t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:57:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626191700; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cyXJ9mJ8LBWXjwGWfk54YTCR6FHccnLnwAEVHScm1GQ=; b=QpGRyZ5sEJHzq/bIbGZSLCfC/+wg/byvmKX0P/bPAfgNhcXGlP5+Mzv6hlw57e1PHuWlTqHa
 VpgY+3sYR2QoF5CGUf+NYB3CJwex+kUGpdiod2JVaipXjdgIGSicZ1d10h2vUuuB1aAvSbRk
 JADQkbG4NJHFRZreu0xGKpk2QqQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60edb7535d0d101e3816383e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:54:59
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58DD7C43460; Tue, 13 Jul 2021 15:54:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E9EEC43152;
        Tue, 13 Jul 2021 15:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E9EEC43152
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] drm/msm/dp: retrain link when loss of symbol lock detected
Date:   Tue, 13 Jul 2021 08:54:07 -0700
Message-Id: <1626191647-13901-8-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Main link symbol locked is achieved at end of link training 2. Some
dongle main link symbol may become unlocked again if host did not end
link training soon enough after completion of link training 2. Host
have to re train main link if loss of symbol lock detected before
end link training so that the coming video stream can be transmitted
to sink properly.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6a013b0..20951c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1638,6 +1638,25 @@ static bool dp_ctrl_clock_recovery_any_ok(
 	return drm_dp_clock_recovery_ok(link_status, lane_count);
 }
 
+static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	u8 status;
+	int i;
+	int num_lanes = ctrl->link->link_params.num_lanes;
+
+	dp_ctrl_read_link_status(ctrl, link_status);
+
+	for (i = 0; i < num_lanes; i++) {
+		status = link_status[i / 2];
+		status >>= ((i % 2) * 4);
+		if (!(status & DP_LANE_SYMBOL_LOCKED))
+			return true;
+	}
+
+	return false;
+}
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
@@ -1761,6 +1780,13 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	return rc;
 }
 
+static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
+{
+	int training_step = DP_TRAINING_NONE;
+
+	return dp_ctrl_setup_main_link(ctrl, &training_step);
+}
+
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 {
 	int ret = 0;
@@ -1786,6 +1812,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	if (dp_ctrl_loss_symbol_lock(ctrl))
+		dp_ctrl_link_retrain(ctrl);
+
 	/* stop txing train pattern to end link training */
 	dp_ctrl_clear_training_pattern(ctrl);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

