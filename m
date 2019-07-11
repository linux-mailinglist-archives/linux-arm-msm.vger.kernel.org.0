Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7EA6614F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 23:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfGKVjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 17:39:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45451 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729197AbfGKVjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 17:39:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so3330874pfq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jXwph2UfDbz78cSxgU9L336K7eawYBM8cA2q3TIo9E8=;
        b=UOlpjPpcTtkV8+FVo477lavTksqLf81n2KqNXEiWlWEgHhEhMi7rsZWT2z4lYWdB84
         py7eEldL/QN981einS5g7QLZhJle/XYWsQa7e8HNMRiJKazfUPIeytFYk2OsbR9UaZip
         encC34pr4GyMRD3ScpWitIEVZOAOmDNmVlHsfVW5DykIm5+HDFczOvCzwhEc0FhxXLrZ
         Cz61KW3hVfxzzti9i8xkt6yiPE4Koal9R34hkuA9o7hhKJd2c2J7ftIadjHRCuo15BBP
         IB4Z2rdqutE6R5yt5apIP32xspa23qeOERoPP8C12tmg4nJy1t48yP8/bJFZ8zG4vaGC
         ggCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jXwph2UfDbz78cSxgU9L336K7eawYBM8cA2q3TIo9E8=;
        b=dBFCnjUSO4DoE/bwXRqxzFBfIhJa0gDqiGwNz008mY7bq65JfYw5SxJwQaWZJDQTrK
         xEvryMPOLiml0HsvjNvP6KXPF9ajRAzWo4SuJSfyFQIKkGl9MohXryjyK5fQ3ApYYSwK
         CwFo5alSm0VqLVYEFnWKhX8VOFXtpg4Wxm3Rq8VvbkZtTLAgXJHr1g8MeBkilumYCGgh
         5xfjGLDzWwUlN5cCl8k8WYVPaehNivLkVjB6bYZ08mDqv1Y8FClhtiifsbpUdUmWkCja
         4daoAXy23Phjf8nQSuzGHVdUwFfZZMkzvMEN/EfDv9rejrKrCV5ZVxt3VdsUL+Tvfrfo
         thAg==
X-Gm-Message-State: APjAAAXfkmsQSRC27EBKEPG4J+YTdvPR7klpOw8cqW8LY7a1yeYp83iS
        cNfu7hnvTa96CHsrLTp18LLM7Q==
X-Google-Smtp-Source: APXvYqyCCil+OUDeWlWo7UCv5ipg/QMk3aTZ39QD+viWPYLo/pjtvVbSg+Vb890ApNuLJT33wz/eFA==
X-Received: by 2002:a17:90a:d998:: with SMTP id d24mr7186590pjv.89.1562881174146;
        Thu, 11 Jul 2019 14:39:34 -0700 (PDT)
Received: from localhost.localdomain ([27.7.91.104])
        by smtp.gmail.com with ESMTPSA id w3sm5709795pgl.31.2019.07.11.14.39.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 14:39:33 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v5 4/5] soc: qcom: socinfo: Expose custom attributes
Date:   Fri, 12 Jul 2019 03:09:10 +0530
Message-Id: <20190711213911.23180-5-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
References: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm socinfo provides a number of additional attributes,
add these to the socinfo driver and expose them via debugfs
functionality.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
---
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
@@ -6,0 +7 @@
+#include <linux/debugfs.h>
@@ -22,0 +24 @@
+#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
@@ -31,0 +34,21 @@
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
@@ -69,0 +93,15 @@ struct socinfo {
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
@@ -72,0 +111,4 @@ struct qcom_socinfo {
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *dbg_root;
+	struct socinfo_params info;
+#endif /* CONFIG_DEBUG_FS */
@@ -132,0 +175,144 @@ static const char *socinfo_machine(struct device *dev, unsigned int id)
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
@@ -164,0 +351,2 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
+	socinfo_debugfs_init(qs, info);
+
@@ -178,0 +367,2 @@ static int qcom_socinfo_remove(struct platform_device *pdev)
+	socinfo_debugfs_exit(qs);
+
-- 
2.17.1

