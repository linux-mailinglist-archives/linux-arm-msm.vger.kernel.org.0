Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5232FB2FEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Sep 2019 14:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbfIOMfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Sep 2019 08:35:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47388 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbfIOMfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Sep 2019 08:35:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D4BDF611FD; Sun, 15 Sep 2019 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568550935;
        bh=fsVA2cuiJ0/+z4KWe7dv5Fc+4ikQQf1wTpfvsUMjVrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ge1J86MEW7ipH8YgcrMa4EYbko7a4pIeXhlcSwdOXfTvsdn5LZSxk2JNXPgXt0Hd8
         fLbRjnEewSbsZ0szYunzt14kuhd7R8MRpXuPIr8DRw4qKjUdYy0sqI74Z7Icr4U6Pz
         kZ6UM6lbf6nomFE0QCLIDGDH1BTlXcgFoGt0Sly8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E44506119E;
        Sun, 15 Sep 2019 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568550934;
        bh=fsVA2cuiJ0/+z4KWe7dv5Fc+4ikQQf1wTpfvsUMjVrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WAOhKuU1WU4rSfAVEpEulTrIE3H0E2m3GQYBNeGafHVENCr9NqRjVWwivIvVB68k+
         7zmKQRb96Q7erHJdAGlYrA/u0ndx4Q/YOAdolYQivCqaDWf0xjwjplHWuezJL2b2sr
         cQ5l6JL/MhUK5sfyPX5TbpsbWKsvaU1AnfRpcHdI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E44506119E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 2/3] firmware/qcom_scm: Add scm call to handle smmu errata
Date:   Sun, 15 Sep 2019 18:05:02 +0530
Message-Id: <6d450d8ef7ca836ecdf4979e584034823853d0eb.1568549745.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1568549745.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568549745.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Qcom's smmu-500 needs to toggle wait-for-safe sequence to
handle TLB invalidation sync's.
Few firmwares allow doing that through SCM interface.
Add API to toggle wait for safe from firmware through a
SCM call.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c |  5 +++++
 drivers/firmware/qcom_scm-64.c | 13 +++++++++++++
 drivers/firmware/qcom_scm.c    |  6 ++++++
 drivers/firmware/qcom_scm.h    |  5 +++++
 include/linux/qcom_scm.h       |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 215061c581e1..bee8729525ec 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -614,3 +614,8 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
 				     addr, val);
 }
+
+int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
+{
+	return -ENODEV;
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6697bb741b83..2f1b7d1660ff 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -553,3 +553,16 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
 			     &desc, &res);
 }
+
+int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL;
+	desc.args[1] = en;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
+				    QCOM_SCM_CONFIG_ERRATA1, &desc, &res);
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 4802ab170fe5..a729e05c21b8 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -345,6 +345,12 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
+int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+{
+	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
+}
+EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
+
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 {
 	return __qcom_scm_io_readl(__scm->dev, addr, val);
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 99506bd873c0..baee744dbcfe 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -91,10 +91,15 @@ extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
 				      u32 spare);
 #define QCOM_SCM_IOMMU_SECURE_PTBL_SIZE	3
 #define QCOM_SCM_IOMMU_SECURE_PTBL_INIT	4
+#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
+#define QCOM_SCM_CONFIG_ERRATA1		0x3
+#define QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL	0x2
 extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
+extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
+						bool enable);
 #define QCOM_MEM_PROT_ASSIGN_ID	0x16
 extern int  __qcom_scm_assign_mem(struct device *dev,
 				  phys_addr_t mem_region, size_t mem_sz,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 2d5eff506e13..ffd72b3b14ee 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -58,6 +58,7 @@ extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
 extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
@@ -97,6 +98,7 @@ qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
+static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en) { return -ENODEV; }
 static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
 static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

