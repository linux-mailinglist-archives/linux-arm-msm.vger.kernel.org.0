Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3775B3192F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 20:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhBKTTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:19:49 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:12488 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhBKTTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:19:48 -0500
IronPort-SDR: kAfoij29/9glFVdfpomaH70Sk/5R+O2mC9Ja8+6ggaK1fEV2VdzlQopVnp5zGJZvfqGJvbKSSQ
 0OELPXIwIJ55h4K9mgH68RwFxcXCxGJJ73uVNGtRCzbTUGnk5PICpF1DnT+7Mt0e3xhtC6RXNV
 mzb5OrRwbBZP6NFhVs59EL3OBYuNk1GvKHmroFTk0A1+fq+OtWyFX9Q6c18SlS86KRHCHrGre0
 CL/T2li2CNpIgnITV8sfofwpAKYe6AOD/Gh38Az0+IpRmexaKhN5NDWUEFTnqr+jvmYerDAxTs
 WcI=
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; 
   d="scan'208";a="47741092"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 11 Feb 2021 11:19:00 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 11 Feb 2021 11:18:59 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 40B5A2191A; Thu, 11 Feb 2021 11:18:59 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
Date:   Thu, 11 Feb 2021 11:18:29 -0800
Message-Id: <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1613070911.git.asutoshd@codeaurora.org>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1613070911.git.asutoshd@codeaurora.org>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
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

Fix this by registering ufs device wlun as a scsi driver and
registering it for block runtime-pm. Also make this as a
supplier for all other luns. That way, this device wlun
suspends after all the consumers and resumes after
hba resumes.

Co-developed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c  | 415 +++++++++++++++++++++++++++++++++++++--------
 drivers/scsi/ufs/ufshcd.h  |   4 +
 include/trace/events/ufs.h |  20 +++
 3 files changed, 364 insertions(+), 75 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 45624c7..e92dbde 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -16,6 +16,7 @@
 #include <linux/bitfield.h>
 #include <linux/blk-pm.h>
 #include <linux/blkdev.h>
+#include <scsi/scsi_driver.h>
 #include "ufshcd.h"
 #include "ufs_quirks.h"
 #include "unipro.h"
@@ -251,6 +252,13 @@ static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set);
 static inline int ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable);
 static void ufshcd_hba_vreg_set_lpm(struct ufs_hba *hba);
 static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba);
+static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op);
+static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op);
+static int ufshcd_wl_runtime_suspend(struct device *dev);
+static int ufshcd_wl_runtime_resume(struct device *dev);
+static int ufshcd_wl_suspend(struct device *dev);
+static int ufshcd_wl_resume(struct device *dev);
+static void ufshcd_wl_shutdown(struct device *dev);
 
 static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
 {
@@ -2572,6 +2580,17 @@ static inline u16 ufshcd_upiu_wlun_to_scsi_wlun(u8 upiu_wlun_id)
 	return (upiu_wlun_id & ~UFS_UPIU_WLUN_ID) | SCSI_W_LUN_BASE;
 }
 
