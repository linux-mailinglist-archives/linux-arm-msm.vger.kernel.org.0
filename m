Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC80C3996
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389372AbfJAP4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54404 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfJAP4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id p7so3977438wmp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M85HxRMpAzQjkmFhMcNqj/4jxGHTjtLdbpCzAjHUVKE=;
        b=Mn3TzvyfjdPidTViINAeEWwlZiIMumM1exvdZNYzmwrHX0p3GmyZRMM8V9flY85cFM
         TGgKfMYcMMCk/Z6BbYrfMeX9hn0F57JVuhVCDGIxiYNOflcKwRrHE83ox5RkR9HElHyf
         Q1a7jpz570MTWRKNhXqIWuThAa0xbWiyzEifXEX3YP1NWsSSFsCDDqkreCALRg0TGypv
         vMTof0V0m0ut/H8pAPT5XgoqSxyaQzfgpFx+zOdoUvnq7uo2loK9gclxKpKmWdYKKZWO
         X39hD6UmhHPEg7smpqrJE6xnC7X0lOTQm/jxED4ZyhQOn/mXwNVSaOvrf0AcMP4JYecf
         gBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M85HxRMpAzQjkmFhMcNqj/4jxGHTjtLdbpCzAjHUVKE=;
        b=s2CiYh0gye0Bn28ytQCU4HQhNtynNFE9QvnN1km5ylCNdOSNgL6vAuWb+kGqk4v0FF
         0RaQcMC3/HOXc2zJSU0gJcVEc3YoTDYgoqKeuroODjnO7AP+St1IrUfLDeh4lY4yuKQN
         oH5iOvkaL9chTiVcasntfbKSY42sfxqN2veQ1sxZNEOBzkkQYCHJYLNmQVgnHxwydJUH
         Il7+SwvlZUetqGJWlytFgrgfiY4qF5o4VkaKic3N2mkJkp4nVObaKynhoMxi3cAE8+H/
         vN7/3xfVVG/s4pp1nva58R9oVCvZYN4eB0MgAYDTWjA3yOvaPM4A6zHGhWg4jQWy5EZy
         6Inw==
X-Gm-Message-State: APjAAAXnGfg0aYzRgz4kGHHwelNvIszy/dIbUxV/UsNRRi1geR11+H33
        /hVzMS6LeWIpXCXVBA5Ckjq+Q6T2u0lTFA==
X-Google-Smtp-Source: APXvYqwgHcum1wu7NMQryt4s3kdsWiHCV3vJ+/aDv8wZmVHDgpg2yBt409KP4EdnHJifTkjyoJpwpw==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr4519445wma.111.1569945408656;
        Tue, 01 Oct 2019 08:56:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:47 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 1/7] firmware: qcom: scm: Add function to set IOMMU pagetable addressing
Date:   Tue,  1 Oct 2019 17:56:35 +0200
Message-Id: <20191001155641.37117-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
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
 drivers/firmware/qcom_scm-32.c  |  6 ++++++
 drivers/firmware/qcom_scm-64.c  | 15 +++++++++++++++
 drivers/firmware/qcom_scm.c     |  7 +++++++
 drivers/firmware/qcom_scm.h     |  4 ++++
 drivers/firmware/qcom_scm.h.rej | 13 +++++++++++++
 include/linux/qcom_scm.h        |  2 ++
 include/linux/qcom_scm.h.rej    | 19 +++++++++++++++++++
 7 files changed, 66 insertions(+)
 create mode 100644 drivers/firmware/qcom_scm.h.rej
 create mode 100644 include/linux/qcom_scm.h.rej

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
diff --git a/drivers/firmware/qcom_scm.h.rej b/drivers/firmware/qcom_scm.h.rej
new file mode 100644
index 000000000000..05bb1a91dca5
--- /dev/null
+++ b/drivers/firmware/qcom_scm.h.rej
@@ -0,0 +1,13 @@
+--- drivers/firmware/qcom_scm.h
++++ drivers/firmware/qcom_scm.h
+@@ -98,6 +98,10 @@ extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
+ 					     u32 size, u32 spare);
+ extern int __qcom_scm_iommu_set_cp_pool_size(struct device *dev, u32 spare,
+ 					     u32 size);
++#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
++#define QCOM_SCM_IOMMU_PT_FORMAT	1
++extern int __qcom_scm_iommu_set_pt_format(struct device *dev, u32 sec_id,
++					  u32 ctx_num, u32 pt_fmt);
+ #define QCOM_MEM_PROT_ASSIGN_ID	0x16
+ extern int  __qcom_scm_assign_mem(struct device *dev,
+ 				  phys_addr_t mem_region, size_t mem_sz,
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
diff --git a/include/linux/qcom_scm.h.rej b/include/linux/qcom_scm.h.rej
new file mode 100644
index 000000000000..138b48e29999
--- /dev/null
+++ b/include/linux/qcom_scm.h.rej
@@ -0,0 +1,19 @@
+--- include/linux/qcom_scm.h
++++ include/linux/qcom_scm.h
+@@ -59,6 +59,7 @@ extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
+ extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
+ extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+ extern int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);
++extern int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt);
+ extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
+ extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
+ #else
+@@ -99,6 +100,8 @@ static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -E
+ static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
+ static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
+ static inline int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size) { return -ENODEV; }
++static inline int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num,
++					       u32 pt_fmt) { return -ENODEV; }
+ static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
+ static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
+ #endif
-- 
2.21.0

