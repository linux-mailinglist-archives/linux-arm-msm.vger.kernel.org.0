Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7791B4F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgDVVmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:42:03 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6394 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbgDVVmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:42:03 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Apr 2020 14:42:01 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 22 Apr 2020 14:42:01 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 6EEE320AA6; Wed, 22 Apr 2020 14:42:01 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        Avri.Altman@wdc.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Colin Ian King <colin.king@canonical.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/3] scsi: ufs: add write booster feature support
Date:   Wed, 22 Apr 2020 14:41:42 -0700
Message-Id: <2871444d9083b0e9323ef6d8ff1b544b7784adc9.1587591527.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586374414.git.asutoshd@codeaurora.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The write performance of TLC NAND is considerably
lower than SLC NAND. Using SLC NAND as a WriteBooster
Buffer enables the write request to be processed with
lower latency and improves the overall write performance.

Adds support for shared-buffer mode WriteBooster.

WriteBooster enable: SW enables it when clocks are
scaled up, thus it's enabled only in high load conditions.

WriteBooster disable: SW will disable the feature,
when clocks are scaled down. Thus writes would go as normal
writes.

To keep the endurance of the WriteBooster Buffer at a
maximum, this load based toggling is adopted.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
---
 drivers/scsi/ufs/ufs.h    |  31 +++++-
 drivers/scsi/ufs/ufshcd.c | 252 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufshcd.h |  14 +++
 3 files changed, 291 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index 990cb48..d77512d 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -140,6 +140,9 @@ enum flag_idn {
 	QUERY_FLAG_IDN_BUSY_RTC				= 0x09,
 	QUERY_FLAG_IDN_RESERVED3			= 0x0A,
 	QUERY_FLAG_IDN_PERMANENTLY_DISABLE_FW_UPDATE	= 0x0B,
+	QUERY_FLAG_IDN_WB_EN                            = 0x0E,
+	QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN                 = 0x0F,
+	QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8     = 0x10,
 };
 
 /* Attribute idn for Query requests */
@@ -168,6 +171,10 @@ enum attr_idn {
 	QUERY_ATTR_IDN_PSA_STATE		= 0x15,
 	QUERY_ATTR_IDN_PSA_DATA_SIZE		= 0x16,
 	QUERY_ATTR_IDN_REF_CLK_GATING_WAIT_TIME	= 0x17,
+	QUERY_ATTR_IDN_WB_FLUSH_STATUS	        = 0x1C,
+	QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
+	QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
+	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
 };
 
 /* Descriptor idn for Query requests */