+static inline bool is_rpmb_wlun(struct scsi_device *sdev)
+{
+	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
+}
+
+static inline bool is_device_wlun(struct scsi_device *sdev)
+{
+	return (sdev->lun ==
+		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
+}
+
 static void ufshcd_init_lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
 {
 	struct utp_transfer_cmd_desc *cmd_descp = hba->ucdl_base_addr;
@@ -4808,6 +4827,43 @@ static inline void ufshcd_get_lu_power_on_wp_status(struct ufs_hba *hba,
 }
 
 /**
+ * ufshcd_setup_links - associate link b/w device wlun and other luns
+ * @sdev: pointer to SCSI device
+ * @hba: pointer to ufs hba
+ *
+ * Returns void
+ */
+static void ufshcd_setup_links(struct ufs_hba *hba, struct scsi_device *sdev)
+{
+	struct device_link *link;
+
+	/*
+	 * device wlun is the supplier & rest of the luns are consumers
+	 * This ensures that device wlun suspends after all other luns.
+	 */
+	if (hba->sdev_ufs_device) {
+		link = device_link_add(&sdev->sdev_gendev,
+				       &hba->sdev_ufs_device->sdev_gendev,
+				       DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			dev_err(&sdev->sdev_gendev, "Failed establishing link - %s\n",
+				dev_name(&hba->sdev_ufs_device->sdev_gendev));
+			return;
+		}
+		hba->luns_avail--;
+		/* Ignore REPORT_LUN wlun probing */
+		if (hba->luns_avail != 1)
+			return;
+
+		pm_runtime_put_noidle(&hba->sdev_ufs_device->sdev_gendev);
+		pm_runtime_mark_last_busy(&hba->sdev_ufs_device->sdev_gendev);
+	} else {
+		/* device wlun is probed */
+		hba->luns_avail--;
+	}
+}
+
+/**
  * ufshcd_slave_alloc - handle initial SCSI device configurations
  * @sdev: pointer to SCSI device
  *
@@ -4838,6 +4894,8 @@ static int ufshcd_slave_alloc(struct scsi_device *sdev)
 
 	ufshcd_get_lu_power_on_wp_status(hba, sdev);
 
+	ufshcd_setup_links(hba, sdev);
+
 	return 0;
 }
 
@@ -5589,8 +5647,8 @@ static void ufshcd_rpm_dev_flush_recheck_work(struct work_struct *work)
 	 * after a certain delay to recheck the threshold by next runtime
 	 * suspend.
 	 */
-	pm_runtime_get_sync(hba->dev);
-	pm_runtime_put_sync(hba->dev);
+	scsi_autopm_get_device(hba->sdev_ufs_device);
+	scsi_autopm_put_device(hba->sdev_ufs_device);
 }
 
 /**
@@ -7254,6 +7312,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 		goto out;
 	}
 	ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
+	/*
+	 * A pm_runtime_put_sync is invoked when this device enables blk_pm_runtime
+	 * & would suspend the device-wlun upon timer expiry.
+	 * But suspending device wlun _may_ put the ufs device in the pre-defined
+	 * low power mode (SSU <rpm_lvl>). Probing of other luns may fail then.
+	 * Don't allow this suspend until all the luns have been probed.
+	 */
+	pm_runtime_get_noresume(&hba->sdev_ufs_device->sdev_gendev);
 	scsi_device_put(hba->sdev_ufs_device);
 
 	hba->sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
@@ -7417,6 +7483,9 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 		goto out;
 	}
 
+	hba->luns_avail = desc_buf[DEVICE_DESC_PARAM_NUM_LU] +
+		desc_buf[DEVICE_DESC_PARAM_NUM_WLU];
+
 	ufs_fixup_device_setup(hba);
 
 	ufshcd_wb_probe(hba, desc_buf);
