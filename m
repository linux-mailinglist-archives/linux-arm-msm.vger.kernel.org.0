Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4F13B1502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 09:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhFWHpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 03:45:11 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:11986 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhFWHpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 03:45:10 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jun 2021 03:45:10 EDT
IronPort-SDR: ctEM4QSLoXvC/Zv1StDrWtEWkPnvsFBmb/9zZU6Xl2S0Nhnd3UEOOWuXBcVa6AhbfQo+pe/vzj
 Al/wPoQBIE70ChFg8ySnnXGcexOBTRCzGsClzqdyy9LX6AEJK4S/ZxFeQP29iBnFC9rx9B1r6B
 6a/ZW8AzdjERiATCscvEUvRO7/XvWET9hbI44xzweRILO4B56VuTGIOeIhmW4QowbAKzqZerbP
 CZhBIukh7BIUvyAMUhoB72LfISMlm1hZDGKYToYlqGEkbWYxXqTpC126SmRoSZvzNiPRKx29SW
 Jis=
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="29780818"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 23 Jun 2021 00:36:47 -0700
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 23 Jun 2021 00:36:46 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id A374A21BC1; Wed, 23 Jun 2021 00:36:46 -0700 (PDT)
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and is_sys_suspended
Date:   Wed, 23 Jun 2021 00:35:00 -0700
Message-Id: <1624433711-9339-2-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
is_wlu_sys_suspended accordingly.

Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c |  2 +-
 drivers/scsi/ufs/ufshcd.c   | 30 +++++++++++++++---------------
 drivers/scsi/ufs/ufshcd.h   |  6 ++++--
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9b1d18d..fbe21e0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -641,7 +641,7 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (err)
 		return err;
 
