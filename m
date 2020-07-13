Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503A821CE88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 07:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGMFDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 01:03:32 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:31904 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgGMFDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 01:03:32 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jul 2020 01:03:31 EDT
IronPort-SDR: JfArKeZ9A2bw0skOq60v6blC1tY8ZhO8aNa9Tk7WprCo5/lMywAE2kYHzZbSzTE1Sz6/A2BXMl
 esKJwZGWOJqHFBb4xKwtFzQ91hfNYz7zOe3yggWZsBsPeibt+60AXi2iCwfmsx42sN7LtLRVKM
 NJLwq0VDYugC0BRBR6jexc8bGyHOC+9JfUQANW4Ix0j3RUJtF3cfV40P16jK7nN83w1wmbtwyI
 K5x7XpplJdGr+dyn0C8VbEOF6AyormNSgxLfB9MYhGmv00l3+G7q8nqyuVKUsPpzuj9IqAVCJZ
 GsQ=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
   d="scan'208";a="47215537"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 12 Jul 2020 21:57:27 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg03-sd.qualcomm.com with ESMTP; 12 Jul 2020 21:57:26 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id 8250322DAF; Sun, 12 Jul 2020 21:57:26 -0700 (PDT)
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
Subject: [PATCH v1 3/4] ufs: ufs-qcom: Fix a few BUGs in func ufs_qcom_dump_dbg_regs()
Date:   Sun, 12 Jul 2020 21:57:11 -0700
Message-Id: <1594616232-25080-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594616232-25080-1-git-send-email-cang@codeaurora.org>
References: <1594616232-25080-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dumping testbus registers needs to sleep a bit intermittently as there are
too many of them. Skip them for those contexts where sleep is not allowed.

Meanwhile, if ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
ufshcd_suspend/resume and/or clk gate/ungate context, pm_runtime_get_sync()
and ufshcd_hold() will cause racing problems. Fix it by removing the
unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2e6ddb5..3743c17 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1604,9 +1604,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	 */
 	}
 	mask <<= offset;
-
-	pm_runtime_get_sync(host->hba->dev);
-	ufshcd_hold(host->hba, false);
 	ufshcd_rmwl(host->hba, TEST_BUS_SEL,
 		    (u32)host->testbus.select_major << 19,
 		    REG_UFS_CFG1);
@@ -1619,8 +1616,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	 * committed before returning.
 	 */
 	mb();
-	ufshcd_release(host->hba);
-	pm_runtime_put_sync(host->hba->dev);
 
 	return 0;
 }
@@ -1658,11 +1653,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	/* sleep a bit intermittently as we are dumping too much data */
 	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
-	udelay(1000);
-	ufs_qcom_testbus_read(hba);
-	udelay(1000);
-	ufs_qcom_print_unipro_testbus(hba);
-	udelay(1000);
+	if (in_task()) {
+		udelay(1000);
+		ufs_qcom_testbus_read(hba);
+		udelay(1000);
+		ufs_qcom_print_unipro_testbus(hba);
+		udelay(1000);
+	}
 }
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