@@ -191,9 +198,9 @@ enum desc_header_offset {
 };
 
 enum ufs_desc_def_size {
-	QUERY_DESC_DEVICE_DEF_SIZE		= 0x40,
+	QUERY_DESC_DEVICE_DEF_SIZE		= 0x59,
 	QUERY_DESC_CONFIGURATION_DEF_SIZE	= 0x90,
-	QUERY_DESC_UNIT_DEF_SIZE		= 0x23,
+	QUERY_DESC_UNIT_DEF_SIZE		= 0x2D,
 	QUERY_DESC_INTERCONNECT_DEF_SIZE	= 0x06,
 	QUERY_DESC_GEOMETRY_DEF_SIZE		= 0x48,
 	QUERY_DESC_POWER_DEF_SIZE		= 0x62,
@@ -219,6 +226,7 @@ enum unit_desc_param {
 	UNIT_DESC_PARAM_PHY_MEM_RSRC_CNT	= 0x18,
 	UNIT_DESC_PARAM_CTX_CAPABILITIES	= 0x20,
 	UNIT_DESC_PARAM_LARGE_UNIT_SIZE_M1	= 0x22,
+	UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS	= 0x29,
 };
 
 /* Device descriptor parameters offsets in bytes*/
@@ -258,6 +266,10 @@ enum device_desc_param {
 	DEVICE_DESC_PARAM_PSA_MAX_DATA		= 0x25,
 	DEVICE_DESC_PARAM_PSA_TMT		= 0x29,
 	DEVICE_DESC_PARAM_PRDCT_REV		= 0x2A,
+	DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP	= 0x4F,
+	DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN	= 0x53,
+	DEVICE_DESC_PARAM_WB_TYPE		= 0x54,
+	DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS = 0x55,
 };
 
 /* Interconnect descriptor parameters offsets in bytes*/
@@ -333,6 +345,11 @@ enum {
 	UFSHCD_AMP		= 3,
 };
 
+/* Possible values for dExtendedUFSFeaturesSupport */
+enum {
+	UFS_DEV_WRITE_BOOSTER_SUP	= BIT(8),
+};
+
 #define POWER_DESC_MAX_SIZE			0x62
 #define POWER_DESC_MAX_ACTV_ICC_LVLS		16
 
@@ -447,6 +464,11 @@ enum ufs_dev_pwr_mode {
 	UFS_POWERDOWN_PWR_MODE	= 3,
 };
 
+enum ufs_dev_wb_buf_avail_size {
+	UFS_WB_10_PERCENT_BUF_REMAIN = 0x1,
+	UFS_WB_40_PERCENT_BUF_REMAIN = 0x4,
+};
+
 /**
  * struct utp_cmd_rsp - Response UPIU structure
  * @residual_transfer_count: Residual transfer count DW-3
@@ -537,6 +559,11 @@ struct ufs_dev_info {
 	u8 *model;
 	u16 wspecversion;
 	u32 clk_gating_wait_us;
+	u32 d_ext_ufs_feature_sup;
+	u8 b_wb_buffer_type;
+	u32 d_wb_alloc_units;
+	bool keep_vcc_on;
+	u8 b_presrv_uspc_en;
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 7d1fa13..b0d6c1e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -48,6 +48,8 @@
 #include "unipro.h"
 #include "ufs-sysfs.h"
 #include "ufs_bsg.h"
+#include <asm/unaligned.h>
+#include <linux/blkdev.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/ufs.h>
@@ -251,6 +253,13 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up);
 static irqreturn_t ufshcd_intr(int irq, void *__hba);
 static int ufshcd_change_power_mode(struct ufs_hba *hba,
 			     struct ufs_pa_layer_attr *pwr_mode);
+static bool ufshcd_wb_sup(struct ufs_hba *hba);
+static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba);
+static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
+static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
+static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set);
+static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable);
+
 static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
 {
 	return tag >= 0 && tag < hba->nutrs;
@@ -272,6 +281,25 @@ static inline void ufshcd_disable_irq(struct ufs_hba *hba)
 	}
 }
 
+static inline void ufshcd_wb_config(struct ufs_hba *hba)
+{
+	int ret;
+
+	if (!ufshcd_wb_sup(hba))
+		return;
+
+	ret = ufshcd_wb_ctrl(hba, true);
+	if (ret)
+		dev_err(hba->dev, "%s: Enable WB failed: %d\n", __func__, ret);
+	else
+		dev_info(hba->dev, "%s: Write Booster Configured\n", __func__);
+	ret = ufshcd_wb_toggle_flush_during_h8(hba, true);
+	if (ret)
+		dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
+			__func__, ret);
+	ufshcd_wb_toggle_flush(hba, true);
+}
+
 static void ufshcd_scsi_unblock_requests(struct ufs_hba *hba)
 {
 	if (atomic_dec_and_test(&hba->scsi_block_reqs_cnt))
@@ -1150,10 +1178,17 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, bool scale_up)
 	/* scale up the gear after scaling up clocks */
 	if (scale_up) {
 		ret = ufshcd_scale_gear(hba, true);
-		if (ret)
+		if (ret) {
 			ufshcd_scale_clks(hba, false);
+			goto out_unprepare;
+		}
 	}
 
+	/* Enable Write Booster if we have scaled up else disable it */
+	up_write(&hba->clk_scaling_lock);
+	ufshcd_wb_ctrl(hba, scale_up);
+	down_write(&hba->clk_scaling_lock);
+
 out_unprepare:
 	ufshcd_clock_scaling_unprepare(hba);
 out:
@@ -5161,6 +5196,166 @@ static void ufshcd_bkops_exception_event_handler(struct ufs_hba *hba)
 				__func__, err);
 }
 
