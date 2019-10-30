Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04157E9B9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 13:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfJ3MiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 08:38:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfJ3MiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 08:38:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B4B546106C; Wed, 30 Oct 2019 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572439088;
        bh=DBmrumYHBj8SE4uwRjnrzfskPulH9RfV3P8m3bSOu9c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gx0cugH76qiK7S4sEghOVcvfp6+XUvom9Wr3XHPxpwh3qG1WljvcGztX7Os9UAx56
         JQjHvIioFoNNKugOoaHlC7ep6Awb+FcVcIij6Hi+qwuKxxdHzhJ1DiEc2K2Uduy3X1
         gXS7ItuC3Tm38BwvsJttm+lsktnSdjMNfQpkcDos=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C066A60FF9;
        Wed, 30 Oct 2019 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572439087;
        bh=DBmrumYHBj8SE4uwRjnrzfskPulH9RfV3P8m3bSOu9c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dJNMGydy3+2bRqoTba3UbKgzlyOGWfcdMzh113l5IF5izs1N+LjSnsVATAjZOpUMl
         TGSGQ23VbH8KLDGhq7QpBXE271pVObf9YC6lNNx5+uZdo12x3Zu91I2KBEVvBkzcbt
         jPBHUca4bOwxzDoiovvpKIFcAq/yxyN5ymqDf+Eo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C066A60FF9
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
Subject: [PATCH v1 2/2] scsi: ufs-qcom: Export bus bandwidth voting ops
Date:   Wed, 30 Oct 2019 05:37:43 -0700
Message-Id: <1572439064-28785-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572439064-28785-1-git-send-email-cang@codeaurora.org>
References: <1572439064-28785-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Export bus bandwidth voting ops so that UFS driver can vote for
bus bandwidth change through vendor ops.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 53 ++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b7148..0a6fac9 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -38,7 +38,6 @@ enum {
 
 static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote);
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_dme_vs_core_clk_ctrl_clear_div(struct ufs_hba *hba,
 						       u32 clk_cycles);
@@ -630,7 +629,7 @@ static void ufs_qcom_get_speed_mode(struct ufs_pa_layer_attr *p, char *result)
 	}
 }
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
+static int __ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
 {
 	int err = 0;
 
@@ -661,7 +660,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
 
 	vote = ufs_qcom_get_bus_vote(host, mode);
 	if (vote >= 0)
-		err = ufs_qcom_set_bus_vote(host, vote);
+		err = __ufs_qcom_set_bus_vote(host, vote);
 	else
 		err = vote;
 
@@ -672,6 +671,35 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
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
@@ -748,7 +776,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
 	return 0;
 }
 
-static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
+static int ufs_qcom_set_bus_vote(struct ufs_hba *host, bool on)
 {
 	return 0;
 }
@@ -986,8 +1014,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int err;
-	int vote = 0;
 
 	/*
 	 * In case ufs_qcom_init() is not yet done, simply ignore.
@@ -1001,25 +1027,14 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
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
 	}
 
-	err = ufs_qcom_set_bus_vote(host, vote);
-	if (err)
-		dev_err(hba->dev, "%s: set bus vote failed %d\n",
-				__func__, err);
-
-	return err;
+	return 0;
 }
 
 static int
@@ -1185,6 +1200,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
 
+	ufs_qcom_set_bus_vote(hba, true);
 	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
 
 	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
@@ -1597,6 +1613,7 @@ static void ufs_qcom_device_reset(struct ufs_hba *hba)
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
+	.set_bus_vote		= ufs_qcom_set_bus_vote,
 	.device_reset		= ufs_qcom_device_reset,
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

