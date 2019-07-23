Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0D617227A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389596AbfGWWfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36671 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389590AbfGWWfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id k8so21166748plt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Kzw48hnOfa4vVn93dbjkEVKUi4wwL3FJuUWFXLCPa8A=;
        b=NdUIvuirRhD58ngXrSIrWrkjefkELDeGHP+b3/enXWKITirUydYKichVsx7dQwRj7S
         1gNBk/uDGnT9SIxTy796d716WNcwK/Q5YPh9+s9VDJFDpzfHHT44uTnF4yHOYMSXncEu
         RafpbLy69mNPKc0BxV99z7ZyfwFwcBOHSOFavEtKG6nEcXntMNiiSmn5aLVmUqGOrb8k
         /AufNT3eGMUCEyv77c3YmV8z5M7YA23FeTgmnEkPz0yWP3IJtAOpDMhqG0fjeGyIWWpT
         Kp182rzy7KOrifvQNtuRy7I58OnTs2SxfDGAMBj0BN2IdPlwQeiRWghEc6kVdbMcQzEK
         sQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Kzw48hnOfa4vVn93dbjkEVKUi4wwL3FJuUWFXLCPa8A=;
        b=AyTdZJUZgeqWyp9n3hNlIjtNBPFEpvWTaenHEztyOVMU0ooVgnxMlpvDT3dD1Wl9a9
         +yXKjLAGIvqIpkpDleVGww8nzbdsY06YlebZnTnYT8DBVcsdBDgZGPp3sFeWz3aHj+9E
         XICmgiU+YGxaAi+GEfayO9JQ8r9qaj5Xf5uOEqf3isLCfC8QFu20oSzy2aPDdbpXhsK1
         TXHTmMUD+4oNYsXejOHnpzX4A/cKaZ2p87IugEyfcoQLVxK/XMLzVWT+BCBibu8EmjRs
         cCgJMFsjEiLupRcZCXnXRWdQ6hnZOjI5IlOZZv4FuzC4UulLGXw9EjrbE3lQDMzxHGAx
         frcw==
X-Gm-Message-State: APjAAAUygYSLmYtbe1GJFYurstzmDkYtYCZ0dw5xZIJUu9Y1zomTHyVL
        N2LyPT0SLKs37fQFVhvbN4qZlw==
X-Google-Smtp-Source: APXvYqyAJrR7LStYTlqmq2dEewOkDGtWUDedNn9pHPypBlw5DL5eAPCTcsPVbRNCOfkIcQP69GbZEw==
X-Received: by 2002:a17:902:549:: with SMTP id 67mr82351914plf.86.1563921337409;
        Tue, 23 Jul 2019 15:35:37 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:37 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 4/5] soc: qcom: socinfo: Expose custom attributes
Date:   Wed, 24 Jul 2019 04:05:14 +0530
Message-Id: <20190723223515.27839-5-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm socinfo provides a number of additional attributes,
add these to the socinfo driver and expose them via debugfs
functionality.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
---
Changes since v5:
	- No code changes, fix my diff.context setting for formatting
          patches. Version 5 was adding context at the bottom of
          the file with 'git am'.
Changes since v4:
	- Introduce socinfo_params and use create_debugfs_{u32,x32}
	  instead of driver specific macros
	- Remove some unnecessary separate functions
	  [qcom_show_{platform_subtype,accessory_chip}] and use
	  debugfs core functions to expose their values
	- Use switch to expose custom attributes based on the
	  firmware version
	- Misc: Drop unnecessory comments, pmic_model->pmic_models,
		don't pass socinfo pointer in qcom_socinfo
	- Note: I didn't introduce any new debugfs core functions
	        for printing string values because it wasn't
		possible to cover both cases of string arrays in this
		file - pmic_model and build_id by introducing a single
		function. Morever, I still needed QCOM_OPEN and DEBUGFS_ADD
		to cover the case of pmic_die_rev so introducing the
		'debugfs create string array function' wasn't completely
		eliminating extra macro code. So, I'm just using the
		above mentioned macros to print string array values for
		now. Feel free to on this matter. Thanks!
Changes since v3:
	- Fix compilation error in function signatures when
          debugfs is disabled
Changes since v2:
	- None
Changes since v1:
	- Remove unnecessary debugfs dir creation check
        - Align ifdefs to left
        - Fix function signatures for debugfs init/exit
---
 drivers/soc/qcom/socinfo.c | 190 +++++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1b9eb44df7fe..6a4795433d57 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2017-2019, Linaro Ltd.
  */
 
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -20,6 +21,7 @@
  */
 #define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
 #define SOCINFO_MINOR(ver) ((ver) & 0xffff)
+#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
 
 #define SMEM_SOCINFO_BUILD_ID_LENGTH           32
 
@@ -29,6 +31,27 @@
  */
 #define SMEM_HW_SW_BUILD_ID            137
 
