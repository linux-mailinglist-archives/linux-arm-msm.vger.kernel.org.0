Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C80A2E0B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 14:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgLVNvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 08:51:02 -0500
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226]:58757 "EHLO
        alexa-out-tai-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726904AbgLVNvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 08:51:01 -0500
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
  by alexa-out-tai-01.qualcomm.com with ESMTP; 22 Dec 2020 21:50:16 +0800
X-QCInternal: smtphost
Received: from cbsp-sh-gv.ap.qualcomm.com (HELO cbsp-sh-gv.qualcomm.com) ([10.231.249.68])
  by ironmsg03-tai.qualcomm.com with ESMTP; 22 Dec 2020 21:49:44 +0800
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 393357)
        id 85939276B; Tue, 22 Dec 2020 21:49:43 +0800 (CST)
From:   Ziqi Chen <ziqichen@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        cang@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        ziqichen@codeaurora.org, kwmad.kim@samsung.com,
        stanley.chu@mediatek.com
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH
        STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs violation
Date:   Tue, 22 Dec 2020 21:49:33 +0800
Message-Id: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per specs, e.g, JESD220E chapter 7.2, while powering
off/on the ufs device, RST_N signal and REF_CLK signal
should be between VSS(Ground) and VCCQ/VCCQ2.

To flexibly control device reset line, refactor the function
ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
vops_device_reset(sturct ufs_hba *hba, bool asserted). The
new parameter "bool asserted" is used to separate device reset
line pulling down from pulling up.

Cc: Kiwoong Kim <kwmad.kim@samsung.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
---
 drivers/scsi/ufs/ufs-mediatek.c | 32 ++++++++++++++++----------------
 drivers/scsi/ufs/ufs-qcom.c     | 24 +++++++++++++++---------
 drivers/scsi/ufs/ufshcd.c       | 36 +++++++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h       |  8 ++++----
 4 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 80618af..072f4db 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -841,27 +841,27 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static int ufs_mtk_device_reset(struct ufs_hba *hba)
+static int ufs_mtk_device_reset(struct ufs_hba *hba, bool asserted)
 {
 	struct arm_smccc_res res;
 
-	ufs_mtk_device_reset_ctrl(0, res);
+	if (asserted) {
+		ufs_mtk_device_reset_ctrl(0, res);
 
-	/*
-	 * The reset signal is active low. UFS devices shall detect
-	 * more than or equal to 1us of positive or negative RST_n
-	 * pulse width.
-	 *
-	 * To be on safe side, keep the reset low for at least 10us.
-	 */
-	usleep_range(10, 15);
-
-	ufs_mtk_device_reset_ctrl(1, res);
-
-	/* Some devices may need time to respond to rst_n */
-	usleep_range(10000, 15000);
+		/*
+		 * The reset signal is active low. UFS devices shall detect
+		 * more than or equal to 1us of positive or negative RST_n
+		 * pulse width.
+		 *
+		 * To be on safe side, keep the reset low for at least 10us.
+		 */
+		usleep_range(10, 15);
+	} else {
+		ufs_mtk_device_reset_ctrl(1, res);
 
-	dev_info(hba->dev, "device reset done\n");
+		/* Some devices may need time to respond to rst_n */
+		usleep_range(10000, 15000);
+	}
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..fed10e5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1406,10 +1406,11 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 /**
  * ufs_qcom_device_reset() - toggle the (optional) device reset line
  * @hba: per-adapter instance
+ * @asserted: assert or deassert device reset line
  *
  * Toggles the (optional) reset line to reset the attached device.
  */
-static int ufs_qcom_device_reset(struct ufs_hba *hba)
+static int ufs_qcom_device_reset(struct ufs_hba *hba, bool asserted)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
@@ -1417,15 +1418,20 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	if (!host->device_reset)
 		return -EOPNOTSUPP;
 
-	/*
-	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
-	 * be on the safe side.
-	 */
-	gpiod_set_value_cansleep(host->device_reset, 1);
-	usleep_range(10, 15);
+	if (asserted) {
+		gpiod_set_value_cansleep(host->device_reset, 1);
 
-	gpiod_set_value_cansleep(host->device_reset, 0);
-	usleep_range(10, 15);
+		/*
+		 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
+		 * be on the safe side.
+		 */
+		usleep_range(10, 15);
+	} else {
+		gpiod_set_value_cansleep(host->device_reset, 0);
+
+		 /* Some devices may need time to respond to rst_n */
+		usleep_range(10, 15);
+	}
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e221add..f2daac2 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -585,7 +585,13 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
 {
 	int err;
 
-	err = ufshcd_vops_device_reset(hba);
+	err = ufshcd_vops_device_reset(hba, true);
+	if (err) {
+		dev_err(hba->dev, "asserting device reset failed: %d\n", err);
+		return;
+	}
+
+	err = ufshcd_vops_device_reset(hba, false);
 
 	if (!err) {
 		ufshcd_set_ufs_dev_active(hba);
@@ -593,7 +599,11 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
 			hba->wb_enabled = false;
 			hba->wb_buf_flush_enabled = false;
 		}
+		dev_dbg(hba->dev, "device reset done\n");
+	} else {
+		dev_err(hba->dev, "deasserting device reset failed: %d\n", err);
 	}
+
 	if (err != -EOPNOTSUPP)
 		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
 }
