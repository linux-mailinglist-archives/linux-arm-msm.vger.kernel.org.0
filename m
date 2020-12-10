Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B102D50ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 03:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbgLJCfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 21:35:17 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:56768 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728772AbgLJCfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 21:35:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607567683; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=z3Hh6aY58XBMW8Q0uTCpd7iuzo0WDdAYj1yFPNK7f6k=; b=vyZwduJ/x9jtIac2vWBUrz+nKoJRsxziuta0glc7NZjFoN1xOKyzLg3t0IhWtCRE/8SySpQ+
 fmW93fNcYM7tkCf2Uo2Xk20sLiyr4p778ESGT+5GDsZk3rGFa6zOL86cvFOTYtybRs/9LiIE
 vUE53Qs58XfDQMsJnVEpknFkeEo=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fd1891d27e7db2389997fec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Dec 2020 02:34:05
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F408C43461; Thu, 10 Dec 2020 02:34:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31993C433C6;
        Thu, 10 Dec 2020 02:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31993C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH] drivers: mdt_loader: Add parallel blobs loading capability
Date:   Wed,  9 Dec 2020 18:33:56 -0800
Message-Id: <1607567636-28439-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add capability to load blobs parallely during loading
of firmware. Create a high priority unbound workqueue and
schedule work items to load the firmware blobs parallely.
This helps in improving firmware loading times.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c | 147 ++++++++++++++++++++++++++++++------------
 1 file changed, 107 insertions(+), 40 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 24cd193..4e5d2aa 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -17,6 +17,26 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+static struct workqueue_struct *mdt_wq;
+
+struct fw_desc {
+	size_t mem_size;
+	void *mem_region;
+	const struct firmware *fw;
+	char *fw_name;
+	struct device *dev;
+	size_t fw_name_len;
+	phys_addr_t mem_reloc;
+};
+
+struct mdt_seg_data {
+	struct work_struct load_seg_work;
+	const struct elf32_phdr *phdr;
+	int seg_num;
+	int result;
+	struct fw_desc *desc;
+};
+
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
@@ -126,6 +146,62 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
+static void mdt_load_seg_work_fn(struct work_struct *work)
+{
+	struct mdt_seg_data *mdt_seg_data = container_of(work, struct mdt_seg_data, load_seg_work);
+	struct fw_desc *desc = mdt_seg_data->desc;
+	int seg_num = mdt_seg_data->seg_num;
+	const struct elf32_phdr *phdr = mdt_seg_data->phdr;
+	const struct firmware *seg_fw;
+	ssize_t offset;
+	void *ptr;
+	int ret;
+	char *fw_name = kstrdup(desc->fw_name, GFP_KERNEL);
+
+	if (!mdt_phdr_valid(phdr))
+		goto fw_free;
+
+	offset = phdr->p_paddr - desc->mem_reloc;
+	if (offset < 0 || offset + phdr->p_memsz > desc->mem_size) {
+		dev_err(desc->dev, "segment outside memory range\n");
+		mdt_seg_data->result = -EINVAL;
+		goto fw_free;
+	}
+
+	ptr = desc->mem_region + offset;
+
+	if (phdr->p_filesz && phdr->p_offset < desc->fw->size) {
+		/* Firmware is large enough to be non-split */
+		if (phdr->p_offset + phdr->p_filesz > desc->fw->size) {
+			dev_err(desc->dev,
+				"failed to load segment %d from truncated file %s\n",
+				seg_num, desc->fw_name);
+			mdt_seg_data->result = -EINVAL;
+			goto fw_free;
+		}
+
+		memcpy(ptr, desc->fw->data + phdr->p_offset, phdr->p_filesz);
+	} else if (phdr->p_filesz) {
+		/* Firmware not large enough, load split-out segments */
+		sprintf(fw_name + desc->fw_name_len - 3, "b%02d", seg_num);
+		ret = request_firmware_into_buf(&seg_fw, fw_name, desc->dev,
+						ptr, phdr->p_filesz);
+		if (ret) {
+			dev_err(desc->dev, "failed to load %s\n", fw_name);
+			mdt_seg_data->result = -EINVAL;
+			goto fw_free;
+		}
+
+		release_firmware(seg_fw);
+	}
+
+	if (phdr->p_memsz > phdr->p_filesz)
+		memset(ptr + phdr->p_filesz, 0, phdr->p_memsz - phdr->p_filesz);
+
+fw_free:
+	kfree(fw_name);
+}
+
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *firmware, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
@@ -134,19 +210,18 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
-	const struct firmware *seg_fw;
+	struct mdt_seg_data *segs;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	phys_addr_t max_addr = 0;
 	size_t metadata_len;
 	size_t fw_name_len;
