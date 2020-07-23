Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC06522A54F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 04:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387546AbgGWCec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 22:34:32 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:37589 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387483AbgGWCec (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 22:34:32 -0400
IronPort-SDR: SEaBUIS7QFVySKDz6MH5gNsusfxBz1WgLsI4esHeAUNXPgVAQSsxyXqstH2TmrKaN/uPuuBFPn
 fJunmBM/ZbtkiNo50oQhEM8NPiyYBcRpxEsgkmDkd8wibOg4LIcD99aABdaEWzDzRphwCCVGDU
 I/5bcChh9Rm81GqxZmlKnz4C3823U4dv0pKfD4iZfKQhlgh7Jv/7ptpEjPRY31pbM5UdF3zVuG
 6iDTA1szGsst+inAqwc7TevudPpM5SIx3Ydn7JK0q7NnIMfbeu4oIzcgbtSGw5DKcXgmDrmVuQ
 2TM=
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="29047797"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by labrats.qualcomm.com with ESMTP; 22 Jul 2020 19:34:31 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg04-sd.qualcomm.com with ESMTP; 22 Jul 2020 19:34:27 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id ACBCC22E1F; Wed, 22 Jul 2020 19:34:20 -0700 (PDT)
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        sh425.lee@samsung.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 4/9] scsi: ufs-qcom: Fix schedule while atomic error in ufs_qcom_dump_dbg_regs
Date:   Wed, 22 Jul 2020 19:34:03 -0700
Message-Id: <1595471649-25675-5-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595471649-25675-1-git-send-email-cang@codeaurora.org>
References: <1595471649-25675-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dumping testbus registers needs to sleep a bit intermittently as there are
too many of them. Skip them for those contexts where sleep is not allowed.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 7da27ee..7831b2b 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1651,13 +1651,16 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
-	/* sleep a bit intermittently as we are dumping too much data */
 	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
-	udelay(1000);
-	ufs_qcom_testbus_read(hba);
-	udelay(1000);
-	ufs_qcom_print_unipro_testbus(hba);
-	udelay(1000);
+
+	if (in_task()) {
+		/* sleep a bit intermittently as we are dumping too much data */
+		usleep_range(1000, 1100);
+		ufs_qcom_testbus_read(hba);
+		usleep_range(1000, 1100);
+		ufs_qcom_print_unipro_testbus(hba);
+		usleep_range(1000, 1100);
+	}
 }
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

