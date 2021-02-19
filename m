Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49617320198
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 00:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhBSXMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 18:12:39 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:53082 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhBSXMh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 18:12:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613776337; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ToUYX1fzS/6Po1nFOrkd96NtJXG6i4KSFNc2W66X8Zo=; b=L36qPdVZlPMdVIK4LZDnwM+ujjfyMMKEv7ZBcKdS7d3MUb0/XJhWtvpC1a8Cz21/iyYksuaL
 tD9dpOw3+ZUZWXKMKeUiqqeGFpf3Pl7eEVd8LjweJktDSJR6Bb7DYrcwVybnemsHNXtADe7X
 +gIct6rODxC7LYUDA56ynzD67I4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 603045b30ccf3cf226a4297f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 23:11:47
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3FC0C43467; Fri, 19 Feb 2021 23:11:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACD1BC43462;
        Fri, 19 Feb 2021 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACD1BC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v5 2/3] bus: mhi: core: Download AMSS image from appropriate function
Date:   Fri, 19 Feb 2021 15:11:37 -0800
Message-Id: <1613776298-35560-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613776298-35560-1-git-send-email-bbhatt@codeaurora.org>
References: <1613776298-35560-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During full boot chain firmware download, the PM state worker
downloads the AMSS image after a blocking wait for the SBL
execution environment change when running in PBL transition
itself. Improve this design by having the host download the AMSS
image from the SBL transition of PM state worker thread when a
DEV_ST_TRANSITION_SBL is queued instead of the blocking wait.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 48 ++++++++++++++++++++---------------------
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/pm.c       |  2 ++
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index c2546bf..983e6b5 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -389,7 +389,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 {
 	const struct firmware *firmware = NULL;
-	struct image_info *image_info;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	const char *fw_name;
 	void *buf;
@@ -493,35 +492,15 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_ready_state_transition(mhi_cntrl);
 
 	if (!mhi_cntrl->fbc_download)
-		return;
+		goto exit_fw_load;
 
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
 		goto error_ready_state;
 	}
 
-	/* Wait for the SBL event */
-	ret = wait_event_timeout(mhi_cntrl->state_event,
-				 mhi_cntrl->ee == MHI_EE_SBL ||
-				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
-				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
-
-	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_ready_state;
-	}
-
-	/* Start full firmware image download */
-	image_info = mhi_cntrl->fbc_image;
-	ret = mhi_fw_load_bhie(mhi_cntrl,
-			       /* Vector table is the last entry */
-			       &image_info->mhi_buf[image_info->entries - 1]);
-	if (ret) {
-		dev_err(dev, "MHI did not load image over BHIe, ret: %d\n",
-			ret);
-		goto error_fw_load;
-	}
-
+exit_fw_load:
+	dev_info(dev, "Wait for device to enter SBL or Mission mode\n");
 	return;
 
 error_ready_state:
@@ -532,3 +511,24 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
 	wake_up_all(&mhi_cntrl->state_event);
 }
+
+int mhi_download_amss_image(struct mhi_controller *mhi_cntrl)
+{
+	struct image_info *image_info = mhi_cntrl->fbc_image;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
+	if (!image_info)
+		return -EIO;
+
+	ret = mhi_fw_load_bhie(mhi_cntrl,
+			       /* Vector table is the last entry */
+			       &image_info->mhi_buf[image_info->entries - 1]);
+	if (ret) {
+		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
+		mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
+		wake_up_all(&mhi_cntrl->state_event);
+	}
+
+	return ret;
+}
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 6f80ec3..6f37439 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -619,6 +619,7 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
 int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd);
+int mhi_download_amss_image(struct mhi_controller *mhi_cntrl);
 static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 {
 	return (mhi_cntrl->dev_state >= MHI_STATE_M0 &&
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 8da8806..44aa7eb 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -758,6 +758,8 @@ void mhi_pm_st_worker(struct work_struct *work)
 			 * either SBL or AMSS states
 			 */
 			mhi_create_devices(mhi_cntrl);
+			if (mhi_cntrl->fbc_download)
+				mhi_download_amss_image(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

