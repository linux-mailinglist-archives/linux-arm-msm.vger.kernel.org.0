Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D4530516B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 05:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239434AbhA0Eo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 23:44:57 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:31467 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238229AbhA0EJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 23:09:23 -0500
IronPort-SDR: A0VjZ20FM29nhAGpEObYJz9jL8kyjchB1BIXJhZ+T2zi7ZVSXOLLtMmVN6MU0HPWGxZmCRYLX3
 z/APdQ+x4Ok8nogysGjy0CFxbi45ypqEPqXwiUXcrLqHf9QGAszvf58wtIF8BgY070l3PBvjpc
 O6F/eM3/8zVwn6fHqJf0byNtfQIKZ//1dw61RJudE3+TnrcR6iA/Dx4gsGMCezEFLNwWVbn+to
 nVm7B4IvDD6UMulXzku9arxqdb1GsfuK979oO7pEV0xB96lxX1KR5WzJm1ILtWK0kTWjtx5w0D
 lrA=
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="47711300"
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by labrats.qualcomm.com with ESMTP; 26 Jan 2021 20:00:32 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg05-sd.qualcomm.com with ESMTP; 26 Jan 2021 20:00:31 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id A76D721903; Tue, 26 Jan 2021 20:00:31 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH v1 2/2] scsi: ufs: Fix deadlock while suspending ufs host
Date:   Tue, 26 Jan 2021 20:00:23 -0800
Message-Id: <7929cc67311133f8dbdfe5e627cf6a2f1daa486e.1611719814.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1611719814.git.asutoshd@codeaurora.org>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1611719814.git.asutoshd@codeaurora.org>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During runtime-suspend of ufs host, the scsi devices are
already suspended and so are the queues associated with them.
But the ufs host sends SSU to wlun during its runtime-suspend.
During the process blk_queue_enter checks if the queue is not in
suspended state. If so, it waits for the queue to resume, and never
comes out of it.
The commit
(d55d15a33: scsi: block: Do not accept any requests while suspended)
adds the check if the queue is in suspended state in blk_queue_enter().

Fix this, by decoupling wlun scsi devices from block layer pm.
The runtime-pm for these devices would be managed by bsg and sg drivers.

Call trace:
 __switch_to+0x174/0x2c4
 __schedule+0x478/0x764
 schedule+0x9c/0xe0
 blk_queue_enter+0x158/0x228
 blk_mq_alloc_request+0x40/0xa4
 blk_get_request+0x2c/0x70
 __scsi_execute+0x60/0x1c4
 ufshcd_set_dev_pwr_mode+0x124/0x1e4
 ufshcd_suspend+0x208/0x83c
 ufshcd_runtime_suspend+0x40/0x154
 ufshcd_pltfrm_runtime_suspend+0x14/0x20
 pm_generic_runtime_suspend+0x28/0x3c
 __rpm_callback+0x80/0x2a4
 rpm_suspend+0x308/0x614
 rpm_idle+0x158/0x228
 pm_runtime_work+0x84/0xac
 process_one_work+0x1f0/0x470
 worker_thread+0x26c/0x4c8
 kthread+0x13c/0x320
 ret_from_fork+0x10/0x18

Change-Id: Id777fd52493c8b5522d1ebcad73cd30dac33e8a4
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9c691e4..b7e7f81 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7217,16 +7217,6 @@ static void ufshcd_set_active_icc_lvl(struct ufs_hba *hba)
 	kfree(desc_buf);
 }
 
-static inline void ufshcd_blk_pm_runtime_init(struct scsi_device *sdev)
-{
-	scsi_autopm_get_device(sdev);
-	blk_pm_runtime_init(sdev->request_queue, &sdev->sdev_gendev);
-	if (sdev->rpm_autosuspend)
-		pm_runtime_set_autosuspend_delay(&sdev->sdev_gendev,
-						 RPM_AUTOSUSPEND_DELAY_MS);
-	scsi_autopm_put_device(sdev);
-}
-
 /**
  * ufshcd_scsi_add_wlus - Adds required W-LUs
  * @hba: per-adapter instance
@@ -7265,7 +7255,6 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 		hba->sdev_ufs_device = NULL;
 		goto out;
 	}
-	ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
 	scsi_device_put(hba->sdev_ufs_device);
 
 	hba->sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
@@ -7274,17 +7263,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 		ret = PTR_ERR(hba->sdev_rpmb);
 		goto remove_sdev_ufs_device;
 	}
-	ufshcd_blk_pm_runtime_init(hba->sdev_rpmb);
 	scsi_device_put(hba->sdev_rpmb);
 
 	sdev_boot = __scsi_add_device(hba->host, 0, 0,
 		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_BOOT_WLUN), NULL);
-	if (IS_ERR(sdev_boot)) {
+	if (IS_ERR(sdev_boot))
 		dev_err(hba->dev, "%s: BOOT WLUN not found\n", __func__);
-	} else {
-		ufshcd_blk_pm_runtime_init(sdev_boot);
+	else
 		scsi_device_put(sdev_boot);
-	}
 	goto out;
 
 remove_sdev_ufs_device:
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

