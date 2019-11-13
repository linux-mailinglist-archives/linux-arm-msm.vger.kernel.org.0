Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B31FAA60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 07:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfKMGqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 01:46:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:44304 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfKMGqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 01:46:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1770360A1B; Wed, 13 Nov 2019 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573627595;
        bh=vA5QMfOG8/tSJ0LbkGi4Gjgkhix8FM2eGb2eZp8y9oo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M/HlsVB5bb8+l4+YaMJ1Tp7nqyHluESqXyhjgoJIa4KufRnWZNPDdoRhSs0Q9bFO7
         UBmYcnB8EgCgeQPHs5MmZZnspEUf/uxVr8IBfOLM6zDBgmYSYIGGDzFVqilAi81BLR
         lwB+2lu+Qe/1jHmVcrSXcLYULKrJlpkv10ojeLeI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFDE06090E;
        Wed, 13 Nov 2019 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573627593;
        bh=vA5QMfOG8/tSJ0LbkGi4Gjgkhix8FM2eGb2eZp8y9oo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2vzfKsAG2mZGoKLD1sdBRfM6oL43Y7K2Iq/piQEA2HSRkd+Yh8H5qdbfkF2ycz6r
         RP9aWEz4qxlAtAF33JT0uIQvvbcmxtzNcliyOU+iHCrrQcUv/2lGcR3fZvU3BJGBg3
         +QNctqsuwRehLc3fHm68ln4NYOFVL2fXwxihleiA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFDE06090E
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
Subject: [PATCH v4 2/7] scsi: ufs-qcom: Add reset control support for host controller
Date:   Tue, 12 Nov 2019 22:45:46 -0800
Message-Id: <1573627552-12615-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573627552-12615-1-git-send-email-cang@codeaurora.org>
References: <1573627552-12615-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add reset control for host controller so that host controller can be reset
as required in its power up sequence.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-qcom.h |  3 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b7148..c69c29a1c 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -246,6 +246,44 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
 	mb();
 }
 
+/**
+ * ufs_qcom_host_reset - reset host controller and PHY
+ */
+static int ufs_qcom_host_reset(struct ufs_hba *hba)
+{
+	int ret = 0;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	if (!host->core_reset) {
+		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
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
+	usleep_range(1000, 1100);
+
+out:
+	return ret;
+}
+
 static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -254,6 +292,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	bool is_rate_B = (UFS_QCOM_LIMIT_HS_RATE == PA_HS_MODE_B)
 							? true : false;
 
+	/* Reset UFS Host Controller and PHY */
+	ret = ufs_qcom_host_reset(hba);
+	if (ret)
+		dev_warn(hba->dev, "%s: host reset returned %d\n",
+				  __func__, ret);
+
 	if (is_rate_B)
 		phy_set_mode(phy, PHY_MODE_UFS_HS_B);
 
@@ -1101,6 +1145,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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

