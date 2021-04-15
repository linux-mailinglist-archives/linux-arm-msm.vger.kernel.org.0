Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E462361658
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 01:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237913AbhDOXhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 19:37:18 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:58332 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237906AbhDOXhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 19:37:15 -0400
IronPort-SDR: OvRAyKoR5xO1em7skCFNLn+6n55pKJHfHCTdhuuS1LcgdvN8WEFna+j8BzbwXncYawydca1Nlu
 oavyTzDuvTQHEtHq8gL7AgWZc+eTYvfdIkh37I0S0V6z/yKBIl0LJ2FRQJ7AgyZxkMeBm2Po4L
 JgBHywcxvi/tjylYLKvRIY03436tknDH58SBwqdCn0gspLB/mYMSJ7rLG+eRRJdc76xD0Vx9Hb
 kJlPGVhQFCS6puL3vqB5nCDcZyKILW9lfCBO9T2bNFXyGlhnN5TgcWxRot2ku40lwxLQ1Jx9Kx
 334=
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="29751641"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by labrats.qualcomm.com with ESMTP; 15 Apr 2021 16:36:52 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg04-sd.qualcomm.com with ESMTP; 15 Apr 2021 16:36:51 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 27A9921BA5; Thu, 15 Apr 2021 16:36:51 -0700 (PDT)
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
        "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v19 2/2] ufs: sysfs: Resume the proper scsi device
Date:   Thu, 15 Apr 2021 16:36:08 -0700
Message-Id: <3086cac6c9e949fd9a42a8bc0988c055ab3c2c77.1618529652.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618529652.git.asutoshd@codeaurora.org>
References: <cover.1618529652.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1618529652.git.asutoshd@codeaurora.org>
References: <cover.1618529652.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resumes the actual scsi device the unit descriptor of which
is being accessed instead of the hba alone.

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-sysfs.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index d7c3cff..4d9d4d8 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -245,9 +245,9 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	ufshcd_rpm_get_sync(hba);
 	res = ufshcd_wb_toggle(hba, wb_enable);
-	pm_runtime_put_sync(hba->dev);
+	ufshcd_rpm_put_sync(hba);
 out:
 	up(&hba->host_sem);
 	return res < 0 ? res : count;
@@ -297,10 +297,10 @@ static ssize_t ufs_sysfs_read_desc_param(struct ufs_hba *hba,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	ufshcd_rpm_get_sync(hba);
 	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
 				param_offset, desc_buf, param_size);
-	pm_runtime_put_sync(hba->dev);
+	ufshcd_rpm_put_sync(hba);
 	if (ret) {
 		ret = -EINVAL;
 		goto out;
@@ -678,7 +678,7 @@ static ssize_t _name##_show(struct device *dev,				\
 		up(&hba->host_sem);					\
 		return -ENOMEM;						\
 	}								\
-	pm_runtime_get_sync(hba->dev);					\
+	ufshcd_rpm_get_sync(hba);					\
 	ret = ufshcd_query_descriptor_retry(hba,			\
 		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
 		0, 0, desc_buf, &desc_len);				\
@@ -695,7 +695,7 @@ static ssize_t _name##_show(struct device *dev,				\
 		goto out;						\
 	ret = sysfs_emit(buf, "%s\n", desc_buf);			\
 out:									\
-	pm_runtime_put_sync(hba->dev);					\
+	ufshcd_rpm_put_sync(hba);					\
 	kfree(desc_buf);						\
 	up(&hba->host_sem);						\
 	return ret;							\
@@ -744,10 +744,10 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	pm_runtime_get_sync(hba->dev);					\
+	ufshcd_rpm_get_sync(hba);					\
 	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
 		QUERY_FLAG_IDN##_uname, index, &flag);			\
-	pm_runtime_put_sync(hba->dev);					\
+	ufshcd_rpm_put_sync(hba);					\
 	if (ret) {							\
 		ret = -EINVAL;						\
 		goto out;						\
@@ -813,10 +813,10 @@ static ssize_t _name##_show(struct device *dev,				\
 	}								\
 	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
 		index = ufshcd_wb_get_query_index(hba);			\
-	pm_runtime_get_sync(hba->dev);					\
+	ufshcd_rpm_get_sync(hba);					\
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
 		QUERY_ATTR_IDN##_uname, index, 0, &value);		\
-	pm_runtime_put_sync(hba->dev);					\
+	ufshcd_rpm_put_sync(hba);					\
 	if (ret) {							\
 		ret = -EINVAL;						\
 		goto out;						\
@@ -964,10 +964,10 @@ static ssize_t dyn_cap_needed_attribute_show(struct device *dev,
 		goto out;
 	}
 
-	pm_runtime_get_sync(hba->dev);
+	ufshcd_rpm_get_sync(hba);
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
-	pm_runtime_put_sync(hba->dev);
+	ufshcd_rpm_put_sync(hba);
 	if (ret) {
 		ret = -EINVAL;
 		goto out;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