@@ -7747,6 +7816,54 @@ static int ufshcd_device_params_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static int ufshcd_wl_probe(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+
+	/*
+	 * Use this driver for both device wlun and rpmb lun
+	 * It's used to send uac to rpmb wlun and ssu to device wlun
+	 */
+	if (sdev && (is_rpmb_wlun(sdev) || is_device_wlun(sdev)))
+		return 0;
+	return -ENODEV;
+}
+
+static int ufshcd_wl_remove(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+
+	scsi_remove_device(sdev);
+	return 0;
+}
+
+static const struct dev_pm_ops ufshcd_wl_pm_ops = {
+	SET_RUNTIME_PM_OPS(ufshcd_wl_runtime_suspend, ufshcd_wl_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(ufshcd_wl_suspend, ufshcd_wl_resume)
+};
+
+/**
+ * ufs_wlun - describes 2 wluns:
+ * ufs-device wlun - used to send pm commands
+ * and rpmb wlun - for rpmb commands
+ * All luns including rpmb are consumers of ufs-device wlun.
+ *
+ * Currently, no sd driver is present for wluns.
+ * Hence the no specific pm operations are performed.
+ * With ufs design, SSU should be sent to ufs-device wlun.
+ * Hence register a scsi driver for ufs wluns only.
+ */
+static struct scsi_driver ufs_wlun = {
+	.gendrv = {
+		.name = "ufs_device_wlun",
+		.owner = THIS_MODULE,
+		.probe = ufshcd_wl_probe,
+		.remove = ufshcd_wl_remove,
+		.pm = &ufshcd_wl_pm_ops,
+		.shutdown = ufshcd_wl_shutdown,
+	},
+};
+
 /**
  * ufshcd_add_lus - probe and add UFS logical units
  * @hba: per-adapter instance
@@ -7755,6 +7872,12 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 {
 	int ret;
 
+	ret = scsi_register_driver(&ufs_wlun.gendrv);
+	if (ret) {
+		dev_err(hba->dev, "Register device wlun driver failed: %d\n",
+			ret);
+		return ret;
+	}
 	/* Add required well known logical units to scsi mid layer */
 	ret = ufshcd_scsi_add_wlus(hba);
 	if (ret)
@@ -7964,6 +8087,7 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 		pm_runtime_put_sync(hba->dev);
 		ufshcd_hba_exit(hba);
 	}
+	hba->init_done = true;
 }
 
 static const struct attribute_group *ufshcd_driver_groups[] = {
@@ -8475,7 +8599,8 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 	 * handling context.
 	 */
 	hba->host->eh_noresume = 1;
-	ufshcd_clear_ua_wluns(hba);
+	if (hba->wlun_dev_clr_ua)
+		ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
 
 	cmd[4] = pwr_mode << 4;
 
@@ -8650,26 +8775,9 @@ static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba)
 		ufshcd_setup_hba_vreg(hba, true);
 }
 
-/**
- * ufshcd_suspend - helper function for suspend operations
- * @hba: per adapter instance
- * @pm_op: desired low power operation type
- *
- * This function will try to put the UFS device and link into low power
- * mode based on the "rpm_lvl" (Runtime PM level) or "spm_lvl"
- * (System PM level).
- *
- * If this function is called during shutdown, it will make sure that
- * both UFS device and UFS link is powered off.
- *
- * NOTE: UFS device & link must be active before we enter in this function.
- *
- * Returns 0 for success and non-zero for failure
- */
-static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int ret = 0;
-	int check_for_bkops;
 	enum ufs_pm_level pm_lvl;
 	enum ufs_dev_pwr_mode req_dev_pwr_mode;
 	enum uic_link_state req_link_state;
@@ -8690,24 +8798,23 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 * just gate the clocks.
 	 */
 	ufshcd_hold(hba, false);
-	hba->clk_gating.is_suspended = true;
 
 	if (ufshcd_is_clkscaling_supported(hba))
 		ufshcd_clk_scaling_suspend(hba, true);
 
 	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
 			req_link_state == UIC_LINK_ACTIVE_STATE) {
-		goto disable_clks;
+		goto enable_scaling;
 	}
 
 	if ((req_dev_pwr_mode == hba->curr_dev_pwr_mode) &&
 	    (req_link_state == hba->uic_link_state))
-		goto enable_gating;
+		goto enable_scaling;
 
 	/* UFS device & link must be active before we enter in this function */
 	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
 		ret = -EINVAL;
-		goto enable_gating;
+		goto enable_scaling;
 	}
 
 	if (ufshcd_is_runtime_pm(pm_op)) {
@@ -8719,7 +8826,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			 */
 			ret = ufshcd_urgent_bkops(hba);
 			if (ret)
-				goto enable_gating;
+				goto enable_scaling;
 		} else {
 			/* make sure that auto bkops is disabled */
 			ufshcd_disable_auto_bkops(hba);
@@ -8746,10 +8853,214 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 		if (!hba->dev_info.b_rpm_dev_flush_capable) {
 			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
-			if (ret)
-				goto enable_gating;
+			if (!ret)
+				goto out;
 		}
 	}
