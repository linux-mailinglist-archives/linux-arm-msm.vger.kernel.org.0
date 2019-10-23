Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E1BE10C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 06:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731487AbfJWENz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 00:13:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41930 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfJWENz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 00:13:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3B65A60AA8; Wed, 23 Oct 2019 04:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571804034;
        bh=bIqfUq8Cj92dVeLxzswjGAmf6yE3hjGEGDCaYQ/HP8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FZNzxAyufhig1XGtKTvWtJUk3zJrcXbqphX91+BY/WGdU8KOLD4JYyMA42fCinisg
         +JUPDyHnu8gZF+ztiwG44nRXPoPMZaO+4tpQbqOa1O9/Hltn7g7G4SperO1985Ztci
         C1NBn7CGowWhj2EKxCeRGmxN1KAxmN507BYYroh0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8F0260A66;
        Wed, 23 Oct 2019 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571804033;
        bh=bIqfUq8Cj92dVeLxzswjGAmf6yE3hjGEGDCaYQ/HP8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X27rt2T7n4f9qfTki59F32SVFZtliV5rFn+2Vix6qEf6qZYMgdTG5fGd1hSFOUGpc
         ASZCu6Sx1GovWZgiFG7Hn9CvbA2sc54OHFlFE8n3HIrg83q7grK1n/AqAKSlgUxIww
         SGK0Lzc4YSeT4dTlBA0QZpVlBC+uZBKts4Ode2yk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8F0260A66
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cang@codeaurora.org
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 2/2] scsi: ufs-qcom: Add reset control support for host controller
Date:   Tue, 22 Oct 2019 21:13:28 -0700
Message-Id: <1571804009-29787-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571804009-29787-1-git-send-email-cang@codeaurora.org>
References: <1571804009-29787-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add reset control for host controller and provide it through vops to UFS
core driver.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-qcom.h |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b7148..3dee906 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -576,6 +576,39 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return 0;
 }
 
+static int ufs_qcom_full_reset(struct ufs_hba *hba)
+{
+	int ret = -ENOTSUPP;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	if (!host->core_reset) {
+		dev_warn(hba->dev, "%s: failed, err = %d\n", __func__, ret);
+		goto out;
+	}
+
+	ret = reset_control_assert(host->core_reset);
+	if (ret) {
+		dev_err(hba->dev, "%s: core_reset assert failed, err = %d\n",
+				 __func__, ret);
+		goto out;
+	}
+
+	/*
+	 * The hardware requirement for delay between assert/deassert
+	 * is at least 3-4 sleep clock (32.7KHz) cycles, which comes to
+	 * ~125us (4/32768). To be on the safe side add 200us delay.
+	 */
+	usleep_range(200, 210);
+
+	ret = reset_control_deassert(host->core_reset);
+	if (ret)
+		dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
+				 __func__, ret);
+
+out:
+	return ret;
+}
+
 #ifdef CONFIG_MSM_BUS_SCALING
 static int ufs_qcom_get_bus_vote(struct ufs_qcom_host *host,
 		const char *speed_mode)
@@ -1101,6 +1134,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
+	/* Setup the reset control of HCI */
+	host->core_reset = devm_reset_control_get(hba->dev, "rst");
+	if (IS_ERR(host->core_reset)) {
+		err = PTR_ERR(host->core_reset);
+		dev_warn(dev, "Failed to get reset control %d\n", err);
+		host->core_reset = NULL;
+		err = 0;
+	}
+
 	/* Fire up the reset controller. Failure here is non-fatal. */
 	host->rcdev.of_node = dev->of_node;
 	host->rcdev.ops = &ufs_qcom_reset_ops;
@@ -1596,6 +1638,7 @@ static void ufs_qcom_device_reset(struct ufs_hba *hba)
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
+	.full_reset		= ufs_qcom_full_reset,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
 	.device_reset		= ufs_qcom_device_reset,
 };
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index d401f17..2d95e7c 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -6,6 +6,7 @@
 #define UFS_QCOM_H_
 
 #include <linux/reset-controller.h>
+#include <linux/reset.h>
 
 #define MAX_UFS_QCOM_HOSTS	1
 #define MAX_U32                 (~(u32)0)
@@ -233,6 +234,8 @@ struct ufs_qcom_host {
 	u32 dbg_print_en;
 	struct ufs_qcom_testbus testbus;
 
+	/* Reset control of HCI */
+	struct reset_control *core_reset;
 	struct reset_controller_dev rcdev;
 
 	struct gpio_desc *device_reset;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

