Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C9922A54B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 04:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgGWCeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 22:34:24 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:37589 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387483AbgGWCeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 22:34:24 -0400
IronPort-SDR: +CwSSzEVROfjEbwSccSiEnoU/6BReWG4pBdQdpKI4kzYJjDhT7wosgAwN4RpWStNTncQC2t1Gm
 WVza9yxg+sw8B0TNgJmfbb7j9iQSlqF6k7bnazOFHwlRTjHmoS4gtJVBE9+wZhMGwKtcQmueR9
 Qkv68hFPHykTVt7cgqwULajs+OyJpFVebWoSi9QDxziz2Ptev621nYXtfWZ4/CAcMZ80Or0urt
 bcExaKu0CDOdq8Aahn1dwlSFgxAFaLq2CrXY0nHxfePb7PBxvbg4YrfTqJtQ+utXueGNtkn2mg
 h1Q=
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="29047795"
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by labrats.qualcomm.com with ESMTP; 22 Jul 2020 19:34:23 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 22 Jul 2020 19:34:21 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
        id 3482A22A4D; Wed, 22 Jul 2020 19:34:20 -0700 (PDT)
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
Subject: [PATCH v5 3/9] ufs: ufs-qcom: Fix race conditions caused by func ufs_qcom_testbus_config
Date:   Wed, 22 Jul 2020 19:34:02 -0700
Message-Id: <1595471649-25675-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595471649-25675-1-git-send-email-cang@codeaurora.org>
References: <1595471649-25675-1-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
ufshcd_suspend/resume and/or clk gate/ungate context, pm_runtime_get_sync()
and ufshcd_hold() will cause racing problems. Fix this by removing the
unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2e6ddb5..7da27ee 100644
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
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

