Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D031772277
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389591AbfGWWfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38488 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389613AbfGWWfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id f5so11294618pgu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ISDhy1lFnV9frfiPyjqolFGkkeA7zQy7U6U1fLUKzLo=;
        b=Rp7bZn35T+JvwV7+QL8xoDSQlaAjqcHc/tZR4YkCtTIwA8n8wayhgPQVWb9sD5E7g6
         dszvbClvBisaSBUQbBAt66RjSHa1MMgvh8+ZS6vXbZgB5PLlJWRysGVUfYe+1eUg9trh
         efdqJqz8EnjZcxqBcIJEtHqUL9jZmoiAnTcxr7A17djpPzN0BOjSpPMBqUHBpxl8gSPc
         O0pG33xSiQmnq9va+q87ygPc/o0TxFUzWRXeid8TBaRMdQ+8YJQ4E+MQIyYJyFiPZwiJ
         FAMFffHFF/gZANt0bI8fECO6AD9wN5C4nvhCxASZuhvHdlmVjSh74tFkmiMUvoIdHSj+
         vrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ISDhy1lFnV9frfiPyjqolFGkkeA7zQy7U6U1fLUKzLo=;
        b=eKgCMWfXWrWsogn9O3JvvqWQsuvRf3rrP0PGRy6DSya/8ORVZBigAn0gF78LjsATNZ
         1d563xO57//GJjAR83HIdWPNOSnkkIgCzmJC/ZrLiN7y6jYAUxU1WkGg9a9bN26Rd2wo
         u/nBmEQP4WDp+g/SSCi0NDIQQQ3OMMzybZjzgAF+VSb2kEW+dBHP/uplWBRukvZXLj3S
         EytE8Sd+su/NOjriXpN3QuxRUDVmxzf9305lzNzLwAE2dT1zThLG5d7trpaNSJuAME2r
         TQp5osUpeCEcRrFZxrY4Y1OSpMuFV2o3q3A6EYVMmqdGgPUqRgEik6VW2y8sHwKhRRHg
         vt8g==
X-Gm-Message-State: APjAAAWiX4h+U4/qvV5XGevvcVUz8+xPbiCfox38gD3IJL3IJKsAemxe
        hcLpSIdkisdBwWl86IMC9lRtfA==
X-Google-Smtp-Source: APXvYqyk1yodnkhLdVAwBZxhmwgm/SRN+1VeCakDR+8+iCQae/FpVHlXgD9bw2X+AeRVJ7mKSJvRTw==
X-Received: by 2002:a63:1743:: with SMTP id 3mr338246pgx.435.1563921341327;
        Tue, 23 Jul 2019 15:35:41 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:41 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 5/5] soc: qcom: socinfo: Expose image information
Date:   Wed, 24 Jul 2019 04:05:15 +0530
Message-Id: <20190723223515.27839-6-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The socinfo driver provides information about version of the various
images loaded in the system. Expose this to user space for debugging
purpose.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
---
Changes since v5:
	- No code changes, fix diff.context setting for formatting
          patches. Version 5 was adding context at the bottom of
          the file with 'git am'.
Changes since v4:
	- Reduce number of duplicate image macros and functions
	- Introduce array for image info debugfs entries and use it
	  instead of open coding
Changes since v3:
        - Remove extra debugfs directory creation checks
Changes since v2:
        - None
Changes since v1:
        - None
---
 drivers/soc/qcom/socinfo.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 6a4795433d57..855353bed19e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -32,6 +32,39 @@
 #define SMEM_HW_SW_BUILD_ID            137
 
 #ifdef CONFIG_DEBUG_FS