-	hba->is_sys_suspended = false;
+	hba->is_wlu_sys_suspended = false;
 	return 0;
 }
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 25fe18a..c40ba1d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -549,8 +549,8 @@ static void ufshcd_print_host_state(struct ufs_hba *hba)
 		hba->saved_err, hba->saved_uic_err);
 	dev_err(hba->dev, "Device power mode=%d, UIC link state=%d\n",
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
-	dev_err(hba->dev, "PM in progress=%d, sys. suspended=%d\n",
-		hba->pm_op_in_progress, hba->is_sys_suspended);
+	dev_err(hba->dev, "wlu_pm_op_in_progress=%d, is_wlu_sys_suspended=%d\n",
+		hba->wlu_pm_op_in_progress, hba->is_wlu_sys_suspended);
 	dev_err(hba->dev, "Auto BKOPS=%d, Host self-block=%d\n",
 		hba->auto_bkops_enabled, hba->host->host_self_blocked);
 	dev_err(hba->dev, "Clk gate=%d\n", hba->clk_gating.state);
@@ -1999,7 +1999,7 @@ static void ufshcd_clk_scaling_start_busy(struct ufs_hba *hba)
 	if (!hba->clk_scaling.active_reqs++)
 		queue_resume_work = true;
 
-	if (!hba->clk_scaling.is_enabled || hba->pm_op_in_progress) {
+	if (!hba->clk_scaling.is_enabled || hba->wlu_pm_op_in_progress) {
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 		return;
 	}
@@ -2734,7 +2734,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 		 * err handler blocked for too long. So, just fail the scsi cmd
 		 * sent from PM ops, err handler can recover PM error anyways.
 		 */
-		if (hba->pm_op_in_progress) {
+		if (hba->wlu_pm_op_in_progress) {
 			hba->force_reset = true;
 			set_host_byte(cmd, DID_BAD_TARGET);
 			cmd->scsi_done(cmd);
@@ -2767,7 +2767,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 		(hba->clk_gating.state != CLKS_ON));
 
 	if (unlikely(test_bit(tag, &hba->outstanding_reqs))) {
-		if (hba->pm_op_in_progress)
+		if (hba->wlu_pm_op_in_progress)
 			set_host_byte(cmd, DID_BAD_TARGET);
 		else
 			err = SCSI_MLQUEUE_HOST_BUSY;
@@ -5116,7 +5116,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 			 * solution could be to abort the system suspend if
 			 * UFS device needs urgent BKOPs.
 			 */
-			if (!hba->pm_op_in_progress &&
+			if (!hba->wlu_pm_op_in_progress &&
 			    !ufshcd_eh_in_progress(hba) &&
 			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
 				/* Flushed in suspend */
@@ -5916,7 +5916,7 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 {
 	ufshcd_rpm_get_sync(hba);
 	if (pm_runtime_status_suspended(&hba->sdev_ufs_device->sdev_gendev) ||
-	    hba->is_sys_suspended) {
+	    hba->is_wlu_sys_suspended) {
 		enum ufs_pm_op pm_op;
 
 		/*
@@ -5933,7 +5933,7 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 		if (!ufshcd_is_clkgating_allowed(hba))
 			ufshcd_setup_clocks(hba, true);
 		ufshcd_release(hba);
-		pm_op = hba->is_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
+		pm_op = hba->is_wlu_sys_suspended ? UFS_SYSTEM_PM : UFS_RUNTIME_PM;
 		ufshcd_vops_resume(hba, pm_op);
 	} else {
 		ufshcd_hold(hba, false);
@@ -5976,7 +5976,7 @@ static void ufshcd_recover_pm_error(struct ufs_hba *hba)
 	struct request_queue *q;
 	int ret;
 
-	hba->is_sys_suspended = false;
+	hba->is_wlu_sys_suspended = false;
 	/*
 	 * Set RPM status of wlun device to RPM_ACTIVE,
 	 * this also clears its runtime error.
@@ -8784,7 +8784,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum ufs_dev_pwr_mode req_dev_pwr_mode;
 	enum uic_link_state req_link_state;
 
-	hba->pm_op_in_progress = true;
+	hba->wlu_pm_op_in_progress = true;
 	if (pm_op != UFS_SHUTDOWN_PM) {
 		pm_lvl = pm_op == UFS_RUNTIME_PM ?
 			 hba->rpm_lvl : hba->spm_lvl;
@@ -8919,7 +8919,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		hba->clk_gating.is_suspended = false;
 		ufshcd_release(hba);
 	}
-	hba->pm_op_in_progress = false;
+	hba->wlu_pm_op_in_progress = false;
 	return ret;
 }
 
@@ -8928,7 +8928,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	int ret;
 	enum uic_link_state old_link_state = hba->uic_link_state;
 
-	hba->pm_op_in_progress = true;
+	hba->wlu_pm_op_in_progress = true;
 
 	/*
 	 * Call vendor specific resume callback. As these callbacks may access
@@ -9006,7 +9006,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
 	hba->clk_gating.is_suspended = false;
 	ufshcd_release(hba);
-	hba->pm_op_in_progress = false;
+	hba->wlu_pm_op_in_progress = false;
 	return ret;
 }
 
@@ -9072,7 +9072,7 @@ static int ufshcd_wl_suspend(struct device *dev)
 
 out:
 	if (!ret)
-		hba->is_sys_suspended = true;
+		hba->is_wlu_sys_suspended = true;
 	trace_ufshcd_wl_suspend(dev_name(dev), ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
@@ -9100,7 +9100,7 @@ static int ufshcd_wl_resume(struct device *dev)
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 	if (!ret)
-		hba->is_sys_suspended = false;
+		hba->is_wlu_sys_suspended = false;
 	up(&hba->host_sem);
 	return ret;
 }
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index c98d540..93aeeb3 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -752,7 +752,8 @@ struct ufs_hba {
 	enum ufs_pm_level spm_lvl;
 	struct device_attribute rpm_lvl_attr;
 	struct device_attribute spm_lvl_attr;
-	int pm_op_in_progress;
+	/* A flag to tell whether __ufshcd_wl_suspend/resume() is in progress */
+	bool wlu_pm_op_in_progress;
 
 	/* Auto-Hibernate Idle Timer register value */
 	u32 ahit;
@@ -838,7 +839,8 @@ struct ufs_hba {
 
 	struct devfreq *devfreq;
 	struct ufs_clk_scaling clk_scaling;
-	bool is_sys_suspended;
+	/* A flag to tell whether the UFS device W-LU is system suspended */
+	bool is_wlu_sys_suspended;
 
 	enum bkops_status urgent_bkops_lvl;
 	bool is_urgent_bkops_lvl_checked;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

