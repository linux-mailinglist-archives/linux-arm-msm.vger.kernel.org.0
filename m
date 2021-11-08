Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41A0449EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 23:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbhKHWWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 17:22:34 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:45742 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239633AbhKHWWc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 17:22:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636409987; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OVbAu503m2OjDJ+olw7/qCqtm3SJRr6hxHct9Rj2XTM=; b=mdkR7eYmy6sLXPHw2buFgTKmkg4lF3aTticEwAWHmqIyO+gazPoeNyTbTkeIYfmKnR3O/GvL
 /bcN6aKbv4rBO4QSBX3GfmagmVM7smirJMRMtOrgbF/PtqL3pqSa/EdPbWjilAddip4YJ/MI
 Yd5wy/WuNsmIjPpS9SUi2lIakKA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6189a2816b778b5a19cf2307 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 22:19:45
 GMT
Sender: quic_bbhatt=quicinc.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D993C4338F; Mon,  8 Nov 2021 22:19:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from vivace-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBAB5C4338F;
        Mon,  8 Nov 2021 22:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DBAB5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=quicinc.com
From:   Bhaumik Bhatt <quic_bbhatt@quicinc.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, quic_hemantk@quicinc.com,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Use macros for execution environment features
Date:   Mon,  8 Nov 2021 14:19:38 -0800
Message-Id: <1636409978-31847-1-git-send-email-quic_bbhatt@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

The implementation for execution environment specific functionality
is spread out. Use macros that help determine the paths to be taken.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 2 +-
 drivers/bus/mhi/core/internal.h | 3 ++-
 drivers/bus/mhi/core/pm.c       | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0a97262..74295d3 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -417,7 +417,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* wait for ready on pass through or any other execution environment */
-	if (mhi_cntrl->ee != MHI_EE_EDL && mhi_cntrl->ee != MHI_EE_PBL)
+	if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
 		goto fw_load_ready_state;
 
 	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 3a732af..9d72b1d1 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -390,7 +390,8 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
 
 #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
 			ee == MHI_EE_EDL)
-
+#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
+#define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
 #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
 				 ee == MHI_EE_FP)
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e37..0bb8d77 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1068,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
 	/* Confirm that the device is in valid exec env */
-	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
+	if (!MHI_POWER_UP_CAPABLE(current_ee)) {
 		dev_err(dev, "%s is not a valid EE for power on\n",
 			TO_MHI_EXEC_STR(current_ee));
 		ret = -EIO;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