+#ifdef CONFIG_DEBUG_FS
+static const char *const pmic_models[] = {
+	[0]  = "Unknown PMIC model",
+	[9]  = "PM8994",
+	[11] = "PM8916",
+	[13] = "PM8058",
+	[14] = "PM8028",
+	[15] = "PM8901",
+	[16] = "PM8027",
+	[17] = "ISL9519",
+	[18] = "PM8921",
+	[19] = "PM8018",
+	[20] = "PM8015",
+	[21] = "PM8014",
+	[22] = "PM8821",
+	[23] = "PM8038",
+	[24] = "PM8922",
+	[25] = "PM8917",
+};
+#endif /* CONFIG_DEBUG_FS */
+
 /* Socinfo SMEM item structure */
 struct socinfo {
 	__le32 fmt;
@@ -67,9 +90,28 @@ struct socinfo {
 	__le32 raw_device_num;
 };
 
+#ifdef CONFIG_DEBUG_FS
+struct socinfo_params {
+	u32 raw_device_family;
+	u32 hw_plat_subtype;
+	u32 accessory_chip;
+	u32 raw_device_num;
+	u32 chip_family;
+	u32 foundry_id;
+	u32 plat_ver;
+	u32 raw_ver;
+	u32 hw_plat;
+	u32 fmt;
+};
+#endif /* CONFIG_DEBUG_FS */
+
 struct qcom_socinfo {
 	struct soc_device *soc_dev;
 	struct soc_device_attribute attr;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *dbg_root;
+	struct socinfo_params info;
+#endif /* CONFIG_DEBUG_FS */
 };
 
 struct soc_id {
@@ -130,6 +172,150 @@ static const char *socinfo_machine(struct device *dev, unsigned int id)
 	return NULL;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+#define QCOM_OPEN(name, _func)						\
+static int qcom_open_##name(struct inode *inode, struct file *file)	\
+{									\
+	return single_open(file, _func, inode->i_private);		\
+}									\
+									\
+static const struct file_operations qcom_ ##name## _ops = {		\
+	.open = qcom_open_##name,					\
+	.read = seq_read,						\
+	.llseek = seq_lseek,						\
+	.release = single_release,					\
+}
+
+#define DEBUGFS_ADD(info, name)						\
+	debugfs_create_file(__stringify(name), 0400,			\
+			    qcom_socinfo->dbg_root,			\
+			    info, &qcom_ ##name## _ops)
+
+
+static int qcom_show_build_id(struct seq_file *seq, void *p)
+{
+	struct socinfo *socinfo = seq->private;
+
+	seq_printf(seq, "%s\n", socinfo->build_id);
+
+	return 0;
+}
+
+static int qcom_show_pmic_model(struct seq_file *seq, void *p)
+{
+	struct socinfo *socinfo = seq->private;
+	int model = SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_model));
+
+	if (model < 0)
+		return -EINVAL;
+
+	seq_printf(seq, "%s\n", pmic_models[model]);
+
+	return 0;
+}
+
+static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
+{
+	struct socinfo *socinfo = seq->private;
+
+	seq_printf(seq, "%u.%u\n",
+		   SOCINFO_MAJOR(le32_to_cpu(socinfo->pmic_die_rev)),
+		   SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_die_rev)));
+
+	return 0;
+}
+
+QCOM_OPEN(build_id, qcom_show_build_id);
+QCOM_OPEN(pmic_model, qcom_show_pmic_model);
+QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
+
+static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
+				 struct socinfo *info)
+{
+	size_t size;
+
+	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
+
+	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
+
+	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 12):
+		qcom_socinfo->info.chip_family =
+			__le32_to_cpu(info->chip_family);
+		qcom_socinfo->info.raw_device_family =
+			__le32_to_cpu(info->raw_device_family);
+		qcom_socinfo->info.raw_device_num =
+			__le32_to_cpu(info->raw_device_num);
+
+		debugfs_create_x32("chip_family", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.chip_family);
+		debugfs_create_x32("raw_device_family", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_device_family);
+		debugfs_create_x32("raw_device_number", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_device_num);
+	case SOCINFO_VERSION(0, 11):
+	case SOCINFO_VERSION(0, 10):
+	case SOCINFO_VERSION(0, 9):
+		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
+
+		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.foundry_id);
+	case SOCINFO_VERSION(0, 8):
+	case SOCINFO_VERSION(0, 7):
+		DEBUGFS_ADD(info, pmic_model);
+		DEBUGFS_ADD(info, pmic_die_rev);
+	case SOCINFO_VERSION(0, 6):
+		qcom_socinfo->info.hw_plat_subtype =
+			__le32_to_cpu(info->hw_plat_subtype);
+
+		debugfs_create_u32("hardware_platform_subtype", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.hw_plat_subtype);
+	case SOCINFO_VERSION(0, 5):
+		qcom_socinfo->info.accessory_chip =
+			__le32_to_cpu(info->accessory_chip);
+
+		debugfs_create_u32("accessory_chip", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.accessory_chip);
+	case SOCINFO_VERSION(0, 4):
+		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
+
+		debugfs_create_u32("platform_version", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.plat_ver);
+	case SOCINFO_VERSION(0, 3):
+		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
+
+		debugfs_create_u32("hardware_platform", 0400,
+				   qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.hw_plat);
+	case SOCINFO_VERSION(0, 2):
+		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
+
+		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_ver);
+	case SOCINFO_VERSION(0, 1):
+		DEBUGFS_ADD(info, build_id);
+		break;
+	}
+}
+
+static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo)
+{
+	debugfs_remove_recursive(qcom_socinfo->dbg_root);
+}
+#else
+static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
+				 struct socinfo *info)
+{
+}
+static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo) {  }
+#endif /* CONFIG_DEBUG_FS */
+
 static int qcom_socinfo_probe(struct platform_device *pdev)
 {
 	struct qcom_socinfo *qs;
@@ -162,6 +348,8 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	if (IS_ERR(qs->soc_dev))
 		return PTR_ERR(qs->soc_dev);
 
+	socinfo_debugfs_init(qs, info);
+
 	/* Feed the soc specific unique data into entropy pool */
 	add_device_randomness(info, item_size);
 
@@ -176,6 +364,8 @@ static int qcom_socinfo_remove(struct platform_device *pdev)
 
 	soc_device_unregister(qs->soc_dev);
 
+	socinfo_debugfs_exit(qs);
+
 	return 0;
 }
 
-- 
2.17.1

