Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF80872275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbfGWWff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33792 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389589AbfGWWfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so13896344pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a9df1aBp8aRLCGR2a9/ePqT7IGRC3SBDVB33J06YG3E=;
        b=mvD+jRhhI2hqAwqkMhcgItMuaZfI4koFazSdjTev8IR7/2NMFOofFgmP1HhpSM1iD4
         jp8d/9iXunM2UmR3hWUETUkBCI0bx2jfKRvlL6gt3CQmvu+n/Gs6NQHAvxZwPmfc1DII
         dM8ZYTQ2NSvj5B9Wf375+WrOd6BtU9fC4ctwhe3zZuKMNTHg7z825fVJtBGgKreKrH79
         qZQbohrlqFpFWLeCzpW5ct1Z1NmBqgDXI4OedBGIyiGGgdddXbaKiFKXbOJJCcBEdj4L
         hTa07EiOfuObbMDwvPIk7RXIpjdFqZspY9r17ZFRpJrPHt97hkJ0VkhIqwN0XoipVzIe
         vl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a9df1aBp8aRLCGR2a9/ePqT7IGRC3SBDVB33J06YG3E=;
        b=elr7Hu8Jcrf5+WXNg2oUdEaJXJrMr1YS/FC0/SCxug4Fq5G4Z7elFY/AQD/2OwTHRM
         /YI1s71qtarImLxwYmVsw+SOsD1jaFDIrXsxZmuImGbwrwQdmHlKtxSnIvqpSjzX+RWa
         IqFplFgOTjSqFdmkARr7vjze9T3KCY1e4oyTpwfle5+wNbuwn5Qg0VxEm323sRW+P5AN
         fTUGiXkvbnLMckpBPEBGOtcjHnDgK7g+MFYDyklXutMMjOdtc/am+FtOnYPdDQduhBTe
         bEMUSXRoialGLtjaXBpXcwlvPnI2fMXvgT0Yp0+w2gKBd9Zu1zfFnRxovDMZuYq6wKMy
         xBaA==
X-Gm-Message-State: APjAAAVMGirRiar1eCMYjjHLQPqhyOMJqt18Twl4v6P/R/K6i3TVbI2l
        vbGYC49qlbbwcg0yGeZDEnmC6Wsie78=
X-Google-Smtp-Source: APXvYqyL114K7eWF4i2epD59fFdy9Bai16Vh9NLPgVO1G6L+PL8oKl0zv3DaNS6OE9gUMDHgfBPOZw==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr84641946pjs.101.1563921333450;
        Tue, 23 Jul 2019 15:35:33 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:33 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Imran Khan <kimran@codeaurora.org>,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 3/5] soc: qcom: Add socinfo driver
Date:   Wed, 24 Jul 2019 04:05:13 +0530
Message-Id: <20190723223515.27839-4-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Imran Khan <kimran@codeaurora.org>

The Qualcomm socinfo driver exposes information about the SoC, its
version and its serial number to user space.

Signed-off-by: Imran Khan <kimran@codeaurora.org>
[Bjorn: Extract code to platform_driver, split patch in multiple]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[Vaishali: Simplify declarations, introduce qcom_socinfo struct, Fix
           memory leak, Remove extra code and Misc code refactoring]
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
---
Changes since v5:
	-No code changes, fix diff.context setting for formatting
         patches. Version 5 was adding context at the bottom of
         the file with 'git am'.
Changes since v4:
	- Return PTR_ERR in qcom_socinfo_probe instead of error value
	- Return PTR_ERR in smem probe to print proper error message
	  when we fail to register the socinfo device
	- Use dev_dbg instead of dev_err in qcom_smem_probe
	- Use offset_of for exposing the value of serial_number
	- Unregister the platform device in smem remove function
	- Drop error message in socinfo_machine
	- Misc: Add spaces between brackets and strings/numbers in
	        soc_of_id, item ids->item id, socinfo->SoCinfo,
		soc_of_id->soc_id
