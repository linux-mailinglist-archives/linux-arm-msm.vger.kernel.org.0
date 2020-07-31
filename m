Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0010323475C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 16:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387493AbgGaOIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 10:08:09 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:15506 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732281AbgGaOIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 10:08:06 -0400
IronPort-SDR: x/CIroGFlnK3xA+D1zoFkwhnfxsuVCE+xszbAMqI6ufoSAmniObRCYKq4CPxw58fsV7UOWci9r
 hiN0La5d9wU3duMr5/HhuFbOHmV9m0XL7gH7e4XbamUV+6IRHrM4LJNKPFh/wbF8QZ5ZRLR+SE
 gV5on1rUYtljiHFiQqDqx/2YYIYBnL8QnRwROgruOZDETizu25dpXgjUllvhvw7xxWvAe77xq2
 aQ9vfIVXXwwzdIwf6XAzBCNvnX+M4q8PcGkFmHfjejxzSn96vUEM1X40helVbBoo0Ctns0zL1N
 34k=
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="47235770"
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by labrats.qualcomm.com with ESMTP; 31 Jul 2020 07:08:05 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 31 Jul 2020 07:08:04 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id 6735922E4D; Fri, 31 Jul 2020 07:08:04 -0700 (PDT)
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
Subject: [PATCH 3/8] scsi: ufs-qcom: Remove testbus dump in ufs_qcom_dump_dbg_regs
Date:   Fri, 31 Jul 2020 07:07:51 -0700
Message-Id: <1596204478-5420-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596204478-5420-1-git-send-email-cang@codeaurora.org>
References: <1596204478-5420-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dumping testbus registers is heavy enough to cause stability issues
sometime, just remove them as of now.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 7da27ee..96e0999 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1620,44 +1620,12 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
-static void ufs_qcom_testbus_read(struct ufs_hba *hba)
-{
-	ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
-}
-
-static void ufs_qcom_print_unipro_testbus(struct ufs_hba *hba)
-{
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	u32 *testbus = NULL;
-	int i, nminor = 256, testbus_len = nminor * sizeof(u32);
-
-	testbus = kmalloc(testbus_len, GFP_KERNEL);
-	if (!testbus)
-		return;
-
-	host->testbus.select_major = TSTBUS_UNIPRO;
-	for (i = 0; i < nminor; i++) {
-		host->testbus.select_minor = i;
-		ufs_qcom_testbus_config(host);
-		testbus[i] = ufshcd_readl(hba, UFS_TEST_BUS);
-	}
-	print_hex_dump(KERN_ERR, "UNIPRO_TEST_BUS ", DUMP_PREFIX_OFFSET,
-			16, 4, testbus, testbus_len, false);
-	kfree(testbus);
-}
-
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
-	/* sleep a bit intermittently as we are dumping too much data */
 	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
-	udelay(1000);
-	ufs_qcom_testbus_read(hba);
-	udelay(1000);
-	ufs_qcom_print_unipro_testbus(hba);
-	udelay(1000);
 }
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

