Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB1D140BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 14:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgAQNwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 08:52:02 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:42929 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729021AbgAQNv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 08:51:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579269118; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ovyWJ6zpbSqDDSSxMWZyo+IzmXMYbJbI7rlM+Da3DcE=; b=KqZbFyxlXZTcAJTMJ/jY1Edp7rYL7CO1aodvZuaJqtGm/iBTFnCcLQC+huwReaMAuQORQdHY
 hK4RlC2CkbssPAjgqfx9beDOBQS6WT100bLEASsM17PNVj15Wf3fqhxYuFP+YpyUgoM6Jyd4
 u8FC62f5f/qWO3XXOH3IKIiDAeE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e21bbfb.7f20f41ded50-smtp-out-n01;
 Fri, 17 Jan 2020 13:51:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8C2A6C447B0; Fri, 17 Jan 2020 13:51:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF909C447A3;
        Fri, 17 Jan 2020 13:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF909C447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        p.zabel@pengutronix.de
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Rename boot status timeout
Date:   Fri, 17 Jan 2020 19:21:29 +0530
Message-Id: <20200117135130.3605-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename the FSM timeout on SC7180 to BOOT_STATUS_TIMEOUT_US.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e1784446d3da3..6a98e9029c70b 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -114,7 +114,7 @@
 #define QDSP6SS_BOOT_CORE_START         0x400
 #define QDSP6SS_BOOT_CMD                0x404
 #define QDSP6SS_BOOT_STATUS		0x408
-#define SLEEP_CHECK_MAX_LOOPS           200
+#define BOOT_STATUS_TIMEOUT_US		200
 #define BOOT_FSM_TIMEOUT                10000
 
 struct reg_info {
@@ -572,7 +572,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* Poll the QDSP6SS_BOOT_STATUS for FSM completion */
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BOOT_STATUS,
 					 val, (val & BIT(0)) != 0, 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 BOOT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "Boot FSM failed to complete.\n");
 			/* Reset the modem so that boot FSM is in reset state */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
