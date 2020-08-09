Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701D623FE2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Aug 2020 14:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgHIMQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Aug 2020 08:16:22 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:11462 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIMQS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Aug 2020 08:16:18 -0400
IronPort-SDR: CTO+rrLecow/2EGmT11P2EhNW5sCylJEbG2R7mqzG9VnT1USWkD1s1DAdASKPb5UUx80GL+rNP
 e1SOnmKN+NBwmY/oz5IZoanGIpJ3tYyVl1FuWcYX/4znjmJGgli69lKaAI+yQ27KA+Q0MeW7F0
 JwaRnGVRzT9la0942Q/9kcUbqNgvxqmfckXh/CJs2ahnaJBkYwZ2bnVCTqyqTIlYKTyXYXfQtb
 MCXRFMSNgiEE6V6igiDgynSqXUSP2Rww2i8ogSaWsBb/Z+CIiXNb9bmKgoWQFGn+pGbWoTnY8N
 vpc=
X-IronPort-AV: E=Sophos;i="5.75,453,1589266800"; 
   d="scan'208";a="47246498"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by labrats.qualcomm.com with ESMTP; 09 Aug 2020 05:16:05 -0700
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg01-sd.qualcomm.com with ESMTP; 09 Aug 2020 05:16:03 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 7F1DC2156E; Sun,  9 Aug 2020 05:16:03 -0700 (PDT)
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
Subject: [PATCH 2/9] ufs: ufs-qcom: Fix race conditions caused by func ufs_qcom_testbus_config
Date:   Sun,  9 Aug 2020 05:15:48 -0700
Message-Id: <1596975355-39813-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
References: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
ufshcd_suspend/resume and/or clk gate/ungate context, pm_runtime_get_sync()
and ufshcd_hold() will cause racing problems. Fix this by removing the
unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index d0d7552..823eccf 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1614,9 +1614,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	 */
 	}
 	mask <<= offset;
-
-	pm_runtime_get_sync(host->hba->dev);
-	ufshcd_hold(host->hba, false);
 	ufshcd_rmwl(host->hba, TEST_BUS_SEL,
 		    (u32)host->testbus.select_major << 19,
 		    REG_UFS_CFG1);
@@ -1629,8 +1626,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	 * committed before returning.
 	 */
 	mb();
-	ufshcd_release(host->hba);
-	pm_runtime_put_sync(host->hba->dev);
 
 	return 0;
 }
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

