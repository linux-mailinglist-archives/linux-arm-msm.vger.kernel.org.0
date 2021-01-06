Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8272EC5AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 22:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbhAFVYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 16:24:49 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:31727 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbhAFVYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 16:24:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609968254; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MYazQZSddXgcH9RSsDLWhr+gbu/RoBdunijn/+4XvK0=; b=sB6k/WsdZXlySuo46TARvNijM3avRsQ7Bwe6nzpyl03Nvw9LxN+872kJgBUTGfCGcLYjxXXK
 rtTtpMcNg81gOwpa7JrVajAlwDeGJ9nKUZhi6HJ+YgL0LRit9N7G1c7r/349qVnPn8ZwOWpZ
 8ymrpkPl+7ksgoRaFGeR6UqnCQo=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ff62a63661021aa280f66e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 21:23:47
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D129C43462; Wed,  6 Jan 2021 21:23:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29629C433CA;
        Wed,  6 Jan 2021 21:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29629C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, psodagud@codeaurora.org,
        rishabhb@codeaurora.org
Subject: [PATCH 3/3] soc: qcom: mdt_loader: Read hash from firmware blob
Date:   Wed,  6 Jan 2021 13:23:31 -0800
Message-Id: <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the split elf blobs will always contain the hash segment, we rely on
the blob file to get the hash rather than assume that it will be present in
the mdt file. This change uses the hash index to read the appropriate elf
blob to get the hash segment.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c  |  4 ++--
 drivers/soc/qcom/mdt_loader.c       | 38 +++++++++++++++++++++++++++----------
 include/linux/soc/qcom/mdt_loader.h |  3 ++-
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 66106ba..74c0229 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2016 Linaro Ltd.
  * Copyright (C) 2014 Sony Mobile Communications AB
- * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -828,7 +828,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	void *ptr;
 	int ret;
 
-	metadata = qcom_mdt_read_metadata(fw, &size);
+	metadata = qcom_mdt_read_metadata(qproc->dev, fw, qproc->hexagon_mdt_image, &size);
 	if (IS_ERR(metadata))
 		return PTR_ERR(metadata);
 
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c9bbd8c..6876c0b 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -103,15 +103,18 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
  *
  * Return: pointer to data, or ERR_PTR()
  */
-void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
+void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
+			     size_t *data_len)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
-	size_t hash_offset;
+	const struct firmware *seg_fw;
 	size_t hash_index;
 	size_t hash_size;
 	size_t ehdr_size;
+	char *fw_name;
 	void *data;
+	int ret;
 
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
@@ -137,14 +140,29 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	if (!data)
 		return ERR_PTR(-ENOMEM);
 
-	/* Is the header and hash already packed */
-	if (qcom_mdt_bins_are_split(fw))
-		hash_offset = phdrs[0].p_filesz;
-	else
-		hash_offset = phdrs[hash_index].p_offset;
-
+	/* copy elf header */
 	memcpy(data, fw->data, ehdr_size);
-	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
+
+	if (qcom_mdt_bins_are_split(fw)) {
+		fw_name = kstrdup(firmware, GFP_KERNEL);
+		if (!fw_name) {
+			kfree(data);
+			return ERR_PTR(-ENOMEM);
+		}
+		snprintf(fw_name + strlen(fw_name) - 3, 4, "b%02d", hash_index);
+
+		ret = request_firmware_into_buf(&seg_fw, fw_name, dev, data + ehdr_size, hash_size);
+		kfree(fw_name);
+
+		if (ret) {
+			kfree(data);
+			return ERR_PTR(ret);
+		}
+
+		release_firmware(seg_fw);
+	} else {
+		memcpy(data + ehdr_size, fw->data + phdrs[hash_index].p_offset, hash_size);
+	}
 
 	*data_len = ehdr_size + hash_size;
 
@@ -191,7 +209,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return -ENOMEM;
 
 	if (pas_init) {
-		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
+		metadata = qcom_mdt_read_metadata(dev, fw, firmware, &metadata_len);
 		if (IS_ERR(metadata)) {
 			ret = PTR_ERR(metadata);
 			goto out;
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index e600bae..04ba5e8 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -21,6 +21,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, int pas_id, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
-void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
+void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
+			     size_t *data_len);
 
 #endif
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

