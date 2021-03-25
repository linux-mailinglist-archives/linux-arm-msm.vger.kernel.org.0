Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EED34867E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 02:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhCYBkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 21:40:08 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:28545 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhCYBjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 21:39:46 -0400
IronPort-SDR: ws4/udhmVJFWYhxbjtAPg7axrtUTZzsI5bYdkI+YjJk+0oyFg00dMCjDhRkBdhCvAjnkgckqgx
 SjfcmsycouVZIPE48SbGo+z8zD7bjf3+yKocueiO+B74bCHericoNgrA7+Oh37kgCY56t+bdo9
 K2xLEJFdemTJdTHusmDl2yronDDudu8l5tU7T1YhcM3NhwFeyO+se5EBmFpfwEnFBalECL9k4H
 IVwX3QGEzJC3zEu/FZJVFNuoAbH7OTF9LH2QuClrc8pM7RirR9uEdnNbLbmV/Mqy+rHyFA4m6/
 QJo=
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; 
   d="scan'208";a="47833100"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by labrats.qualcomm.com with ESMTP; 24 Mar 2021 18:39:45 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg01-sd.qualcomm.com with ESMTP; 24 Mar 2021 18:39:44 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id AFE7921038; Wed, 24 Mar 2021 18:39:44 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        adrian.hunter@intel.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v13 2/2] ufs: sysfs: Resume the proper scsi device
Date:   Wed, 24 Mar 2021 18:39:14 -0700
Message-Id: <e6a49c62b7d643bd5fbe7e744a9f91d91349ec72.1616633712.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616633712.git.asutoshd@codeaurora.org>
References: <cover.1616633712.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1616633712.git.asutoshd@codeaurora.org>
References: <cover.1616633712.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resumes the actual scsi device the unit descriptor of which
is being accessed instead of the hba alone.

Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index acc54f5..3fc182b 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -245,9 +245,9 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	scsi_autopm_get_device(hba->sdev_ufs_device);
 	res = ufshcd_wb_ctrl(hba, wb_enable);
-	pm_runtime_put_sync(hba->dev);
+	scsi_autopm_put_device(hba->sdev_ufs_device);
 out:
 	up(&hba->host_sem);
 	return res < 0 ? res : count;
@@ -297,10 +297,10 @@ static ssize_t ufs_sysfs_read_desc_param(struct ufs_hba *hba,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	scsi_autopm_get_device(hba->sdev_ufs_device);
 	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
 				param_offset, desc_buf, param_size);
-	pm_runtime_put_sync(hba->dev);
+	scsi_autopm_put_device(hba->sdev_ufs_device);
 	if (ret) {
 		ret = -EINVAL;
 		goto out;
@@ -678,7 +678,7 @@ static ssize_t _name##_show(struct device *dev,				\
 		up(&hba->host_sem);					\
 		return -ENOMEM;						\
 	}								\
-	pm_runtime_get_sync(hba->dev);					\
+	scsi_autopm_get_device(hba->sdev_ufs_device);			\
 	ret = ufshcd_query_descriptor_retry(hba,			\
 		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
 		0, 0, desc_buf, &desc_len);				\
@@ -695,7 +695,7 @@ static ssize_t _name##_show(struct device *dev,				\
 		goto out;						\
 	ret = sysfs_emit(buf, "%s\n", desc_buf);			\
 out:									\
-	pm_runtime_put_sync(hba->dev);					\
+	scsi_autopm_put_device(hba->sdev_ufs_device);			\
 	kfree(desc_buf);						\
 	up(&hba->host_sem);						\
 	return ret;							\
@@ -744,10 +744,10 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	pm_runtime_get_sync(hba->dev);					\
+	scsi_autopm_get_device(hba->sdev_ufs_device);			\
 	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
 		QUERY_FLAG_IDN##_uname, index, &flag);			\
-	pm_runtime_put_sync(hba->dev);					\
+	scsi_autopm_put_device(hba->sdev_ufs_device);			\
 	if (ret) {							\
 		ret = -EINVAL;						\
 		goto out;						\
@@ -813,10 +813,10 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	pm_runtime_get_sync(hba->dev);					\
+	scsi_autopm_get_device(hba->sdev_ufs_device);			\
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
 		QUERY_ATTR_IDN##_uname, index, 0, &value);		\
-	pm_runtime_put_sync(hba->dev);					\
+	scsi_autopm_put_device(hba->sdev_ufs_device);			\
 	if (ret) {							\
 		ret = -EINVAL;						\
 		goto out;						\
@@ -899,11 +899,15 @@ static ssize_t _pname##_show(struct device *dev,			\
 	struct scsi_device *sdev = to_scsi_device(dev);			\
 	struct ufs_hba *hba = shost_priv(sdev->host);			\
 	u8 lun = ufshcd_scsi_to_upiu_lun(sdev->lun);			\
+	int ret;							\
 	if (!ufs_is_valid_unit_desc_lun(&hba->dev_info, lun,		\
 				_duname##_DESC_PARAM##_puname))		\
 		return -EINVAL;						\
-	return ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
+	scsi_autopm_get_device(sdev);					\
+	ret = ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
 		lun, _duname##_DESC_PARAM##_puname, buf, _size);	\
+	scsi_autopm_put_device(sdev);					\
+	return ret;							\
 }									\
 static DEVICE_ATTR_RO(_pname)
 
@@ -964,10 +968,10 @@ static ssize_t dyn_cap_needed_attribute_show(struct device *dev,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	scsi_autopm_get_device(hba->sdev_ufs_device);
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
-	pm_runtime_put_sync(hba->dev);
+	scsi_autopm_put_device(hba->sdev_ufs_device);
 	if (ret) {
 		ret = -EINVAL;
 		goto out;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

