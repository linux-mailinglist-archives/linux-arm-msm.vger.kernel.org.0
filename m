Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5416153EF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 07:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgBFG5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 01:57:25 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36447 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727995AbgBFG5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 01:57:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580972243; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5bz0C9Ewaz4NB7pJ4aL3LrNuLY54i9bNw2BWvCOwH84=; b=JgaaKd9L89fAahiSXXQKheiS9peip6Usj5RBzM4gRSGM/wPDzBpAbvAFW/qdrpQYrU7AloIe
 epAmj6EKnR7opOyiXZDVwJKa9UCfXGfUu0xK3pavkAlV+H7uGnlLYesJkHvhslajESNX6Fw+
 FyRXTr6KYfbrbvw2jTuc7+Lo7Po=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3bb8cc.7f0a50932e30-smtp-out-n02;
 Thu, 06 Feb 2020 06:57:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8ABFFC447A0; Thu,  6 Feb 2020 06:57:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFE02C433A2;
        Thu,  6 Feb 2020 06:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFE02C433A2
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
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/8] scsi: ufs-qcom: Adjust bus bandwidth voting and unvoting
Date:   Wed,  5 Feb 2020 22:56:47 -0800
Message-Id: <1580972212-29881-5-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
References: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bus bandwidth voting is required to be done before the bus clocks
are enabled, and the unvoting is required to be done only after the bus
clocks are disabled.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1c..85d7c17 100644
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
+				 __func__, err);
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
@@ -1041,28 +1068,21 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	if (!host)
 		return 0;
 
-	if (on && (status == POST_CHANGE)) {
+	if (on && (status == PRE_CHANGE)) {
+		err = ufs_qcom_set_bus_vote(hba, true);
+	} else if (on && (status == POST_CHANGE)) {
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
+	} else if (!on && (status == POST_CHANGE)) {
+		err = ufs_qcom_set_bus_vote(hba, false);
 	}
 
-	err = ufs_qcom_set_bus_vote(host, vote);
-	if (err)
-		dev_err(hba->dev, "%s: set bus vote failed %d\n",
-				__func__, err);
-
 	return err;
 }
 
@@ -1238,6 +1258,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
 
+	ufs_qcom_set_bus_vote(hba, true);
 	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
 
 	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
