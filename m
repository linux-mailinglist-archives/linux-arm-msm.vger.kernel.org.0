Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD73236FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 06:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhBXFpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 00:45:09 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:1345 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233329AbhBXFpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 00:45:08 -0500
X-Greylist: delayed 447 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Feb 2021 00:45:08 EST
IronPort-SDR: GHmwxkBX6TVH0/iQO+VHE8ZITx+k7XDjf5up68DbhKPgeHQAlc5rt/69EyPZlz4xtknQ5ClmmW
 fnhTAO3CEFdYp49UsTI7S8QYHAA4S/QRr7T25No7JRJ2R+FgOMB7lvpY0pZULI2fbiMP2WKAIC
 ieT6bnJpeSWN9oWcaUJzrlq+isDG/3qb4VxzSH57J/rBBFnlj7IQZxGgR5lUt7e7L5ubb4YX5w
 +7LyzcqRgaSWVF2EWxMws8e+vBQCws3zOvE11bNJCua/1xBDbP3O8XDhjE9b94lnuopf+jSKSY
 tKU=
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="scan'208";a="29674165"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by labrats.qualcomm.com with ESMTP; 23 Feb 2021 21:37:01 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg02-sd.qualcomm.com with ESMTP; 23 Feb 2021 21:37:00 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 8026D21A10; Tue, 23 Feb 2021 21:37:00 -0800 (PST)
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, cang@codeaurora.org
Cc:     Nitin Rawat <nitirawa@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] scsi: ufs-qcom: Disable interrupt in reset path
Date:   Tue, 23 Feb 2021 21:36:48 -0800
Message-Id: <1614145010-36079-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614145010-36079-1-git-send-email-cang@codeaurora.org>
References: <1614145010-36079-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nitin Rawat <nitirawa@codeaurora.org>

Disable interrupt in reset path to flush pending IRQ handler in order to
avoid possible NoC issues.

Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f97d7b0..a9dc8d7 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -253,12 +253,17 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
 {
 	int ret = 0;
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	bool reenable_intr = false;
 
 	if (!host->core_reset) {
 		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
 		goto out;
 	}
 
+	reenable_intr = hba->is_irq_enabled;
+	disable_irq(hba->irq);
+	hba->is_irq_enabled = false;
+
 	ret = reset_control_assert(host->core_reset);
 	if (ret) {
 		dev_err(hba->dev, "%s: core_reset assert failed, err = %d\n",
@@ -280,6 +285,11 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
 
 	usleep_range(1000, 1100);
 
+	if (reenable_intr) {
+		enable_irq(hba->irq);
+		hba->is_irq_enabled = true;
+	}
+
 out:
 	return ret;
 }
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

