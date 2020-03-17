Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4F8188DDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 20:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCQTUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 15:20:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:61554 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbgCQTUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 15:20:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584472824; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=04UTOZ7ySzY56t49Lejqqg+/qSfvKFvxULvm3fkhHB8=; b=e0Meo10FieG9k4wdBfw2+VMCyNKVwm51eug2gzQzkej5PZgwS9BXXDc7Egd2+2nml7X83Ltl
 kzibSF86/ZrUbMsfGnxkMnynlq0eTL83XbrwySSII0eRUPxWSyQlnvAQ0xd8EcG1YIAFFQwp
 D50MUG1nZ5KV3mmz7nYZtrG/u/4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7122f4.7f0a0b246458-smtp-out-n04;
 Tue, 17 Mar 2020 19:20:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1557CC432C2; Tue, 17 Mar 2020 19:20:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE6D3C433CB;
        Tue, 17 Mar 2020 19:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE6D3C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: map/unmap mpss region before/after use
Date:   Wed, 18 Mar 2020 00:49:18 +0530
Message-Id: <20200317191918.4123-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The application processor accessing the mpss region when the Q6 modem
is running will lead to an XPU violation. Fix this by un-mapping the
mpss region post copy during processor out of reset sequence and
coredumps.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 53 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ce49c3236ff7c..b1ad4de179019 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -196,7 +196,6 @@ struct q6v5 {
 
 	phys_addr_t mpss_phys;
 	phys_addr_t mpss_reloc;
-	void *mpss_region;
 	size_t mpss_size;
 
 	struct qcom_rproc_glink glink_subdev;
@@ -1061,6 +1060,18 @@ static int q6v5_reload_mba(struct rproc *rproc)
 	return ret;
 }
 
+static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
+{
+	struct q6v5 *qproc = rproc->priv;
+	int offset;
+
+	offset = da - qproc->mpss_reloc;
+	if (offset < 0 || offset + len > qproc->mpss_size)
+		return NULL;
+
+	return devm_ioremap_wc(qproc->dev, qproc->mpss_phys + offset, len);
+}
+
 static int q6v5_mpss_load(struct q6v5 *qproc)
 {
 	const struct elf32_phdr *phdrs;
@@ -1156,7 +1167,11 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
-		ptr = qproc->mpss_region + offset;
+		ptr = q6v5_da_to_va(qproc->rproc, phdr->p_paddr, phdr->p_memsz);
+		if (!ptr) {
+			dev_err(qproc->dev, "failed to map memory\n");
+			goto release_firmware;
+		}
 
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
 			/* Firmware is large enough to be non-split */
@@ -1165,6 +1180,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
 				ret = -EINVAL;
+				devm_iounmap(qproc->dev, ptr);
 				goto release_firmware;
 			}
 
@@ -1175,6 +1191,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
+				devm_iounmap(qproc->dev, ptr);
 				goto release_firmware;
 			}
 
@@ -1187,6 +1204,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			memset(ptr + phdr->p_filesz, 0,
 			       phdr->p_memsz - phdr->p_filesz);
 		}
+		devm_iounmap(qproc->dev, ptr);
 		size += phdr->p_memsz;
 
 		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -1236,7 +1254,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	int ret = 0;
 	struct q6v5 *qproc = rproc->priv;
 	unsigned long mask = BIT((unsigned long)segment->priv);
-	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+	void *ptr = NULL;
 
 	/* Unlock mba before copying segments */
 	if (!qproc->dump_mba_loaded) {
@@ -1250,10 +1268,15 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		}
 	}
 
-	if (!ptr || ret)
-		memset(dest, 0xff, segment->size);
-	else
+	if (!ret)
+		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+
+	if (ptr) {
 		memcpy(dest, ptr, segment->size);
+		devm_iounmap(qproc->dev, ptr);
+	} else {
+		memset(dest, 0xff, segment->size);
+	}
 
 	qproc->dump_segment_mask |= mask;
 
@@ -1327,18 +1350,6 @@ static int q6v5_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
-{
-	struct q6v5 *qproc = rproc->priv;
-	int offset;
-
-	offset = da - qproc->mpss_reloc;
-	if (offset < 0 || offset + len > qproc->mpss_size)
-		return NULL;
-
-	return qproc->mpss_region + offset;
-}
-
 static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 					    const struct firmware *mba_fw)
 {
@@ -1595,12 +1606,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mpss_phys = qproc->mpss_reloc = r.start;
 	qproc->mpss_size = resource_size(&r);
-	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
-	if (!qproc->mpss_region) {
-		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, qproc->mpss_size);
-		return -EBUSY;
-	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
