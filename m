Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FCB1A2B74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 23:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgDHVtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 17:49:32 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:44429 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726654AbgDHVtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 17:49:31 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2020 14:49:30 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 08 Apr 2020 14:49:30 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 5DF66209D0; Wed,  8 Apr 2020 14:49:30 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        Avri.Altman@wdc.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Bean Huo <beanhuo@micron.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 3/3] ufs: sysfs: add sysfs entries for write booster
Date:   Wed,  8 Apr 2020 14:48:41 -0700
Message-Id: <7d99b5db043072c1b4484d97484b04caae696dab.1586382357.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586374414.git.asutoshd@codeaurora.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
In-Reply-To: <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
References: <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds unit, device, geometry descriptor sysfs entries.
Adds flags sysfs entries for write booster.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 39 ++++++++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufs.h       |  6 ++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index 92a63ee..176a216 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -276,6 +276,10 @@ UFS_DEVICE_DESC_PARAM(device_version, _DEV_VER, 2);
 UFS_DEVICE_DESC_PARAM(number_of_secure_wpa, _NUM_SEC_WPA, 1);
 UFS_DEVICE_DESC_PARAM(psa_max_data_size, _PSA_MAX_DATA, 4);
 UFS_DEVICE_DESC_PARAM(psa_state_timeout, _PSA_TMT, 1);
