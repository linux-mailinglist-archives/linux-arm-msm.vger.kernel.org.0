Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBED3DE094
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 22:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhHBUVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 16:21:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20837 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhHBUVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 16:21:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627935668; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PfQwQqGamk2yhFVMH0cYk8jlQ4TdleftFj0Bcd2uREU=; b=M2E6xx/eVvLyBtVZwH55+EIaFvq8m9Ib9M0yFN87t+2qbXv9V1AdVt8+XUSNdSoAJLQi60Yr
 b4NQ5MNS2HiCvKCpHgnK6xmZe79K3sHfzZrVae0wV76n7yyElSWxwDPb+tjZhLZWNvT7DgiB
 zhBodH9bJnDRGFaiztdJrmDQQqU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 610853af9771b05b248a7946 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 20:21:03
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D273C43217; Mon,  2 Aug 2021 20:21:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4D6BC433F1;
        Mon,  2 Aug 2021 20:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4D6BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: update is_connected status base on sink count at dp_pm_resume()
Date:   Mon,  2 Aug 2021 13:20:55 -0700
Message-Id: <1627935655-4090-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently at dp_pm_resume() is_connected state is decided base on hpd connection
status only. This will put is_connected in wrongly "true" state at the scenario
that dongle attached to DUT but without hmdi cable connecting to it. Fix this
problem by adding read sink count from dongle and decided is_connected state base
on both sink count and hpd connection status.

Changes in v2:
-- remove dp_get_sink_count() cand call drm_dp_read_sink_count()

Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8b69114..6dcb78e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1403,6 +1403,7 @@ static int dp_pm_resume(struct device *dev)
 	struct msm_dp *dp_display = platform_get_drvdata(pdev);
 	struct dp_display_private *dp;
 	u32 status;
+	int sink_count = 0;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
@@ -1417,15 +1418,26 @@ xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	status = dp_catalog_link_is_connected(dp->catalog);
+	/*
+	 * set sink to normal operation mode -- D0
+	 * before dpcd read
+	 */
+	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+
+	/* if sink conencted, do dpcd read sink count */
+	if ((status = dp_catalog_link_is_connected(dp->catalog))) {
+		sink_count = drm_dp_read_sink_count(dp->aux);
+		if (sink_count < 0)
+			sink_count = 0;
+	}
 
+	dp->link->sink_count = sink_count;
 	/*
 	 * can not declared display is connected unless
 	 * HDMI cable is plugged in and sink_count of
 	 * dongle become 1
 	 */
-xlog(__func__, 0x12,0,0, 0, dp->link->sink_count);
-	if (status && dp->link->sink_count)
+	if (dp->link->sink_count)
 		dp->dp_display.is_connected = true;
 	else
 		dp->dp_display.is_connected = false;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

