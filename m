Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A91A23D640
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 07:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgHFFGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 01:06:31 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:43690 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgHFFGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 01:06:31 -0400
IronPort-SDR: OrPzJQe49KsA/iy+W2QtOfkyXJs192U7aGWiIcQSYRyKyhCiXxJ6yuzGEbOYpD9ZOJ9MuvFYeY
 DxJBlO+n9vCEcTxUziB/0qAHHNrI8vgbTj4LmbtwgrqDipTNcsHOWR/XJmK0C0vqSHkdtNYVOc
 m3t9rM8auUPz776fmxwPBoBirFM32VtHw8MCrnW3MAqKIY638c7uQ61BxREn6QTYs3sHYbZ5PA
 INrXPtVgaqCQhkdHDF0hG4iOK/N0sfWnNkt6Gk098KLLcFkzAalKmpAr/Rknh705J8HvxFZAJ1
 kHA=
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; 
   d="scan'208";a="29068254"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by labrats.qualcomm.com with ESMTP; 05 Aug 2020 22:06:30 -0700
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg02-sd.qualcomm.com with ESMTP; 05 Aug 2020 22:06:29 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 8EF1A21562; Wed,  5 Aug 2020 22:06:29 -0700 (PDT)
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
Date:   Wed,  5 Aug 2020 22:06:13 -0700
Message-Id: <1596690383-16438-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596690383-16438-1-git-send-email-cang@codeaurora.org>
References: <1596690383-16438-1-git-send-email-cang@codeaurora.org>
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