Changes since v3:
        - None
Changes since v2:
        - Fix typo in the work log under signed off by s
Changes since v1:
        - None
---
 drivers/soc/qcom/Kconfig   |   8 ++
 drivers/soc/qcom/Makefile  |   1 +
 drivers/soc/qcom/smem.c    |   9 ++
 drivers/soc/qcom/socinfo.c | 194 +++++++++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/soc/qcom/socinfo.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index a6d1bfb17279..661e47acc354 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -175,6 +175,14 @@ config QCOM_SMSM
 	  Say yes here to support the Qualcomm Shared Memory State Machine.
 	  The state machine is represented by bits in shared memory.
 
+config QCOM_SOCINFO
+	tristate "Qualcomm socinfo driver"
+	depends on QCOM_SMEM
+	select SOC_BUS
+	help
+	 Say yes here to support the Qualcomm socinfo driver, providing
+	 information about the SoC to user space.
+
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index eeb088beb15f..162788701a77 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
+obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index f27c00d82ae4..0caf67e2f037 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -268,6 +268,7 @@ struct qcom_smem {
 	struct smem_partition_header *partitions[SMEM_HOST_COUNT];
 	size_t cacheline[SMEM_HOST_COUNT];
 	u32 item_count;
+	struct platform_device *socinfo;
 
 	unsigned num_regions;
 	struct smem_region regions[];
@@ -963,11 +964,19 @@ static int qcom_smem_probe(struct platform_device *pdev)
 
 	__smem = smem;
 
+	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
+						      PLATFORM_DEVID_NONE, NULL,
+						      0);
+	if (IS_ERR(smem->socinfo))
+		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
+
 	return 0;
 }
 
 static int qcom_smem_remove(struct platform_device *pdev)
 {
+	platform_device_unregister(__smem->socinfo);
+
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
 
diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
new file mode 100644
index 000000000000..1b9eb44df7fe
--- /dev/null
+++ b/drivers/soc/qcom/socinfo.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2009-2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, Linaro Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+#include <linux/types.h>
+
+/*
+ * SoC version type with major number in the upper 16 bits and minor
+ * number in the lower 16 bits.
+ */
+#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
+#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
+
+#define SMEM_SOCINFO_BUILD_ID_LENGTH           32
+
+/*
+ * SMEM item id, used to acquire handles to respective
+ * SMEM region.
+ */
+#define SMEM_HW_SW_BUILD_ID            137
+
+/* Socinfo SMEM item structure */
+struct socinfo {
+	__le32 fmt;
+	__le32 id;
+	__le32 ver;
+	char build_id[SMEM_SOCINFO_BUILD_ID_LENGTH];
+	/* Version 2 */
+	__le32 raw_id;
+	__le32 raw_ver;
+	/* Version 3 */
+	__le32 hw_plat;
+	/* Version 4 */
+	__le32 plat_ver;
+	/* Version 5 */
+	__le32 accessory_chip;
+	/* Version 6 */
+	__le32 hw_plat_subtype;
+	/* Version 7 */
+	__le32 pmic_model;
+	__le32 pmic_die_rev;
+	/* Version 8 */
+	__le32 pmic_model_1;
+	__le32 pmic_die_rev_1;
+	__le32 pmic_model_2;
+	__le32 pmic_die_rev_2;
+	/* Version 9 */
+	__le32 foundry_id;
+	/* Version 10 */
+	__le32 serial_num;
+	/* Version 11 */
+	__le32 num_pmics;
+	__le32 pmic_array_offset;
+	/* Version 12 */
+	__le32 chip_family;
+	__le32 raw_device_family;
+	__le32 raw_device_num;
+};
+
+struct qcom_socinfo {
+	struct soc_device *soc_dev;
+	struct soc_device_attribute attr;
+};
+
+struct soc_id {
+	unsigned int id;
+	const char *name;
+};
+
+static const struct soc_id soc_id[] = {
+	{ 87, "MSM8960" },
+	{ 109, "APQ8064" },
+	{ 122, "MSM8660A" },
+	{ 123, "MSM8260A" },
+	{ 124, "APQ8060A" },
+	{ 126, "MSM8974" },
+	{ 130, "MPQ8064" },
+	{ 138, "MSM8960AB" },
+	{ 139, "APQ8060AB" },
+	{ 140, "MSM8260AB" },
+	{ 141, "MSM8660AB" },
+	{ 178, "APQ8084" },
+	{ 184, "APQ8074" },
+	{ 185, "MSM8274" },
+	{ 186, "MSM8674" },
+	{ 194, "MSM8974PRO" },
+	{ 206, "MSM8916" },
+	{ 208, "APQ8074-AA" },
+	{ 209, "APQ8074-AB" },
+	{ 210, "APQ8074PRO" },
+	{ 211, "MSM8274-AA" },
+	{ 212, "MSM8274-AB" },
+	{ 213, "MSM8274PRO" },
+	{ 214, "MSM8674-AA" },
+	{ 215, "MSM8674-AB" },
+	{ 216, "MSM8674PRO" },
+	{ 217, "MSM8974-AA" },
+	{ 218, "MSM8974-AB" },
+	{ 246, "MSM8996" },
+	{ 247, "APQ8016" },
+	{ 248, "MSM8216" },
+	{ 249, "MSM8116" },
+	{ 250, "MSM8616" },
+	{ 291, "APQ8096" },
+	{ 305, "MSM8996SG" },
+	{ 310, "MSM8996AU" },
+	{ 311, "APQ8096AU" },
+	{ 312, "APQ8096SG" },
+};
+
+static const char *socinfo_machine(struct device *dev, unsigned int id)
+{
+	int idx;
+
+	for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
+		if (soc_id[idx].id == id)
+			return soc_id[idx].name;
+	}
+
+	return NULL;
+}
+
+static int qcom_socinfo_probe(struct platform_device *pdev)
+{
+	struct qcom_socinfo *qs;
+	struct socinfo *info;
+	size_t item_size;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID,
+			      &item_size);
+	if (IS_ERR(info)) {
+		dev_err(&pdev->dev, "Couldn't find socinfo\n");
+		return PTR_ERR(info);
+	}
+
+	qs = devm_kzalloc(&pdev->dev, sizeof(*qs), GFP_KERNEL);
+	if (!qs)
+		return -ENOMEM;
+
+	qs->attr.family = "Snapdragon";
+	qs->attr.machine = socinfo_machine(&pdev->dev,
+					   le32_to_cpu(info->id));
+	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
+					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
+					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
+	if (offsetof(struct socinfo, serial_num) <= item_size)
+		qs->attr.serial_number = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+							"%u",
+							le32_to_cpu(info->serial_num));
+
+	qs->soc_dev = soc_device_register(&qs->attr);
+	if (IS_ERR(qs->soc_dev))
+		return PTR_ERR(qs->soc_dev);
+
+	/* Feed the soc specific unique data into entropy pool */
+	add_device_randomness(info, item_size);
+
+	platform_set_drvdata(pdev, qs->soc_dev);
+
+	return 0;
+}
+
+static int qcom_socinfo_remove(struct platform_device *pdev)
+{
+	struct qcom_socinfo *qs = platform_get_drvdata(pdev);
+
+	soc_device_unregister(qs->soc_dev);
+
+	return 0;
+}
+
+static struct platform_driver qcom_socinfo_driver = {
+	.probe = qcom_socinfo_probe,
+	.remove = qcom_socinfo_remove,
+	.driver  = {
+		.name = "qcom-socinfo",
+	},
+};
+
+module_platform_driver(qcom_socinfo_driver);
+
+MODULE_DESCRIPTION("Qualcomm SoCinfo driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-socinfo");
-- 
2.17.1

