Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9AA7C435E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfJAWCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46990 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbfJAWCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so17240058wrv.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=giiqea5G5OGc1LVX0Omn9vPOumyP7ZJCgt4lHY0EIgA=;
        b=PjDVaKYuBiyaxr8fG48cs3ZSrHBWTPkpQ+3O28fjd9cnkVFdq7MnVFxPgwIXFAEkZp
         /wnKJyMGdg6qEaCtI66NjJZerzo5LAirg4pabbT6PE4xZT1QeOxJNsALTM9eHnqgi+S8
         F0f4khfihPOMLV7G7C5ZjZY4esCqMWE2IY5/GX2MUTfpPrg4QrB08D0mX5pMYV3Q9bcd
         Vd0Go294j/K/r04FArC47f8fHZGAjmz+qCzTT2uHNdqLY7JRF+KZ7T/oJGK0PSkki9AU
         tTQmOKw2hr7InHc5B2IoiE7QDkX2OFKFJ2q4HtgjkrgslbCFqmkVVoAi86DwNSox0tcw
         60NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=giiqea5G5OGc1LVX0Omn9vPOumyP7ZJCgt4lHY0EIgA=;
        b=jQgtVeXup3WYBoBwE1XyLzLdLv8Cqf1Ob3TphRMfuGj3IgoTOlyrcbJ+inc1WZGuID
         eiue97sIJK83TGBuL8bSeWp74DGOmOJ8MdJeqNlNBwlAzaNSOv2lztTI/Wjytakb/HHu
         xBD/0A91WIGsA1fLXkIKwleD6rmECE/6M4t7nQ92MoYSGDvbWNjBhkUKW5rvgExmlb5I
         IR2GTSRz8lh5JTRmiGzQwQLFlMsJvzPz7m5Yc30Ou95d8OPv7JuEdgqVurDNofqS/l2O
         o25Lm9YJvRT9BKD6/UrvDuOOzMqWAGxFKuHCfrRsn7jpOElQHFyl4b6mdU5M5uJ08pHM
         dj/g==
X-Gm-Message-State: APjAAAXf/diKco6PXsrN+NI7dXdA31fS5/ehQA40d8jQMsinbOOk7u6U
        o1QrFfzVKpAcySz4YKtnRj4THFn3Sb9gtg==
X-Google-Smtp-Source: APXvYqwFXp3a/WAERwgUNdNv+brGbfUo+JzVSViX2GvutJqyehoP670EEOwGVSTO/UpvNXrAmeTLRg==
X-Received: by 2002:adf:c58b:: with SMTP id m11mr18753483wrg.252.1569967329096;
        Tue, 01 Oct 2019 15:02:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:08 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 1/7] firmware: qcom: scm: Add function to set IOMMU pagetable addressing
Date:   Wed,  2 Oct 2019 00:01:59 +0200
Message-Id: <20191001220205.6423-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
References: <20191001220205.6423-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add a function to change the IOMMU pagetable addressing to
AArch32 LPAE or AArch64. If doing that, then this must be
done for each IOMMU context (not necessarily at the same time).
---
 drivers/firmware/qcom_scm-32.c |  6 ++++++
 drivers/firmware/qcom_scm-64.c | 15 +++++++++++++++
 drivers/firmware/qcom_scm.c    |  7 +++++++
 drivers/firmware/qcom_scm.h    |  4 ++++
 include/linux/qcom_scm.h       |  2 ++
 5 files changed, 34 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 215061c581e1..f5437e5c8c4e 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -597,6 +597,12 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	return -ENODEV;
 }
 
+int __qcom_scm_iommu_set_pt_format(struct device *dev, u32 sec_id, u32 ctx_num,
+				   u32 pt_fmt)
+{
+	return -ENODEV;
+}
+
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 			unsigned int *val)
 {
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..aab5446ea9f2 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -459,6 +459,21 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	return ret;
 }
 
+int __qcom_scm_iommu_set_pt_format(struct device *dev, u32 sec_id, u32 ctx_num,
+				   u32 pt_fmt)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = sec_id;
+	desc.args[1] = ctx_num;
+	desc.args[2] = pt_fmt; /* 0: LPAE AArch32 - 1: AArch64 */
+	desc.arginfo = QCOM_SCM_ARGS(3);
+
+	return qcom_scm_call(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
+			     QCOM_SCM_IOMMU_PT_FORMAT, &desc, &res);
+}
+
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
 	struct qcom_scm_desc desc = {0};
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 4802ab170fe5..41af7dc0b34d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -345,6 +345,13 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
+int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt)
+{
+	return __qcom_scm_iommu_set_pt_format(__scm->dev, sec_id,
+					      ctx_num, pt_fmt);
+}
+EXPORT_SYMBOL(qcom_scm_iommu_set_pt_format);
+
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 {
 	return __qcom_scm_io_readl(__scm->dev, addr, val);
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 99506bd873c0..f04a3903dc6c 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -95,6 +95,10 @@ extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
+#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
+#define QCOM_SCM_IOMMU_PT_FORMAT	1
+extern int __qcom_scm_iommu_set_pt_format(struct device *dev, u32 sec_id,
+					  u32 ctx_num, u32 pt_fmt);
 #define QCOM_MEM_PROT_ASSIGN_ID	0x16
 extern int  __qcom_scm_assign_mem(struct device *dev,
 				  phys_addr_t mem_region, size_t mem_sz,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 2d5eff506e13..49937d62e462 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -58,6 +58,7 @@ extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt);
 extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
@@ -97,6 +98,7 @@ qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
+static inline int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt) { return -ENODEV; }
 static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
 static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
 #endif
-- 
2.21.0