@@ -8686,8 +8696,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (ret)
 		goto set_dev_active;
 
-	ufshcd_vreg_set_lpm(hba);
-
 disable_clks:
 	/*
 	 * Call vendor specific suspend callback. As these callbacks may access
@@ -8703,6 +8711,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ufshcd_disable_irq(hba);
 
+	if (ufshcd_is_link_off(hba))
+		ufshcd_vops_device_reset(hba, true);
+
 	ufshcd_setup_clocks(hba, false);
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
@@ -8711,6 +8722,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 					hba->clk_gating.state);
 	}
 
+	ufshcd_vreg_set_lpm(hba);
+
 	/* Put the host controller in low power mode if possible */
 	ufshcd_hba_vreg_set_lpm(hba);
 	goto out;
@@ -8778,18 +8791,19 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	old_link_state = hba->uic_link_state;
 
 	ufshcd_hba_vreg_set_hpm(hba);
+
+	ret = ufshcd_vreg_set_hpm(hba);
+	if (ret)
+		goto out;
+
 	/* Make sure clocks are enabled before accessing controller */
 	ret = ufshcd_setup_clocks(hba, true);
 	if (ret)
-		goto out;
+		goto disable_vreg;
 
 	/* enable the host irq as host controller would be active soon */
 	ufshcd_enable_irq(hba);
 
-	ret = ufshcd_vreg_set_hpm(hba);
-	if (ret)
-		goto disable_irq_and_vops_clks;
-
 	/*
 	 * Call vendor specific resume callback. As these callbacks may access
 	 * vendor specific host controller register space call them when the
@@ -8797,7 +8811,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ret = ufshcd_vops_resume(hba, pm_op);
 	if (ret)
-		goto disable_vreg;
+		goto disable_irq_and_vops_clks;
 
 	/* For DeepSleep, the only supported option is to have the link off */
 	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
@@ -8864,8 +8878,6 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
 	ufshcd_vops_suspend(hba, pm_op);
-disable_vreg:
-	ufshcd_vreg_set_lpm(hba);
 disable_irq_and_vops_clks:
 	ufshcd_disable_irq(hba);
 	if (hba->clk_scaling.is_allowed)
@@ -8876,6 +8888,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		trace_ufshcd_clk_gating(dev_name(hba->dev),
 					hba->clk_gating.state);
 	}
+disable_vreg:
+	ufshcd_vreg_set_lpm(hba);
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 9bb5f0e..d5fbaba 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
  * @resume: called during host controller PM callback
  * @dbg_register_dump: used to dump controller debug information
  * @phy_initialization: used to initialize phys
- * @device_reset: called to issue a reset pulse on the UFS device
+ * @device_reset: called to assert or deassert device reset line
  * @program_key: program or evict an inline encryption key
  * @event_notify: called to notify important events
  */
@@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
-	int	(*device_reset)(struct ufs_hba *hba);
+	int	(*device_reset)(struct ufs_hba *hba, bool asserted);
 	void	(*config_scaling_param)(struct ufs_hba *hba,
 					struct devfreq_dev_profile *profile,
 					void *data);
@@ -1216,10 +1216,10 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 		hba->vops->dbg_register_dump(hba);
 }
 
-static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
+static inline int ufshcd_vops_device_reset(struct ufs_hba *hba, bool asserted)
 {
 	if (hba->vops && hba->vops->device_reset)
-		return hba->vops->device_reset(hba);
+		return hba->vops->device_reset(hba, asserted);
 
 	return -EOPNOTSUPP;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