-	ssize_t offset;
 	void *metadata;
 	char *fw_name;
 	bool relocate = false;
-	void *ptr;
 	int ret = 0;
 	int i;
+	struct fw_desc *desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 
 	if (!fw || !mem_region || !mem_phys || !mem_size)
 		return -EINVAL;
@@ -217,54 +292,46 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		mem_reloc = mem_phys;
 	}
 
-	for (i = 0; i < ehdr->e_phnum; i++) {
-		phdr = &phdrs[i];
+	if (!mdt_wq)
+		mdt_wq = alloc_workqueue("mdt_workqueue", WQ_HIGHPRI | WQ_UNBOUND, 0);
 
-		if (!mdt_phdr_valid(phdr))
-			continue;
+	segs = kcalloc(ehdr->e_phnum, sizeof(struct mdt_seg_data), GFP_KERNEL);
 
-		offset = phdr->p_paddr - mem_reloc;
-		if (offset < 0 || offset + phdr->p_memsz > mem_size) {
-			dev_err(dev, "segment outside memory range\n");
-			ret = -EINVAL;
-			break;
-		}
+	/* Fill in the firmware descriptor to be used by individual work items */
+	desc->mem_size = mem_size;
+	desc->mem_region = mem_region;
+	desc->fw = fw;
+	desc->fw_name_len = fw_name_len;
+	desc->fw_name = fw_name;
+	desc->dev = dev;
+	desc->mem_reloc = mem_reloc;
 
-		ptr = mem_region + offset;
-
-		if (phdr->p_filesz && phdr->p_offset < fw->size) {
-			/* Firmware is large enough to be non-split */
-			if (phdr->p_offset + phdr->p_filesz > fw->size) {
-				dev_err(dev,
-					"failed to load segment %d from truncated file %s\n",
-					i, firmware);
-				ret = -EINVAL;
-				break;
-			}
-
-			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
-		} else if (phdr->p_filesz) {
-			/* Firmware not large enough, load split-out segments */
-			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
-			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
-							ptr, phdr->p_filesz);
-			if (ret) {
-				dev_err(dev, "failed to load %s\n", fw_name);
-				break;
-			}
-
-			release_firmware(seg_fw);
-		}
+	/* Queue in individual work item for each firmware blob */
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		INIT_WORK(&segs[i].load_seg_work, mdt_load_seg_work_fn);
+		segs[i].seg_num = i;
+		segs[i].phdr = &phdrs[i];
+		segs[i].desc = desc;
+		queue_work(mdt_wq, &segs[i].load_seg_work);
+	}
 
-		if (phdr->p_memsz > phdr->p_filesz)
-			memset(ptr + phdr->p_filesz, 0, phdr->p_memsz - phdr->p_filesz);
+	/* Wait for the parallel loads to finish */
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		flush_work(&segs[i].load_seg_work);
+		ret |= segs[i].result;
 	}
 
+	/* Different blobs can fail with different errors, so return a generic error */
+	if (ret)
+		ret = -EFAULT;
+
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
 out:
 	kfree(fw_name);
+	kfree(desc);
+	kfree(segs);
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

