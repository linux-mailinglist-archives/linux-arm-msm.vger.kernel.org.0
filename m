Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9012D3C0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 08:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgLIHTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 02:19:03 -0500
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227]:24118 "EHLO
        alexa-out-tai-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725283AbgLIHTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 02:19:03 -0500
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Dec 2020 02:19:02 EST
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
  by alexa-out-tai-02.qualcomm.com with ESMTP; 09 Dec 2020 15:10:55 +0800
X-QCInternal: smtphost
Received: from cbsp-sh-gv.ap.qualcomm.com (HELO cbsp-sh-gv.qualcomm.com) ([10.231.249.68])
  by ironmsg03-tai.qualcomm.com with ESMTP; 09 Dec 2020 15:10:26 +0800
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 393357)
        id 5B353232E; Wed,  9 Dec 2020 15:10:25 +0800 (CST)
From:   Ziqi Chen <ziqichen@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        cang@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        ziqichen@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/1] scsi: ufs: Fix ufs power down/on specs violation
Date:   Wed,  9 Dec 2020 15:09:28 +0800
Message-Id: <1607497774-76579-1-git-send-email-ziqichen@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per specs, e.g, JESD220E chapter 7.2, while powering
off/on the ufs device, RST_N signal and REF_CLK signal
should be between VSS(Ground) and VCCQ/VCCQ2.

Power down:
1. Assert RST_N low
2. Turn-off REF_CLK
3. Turn-off VCC
4. Turn-off VCCQ/VCCQ2.
power on:
1. Turn-on VCC
2. Turn-on VCCQ/VCCQ2
3. Turn-On REF_CLK
4. Deassert RST_N high.

Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 14 ++++++++++----
 drivers/scsi/ufs/ufshcd.c   | 19 +++++++++----------
 drivers/scsi/ufs/ufshcd.h   |  4 ++--
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 1e434cc..5ed3a63d 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -582,6 +582,9 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufs_qcom_disable_lane_clks(host);
 		phy_power_off(phy);
 
+		if (hba->vops && hba->vops->device_reset)
+			hba->vops->device_reset(hba, false);
+
 	} else if (!ufs_qcom_is_link_active(hba)) {
 		ufs_qcom_disable_lane_clks(host);
 	}
@@ -1400,10 +1403,11 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 /**
  * ufs_qcom_device_reset() - toggle the (optional) device reset line
  * @hba: per-adapter instance
+ * @toggle: need pulling up or not
  *
  * Toggles the (optional) reset line to reset the attached device.
  */
-static int ufs_qcom_device_reset(struct ufs_hba *hba)
+static int ufs_qcom_device_reset(struct ufs_hba *hba, bool toggle)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
@@ -1416,10 +1420,12 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	 * be on the safe side.
 	 */
 	gpiod_set_value_cansleep(host->device_reset, 1);
-	usleep_range(10, 15);
 
-	gpiod_set_value_cansleep(host->device_reset, 0);
-	usleep_range(10, 15);
+	if (toggle) {
+		usleep_range(10, 15);
+		gpiod_set_value_cansleep(host->device_reset, 0);
+		usleep_range(10, 15);
+	}
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 92d433d..5ab1c02 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8633,8 +8633,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (ret)
 		goto set_dev_active;
 
-	ufshcd_vreg_set_lpm(hba);
-
 disable_clks:
 	/*
 	 * Call vendor specific suspend callback. As these callbacks may access
@@ -8664,6 +8662,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	/* Put the host controller in low power mode if possible */
 	ufshcd_hba_vreg_set_lpm(hba);
+	ufshcd_vreg_set_lpm(hba);
 	goto out;
 
 set_link_active:
@@ -8729,18 +8728,18 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	old_link_state = hba->uic_link_state;
 
 	ufshcd_hba_vreg_set_hpm(hba);
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
@@ -8748,7 +8747,7 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ret = ufshcd_vops_resume(hba, pm_op);
 	if (ret)
-		goto disable_vreg;
+		goto disable_irq_and_vops_clks;
 
 	/* For DeepSleep, the only supported option is to have the link off */
 	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) && !ufshcd_is_link_off(hba));
@@ -8815,8 +8814,6 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
 	ufshcd_vops_suspend(hba, pm_op);
-disable_vreg:
-	ufshcd_vreg_set_lpm(hba);
 disable_irq_and_vops_clks:
 	ufshcd_disable_irq(hba);
 	if (hba->clk_scaling.is_allowed)
@@ -8827,6 +8824,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		trace_ufshcd_clk_gating(dev_name(hba->dev),
 					hba->clk_gating.state);
 	}
+disable_vreg:
+	ufshcd_vreg_set_lpm(hba);
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 61344c4..47c7dab6 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -323,7 +323,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
-	int	(*device_reset)(struct ufs_hba *hba);
+	int	(*device_reset)(struct ufs_hba *hba, bool);
 	void	(*config_scaling_param)(struct ufs_hba *hba,
 					struct devfreq_dev_profile *profile,
 					void *data);
@@ -1211,7 +1211,7 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 {
 	if (hba->vops && hba->vops->device_reset) {
-		int err = hba->vops->device_reset(hba);
+		int err = hba->vops->device_reset(hba, true);
 
 		if (!err)
 			ufshcd_set_ufs_dev_active(hba);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

