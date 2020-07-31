Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B542340CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731802AbgGaIIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:08:20 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:63244 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgGaIIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:08:18 -0400
IronPort-SDR: qCD+Ur/5sW+AELkTQbASYU8kr4LS8rssvSd8npgAEQ3W7G44bp6yfpidgMGOBXywRW50rlpvvs
 aqQtIj9VZhwc3YFRTVnQV13cLlmkQdiEYwazWnv5UqsSVx1UvjeIuCIY0nlRzNJ3avr2YG2AQB
 dBkMOS7M1ABfupT/7lDLUliwTDPbUp49N5Kt/+2+9VZR2R+EnWSYvNq0WjmkgbQc62j5iL137X
 J1HMjltuobQsUqGfYpQPtaj49FMBfnXD0og1h+qrFsNTHMq8+EZUZu09/XsmYdDncFo3W5HMKq
 fvs=
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="47235640"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by labrats.qualcomm.com with ESMTP; 31 Jul 2020 01:08:18 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg01-sd.qualcomm.com with ESMTP; 31 Jul 2020 01:08:17 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id 9650522E73; Fri, 31 Jul 2020 01:08:17 -0700 (PDT)
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
Date:   Fri, 31 Jul 2020 01:08:03 -0700
Message-Id: <1596182890-10086-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596182890-10086-1-git-send-email-cang@codeaurora.org>
References: <1596182890-10086-1-git-send-email-cang@codeaurora.org>
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

