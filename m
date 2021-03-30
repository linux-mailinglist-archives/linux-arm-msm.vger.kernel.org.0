Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D6934DD7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 03:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhC3B2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 21:28:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35224 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230475AbhC3B2h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 21:28:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617067717; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=vc9PWvmyji/sJp9yjjMx+M4kw6KlADuzc3lhZJx41iA=; b=wV97Puid8f+v5v9pkUJErN3UsXADsxA9zNjna06r9yd7YBeNu55cbt1pe2/Zbz0ZDHGsKhgW
 66bV0IuShQ3JUWf+1HJtQ6cpGo8NMG8WcELpXwVSGsGYQB6cyhSwVeVfkCxfvMJ0YvnSV50t
 kqtfSposMQg9DsCKBdYZl4ffQx4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60627ec1bff8e3e1d417999d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 01:28:33
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68F10C433C6; Tue, 30 Mar 2021 01:28:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13A5FC43461;
        Tue, 30 Mar 2021 01:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13A5FC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, abickett@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 4/7] bus: mhi: core: Add support for Flash Programmer execution environment
Date:   Mon, 29 Mar 2021 18:28:21 -0700
Message-Id: <1617067704-28850-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Carl Yin <carl.yin@quectel.com>

MHI WWAN modems support downloading firmware to NAND or eMMC
using Firehose protocol with process as follows:
1. Modem boots up, enters AMSS execution environment and the
device later enters EDL (Emergency Download) mode through any
mechanism host can use such as a diag command.
2. Modem enters SYS_ERROR, MHI host handles SYS_ERROR transition.
3. EDL image for device to enter 'Flash Programmer' execution
environment is then flashed via BHI interface from host.
4. Modem enters MHI READY -> M0 and sends the Flash Programmer
execution environment change to host.
5. Following that, EDL/FIREHOSE channels (34, 35) are made
available from the host.
6. User space tool for downloading firmware image to modem over
the EDL channels using Firehose protocol. Link to USB flashing
tool: https://git.linaro.org/landing-teams/working/qualcomm/qdl.git/

Make the necessary changes to allow for this sequence to occur and
allow using the Flash Programmer execution environment.

Signed-off-by: Carl Yin <carl.yin@quectel.com>
Co-developed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c     | 2 ++
 drivers/bus/mhi/core/internal.h | 1 +
 drivers/bus/mhi/core/main.c     | 3 +++
 drivers/bus/mhi/core/pm.c       | 6 ++++++
 include/linux/mhi.h             | 4 +++-
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 706484f..ee67712 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -29,6 +29,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
 	[MHI_EE_WFW] = "WFW",
 	[MHI_EE_PTHRU] = "PASS THRU",
 	[MHI_EE_EDL] = "EDL",
+	[MHI_EE_FP] = "FLASH PROGRAMMER",
 	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
 	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
 };
@@ -38,6 +39,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_READY] = "READY",
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
+	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
 	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
 	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 6f37439..b1b5f2b 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -386,6 +386,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_READY,
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
+	DEV_ST_TRANSITION_FP,
 	DEV_ST_TRANSITION_SYS_ERR,
 	DEV_ST_TRANSITION_DISABLE,
 	DEV_ST_TRANSITION_MAX,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index d377d07..8b68657 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -831,6 +831,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			case MHI_EE_AMSS:
 				st = DEV_ST_TRANSITION_MISSION_MODE;
 				break;
+			case MHI_EE_FP:
+				st = DEV_ST_TRANSITION_FP;
+				break;
 			case MHI_EE_RDDM:
 				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 				write_lock_irq(&mhi_cntrl->pm_lock);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index b65222e..7ac9dfe 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -782,6 +782,12 @@ void mhi_pm_st_worker(struct work_struct *work)
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
 			break;
+		case DEV_ST_TRANSITION_FP:
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			mhi_cntrl->ee = MHI_EE_FP;
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			mhi_create_devices(mhi_cntrl);
+			break;
 		case DEV_ST_TRANSITION_READY:
 			mhi_ready_state_transition(mhi_cntrl);
 			break;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 8f5bf40..b16afd3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -117,6 +117,7 @@ struct mhi_link_info {
  * @MHI_EE_WFW: WLAN firmware mode
  * @MHI_EE_PTHRU: Passthrough
  * @MHI_EE_EDL: Embedded downloader
+ * @MHI_EE_FP: Flash Programmer Environment
  */
 enum mhi_ee_type {
 	MHI_EE_PBL,
@@ -126,7 +127,8 @@ enum mhi_ee_type {
 	MHI_EE_WFW,
 	MHI_EE_PTHRU,
 	MHI_EE_EDL,
-	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
+	MHI_EE_FP,
+	MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
 	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
 	MHI_EE_NOT_SUPPORTED,
 	MHI_EE_MAX,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

