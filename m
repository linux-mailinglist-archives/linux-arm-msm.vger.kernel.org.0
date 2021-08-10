Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5432D3E7C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 17:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243086AbhHJPaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 11:30:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27290 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243071AbhHJPaR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 11:30:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628609395; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HgKakaRiW9LgKPRH3JPzKe8BzZrBQ8j/TWIYvdkiy94=; b=SPVqmOxldo6e1DX5//KnPQB3VBzP/enS3c61ABJur4/WyczCHjyGMBgVQiS+MmAIhvlpgOOX
 eqQ6mbC/d9ksUhDZfW0+GmbyT8pXopRHvzOZR9yCCiJziTBRnH7FU2Set8jF6N82kIgvW8uA
 S1+vNVJ9s7JzTk+BaXzxmm9//qQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61129b5a91487ad520207574 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 15:29:30
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5065EC43144; Tue, 10 Aug 2021 15:29:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C5ABC433F1;
        Tue, 10 Aug 2021 15:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C5ABC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
Date:   Tue, 10 Aug 2021 08:29:22 -0700
Message-Id: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V2:
-- correct Fixes text
-- drop commit text

Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8a85613..870b926 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1284,6 +1284,9 @@ static int dp_pm_resume(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
+	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
@@ -1315,6 +1318,10 @@ static int dp_pm_resume(struct device *dev)
 	else
 		dp->dp_display.is_connected = false;
 
+	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
+			dp->link->sink_count, dp->dp_display.is_connected,
+			dp->core_initialized, dp_display->power_on);
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1330,6 +1337,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
+	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	if (dp->core_initialized == true) {
 		/* mainlink enabled */
 		if (dp_power_clk_status(dp->power, DP_CTRL_PM))
@@ -1343,6 +1353,9 @@ static int dp_pm_suspend(struct device *dev)
 	/* host_init will be called at pm_resume */
 	dp->core_initialized = false;
 
+	DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