+enable_scaling:
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_clk_scaling_suspend(hba, false);
+
+	hba->dev_info.b_rpm_dev_flush_capable = false;
+out:
+	if (hba->dev_info.b_rpm_dev_flush_capable) {
+		schedule_delayed_work(&hba->rpm_dev_flush_recheck_work,
+			msecs_to_jiffies(RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS));
+	}
+	if (ret)
+		ufshcd_update_evt_hist(hba, UFS_EVT_WL_SUSP_ERR, (u32)ret);
+	ufshcd_release(hba);
+	return ret;
+}
+
+static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+{
+	int ret = 0;
+	enum uic_link_state old_link_state;
+
+	if (!hba->init_done)
+		return 0;
+
+	old_link_state = hba->uic_link_state;
+	ufshcd_hold(hba, false);
+	if (!ufshcd_is_ufs_dev_active(hba)) {
+		ret = ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE);
+		if (ret)
+			goto out;
+	}
+
+	if (ufshcd_keep_autobkops_enabled_except_suspend(hba))
+		ufshcd_enable_auto_bkops(hba);
+	else
+		/*
+		 * If BKOPs operations are urgently needed at this moment then
+		 * keep auto-bkops enabled or else disable it.
+		 */
+		ufshcd_urgent_bkops(hba);
+
+	if (hba->clk_scaling.is_allowed)
+		ufshcd_resume_clkscaling(hba);
+
+	if (hba->dev_info.b_rpm_dev_flush_capable) {
+		hba->dev_info.b_rpm_dev_flush_capable = false;
+		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
+	}
+
+out:
+	hba->clk_gating.is_suspended = false;
+	if (ret)
+		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
+	ufshcd_release(hba);
+	return ret;
+}
+
+static int ufshcd_wl_runtime_suspend(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct ufs_hba *hba;
+	int ret;
+	ktime_t start = ktime_get();
+
+	hba = shost_priv(sdev->host);
+	if (is_rpmb_wlun(sdev)) {
+		if (hba->sdev_rpmb)
+			return ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
+		return 0;
+	}
+
+	ret = __ufshcd_wl_suspend(hba, UFS_RUNTIME_PM);
+	if (ret)
+		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
+
+	trace_ufshcd_wl_runtime_suspend(dev_name(dev), ret,
+		ktime_to_us(ktime_sub(ktime_get(), start)),
+		hba->curr_dev_pwr_mode, hba->uic_link_state);
+
+	return ret;
+}
+
+static int ufshcd_wl_runtime_resume(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct ufs_hba *hba;
+	int ret;
+	ktime_t start = ktime_get();
+
+	hba = shost_priv(sdev->host);
+
+	if (is_rpmb_wlun(sdev))
+		return 0;
+	ret = __ufshcd_wl_resume(hba, UFS_RUNTIME_PM);
+	if (ret)
+		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
+
+	trace_ufshcd_wl_runtime_resume(dev_name(dev), ret,
+		ktime_to_us(ktime_sub(ktime_get(), start)),
+		hba->curr_dev_pwr_mode, hba->uic_link_state);
+
+	return ret;
+}
+
+static int ufshcd_wl_suspend(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct ufs_hba *hba;
+	int ret;
+	ktime_t start = ktime_get();
+
+	if (is_rpmb_wlun(sdev))
+		return 0;
+	hba = shost_priv(sdev->host);
+	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
+	if (ret)
+		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
+
+	trace_ufshcd_wl_suspend(dev_name(dev), ret,
+		ktime_to_us(ktime_sub(ktime_get(), start)),
+		hba->curr_dev_pwr_mode, hba->uic_link_state);
+
+	return ret;
+
+}
+
+static int ufshcd_wl_resume(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct ufs_hba *hba;
+	int ret;
+	ktime_t start = ktime_get();
+
+	if (pm_runtime_suspended(dev) || is_rpmb_wlun(sdev))
+		return 0;
+	hba = shost_priv(sdev->host);
+
+	ret = __ufshcd_wl_resume(hba, UFS_SYSTEM_PM);
+	if (ret)
+		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
+
+	trace_ufshcd_wl_resume(dev_name(dev), ret,
+		ktime_to_us(ktime_sub(ktime_get(), start)),
+		hba->curr_dev_pwr_mode, hba->uic_link_state);
+
+	return ret;
+}
+
+static void ufshcd_wl_shutdown(struct device *dev)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct ufs_hba *hba;
+
+	if (is_rpmb_wlun(sdev))
+		return;
+	hba = shost_priv(sdev->host);
+	scsi_device_quiesce(sdev);
+	shost_for_each_device(sdev, hba->host) {
+		if (sdev == hba->sdev_ufs_device)
+			continue;
+		scsi_remove_device(sdev);
+	}
+	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
+}
+
+/**
+ * ufshcd_suspend - helper function for suspend operations
+ * @hba: per adapter instance
+ * @pm_op: desired low power operation type
+ *
+ * This function will try to put the UFS link into low power
+ * mode based on the "rpm_lvl" (Runtime PM level) or "spm_lvl"
+ * (System PM level).
+ *
+ * If this function is called during shutdown, it will make sure that
+ * link is powered off.
+ *
+ * Returns 0 for success and non-zero for failure
+ */
+static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+{
+	int ret = 0;
+	int check_for_bkops;
+	enum ufs_pm_level pm_lvl;
+	enum ufs_dev_pwr_mode req_dev_pwr_mode;
+	enum uic_link_state req_link_state;
+
+	hba->pm_op_in_progress = 1;
+	if (!ufshcd_is_shutdown_pm(pm_op)) {
+		pm_lvl = ufshcd_is_runtime_pm(pm_op) ?
+			 hba->rpm_lvl : hba->spm_lvl;
+		req_dev_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(pm_lvl);
+		req_link_state = ufs_get_pm_lvl_to_link_pwr_state(pm_lvl);
+	} else {
+		req_dev_pwr_mode = UFS_POWERDOWN_PWR_MODE;
+		req_link_state = UIC_LINK_OFF_STATE;
+	}
+
+	/*
+	 * If we can't transition into any of the low power modes
+	 * just gate the clocks.
+	 */
+	ufshcd_hold(hba, false);
+	hba->clk_gating.is_suspended = true;
 
 	/*
 	 * In the case of DeepSleep, the device is expected to remain powered
@@ -8758,9 +9069,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
 	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
 	if (ret)
-		goto set_dev_active;
+		goto enable_gating;
 
-disable_clks:
 	/*
 	 * Call vendor specific suspend callback. As these callbacks may access
 	 * vendor specific host controller register space call them before the
@@ -8790,7 +9100,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	goto out;
 
 set_link_active:
-	ufshcd_vreg_set_hpm(hba);
 	/*
 	 * Device hardware reset is required to exit DeepSleep. Also, for
 	 * DeepSleep, the link is off so host reset and restore will be done
@@ -8804,28 +9113,15 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufshcd_set_link_active(hba);
 	else if (ufshcd_is_link_off(hba))
 		ufshcd_host_reset_and_restore(hba);
-set_dev_active:
 	/* Can also get here needing to exit DeepSleep */
 	if (ufshcd_is_ufs_dev_deepsleep(hba)) {
 		ufshcd_device_reset(hba);
 		ufshcd_host_reset_and_restore(hba);
 	}
-	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
-		ufshcd_disable_auto_bkops(hba);
 enable_gating:
-	if (ufshcd_is_clkscaling_supported(hba))
-		ufshcd_clk_scaling_suspend(hba, false);
-
 	hba->clk_gating.is_suspended = false;
-	hba->dev_info.b_rpm_dev_flush_capable = false;
-	ufshcd_clear_ua_wluns(hba);
 	ufshcd_release(hba);
 out:
-	if (hba->dev_info.b_rpm_dev_flush_capable) {
-		schedule_delayed_work(&hba->rpm_dev_flush_recheck_work,
-			msecs_to_jiffies(RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS));
-	}
-
 	hba->pm_op_in_progress = 0;
 
 	if (ret)
@@ -8846,10 +9142,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int ret;
-	enum uic_link_state old_link_state;
 
 	hba->pm_op_in_progress = 1;
-	old_link_state = hba->uic_link_state;
 
 	ufshcd_hba_vreg_set_hpm(hba);
 	ret = ufshcd_vreg_set_hpm(hba);
@@ -8901,43 +9195,14 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			goto vendor_suspend;
 	}
 
