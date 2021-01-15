Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B065C2F700C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 02:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731546AbhAOBh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 20:37:29 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:13949 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731543AbhAOBh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 20:37:28 -0500
IronPort-SDR: bTWwoMesqL3F8HKe1G74d+N1DyTdenKBbnMJQzc5luVeAA1Kf7HWzxcbXMVRPqP0BJNoTjHN1x
 2QIe92xPCA2Rj1HIc7zKb4HCHOcTdt44G7o2wQGAfnAbli9dL+OySyi8eNTyzzREIlNai0Jq7Z
 jGq9vIGWI+e8knqQC78XXIh7Kz0UzkxXUcN4W5Kmm6Zx0a2W2GN6quT2TspMDqBRTvGSFf2/z9
 DAYwEPmgRQh8cNlNV5y5l+XxjYavnUmbSf9f+rqG1L1BNZedMiB8Pri/IagBmG/BudOp8RHzE6
 t6E=
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="29542003"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by labrats.qualcomm.com with ESMTP; 14 Jan 2021 17:36:33 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg04-sd.qualcomm.com with ESMTP; 14 Jan 2021 17:36:32 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 0F54F218C5; Thu, 14 Jan 2021 17:36:32 -0800 (PST)
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
Subject: [PATCH 2/2] scsi: ufs-qcom: Disable interrupt in reset path
Date:   Thu, 14 Jan 2021 17:36:19 -0800
Message-Id: <1610674580-20811-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610674580-20811-1-git-send-email-cang@codeaurora.org>
References: <1610674580-20811-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nitin Rawat <nitirawa@codeaurora.org>

Disable interrupt in reset path to flush pending IRQ handler in order to
avoid possible NoC issues.

Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..e55201f 100644
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