+#define SMEM_IMAGE_VERSION_BLOCKS_COUNT        32
+#define SMEM_IMAGE_VERSION_SIZE                4096
+#define SMEM_IMAGE_VERSION_NAME_SIZE           75
+#define SMEM_IMAGE_VERSION_VARIANT_SIZE        20
+#define SMEM_IMAGE_VERSION_OEM_SIZE            32
+
+/*
+ * SMEM Image table indices
+ */
+#define SMEM_IMAGE_TABLE_BOOT_INDEX     0
+#define SMEM_IMAGE_TABLE_TZ_INDEX       1
+#define SMEM_IMAGE_TABLE_RPM_INDEX      3
+#define SMEM_IMAGE_TABLE_APPS_INDEX     10
+#define SMEM_IMAGE_TABLE_MPSS_INDEX     11
+#define SMEM_IMAGE_TABLE_ADSP_INDEX     12
+#define SMEM_IMAGE_TABLE_CNSS_INDEX     13
+#define SMEM_IMAGE_TABLE_VIDEO_INDEX    14
+#define SMEM_IMAGE_VERSION_TABLE       469
+
+/*
+ * SMEM Image table names
+ */
+static const char *const socinfo_image_names[] = {
+	[SMEM_IMAGE_TABLE_ADSP_INDEX] = "adsp",
+	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
+	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
+	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
+	[SMEM_IMAGE_TABLE_MPSS_INDEX] = "mpss",
+	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
+	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
+	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
+};
+
 static const char *const pmic_models[] = {
 	[0]  = "Unknown PMIC model",
 	[9]  = "PM8994",
@@ -103,6 +136,13 @@ struct socinfo_params {
 	u32 hw_plat;
 	u32 fmt;
 };
+
+struct smem_image_version {
+	char name[SMEM_IMAGE_VERSION_NAME_SIZE];
+	char variant[SMEM_IMAGE_VERSION_VARIANT_SIZE];
+	char pad;
+	char oem[SMEM_IMAGE_VERSION_OEM_SIZE];
+};
 #endif /* CONFIG_DEBUG_FS */
 
 struct qcom_socinfo {
@@ -230,10 +270,37 @@ QCOM_OPEN(build_id, qcom_show_build_id);
 QCOM_OPEN(pmic_model, qcom_show_pmic_model);
 QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
 
+#define DEFINE_IMAGE_OPS(type)					\
+static int show_image_##type(struct seq_file *seq, void *p)		  \
+{								  \
+	struct smem_image_version *image_version = seq->private;  \
+	seq_puts(seq, image_version->type);			  \
+	seq_puts(seq, "\n");					  \
+	return 0;						  \
+}								  \
+static int open_image_##type(struct inode *inode, struct file *file)	  \
+{									  \
+	return single_open(file, show_image_##type, inode->i_private); \
+}									  \
+									  \
+static const struct file_operations qcom_image_##type##_ops = {	  \
+	.open = open_image_##type,					  \
+	.read = seq_read,						  \
+	.llseek = seq_lseek,						  \
+	.release = single_release,					  \
+}
+
+DEFINE_IMAGE_OPS(name);
+DEFINE_IMAGE_OPS(variant);
+DEFINE_IMAGE_OPS(oem);
+
 static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 				 struct socinfo *info)
 {
+	struct smem_image_version *versions;
+	struct dentry *dentry;
 	size_t size;
+	int i;
 
 	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
 
@@ -302,6 +369,23 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		DEBUGFS_ADD(info, build_id);
 		break;
 	}
+
+	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
+				 &size);
+
+	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
+		if (!socinfo_image_names[i])
+			continue;
+
+		dentry = debugfs_create_dir(socinfo_image_names[i],
+					    qcom_socinfo->dbg_root);
+		debugfs_create_file("name", 0400, dentry, &versions[i],
+				    &qcom_image_name_ops);
+		debugfs_create_file("variant", 0400, dentry, &versions[i],
+				    &qcom_image_variant_ops);
+		debugfs_create_file("oem", 0400, dentry, &versions[i],
+				    &qcom_image_oem_ops);
+	}
 }
 
 static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo)
-- 
2.17.1