+UFS_DEVICE_DESC_PARAM(ext_feature_sup, _EXT_UFS_FEATURE_SUP, 4);
+UFS_DEVICE_DESC_PARAM(wb_presv_us_en, _WB_US_RED_EN, 1);
+UFS_DEVICE_DESC_PARAM(wb_type, _WB_TYPE, 1);
+UFS_DEVICE_DESC_PARAM(wb_shared_alloc_units, _WB_SHARED_ALLOC_UNITS, 4);
 
 static struct attribute *ufs_sysfs_device_descriptor[] = {
 	&dev_attr_device_type.attr,
@@ -304,6 +308,10 @@ static struct attribute *ufs_sysfs_device_descriptor[] = {
 	&dev_attr_number_of_secure_wpa.attr,
 	&dev_attr_psa_max_data_size.attr,
 	&dev_attr_psa_state_timeout.attr,
+	&dev_attr_ext_feature_sup.attr,
+	&dev_attr_wb_presv_us_en.attr,
+	&dev_attr_wb_type.attr,
+	&dev_attr_wb_shared_alloc_units.attr,
 	NULL,
 };
 
@@ -373,6 +381,12 @@ UFS_GEOMETRY_DESC_PARAM(enh4_memory_max_alloc_units,
 	_ENM4_MAX_NUM_UNITS, 4);
 UFS_GEOMETRY_DESC_PARAM(enh4_memory_capacity_adjustment_factor,
 	_ENM4_CAP_ADJ_FCTR, 2);
+UFS_GEOMETRY_DESC_PARAM(wb_max_alloc_units, _WB_MAX_ALLOC_UNITS, 4);
+UFS_GEOMETRY_DESC_PARAM(wb_max_wb_luns, _WB_MAX_WB_LUNS, 1);
+UFS_GEOMETRY_DESC_PARAM(wb_buff_cap_adj, _WB_BUFF_CAP_ADJ, 1);
+UFS_GEOMETRY_DESC_PARAM(wb_sup_red_type, _WB_SUP_RED_TYPE, 1);
+UFS_GEOMETRY_DESC_PARAM(wb_sup_wb_type, _WB_SUP_WB_TYPE, 1);
+
 
 static struct attribute *ufs_sysfs_geometry_descriptor[] = {
 	&dev_attr_raw_device_capacity.attr,
@@ -404,6 +418,11 @@ static struct attribute *ufs_sysfs_geometry_descriptor[] = {
 	&dev_attr_enh3_memory_capacity_adjustment_factor.attr,
 	&dev_attr_enh4_memory_max_alloc_units.attr,
 	&dev_attr_enh4_memory_capacity_adjustment_factor.attr,
+	&dev_attr_wb_max_alloc_units.attr,
+	&dev_attr_wb_max_wb_luns.attr,
+	&dev_attr_wb_buff_cap_adj.attr,
+	&dev_attr_wb_sup_red_type.attr,
+	&dev_attr_wb_sup_wb_type.attr,
 	NULL,
 };
 
@@ -616,7 +635,7 @@ static ssize_t _name##_show(struct device *dev,				\
 	pm_runtime_put_sync(hba->dev);					\
 	if (ret)							\
 		return -EINVAL;						\
-	return sprintf(buf, "%s\n", flag ? "true" : "false");		\
+	return sprintf(buf, "%s\n", flag ? "true" : "false"); \
 }									\
 static DEVICE_ATTR_RO(_name)
 
@@ -628,6 +647,9 @@ UFS_FLAG(life_span_mode_enable, _LIFE_SPAN_MODE_ENABLE);
 UFS_FLAG(phy_resource_removal, _FPHYRESOURCEREMOVAL);
 UFS_FLAG(busy_rtc, _BUSY_RTC);
 UFS_FLAG(disable_fw_update, _PERMANENTLY_DISABLE_FW_UPDATE);
+UFS_FLAG(wb_enable, _WB_EN);
+UFS_FLAG(wb_flush_en, _WB_BUFF_FLUSH_EN);
+UFS_FLAG(wb_flush_during_h8, _WB_BUFF_FLUSH_DURING_HIBERN8);
 
 static struct attribute *ufs_sysfs_device_flags[] = {
 	&dev_attr_device_init.attr,
@@ -638,6 +660,9 @@ static struct attribute *ufs_sysfs_device_flags[] = {
 	&dev_attr_phy_resource_removal.attr,
 	&dev_attr_busy_rtc.attr,
 	&dev_attr_disable_fw_update.attr,
+	&dev_attr_wb_enable.attr,
+	&dev_attr_wb_flush_en.attr,
+	&dev_attr_wb_flush_during_h8.attr,
 	NULL,
 };
 
@@ -679,6 +704,11 @@ UFS_ATTRIBUTE(exception_event_status, _EE_STATUS);
 UFS_ATTRIBUTE(ffu_status, _FFU_STATUS);
 UFS_ATTRIBUTE(psa_state, _PSA_STATE);
 UFS_ATTRIBUTE(psa_data_size, _PSA_DATA_SIZE);
+UFS_ATTRIBUTE(wb_flush_status, _WB_FLUSH_STATUS);
+UFS_ATTRIBUTE(wb_avail_buf, _AVAIL_WB_BUFF_SIZE);
+UFS_ATTRIBUTE(wb_life_time_est, _WB_BUFF_LIFE_TIME_EST);
+UFS_ATTRIBUTE(wb_cur_buf, _CURR_WB_BUFF_SIZE);
+
 
 static struct attribute *ufs_sysfs_attributes[] = {
 	&dev_attr_boot_lun_enabled.attr,
@@ -697,6 +727,10 @@ static struct attribute *ufs_sysfs_attributes[] = {
 	&dev_attr_ffu_status.attr,
 	&dev_attr_psa_state.attr,
 	&dev_attr_psa_data_size.attr,
+	&dev_attr_wb_flush_status.attr,
+	&dev_attr_wb_avail_buf.attr,
+	&dev_attr_wb_life_time_est.attr,
+	&dev_attr_wb_cur_buf.attr,
 	NULL,
 };
 
@@ -748,6 +782,8 @@ UFS_UNIT_DESC_PARAM(provisioning_type, _PROVISIONING_TYPE, 1);
 UFS_UNIT_DESC_PARAM(physical_memory_resourse_count, _PHY_MEM_RSRC_CNT, 8);
 UFS_UNIT_DESC_PARAM(context_capabilities, _CTX_CAPABILITIES, 2);
 UFS_UNIT_DESC_PARAM(large_unit_granularity, _LARGE_UNIT_SIZE_M1, 1);
+UFS_UNIT_DESC_PARAM(wb_buf_alloc_units, _WB_BUF_ALLOC_UNITS, 4);
+
 
 static struct attribute *ufs_sysfs_unit_descriptor[] = {
 	&dev_attr_boot_lun_id.attr,
@@ -763,6 +799,7 @@ static struct attribute *ufs_sysfs_unit_descriptor[] = {
 	&dev_attr_physical_memory_resourse_count.attr,
 	&dev_attr_context_capabilities.attr,
 	&dev_attr_large_unit_granularity.attr,
+	&dev_attr_wb_buf_alloc_units.attr,
 	NULL,
 };
 
diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index 2c77b3e..5c26659 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -267,6 +267,7 @@ enum device_desc_param {
 	DEVICE_DESC_PARAM_PSA_TMT		= 0x29,
 	DEVICE_DESC_PARAM_PRDCT_REV		= 0x2A,
 	DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP	= 0x4F,
+	DEVICE_DESC_PARAM_WB_US_RED_EN		= 0x53,
 	DEVICE_DESC_PARAM_WB_TYPE		= 0x54,
 	DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS = 0x55,
 };
@@ -313,6 +314,11 @@ enum geometry_desc_param {
 	GEOMETRY_DESC_PARAM_ENM4_MAX_NUM_UNITS	= 0x3E,
 	GEOMETRY_DESC_PARAM_ENM4_CAP_ADJ_FCTR	= 0x42,
 	GEOMETRY_DESC_PARAM_OPT_LOG_BLK_SIZE	= 0x44,
+	GEOMETRY_DESC_PARAM_WB_MAX_ALLOC_UNITS	= 0x4F,
+	GEOMETRY_DESC_PARAM_WB_MAX_WB_LUNS	= 0x53,
+	GEOMETRY_DESC_PARAM_WB_BUFF_CAP_ADJ	= 0x54,
+	GEOMETRY_DESC_PARAM_WB_SUP_RED_TYPE	= 0x55,
+	GEOMETRY_DESC_PARAM_WB_SUP_WB_TYPE	= 0x56,
 };
 
 /* Health descriptor parameters offsets in bytes*/
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