+static bool ufshcd_wb_sup(struct ufs_hba *hba)
+{
+	return ufshcd_is_wb_allowed(hba);
+}
+
+static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
+{
+	int ret;
+	enum query_opcode opcode;
+
+	if (!ufshcd_wb_sup(hba))
+		return 0;
+
+	if (!(enable ^ hba->wb_enabled))
+		return 0;
+	if (enable)
+		opcode = UPIU_QUERY_OPCODE_SET_FLAG;
+	else
+		opcode = UPIU_QUERY_OPCODE_CLEAR_FLAG;
+
+	ret = ufshcd_query_flag_retry(hba, opcode,
+				      QUERY_FLAG_IDN_WB_EN, NULL);
+	if (ret) {
+		dev_err(hba->dev, "%s write booster %s failed %d\n",
+			__func__, enable ? "enable" : "disable", ret);
+		return ret;
+	}
+
+	hba->wb_enabled = enable;
+	dev_dbg(hba->dev, "%s write booster %s %d\n",
+			__func__, enable ? "enable" : "disable", ret);
+
+	return ret;
+}
+
+static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
+{
+	int val;
+
+	if (set)
+		val =  UPIU_QUERY_OPCODE_SET_FLAG;
+	else
+		val = UPIU_QUERY_OPCODE_CLEAR_FLAG;
+
+	return ufshcd_query_flag_retry(hba, val,
+			       QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8,
+				       NULL);
+}
+
+static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable)
+{
+	if (enable)
+		ufshcd_wb_buf_flush_enable(hba);
+	else
+		ufshcd_wb_buf_flush_disable(hba);
+
+}
+
+static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
+{
+	int ret;
+
+	if (!ufshcd_wb_sup(hba) || hba->wb_buf_flush_enabled)
+		return 0;
+
+	ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_SET_FLAG,
+				      QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
+	if (ret)
+		dev_err(hba->dev, "%s WB - buf flush enable failed %d\n",
+			__func__, ret);
+	else
+		hba->wb_buf_flush_enabled = true;
+
+	dev_dbg(hba->dev, "WB - Flush enabled: %d\n", ret);
+	return ret;
+}
+
+static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
+{
+	int ret;
+
+	if (!ufshcd_wb_sup(hba) || !hba->wb_buf_flush_enabled)
+		return 0;
+
+	ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_CLEAR_FLAG,
+				      QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
+	if (ret) {
+		dev_warn(hba->dev, "%s: WB - buf flush disable failed %d\n",
+			 __func__, ret);
+	} else {
+		hba->wb_buf_flush_enabled = false;
+		dev_dbg(hba->dev, "WB - Flush disabled: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
+						u32 avail_buf)
+{
+	u32 cur_buf;
+	int ret;
+
+	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+					      QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE,
+					      0, 0, &cur_buf);
+	if (ret) {
+		dev_err(hba->dev, "%s dCurWriteBoosterBufferSize read failed %d\n",
+			__func__, ret);
+		return false;
+	}
+
+	if (!cur_buf) {
+		dev_info(hba->dev, "dCurWBBuf: %d WB disabled until free-space is available\n",
+			 cur_buf);
+		return false;
+	}
+	/* Let it continue to flush when >60% full */
+	if (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)
+		return true;
+
+	return false;
+}
+
+static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
+{
+	int ret;
+	u32 avail_buf;
+
+	if (!ufshcd_wb_sup(hba))
+		return false;
+	/*
+	 * The ufs device needs the vcc to be ON to flush.
+	 * With user-space reduction enabled, it's enough to enable flush
+	 * by checking only the available buffer. The threshold
+	 * defined here is > 90% full.
+	 * With user-space preserved enabled, the current-buffer
+	 * should be checked too because the wb buffer size can reduce
+	 * when disk tends to be full. This info is provided by current
+	 * buffer (dCurrentWriteBoosterBufferSize). There's no point in
+	 * keeping vcc on when current buffer is empty.
+	 */
+	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+				      QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE,
+				      0, 0, &avail_buf);
+	if (ret) {
+		dev_warn(hba->dev, "%s dAvailableWriteBoosterBufferSize read failed %d\n",
+			 __func__, ret);
+		return false;
+	}
+
+	if (!hba->dev_info.b_presrv_uspc_en) {
+		if (avail_buf <= UFS_WB_10_PERCENT_BUF_REMAIN)
+			return true;
+		return false;
+	}
+
+	return ufshcd_wb_presrv_usrspc_keep_vcc_on(hba, avail_buf);
+}
+
 /**
  * ufshcd_exception_event_handler - handle exceptions raised by device
  * @work: pointer to work data
@@ -6603,6 +6798,33 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 	return ret;
 }
 
+static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
+{
+	hba->dev_info.d_ext_ufs_feature_sup =
+		get_unaligned_be32(desc_buf +
+				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
+	/*
+	 * WB may be supported but not configured while provisioning.
+	 * The spec says, in dedicated wb buffer mode,
+	 * a max of 1 lun would have wb buffer configured.
+	 * Now only shared buffer mode is supported.
+	 */
+	hba->dev_info.b_wb_buffer_type =
+		desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
+
+	hba->dev_info.d_wb_alloc_units =
+		get_unaligned_be32(desc_buf +
+				   DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
+	hba->dev_info.b_presrv_uspc_en =
+		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
+
+	if (!((hba->dev_info.d_ext_ufs_feature_sup &
+		 UFS_DEV_WRITE_BOOSTER_SUP) &&
+		hba->dev_info.b_wb_buffer_type &&
+	      hba->dev_info.d_wb_alloc_units))
+		hba->caps &= ~UFSHCD_CAP_WB_EN;
+}
+
 static int ufs_get_device_desc(struct ufs_hba *hba)
 {
 	int err;
@@ -6639,6 +6861,11 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 				      desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
 
 	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
+
+	/* Enable WB only for UFS-3.1 */
+	if (dev_info->wspecversion >= 0x310)
+		ufshcd_wb_probe(hba, desc_buf);
+
 	err = ufshcd_read_string_desc(hba, model_index,
 				      &dev_info->model, SD_ASCII_STD);
 	if (err < 0) {
@@ -7149,6 +7376,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool async)
 	/* set the state as operational after switching to desired gear */
 	hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
 
+	ufshcd_wb_config(hba);
 	/* Enable Auto-Hibernate if configured */
 	ufshcd_auto_hibern8_enable(hba);
 
@@ -7809,12 +8037,16 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	 *
 	 * Ignore the error returned by ufshcd_toggle_vreg() as device is anyway
 	 * in low power state which would save some power.
+	 *
+	 * If Write Booster is enabled and the device needs to flush the WB
+	 * buffer OR if bkops status is urgent for WB, keep Vcc on.
 	 */
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
 	    !hba->dev_info.is_lu_power_on_wp) {
 		ufshcd_setup_vreg(hba, false);
 	} else if (!ufshcd_is_ufs_dev_active(hba)) {
-		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
+		if (!hba->dev_info.keep_vcc_on)
+			ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
 		if (!ufshcd_is_link_active(hba)) {
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
@@ -7938,11 +8170,23 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			/* make sure that auto bkops is disabled */
 			ufshcd_disable_auto_bkops(hba);
 		}
+		/*
+		 * With wb enabled, if the bkops is enabled or if the
+		 * configured WB type is 70% full, keep vcc ON
+		 * for the device to flush the wb buffer
+		 */
+		if ((hba->auto_bkops_enabled && ufshcd_wb_sup(hba)) ||
+		    ufshcd_wb_keep_vcc_on(hba))
+			hba->dev_info.keep_vcc_on = true;
+		else
+			hba->dev_info.keep_vcc_on = false;
+	} else if (!ufshcd_is_runtime_pm(pm_op)) {
+		hba->dev_info.keep_vcc_on = false;
 	}
 
 	if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