-	if (!ufshcd_is_ufs_dev_active(hba)) {
-		ret = ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE);
-		if (ret)
-			goto set_old_link_state;
-	}
-
-	if (ufshcd_keep_autobkops_enabled_except_suspend(hba))
-		ufshcd_enable_auto_bkops(hba);
-	else
-		/*
-		 * If BKOPs operations are urgently needed at this moment then
-		 * keep auto-bkops enabled or else disable it.
-		 */
-		ufshcd_urgent_bkops(hba);
-
-	hba->clk_gating.is_suspended = false;
-
-	if (ufshcd_is_clkscaling_supported(hba))
-		ufshcd_clk_scaling_suspend(hba, false);
-
 	/* Enable Auto-Hibernate if configured */
 	ufshcd_auto_hibern8_enable(hba);
 
-	if (hba->dev_info.b_rpm_dev_flush_capable) {
-		hba->dev_info.b_rpm_dev_flush_capable = false;
-		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
-	}
-
-	ufshcd_clear_ua_wluns(hba);
-
 	/* Schedule clock gating in case of no access to UFS device yet */
 	ufshcd_release(hba);
 
 	goto out;
 
-set_old_link_state:
-	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
 	ufshcd_vops_suspend(hba, pm_op);
 disable_irq_and_vops_clks:
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index ee61f82..7662387 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -72,6 +72,8 @@ enum ufs_event_type {
 	UFS_EVT_LINK_STARTUP_FAIL,
 	UFS_EVT_RESUME_ERR,
 	UFS_EVT_SUSPEND_ERR,
+	UFS_EVT_WL_SUSP_ERR,
+	UFS_EVT_WL_RES_ERR,
 
 	/* abnormal events */
 	UFS_EVT_DEV_RESET,
@@ -841,6 +843,8 @@ struct ufs_hba {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_root;
 #endif
+	bool init_done;
+	u32 luns_avail;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
index e151477..d9d233b 100644
--- a/include/trace/events/ufs.h
+++ b/include/trace/events/ufs.h
@@ -246,6 +246,26 @@ DEFINE_EVENT(ufshcd_template, ufshcd_init,
 		      int dev_state, int link_state),
 	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
 
+DEFINE_EVENT(ufshcd_template, ufshcd_wl_suspend,
+	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+		      int dev_state, int link_state),
+	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+
+DEFINE_EVENT(ufshcd_template, ufshcd_wl_resume,
+	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+		      int dev_state, int link_state),
+	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+
+DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_suspend,
+	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+		      int dev_state, int link_state),
+	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+
+DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_resume,
+	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+		      int dev_state, int link_state),
+	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+
 TRACE_EVENT(ufshcd_command,
 	TP_PROTO(const char *dev_name, enum ufs_trace_str_t str_t,
 		 unsigned int tag, u32 doorbell, int transfer_len, u32 intr,
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

