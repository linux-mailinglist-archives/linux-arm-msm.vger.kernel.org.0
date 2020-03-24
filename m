Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D31F191C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 22:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgCXVsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 17:48:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10335 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727040AbgCXVsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 17:48:37 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2020 14:48:36 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg02-sd.qualcomm.com with ESMTP; 24 Mar 2020 14:48:36 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id D85431F79C; Tue, 24 Mar 2020 14:48:35 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Nitin Rawat <nitirawa@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Asutosh Das <asutoshd@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [<PATCH v1> 1/1] scsi: ufs: Resume ufs host before accessing ufs device
Date:   Tue, 24 Mar 2020 14:48:21 -0700
Message-Id: <f712a4f7bdb0ae32e0d83634731e7aaa1b3a6cdd.1585009663.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nitin Rawat <nitirawa@codeaurora.org>

As a part of sysfs reading of descriptors/attributes/flags,
query commands should only be executed when hba's
power runtime status is active.
To guarantee this, add pm_runtime_get/put_sync()
to those paths where query commands are sent.

Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index dbdf8b0..92a63ee 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -210,8 +210,10 @@ static ssize_t ufs_sysfs_read_desc_param(struct ufs_hba *hba,
 	if (param_size > 8)
 		return -EINVAL;
 
+	pm_runtime_get_sync(hba->dev);
 	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
 				param_offset, desc_buf, param_size);
+	pm_runtime_put_sync(hba->dev);
 	if (ret)
 		return -EINVAL;
 	switch (param_size) {
@@ -558,6 +560,7 @@ static ssize_t _name##_show(struct device *dev,				\
 	desc_buf = kzalloc(QUERY_DESC_MAX_SIZE, GFP_ATOMIC);		\
 	if (!desc_buf)                                                  \
 		return -ENOMEM;                                         \
+	pm_runtime_get_sync(hba->dev);					\
 	ret = ufshcd_query_descriptor_retry(hba,			\
 		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
 		0, 0, desc_buf, &desc_len);				\
@@ -574,6 +577,7 @@ static ssize_t _name##_show(struct device *dev,				\
 		goto out;						\
 	ret = snprintf(buf, PAGE_SIZE, "%s\n", desc_buf);		\
 out:									\
+	pm_runtime_put_sync(hba->dev);					\
 	kfree(desc_buf);						\
 	return ret;							\
 }									\
@@ -604,9 +608,13 @@ static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
 {									\
 	bool flag;							\
+	int ret;							\
 	struct ufs_hba *hba = dev_get_drvdata(dev);			\
-	if (ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,		\
-		QUERY_FLAG_IDN##_uname, &flag))				\
+	pm_runtime_get_sync(hba->dev);					\
+	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
+		QUERY_FLAG_IDN##_uname, &flag);				\
+	pm_runtime_put_sync(hba->dev);					\
+	if (ret)							\
 		return -EINVAL;						\
 	return sprintf(buf, "%s\n", flag ? "true" : "false");		\
 }									\
@@ -644,8 +652,12 @@ static ssize_t _name##_show(struct device *dev,				\
 {									\
 	struct ufs_hba *hba = dev_get_drvdata(dev);			\
 	u32 value;							\
-	if (ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,		\
-		QUERY_ATTR_IDN##_uname, 0, 0, &value))			\
+	int ret;							\
+	pm_runtime_get_sync(hba->dev);					\
+	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
+		QUERY_ATTR_IDN##_uname, 0, 0, &value);			\
+	pm_runtime_put_sync(hba->dev);					\
+	if (ret)							\
 		return -EINVAL;						\
 	return sprintf(buf, "0x%08X\n", value);				\
 }									\
@@ -766,9 +778,13 @@ static ssize_t dyn_cap_needed_attribute_show(struct device *dev,
 	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
 	u8 lun = ufshcd_scsi_to_upiu_lun(sdev->lun);
+	int ret;
 
-	if (ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
-		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value))
+	pm_runtime_get_sync(hba->dev);
+	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
+		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
+	pm_runtime_put_sync(hba->dev);
+	if (ret)
 		return -EINVAL;
 	return sprintf(buf, "0x%08X\n", value);
 }
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

