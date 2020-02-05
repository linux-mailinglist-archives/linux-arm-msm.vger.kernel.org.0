Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9781526B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 08:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgBEHOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 02:14:48 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:55138 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725497AbgBEHOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 02:14:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580886887; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/Rn8gPx55VphCTkY85g7IMgryOUcsLPrZIyhj6H0O9Q=; b=iWiKa5SUAeH/yH0QKpi6CV7B2spOfw+f/QhX+tSlIFKBiCqAHbzwJcKZyxILc5yoe+umFjRi
 ad4jN//83PYrKmQhpLYiZqL53zKpYIl0yo7lK9tDBVx/bEfmbin6QznW/6kxFyWtKuTheK0H
 4XepnbPz9S+BBLX1DmP7e8qqmpA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a6b66.7fa68d3f10d8-smtp-out-n03;
 Wed, 05 Feb 2020 07:14:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9C4DC447A3; Wed,  5 Feb 2020 07:14:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B01CCC433CB;
        Wed,  5 Feb 2020 07:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B01CCC433CB
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
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] scsi: ufs: Fix registers dump vops caused scheduling while atomic
Date:   Tue,  4 Feb 2020 23:14:29 -0800
Message-Id: <1580886875-31967-1-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reigsters dump intiated from atomic context should not sleep. To fix it,
add one boolean parameter to register dump vops to inform vendor driver if
sleep is allowed or not.

Signed-off-by: Can Guo <cang@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 3b5b2d9..c30139c 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1619,13 +1619,17 @@ static void ufs_qcom_print_unipro_testbus(struct ufs_hba *hba)
 	kfree(testbus);
 }
 
-static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
+static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba, bool no_sleep)
 {
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
 	/* sleep a bit intermittently as we are dumping too much data */
 	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
+
+	if (no_sleep)
+		return;
+
 	usleep_range(1000, 1100);
 	ufs_qcom_testbus_read(hba);
 	usleep_range(1000, 1100);
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 0ac5d47..c585457 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -398,7 +398,7 @@ static void ufshcd_print_err_hist(struct ufs_hba *hba,
 		dev_err(hba->dev, "No record of %s\n", err_name);
 }
 
-static void ufshcd_print_host_regs(struct ufs_hba *hba)
+static inline void __ufshcd_print_host_regs(struct ufs_hba *hba, bool no_sleep)
 {
 	ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
 	dev_err(hba->dev, "hba->ufs_version = 0x%x, hba->capabilities = 0x%x\n",
@@ -430,7 +430,17 @@ static void ufshcd_print_host_regs(struct ufs_hba *hba)
 
 	ufshcd_print_clk_freqs(hba);
 
-	ufshcd_vops_dbg_register_dump(hba);
+	ufshcd_vops_dbg_register_dump(hba, no_sleep);
+}
+
+static void ufshcd_print_host_regs(struct ufs_hba *hba)
+{
+	__ufshcd_print_host_regs(hba, false);
+}
+
+static void ufshcd_print_host_regs_atomic(struct ufs_hba *hba)
+{
+	__ufshcd_print_host_regs(hba, true);
 }
 
 static
@@ -4821,7 +4831,7 @@ static void ufshcd_slave_destroy(struct scsi_device *sdev)
 		dev_err(hba->dev,
 				"OCS error from controller = %x for tag %d\n",
 				ocs, lrbp->task_tag);
-		ufshcd_print_host_regs(hba);
+		ufshcd_print_host_regs_atomic(hba);
 		ufshcd_print_host_state(hba);
 		break;
 	} /* end of switch */
@@ -5617,7 +5627,7 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 					__func__, hba->saved_err,
 					hba->saved_uic_err);
 
-				ufshcd_print_host_regs(hba);
+				ufshcd_print_host_regs_atomic(hba);
 				ufshcd_print_pwr_info(hba);
 				ufshcd_print_tmrs(hba, hba->outstanding_tasks);
 				ufshcd_print_trs(hba, hba->outstanding_reqs,
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 2ae6c7c..3de7cbb 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -323,7 +323,7 @@ struct ufs_hba_variant_ops {
 	int	(*apply_dev_quirks)(struct ufs_hba *hba);
 	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
-	void	(*dbg_register_dump)(struct ufs_hba *hba);
+	void	(*dbg_register_dump)(struct ufs_hba *hba, bool no_sleep);
 	int	(*phy_initialization)(struct ufs_hba *);
 	void	(*device_reset)(struct ufs_hba *hba);
 };
@@ -1078,10 +1078,11 @@ static inline int ufshcd_vops_resume(struct ufs_hba *hba, enum ufs_pm_op op)
 	return 0;
 }
 
-static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
+static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba,
+						 bool no_sleep)
 {
 	if (hba->vops && hba->vops->dbg_register_dump)
-		hba->vops->dbg_register_dump(hba);
+		hba->vops->dbg_register_dump(hba, no_sleep);
 }
 
 static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
