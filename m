Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D7129F679
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 21:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ2UzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 16:55:17 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:19207 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgJ2UzR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 16:55:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604004916; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=IvT094o+bw1ADvmBPN9gouqbGIGTEAEKXJ7h9ttqJTY=; b=bK16y6Cwhz51fFGV22E4JZdKDYZqLOPgMIVh+3BZ4t1ICIxRgHt7Zvfbh6BNwkhUqHjvtIjh
 e3pUO5UBCNTWvLyi4WUfr5Eym/MQ2hqZsD0nrHly1rmW2BSrOnZf4F4nxbNf9aFiRAZF/U6C
 L5hmgoTnmt9oAqRTP76Skfab6Cw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f9b2c33b01cad7dbfadd60f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 20:55:15
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F499C433C6; Thu, 29 Oct 2020 20:55:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A6B6C433C8;
        Thu, 29 Oct 2020 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A6B6C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org, cychiang@chromium.org
Subject: [PATCH] drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
Date:   Thu, 29 Oct 2020 13:55:09 -0700
Message-Id: <20201029205509.13192-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For sinks that do not support audio, there is no need to notify
audio subsystem of the connection event.

This will make sure that audio routes only to the primary display
when connected to such sinks.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4a5735564be2..d970980b0ca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
-	if (dp_display->plugged_cb && dp_display->codec_dev)
-		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+	struct dp_display_private *dp;
+
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
+
+	if (dp_display->plugged_cb && dp_display->codec_dev) {
+		/* notify audio subsystem only if sink supports audio */
+		if (dp->audio_supported)
+			dp_display->plugged_cb(dp_display->codec_dev, plugged);
+	}
 }
 
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

