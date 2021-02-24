Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D2B324523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 21:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhBXUYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 15:24:46 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:43036 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhBXUYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 15:24:46 -0500
IronPort-SDR: iRvFaHkHvnGExtwf5j2f4Q7FgUCgMO30r5JmTTjyj+YPbnfvAMpn6zUqv4hoBo7m4JrQbg6UAr
 IG+QTMNcqIjbNzzfwvbRK3fUKVuXf6mtFBZGuPm/vY/rYL9of1MZ6rgPXPpoZ/GxVyh+HslmAT
 qas6dtUzyDer3+2i6jVZbDcgS3vgBbiFwpv2vIpqloMbrBKXL3+Lln+R0xKw4h2k427DSHLyox
 WpS5JY3W44CQ6pI2g/fplh5RGk12mWEfBDakLfSnbelntbjI4ERp3Rd8sRXN5JhQ626wB/TVgV
 4RY=
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="47789412"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by labrats.qualcomm.com with ESMTP; 24 Feb 2021 12:24:16 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg04-sd.qualcomm.com with ESMTP; 24 Feb 2021 12:24:16 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 1D6CC219CE; Wed, 24 Feb 2021 12:24:16 -0800 (PST)
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
Subject: [PATCH v6 2/2] ufs: sysfs: Resume the proper scsi device
Date:   Wed, 24 Feb 2021 12:23:05 -0800
Message-Id: <daf65282badec5f6452a1a705f5a126381d0fa36.1614198015.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1614198015.git.asutoshd@codeaurora.org>
References: <cover.1614198015.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1614198015.git.asutoshd@codeaurora.org>
References: <cover.1614198015.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resumes the actual scsi device the unit descriptor of which
is being accessed instead of the hba alone.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index acc54f5..34481e3 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
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

