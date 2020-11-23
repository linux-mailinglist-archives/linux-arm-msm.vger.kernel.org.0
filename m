Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E7A2BFF61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 06:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgKWFVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 00:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgKWFVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 00:21:23 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115ACC061A4C
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 21:21:23 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id l206so18361512oif.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 21:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SQZtSOK4xn1QIKzmuoIQkczUfVpDBW6ddlR5KEBnYhU=;
        b=phsZsA4hbSvtpRgOkHsUPf0WqPPOyqetoYL4TRNsXZNGCjYBgWJypZRpNjnpT06K9A
         jwvMAdMw8nLaggK98kGq4soy9fuRXqYovX5+Ql+Sp6Y3cpLeR1AvSlLadMF10sFR2/o4
         T+/u9UjEtDhl6IDQC1ZvUdK6+/fQQ8G5BIekKIFvr6htW+WZi3qxLW8Tqf6bHin5mSIF
         EkX5U3XtiZDPmz4xgp3T/VDyy8gK7ss5rROiIwDNtgh1DnyW5f/jzNQ4m3UvAStHIo7I
         OoYkWY8OFa5LqGuOfqZdcffr1fwbaS1yTxSkcWhwhxAusgYVxveuxtkCsSSjqFDDnIx/
         AUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SQZtSOK4xn1QIKzmuoIQkczUfVpDBW6ddlR5KEBnYhU=;
        b=JjMrDKXApCm8U4ue5ZB8wfpJJw3Y2gSoH/oz92eM1LdGXFTl5Q1nA87xjVA5MXM4RU
         8g1hqazHl2nLT+G2+0U5akvC/2pRzg1a3eMfyL8raHlv5yCZdbEF5AwQaaFBbQEllOYz
         HB0jjXrXZH3BaYn6WZW8GO1R8CaB3GW8RNQhJwKi/VyspcZ21M5Tv6ZfoBc+39IQf091
         y6O3TQAcYoD/Qf181BaKJEkb07+yAUDqRnQ6Vvdiqt2ZBLkFVkwt20SR9IqrFPcGN/to
         Og6Se8Ug7oLt65U4AO3yhc5ti7XFvKrzW6czXmnsPjWfNkge8cChiIo6jHAH5oSOjxTr
         xJyw==
X-Gm-Message-State: AOAM5327l1U0sAHtqCGe+Yz1+Wlgxst5aihaIDVAQEG22LwKAyHdLxm7
        woIlM+YkSNqxQCh0T3TA9sxnxg==
X-Google-Smtp-Source: ABdhPJw3wzvKPFR5o0MDnXCt6Ug8RUC0GBGpmPYlGo7U0JZ1SvEF0S94dD/vhodt7WEfY/Pm/gnQ/w==
X-Received: by 2002:aca:919:: with SMTP id 25mr14232888oij.95.1606108881243;
        Sun, 22 Nov 2020 21:21:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z42sm6625778ooi.1.2020.11.22.21.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 21:21:20 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, elder@linaro.org
Cc:     linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH] soc: qcom: Introduce debugfs interface to smem
Date:   Sun, 22 Nov 2020 23:21:19 -0600
Message-Id: <20201123052119.157551-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Every now and then it's convenient to be able to inspect the content of
SMEM items. Rather than carrying some hack locally let's upstream a
driver that when inserted exposes a debugfs interface for dumping
available items.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/Kconfig        |   7 +++
 drivers/soc/qcom/Makefile       |   1 +
 drivers/soc/qcom/smem_debugfs.c | 102 ++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/soc/qcom/smem_debugfs.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 3dc3e3d61ea3..7e1dd6b3f33a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -128,6 +128,13 @@ config QCOM_SMEM
 	  The driver provides an interface to items in a heap shared among all
 	  processors in a Qualcomm platform.
 
+config QCOM_SMEM_DEBUGFS
+	tristate "Qualcomm Shared Memory Manager (SMEM) DebugFS interface"
+	depends on QCOM_SMEM
+	depends on DEBUG_FS
+	help
+	  Provides a debugfs interface for inspecting SMEM.
+
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 93392d9dc7f7..632eefc5a897 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,6 +15,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
 qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
 obj-$(CONFIG_QCOM_SMEM) +=	smem.o
+obj-$(CONFIG_QCOM_SMEM_DEBUGFS) += smem_debugfs.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
diff --git a/drivers/soc/qcom/smem_debugfs.c b/drivers/soc/qcom/smem_debugfs.c
new file mode 100644
index 000000000000..11ef29a0cada
--- /dev/null
+++ b/drivers/soc/qcom/smem_debugfs.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/smem.h>
+
+struct smem_debugfs {
+	struct dentry *root;
+};
+
+static int smem_debugfs_item_show(struct seq_file *seq, void *p)
+{
+	unsigned long data = (unsigned long)seq->private;
+	unsigned long item = data & 0xffff;
+	unsigned long host = data >> 16;
+	size_t len;
+	void *ptr;
+
+	ptr = qcom_smem_get(host, item, &len);
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+
+	seq_hex_dump(seq, "", DUMP_PREFIX_OFFSET, 16, 1, ptr, len, true);
+
+	return 0;
+}
+
+static int smem_debugfs_item_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, smem_debugfs_item_show, inode->i_private);
+}
+
+static const struct file_operations smem_debugfs_item_ops = {
+	.open = smem_debugfs_item_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int smem_debugfs_rescan(struct seq_file *seq, void *p)
+{
+	struct dentry *root = seq->private;
+	unsigned long item;
+	unsigned long host;
+	unsigned long data;
+	char name[10];
+	char *ptr;
+
+	for (host = 0; host < 10; host++) {
+		for (item = 0; item < 512; item++) {
+			ptr = qcom_smem_get(host, item, NULL);
+			if (IS_ERR(ptr))
+				continue;
+
+			sprintf(name, "%ld-%ld", host, item);
+
+			data = host << 16 | item;
+			debugfs_create_file(name, 0400, root,
+					    (void *)data, &smem_debugfs_item_ops);
+		}
+	}
+
+	return 0;
+}
+
+static int smem_debugfs_rescan_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, smem_debugfs_rescan, inode->i_private);
+}
+
+static const struct file_operations smem_debugfs_rescan_ops = {
+	.open = smem_debugfs_rescan_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static struct dentry *smem_debugfs_root;
+
+static int __init qcom_smem_debugfs_init(void)
+{
+	smem_debugfs_root = debugfs_create_dir("qcom_smem", NULL);
+	debugfs_create_file("rescan", 0400, smem_debugfs_root,
+			    smem_debugfs_root, &smem_debugfs_rescan_ops);
+
+	return 0;
+}
+
+static void __exit qcom_smem_debugfs_exit(void)
+{
+	debugfs_remove_recursive(smem_debugfs_root);
+}
+
+module_init(qcom_smem_debugfs_init);
+module_exit(qcom_smem_debugfs_exit);
+
+MODULE_DESCRIPTION("Qualcomm SMEM debugfs driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2

