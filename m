Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC42A222229
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 14:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgGPMFw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 08:05:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11854 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728123AbgGPMFw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 08:05:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594901151; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=mZToouJIgleobHZ2m2rREERXRWsV20MId2MvaPSl/d8=; b=gh+EoqjhKLID/dHH/uHlC3mJJ0paVksNeNNLS987/oHe3OFz/9z2pz95ZCzHghdNFAAx3Nuk
 WmkW2ip3WLuVx1QhEeGl2PK01Fd9+R2BU+/eLyOL0YLuUiZxLqz+TdmfJtzGquXoo0goangu
 Db+LDbObsqZUlo3WJPRGHnoQbLg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f10429865270fa595814deb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 12:05:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C372C433CA; Thu, 16 Jul 2020 12:05:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AA3EC433C6;
        Thu, 16 Jul 2020 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AA3EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Monitor MSS_STATUS for boot completion
Date:   Thu, 16 Jul 2020 17:35:14 +0530
Message-Id: <20200716120514.21588-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On secure devices there exists a race condition which could lock the MSS
CONFIG AHB bus thus preventing access to BOOT_STATUS register during SSR.
Switch to polling the MSS_STATUS register with an additional 10 us delay
to reliably track boot completion.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a9ba5f38a58ed..13c6d5a72a831 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -113,8 +113,6 @@
 #define QDSP6SS_SLEEP                   0x3C
 #define QDSP6SS_BOOT_CORE_START         0x400
 #define QDSP6SS_BOOT_CMD                0x404
-#define QDSP6SS_BOOT_STATUS		0x408
-#define BOOT_STATUS_TIMEOUT_US		200
 #define BOOT_FSM_TIMEOUT                10000
 
 struct reg_info {
@@ -580,13 +578,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* De-assert the Q6 stop core signal */
 		writel(1, qproc->reg_base + QDSP6SS_BOOT_CORE_START);
 
+		/* Wait for 10 us for any staggering logic to settle */
+		usleep_range(10, 20);
+
 		/* Trigger the boot FSM to start the Q6 out-of-reset sequence */
 		writel(1, qproc->reg_base + QDSP6SS_BOOT_CMD);
 
-		/* Poll the QDSP6SS_BOOT_STATUS for FSM completion */
-		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BOOT_STATUS,
-					 val, (val & BIT(0)) != 0, 1,
-					 BOOT_STATUS_TIMEOUT_US);
+		/* Poll the MSS_STATUS for FSM completion */
+		ret = readl_poll_timeout(qproc->rmb_base + RMB_MBA_MSS_STATUS,
+					 val, (val & BIT(0)) != 0, 10, BOOT_FSM_TIMEOUT);
 		if (ret) {
 			dev_err(qproc->dev, "Boot FSM failed to complete.\n");
 			/* Reset the modem so that boot FSM is in reset state */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