-	     ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
-	       !ufshcd_is_runtime_pm(pm_op))) {
+	    ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
+	    !ufshcd_is_runtime_pm(pm_op))) {
 		/* ensure that bkops is disabled */
 		ufshcd_disable_auto_bkops(hba);
 		ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 6ffc08a..056537e 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -555,6 +555,13 @@ enum ufshcd_caps {
 	 * for userspace to control the power management.
 	 */
 	UFSHCD_CAP_RPM_AUTOSUSPEND			= 1 << 6,
+
+	/*
+	 * This capability allows the host controller driver to turn-on
+	 * WriteBooster, if the underlying device supports it and is
+	 * provisioned to be used. This would increase the write performance.
+	 */
+	UFSHCD_CAP_WB_EN				= 1 << 7,
 };
 
 /**
@@ -727,6 +734,8 @@ struct ufs_hba {
 
 	struct device		bsg_dev;
 	struct request_queue	*bsg_queue;
+	bool wb_buf_flush_enabled;
+	bool wb_enabled;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
@@ -775,6 +784,11 @@ static inline bool ufshcd_is_auto_hibern8_enabled(struct ufs_hba *hba)
 	return FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, hba->ahit) ? true : false;
 }
 
+static inline bool ufshcd_is_wb_allowed(struct ufs_hba *hba)
+{
+	return hba->caps & UFSHCD_CAP_WB_EN;
+}
+
 #define ufshcd_writel(hba, val, reg)	\
 	writel((val), (hba)->mmio_base + (reg))
 #define ufshcd_readl(hba, reg)	\
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

