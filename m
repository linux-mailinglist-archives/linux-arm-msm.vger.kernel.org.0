Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C9D21E5A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 04:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGNC23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 22:28:29 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:11393 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNC21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 22:28:27 -0400
IronPort-SDR: hIVAOLfRWc7vP/6EzNNwfTtj25E5QxOh8B013qpDsxVQg1XNr6p6g2YZormq2oue6Gd2MuZ/kz
 g5lVhOHBDMsn4mS95zvGvPglJLqfzucEyKEgFt8jfinhveC+/M0BPnHVbnyQuIb967GctgnLjZ
 B4iIESEgsqNKi6CukIUnJpRGYAYdrQCEka/IyvJsB9agZeqPclXS94sSGGEiuTzy6vjrJjdpvZ
 vVf2GnbfRiu2jFuU7T3WGGHmdVsAagojyYHg+sx5eY8NWFWzicYEvfz4PcsA4cHchL+fiUBApE
 9j0=
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; 
   d="scan'208";a="47216745"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by labrats.qualcomm.com with ESMTP; 13 Jul 2020 19:28:26 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg01-sd.qualcomm.com with ESMTP; 13 Jul 2020 19:28:25 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id 8A0A122DC2; Mon, 13 Jul 2020 19:28:25 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ufs: ufs-qcom: Fix a few BUGs in func ufs_qcom_dump_dbg_regs()
Date:   Mon, 13 Jul 2020 19:28:11 -0700
Message-Id: <1594693693-22466-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594693693-22466-1-git-send-email-cang@codeaurora.org>
References: <1594693693-22466-1-git-send-email-cang@codeaurora.org>
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

