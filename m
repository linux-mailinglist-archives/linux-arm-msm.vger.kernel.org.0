Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E882A471E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 14:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgKCN7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 08:59:36 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:27956 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729471AbgKCN6X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 08:58:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604411901; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ObqWOTpheK3mm0bfxZD76ibrbEOYwcqvFAOyd+uof3c=; b=JRUwiN1430SS0kvAJUwXpxoq/KkZ0mEZ2m0EFR6brVRVcsawbVrnh0YFe1lLhKLfNCFVkXNg
 0YbAtr4jstDKTk0Cze/GOpO4gV2TL0JhOZUGz5jr7TN/Q8S/oRZdbKm1U8KQIogYv81hlYgp
 ttaU5OqOQHxUpc02MbWZ9F4ZWzI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa153ecb64b1c5b78f96c5e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 12:58:19
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 722ACC3854B; Tue,  3 Nov 2020 09:19:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A367FC3853E;
        Tue,  3 Nov 2020 09:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A367FC3853E
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: [PATCH v7 3/4] remoteproc: qcom: Add capability to collect minidumps
Date:   Tue,  3 Nov 2020 01:19:19 -0800
Message-Id: <1604395160-12443-4-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for collecting minidump in the event of remoteproc
crash. Parse the minidump table based on remoteproc's unique minidump-id,
read all memory regions from the remoteproc's minidump table entry and
expose the memory to userspace. The remoteproc platform driver can choose
to collect a full/mini dump by specifying the coredump op.

Co-developed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Co-developed-by: Gurbir Arora <gurbaror@codeaurora.org>
Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_minidump.h |  64 +++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c | 104 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 166 insertions(+), 2 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

diff --git a/drivers/remoteproc/qcom_minidump.h b/drivers/remoteproc/qcom_minidump.h
new file mode 100644
index 0000000..5857d06
--- /dev/null
+++ b/drivers/remoteproc/qcom_minidump.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H
+#define __QCOM_MINIDUMP_H
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MD_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MD_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MD_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem_toc: Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @ss_region_count : Number of regions added in this subsystem toc
+ * @md_ss_smem_regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem_toc {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	ss_region_count;
+	__le64	md_ss_smem_regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc: Global Table of Content
+ * @md_toc_init : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @md_enable_status : Minidump enable status
+ * @md_ss_toc : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem_toc	md_ss_toc[MAX_NUM_OF_SS];
+};
+
+#endif
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3837f23..349f725 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -28,11 +28,13 @@
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
+#include "qcom_minidump.h"
 
 struct adsp_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	int pas_id;
+	unsigned int minidump_id;
 	bool has_aggre2_clk;
 	bool auto_boot;
 
@@ -63,6 +65,7 @@ struct qcom_adsp {
 	int proxy_pd_count;
 
 	int pas_id;
+	unsigned int minidump_id;
 	int crash_reason_smem;
 	bool has_aggre2_clk;
 	const char *info_name;
@@ -116,6 +119,88 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
 	}
 }
 
+static void adsp_minidump_cleanup(struct rproc *rproc)
+{
+	struct rproc_dump_segment *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
+		list_del(&entry->node);
+		kfree(entry->priv);
+		kfree(entry);
+	}
+}
+
+static void adsp_add_minidump_segments(struct rproc *rproc,
+				       struct minidump_subsystem_toc *minidump_ss)
+{
+	struct minidump_region __iomem *ptr;
+	struct minidump_region region;
+	int seg_cnt, i;
+	dma_addr_t da;
+	size_t size;
+	char *name;
+
+	if (!list_empty(&rproc->dump_segments)) {
+		dev_err(&rproc->dev, "dump segment list already populated\n");
+		return;
+	}
+
+	seg_cnt = le32_to_cpu(minidump_ss->ss_region_count);
+	ptr = ioremap((unsigned long)le64_to_cpu(minidump_ss->md_ss_smem_regions_baseptr),
+		      seg_cnt * sizeof(struct minidump_region));
+
+	if (!ptr)
+		return;
+
+	for (i = 0; i < seg_cnt; i++) {
+		memcpy_fromio(&region, ptr + i, sizeof(region));
+		if (region.valid == MD_REGION_VALID) {
+			name = kmalloc(MAX_REGION_NAME_LENGTH, GFP_KERNEL);
+			strlcpy(name, region.name, MAX_REGION_NAME_LENGTH);
+			da = le64_to_cpu(region.address);
+			size = le32_to_cpu(region.size);
+			rproc_coredump_add_custom_segment(rproc, da, size, NULL, name);
+		}
+	}
+
+	iounmap(ptr);
+}
+
+static void adsp_dump(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+	struct minidump_subsystem_toc *minidump_ss;
+	struct minidump_global_toc *minidump_toc;
+
+	/* Get Global minidump ToC*/
+	minidump_toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
+
+	/* check if global table pointer exists and init is set */
+	if (IS_ERR(minidump_toc) || !minidump_toc->status) {
+		dev_err(&rproc->dev, "SMEM is not initialized.\n");
+		return;
+	}
+
+	/* Get subsystem table of contents using the minidump id */
+	minidump_ss = &minidump_toc->md_ss_toc[adsp->minidump_id];
+
+	/**
+	 * Collect minidump if SS ToC is valid and segment table
+	 * is initialized in memory and encryption status is set.
+	 */
+	if (minidump_ss->md_ss_smem_regions_baseptr == 0 ||
+	    le32_to_cpu(minidump_ss->status) != 1 ||
+	    le32_to_cpu(minidump_ss->enabled) != MD_SS_ENABLED ||
+	    le32_to_cpu(minidump_ss->encryption_status) != MD_SS_ENCR_DONE) {
+		dev_err(&rproc->dev, "Minidump not ready!! Aborting\n");
+		return;
+	}
+
+	adsp_add_minidump_segments(rproc, minidump_ss);
+	rproc_minidump(rproc);
+	adsp_minidump_cleanup(rproc);
+}
+
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -258,6 +343,15 @@ static const struct rproc_ops adsp_ops = {
 	.panic = adsp_panic,
 };
 
+static const struct rproc_ops adsp_minidump_ops = {
+	.start = adsp_start,
+	.stop = adsp_stop,
+	.da_to_va = adsp_da_to_va,
+	.load = adsp_load,
+	.panic = adsp_panic,
+	.coredump = adsp_dump,
+};
+
 static int adsp_init_clock(struct qcom_adsp *adsp)
 {
 	int ret;
@@ -398,8 +492,13 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret < 0 && ret != -EINVAL)
 		return ret;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
-			    fw_name, sizeof(*adsp));
+	if (desc->minidump_id)
+		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_minidump_ops, fw_name,
+				    sizeof(*adsp));
+	else
+		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops, fw_name,
+				    sizeof(*adsp));
+
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
@@ -411,6 +510,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
+	adsp->minidump_id = desc->minidump_id;
 	adsp->pas_id = desc->pas_id;
 	adsp->has_aggre2_clk = desc->has_aggre2_clk;
 	adsp->info_name = desc->sysmon_name;
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

