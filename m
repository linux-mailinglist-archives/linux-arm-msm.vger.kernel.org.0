Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DBF169CE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 05:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgBXEJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Feb 2020 23:09:58 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14196 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727207AbgBXEJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Feb 2020 23:09:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582517397; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nrgehuA5vlcZy6vJf6jRjU/2UWV2v8BoCSYVRst3lyM=; b=ABPccQdIk/G9/zs9wEO0dYKJ5ayAwC6nuD3ORri2SM6EemXpv10Y4T1YPgK97/T1R7PGSMD1
 hB1Xdqn/ZUYCm7iJgUscr44FltBWFyrYaytccpseHfMoY4jdSZWCR3RRs2hon0XKTLEFBBDd
 /SV+FUazcJnqBT9xjuZ2ICkLue0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e534c90.7f0c04ac2ae8-smtp-out-n01;
 Mon, 24 Feb 2020 04:09:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A82F8C447A9; Mon, 24 Feb 2020 04:09:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E58A0C43383;
        Mon, 24 Feb 2020 04:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E58A0C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cang@codeaurora.org
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Evan Green <evgreen@chromium.org>,
        Bean Huo <beanhuo@micron.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] scsi: ufs-qcom: Apply QUIRK_HOST_TACTIVATE for WDC UFS devices
Date:   Sun, 23 Feb 2020 20:09:22 -0800
Message-Id: <1582517363-11536-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582517363-11536-1-git-send-email-cang@codeaurora.org>
References: <1582517363-11536-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Western Digital UFS devices require host's PA_TACTIVATE to be lower than
device's PA_TACTIVATE, otherwise it may get stuck during hibern8 sequence.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c   | 3 +++
 drivers/scsi/ufs/ufs_quirks.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1c..4caa57f 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -956,6 +956,9 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME)
 		err = ufs_qcom_quirk_host_pa_saveconfigtime(hba);
 
+	if (hba->dev_info.wmanufacturerid == UFS_VENDOR_WDC)
+		hba->dev_quirks |= UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
+
 	return err;
 }
 
diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index d0ab147..df7a1e6 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -15,6 +15,7 @@
 #define UFS_VENDOR_TOSHIBA     0x198
 #define UFS_VENDOR_SAMSUNG     0x1CE
 #define UFS_VENDOR_SKHYNIX     0x1AD
+#define UFS_VENDOR_WDC         0x145
 
 /**
  * ufs_dev_fix - ufs device quirk info
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
