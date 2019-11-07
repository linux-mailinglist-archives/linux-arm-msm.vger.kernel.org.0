Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B541F297A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 09:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387678AbfKGIm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 03:42:58 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33704 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfKGIm6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 03:42:58 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 30D0160A44; Thu,  7 Nov 2019 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573116176;
        bh=x7xgmsNyZOffU9ajnqQyQDdzussrr2t/6NHbEBf9yQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PBa9bGT2CrxndfJ3p28hljTHKL4Omu2oGpA1aL2xUQj3GNzeiTOcq2zLiCTtEJn0V
         fet/MBeWeZ/toC3tFgePYLtDS5PmOMFuHZT2iR5TExHn7LOtUvpezgpHUDjb8Jh3Ae
         MK0kIOB42HsXqsuouiv3/M6YAoz1Vu0413QAsgLg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 886A960A37;
        Thu,  7 Nov 2019 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573116171;
        bh=x7xgmsNyZOffU9ajnqQyQDdzussrr2t/6NHbEBf9yQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NIhk/MKyDhhqpBNo4tMpTYUlJA4YIkfXduPtiMAot0hfrhrUZ4iXFzU46izYPDqes
         gRj1rkAEQ3/UIvD4vh5oD7EfkjStaT3agKbL2YuiN5Prq+B3nh5ARPm+j2z7AH4y5k
         QqsVCfQWP4OLo4lV3E2J+CqhR/48DF/FOy3Tnhzc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 886A960A37
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
Subject: [PATCH v1 4/6] scsi: ufs-qcom: Adjust bus bandwidth voting and unvoting
Date:   Thu,  7 Nov 2019 00:42:11 -0800
Message-Id: <1573116140-22408-5-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573116140-22408-1-git-send-email-cang@codeaurora.org>
References: <1573116140-22408-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bus bandwidth voting is required to be done before the bus clocks
are enabled, and the unvoting is required to be done only after the bus
clocks are disabled.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 58 ++++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1c..f703dd0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -38,7 +38,6 @@ enum {
 
 static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote);
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_dme_vs_core_clk_ctrl_clear_div(struct ufs_hba *hba,
 						       u32 clk_cycles);
@@ -674,7 +673,7 @@ static void ufs_qcom_get_speed_mode(struct ufs_pa_layer_attr *p, char *result)
 	}
 }
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
+static int __ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
 {
 	int err = 0;
 
@@ -705,7 +704,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
 
 	vote = ufs_qcom_get_bus_vote(host, mode);
 	if (vote >= 0)
-		err = ufs_qcom_set_bus_vote(host, vote);
+		err = __ufs_qcom_set_bus_vote(host, vote);
 	else
 		err = vote;
 
@@ -716,6 +715,35 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
 	return err;
 }
 
+static int ufs_qcom_set_bus_vote(struct ufs_hba *hba, bool on)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	int vote, err;
+
+	/*
+	 * In case ufs_qcom_init() is not yet done, simply ignore.
+	 * This ufs_qcom_set_bus_vote() shall be called from
+	 * ufs_qcom_init() after init is done.
+	 */
+	if (!host)
+		return 0;
+
+	if (on) {
+		vote = host->bus_vote.saved_vote;
+		if (vote == host->bus_vote.min_bw_vote)
+			ufs_qcom_update_bus_bw_vote(host);
+	} else {
+		vote = host->bus_vote.min_bw_vote;
+	}
+
+	err = __ufs_qcom_set_bus_vote(host, vote);
+	if (err)
+		dev_err(hba->dev, "%s: set bus vote failed %d\n",
+				__func__, err);
+
+	return err;
+}
+
 static ssize_t
 show_ufs_to_mem_max_bus_bw(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -792,7 +820,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
 	return 0;
 }
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
+static int ufs_qcom_set_bus_vote(struct ufs_hba *host, bool on)
 {
 	return 0;
 }
@@ -1030,8 +1058,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int err;
-	int vote = 0;
+	int err = 0;
 
 	/*
 	 * In case ufs_qcom_init() is not yet done, simply ignore.
@@ -1041,27 +1068,19 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	if (!host)
 		return 0;
 
-	if (on && (status == POST_CHANGE)) {
+	if (on && (status == PRE_CHANGE))
+		err = ufs_qcom_set_bus_vote(hba, true);
+	else if (on && (status == POST_CHANGE)) {
 		/* enable the device ref clock for HS mode*/
 		if (ufshcd_is_hs_mode(&hba->pwr_info))
 			ufs_qcom_dev_ref_clk_ctrl(host, true);
-		vote = host->bus_vote.saved_vote;
-		if (vote == host->bus_vote.min_bw_vote)
-			ufs_qcom_update_bus_bw_vote(host);
-
 	} else if (!on && (status == PRE_CHANGE)) {
 		if (!ufs_qcom_is_link_active(hba)) {
 			/* disable device ref_clk */
 			ufs_qcom_dev_ref_clk_ctrl(host, false);
 		}
-
-		vote = host->bus_vote.min_bw_vote;
-	}
-
-	err = ufs_qcom_set_bus_vote(host, vote);
-	if (err)
-		dev_err(hba->dev, "%s: set bus vote failed %d\n",
-				__func__, err);
+	} else if (!on && (status == POST_CHANGE))
+		err = ufs_qcom_set_bus_vote(hba, false);
 
 	return err;
 }
@@ -1238,6 +1257,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
 
+	ufs_qcom_set_bus_vote(hba, true);
 	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
 
 	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

