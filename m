Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0CC35FB41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 20:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353307AbhDNS7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 14:59:46 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:17217 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353232AbhDNS7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 14:59:44 -0400
IronPort-SDR: KIWzP4toUh/CiydRtKEl01nq++iAdko/FpaMgLqtLTQK1+cnDeuFO0uMXdXBXKKTRZuZUBjSUE
 otDxayb0MkazJL5F3UY6glEhy5rK5ps7o2E90rVAZ/uin9kDjsHmJM1r3n8zcfLv7WK1hDFgeo
 e4h9Il7z4UmKFCIK6eO9aQoLAqiYAF+Y04f6Ov2cjxSRpZ4tA1EYP+DEsU1yu+on1UHRRqq8c7
 EdfCAm9lGPS3kIN2USYMmA08tNJxZ+U3TJpJP6pv3ThNQtAUAZIoOm71KKSHk/6B+ICRTLbASx
 s1o=
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="29750618"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 14 Apr 2021 11:59:16 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 14 Apr 2021 11:59:15 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id C49E22115D; Wed, 14 Apr 2021 11:59:15 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        adrian.hunter@intel.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>, Yue Hu <huyue2@yulong.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v18 2/2] ufs: sysfs: Resume the proper scsi device
Date:   Wed, 14 Apr 2021 11:58:28 -0700
Message-Id: <4745814f5fa37d49e969c2ffb1b4df401dbc98e7.1618426513.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618426513.git.asutoshd@codeaurora.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1618426513.git.asutoshd@codeaurora.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resumes the actual scsi device the unit descriptor of which
is being accessed instead of the hba alone.

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

