Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91E02B578B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 04:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgKQC6f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 21:58:35 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:53947 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728003AbgKQC6e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 21:58:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605581912; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fc+uRWS1ZDGM/gSjt+rIFo3gxepup6P966dMw8hn/ho=; b=p+8pdOGnhKighBTqUNdv2/t0+QbRYe6/NbtL8flKban4p1eR26A6dPOEMHpCPGUfbpz4lr2x
 JPIgo7J4il4aDQ/LXKB51ll7Sv1eEeIMculrdvgzwVwCZ1e66JqINfUhVlXGZgXSNJCdJz41
 e+C1zX5y0Jmf+a0llr1qdTUEBqg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fb33c5725da3a0fa964d6f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 02:58:31
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45D31C43461; Tue, 17 Nov 2020 02:58:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB0E6C4346B;
        Tue, 17 Nov 2020 02:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB0E6C4346B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     carl.yin@quectel.com, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 1/2] bus: mhi: core: Download AMSS image from appropriate function
Date:   Mon, 16 Nov 2020 18:58:17 -0800
Message-Id: <1605581898-4181-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605581898-4181-1-git-send-email-bbhatt@codeaurora.org>
References: <1605581898-4181-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During full boot chain firmware download, the PM state worker
downloads the AMSS image after waiting for the SBL execution
environment change in PBL mode itself. Since getting rid of the
firmware load worker thread, this design needs to change and MHI
host must download the AMSS image from the SBL mode of PM state
worker thread instead. Since the full boot chain firmware
download is associated with a synchronous power up and has MHI
host waiting for a transition to mission mode with a timeout, we
can skip creating any devices (or probing any client drivers) in
SBL mode transition and proceed directly with the AMSS image
download.

This means that if MHI host driver is not responsible for the
AMSS image download or the controller plans to have client
drivers opening any SBL channels, for example, to download images
or monitor debug logs for memory allocations or power management,
the device can be powered up asynchronously.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 44 ++++++++++++++++++++---------------------
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/pm.c       |  8 ++++++--
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index c2546bf..b91c7b3 100644
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
@@ -500,28 +499,6 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
 	return;
 
 error_ready_state:
@@ -532,3 +509,24 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
index a671f58..aa156b9 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -752,9 +752,13 @@ void mhi_pm_st_worker(struct work_struct *work)
 			/*
 			 * The MHI devices are only created when the client
 			 * device switches its Execution Environment (EE) to
-			 * either SBL or AMSS states
+			 * either SBL or AMSS states. If FBC download is
+			 * expected, we do not create devices in SBL.
 			 */
-			mhi_create_devices(mhi_cntrl);
+			if (mhi_cntrl->fbc_download)
+				mhi_download_amss_image(mhi_cntrl);
+			else
+				mhi_create_devices(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

