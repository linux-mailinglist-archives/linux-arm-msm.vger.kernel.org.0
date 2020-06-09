Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AA51F39ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgFILkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:40:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49784 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbgFILkg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:40:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591702834; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iFq/6BNj3oOF7yRuC9BdDH5XAV22Ax7DPBHG6k35Jq4=; b=k4QonPBWIELeIEZzbSknRSLLSln7zB9e7vWruv5gkZMibV4VNYYca3sYGE1RVYdGJuiAoowK
 an5R37eoPRvs5nsFEj6FwQrrTJ3J5KZ/lbUeraUmnnOvWipBStC7Zk4z5nM9g4Te977cTdNG
 PvsRvD6ea53Usl8aQokoJ0DaH6w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5edf7531356bcc26aba05242 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 11:40:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E0E44C433CA; Tue,  9 Jun 2020 11:40:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61F2FC433C6;
        Tue,  9 Jun 2020 11:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61F2FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        aneela@codeaurora.org
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V1 1/2] soc: qcom: smem: validate fields of shared structures
Date:   Tue,  9 Jun 2020 17:10:03 +0530
Message-Id: <1591702804-26223-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
References: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Structures in shared memory that can be modified by remote
processors may have untrusted values, they should be validated
before use.

Adding proper validation before using fields of shared
structures.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 194 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 133 insertions(+), 61 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 28c19bc..c1bd310 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -249,11 +249,9 @@ struct smem_region {
  * struct qcom_smem - device data for the smem device
  * @dev:	device pointer
  * @hwlock:	reference to a hwspinlock
- * @global_partition:	pointer to global partition when in use
- * @global_cacheline:	cacheline size for global partition
- * @partitions:	list of pointers to partitions affecting the current
+ * @global_partition_entry: pointer to global partition entry when in use
+ * @ptable_entries: list of pointers to partitions table entry of current
  *		processor/host
- * @cacheline:	list of cacheline sizes for each host
  * @item_count: max accepted item number
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
@@ -263,10 +261,8 @@ struct qcom_smem {
 
 	struct hwspinlock *hwlock;
 
-	struct smem_partition_header *global_partition;
-	size_t global_cacheline;
-	struct smem_partition_header *partitions[SMEM_HOST_COUNT];
-	size_t cacheline[SMEM_HOST_COUNT];
+	struct smem_ptable_entry *global_partition_entry;
+	struct smem_ptable_entry *ptable_entries[SMEM_HOST_COUNT];
 	u32 item_count;
 	struct platform_device *socinfo;
 
@@ -274,7 +270,19 @@ struct qcom_smem {
 	struct smem_region regions[];
 };
 
-static void *
+/* Pointer to the one and only smem handle */
+static struct qcom_smem *__smem;
+
+/* Timeout (ms) for the trylock of remote spinlocks */
+#define HWSPINLOCK_TIMEOUT     1000
+
+static struct smem_partition_header *
+ptable_entry_to_phdr(struct smem_ptable_entry *entry)
+{
+	return __smem->regions[0].virt_base + le32_to_cpu(entry->offset);
+}
+
+static struct smem_private_entry *
 phdr_to_last_uncached_entry(struct smem_partition_header *phdr)
 {
 	void *p = phdr;
@@ -339,25 +347,27 @@ static void *cached_entry_to_item(struct smem_private_entry *e)
 	return p - le32_to_cpu(e->size);
 }
 
-/* Pointer to the one and only smem handle */
-static struct qcom_smem *__smem;
-
-/* Timeout (ms) for the trylock of remote spinlocks */
-#define HWSPINLOCK_TIMEOUT	1000
-
 static int qcom_smem_alloc_private(struct qcom_smem *smem,
-				   struct smem_partition_header *phdr,
+				   struct smem_ptable_entry *entry,
 				   unsigned item,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
+	void *p_end;
+
+	phdr = ptable_entry_to_phdr(entry);
+	p_end = (void *)phdr + le32_to_cpu(entry->size);
 
 	hdr = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
+	if (WARN_ON((void *)end > p_end || (void *)cached > p_end))
+		return -EINVAL;
+
 	while (hdr < end) {
 		if (hdr->canary != SMEM_PRIVATE_CANARY)
 			goto bad_canary;
@@ -366,6 +376,8 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 
 		hdr = uncached_entry_next(hdr);
 	}
+	if (WARN_ON((void *)hdr > p_end))
+		return -EINVAL;
 
 	/* Check that we don't grow into the cached region */
 	alloc_size = sizeof(*hdr) + ALIGN(size, 8);
@@ -440,7 +452,7 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
  */
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 {
-	struct smem_partition_header *phdr;
+	struct smem_ptable_entry *entry;
 	unsigned long flags;
 	int ret;
 
@@ -462,12 +474,12 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 	if (ret)
 		return ret;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
-		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
-		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
+		entry = __smem->ptable_entries[host];
+		ret = qcom_smem_alloc_private(__smem, entry, item, size);
+	} else if (__smem->global_partition_entry) {
+		entry = __smem->global_partition_entry;
+		ret = qcom_smem_alloc_private(__smem, entry, item, size);
 	} else {
 		ret = qcom_smem_alloc_global(__smem, item, size);
 	}
@@ -482,9 +494,11 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 				  unsigned item,
 				  size_t *size)
 {
-	struct smem_header *header;
-	struct smem_region *region;
 	struct smem_global_entry *entry;
+	struct smem_header *header;
+	struct smem_region *area;
+	u64 entry_offset;
+	u32 e_size;
 	u32 aux_base;
 	unsigned i;
 
@@ -496,12 +510,19 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 	aux_base = le32_to_cpu(entry->aux_base) & AUX_BASE_MASK;
 
 	for (i = 0; i < smem->num_regions; i++) {
-		region = &smem->regions[i];
+		area = &smem->regions[i];
+
+		if (area->aux_base == aux_base || !aux_base) {
+			e_size = le32_to_cpu(entry->size);
+			entry_offset = le32_to_cpu(entry->offset);
+
+			if (WARN_ON(e_size + entry_offset > area->size))
+				return ERR_PTR(-EINVAL);
 
-		if (region->aux_base == aux_base || !aux_base) {
 			if (size != NULL)
-				*size = le32_to_cpu(entry->size);
-			return region->virt_base + le32_to_cpu(entry->offset);
+				*size = e_size;
+
+			return area->virt_base + entry_offset;
 		}
 	}
 
@@ -509,50 +530,92 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 }
 
 static void *qcom_smem_get_private(struct qcom_smem *smem,
-				   struct smem_partition_header *phdr,
-				   size_t cacheline,
+				   struct smem_ptable_entry *entry,
 				   unsigned item,
 				   size_t *size)
 {
 	struct smem_private_entry *e, *end;
+	struct smem_partition_header *phdr;
+	void *item_ptr, *p_end;
+	u32 partition_size;
+	size_t cacheline;
+	u32 padding_data;
+	u32 e_size;
+
+	phdr = ptable_entry_to_phdr(entry);
+	partition_size = le32_to_cpu(entry->size);
+	p_end = (void *)phdr + partition_size;
+	cacheline = le32_to_cpu(entry->cacheline);
 
 	e = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
 
+	if (WARN_ON((void *)end > p_end))
+		return ERR_PTR(-EINVAL);
+
 	while (e < end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL)
-				*size = le32_to_cpu(e->size) -
-					le16_to_cpu(e->padding_data);
-
-			return uncached_entry_to_item(e);
+			if (size != NULL) {
+				e_size = le32_to_cpu(e->size);
+				padding_data = le16_to_cpu(e->padding_data);
+
+				if (e_size < partition_size
+				    && padding_data < e_size)
+					*size = e_size - padding_data;
+				else
+					return ERR_PTR(-EINVAL);
+			}
+
+			item_ptr =  uncached_entry_to_item(e);
+			if (WARN_ON(item_ptr > p_end))
+				return ERR_PTR(-EINVAL);
+
+			return item_ptr;
 		}
 
 		e = uncached_entry_next(e);
 	}
+	if (WARN_ON((void *)e > p_end))
+		return ERR_PTR(-EINVAL);
 
 	/* Item was not found in the uncached list, search the cached list */
 
 	e = phdr_to_first_cached_entry(phdr, cacheline);
 	end = phdr_to_last_cached_entry(phdr);
 
+	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
+		return ERR_PTR(-EINVAL);
+
 	while (e > end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL)
-				*size = le32_to_cpu(e->size) -
-					le16_to_cpu(e->padding_data);
-
-			return cached_entry_to_item(e);
+			if (size != NULL) {
+				e_size = le32_to_cpu(e->size);
+				padding_data = le16_to_cpu(e->padding_data);
+
+				if (e_size < partition_size
+				    && padding_data < e_size)
+					*size = e_size - padding_data;
+				else
+					return ERR_PTR(-EINVAL);
+			}
+
+			item_ptr =  cached_entry_to_item(e);
+			if (WARN_ON(item_ptr < (void *)phdr))
+				return ERR_PTR(-EINVAL);
+
+			return item_ptr;
 		}
 
 		e = cached_entry_next(e, cacheline);
 	}
+	if (WARN_ON((void *)e < (void *)phdr))
+		return ERR_PTR(-EINVAL);
 
 	return ERR_PTR(-ENOENT);
 
@@ -574,9 +637,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
  */
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 {
-	struct smem_partition_header *phdr;
+	struct smem_ptable_entry *entry;
 	unsigned long flags;
-	size_t cacheln;
 	int ret;
 	void *ptr = ERR_PTR(-EPROBE_DEFER);
 
@@ -592,14 +654,12 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
-		cacheln = __smem->cacheline[host];
-		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
-		cacheln = __smem->global_cacheline;
-		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
+		entry = __smem->ptable_entries[host];
+		ptr = qcom_smem_get_private(__smem, entry, item, size);
+	} else if (__smem->global_partition_entry) {
+		entry = __smem->global_partition_entry;
+		ptr = qcom_smem_get_private(__smem, entry, item, size);
 	} else {
 		ptr = qcom_smem_get_global(__smem, item, size);
 	}
@@ -621,23 +681,37 @@ EXPORT_SYMBOL(qcom_smem_get);
 int qcom_smem_get_free_space(unsigned host)
 {
 	struct smem_partition_header *phdr;
+	struct smem_ptable_entry *entry;
 	struct smem_header *header;
 	unsigned ret;
 
 	if (!__smem)
 		return -EPROBE_DEFER;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
-		phdr = __smem->partitions[host];
+	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
+		entry = __smem->ptable_entries[host];
+		phdr = ptable_entry_to_phdr(entry);
+
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
-	} else if (__smem->global_partition) {
-		phdr = __smem->global_partition;
+
+		if (ret > le32_to_cpu(entry->size))
+			return -EINVAL;
+	} else if (__smem->global_partition_entry) {
+		entry = __smem->global_partition_entry;
+		phdr = ptable_entry_to_phdr(entry);
+
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
+
+		if (ret > le32_to_cpu(entry->size))
+			return -EINVAL;
 	} else {
 		header = __smem->regions[0].virt_base;
 		ret = le32_to_cpu(header->available);
+
+		if (ret > __smem->regions[0].size)
+			return -EINVAL;
 	}
 
 	return ret;
@@ -772,7 +846,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	bool found = false;
 	int i;
 
-	if (smem->global_partition) {
+	if (smem->global_partition_entry) {
 		dev_err(smem->dev, "Already found the global partition\n");
 		return -EINVAL;
 	}
@@ -807,8 +881,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	if (!header)
 		return -EINVAL;
 
-	smem->global_partition = header;
-	smem->global_cacheline = le32_to_cpu(entry->cacheline);
+	smem->global_partition_entry = entry;
 
 	return 0;
 }
@@ -848,7 +921,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 			return -EINVAL;
 		}
 
-		if (smem->partitions[remote_host]) {
+		if (smem->ptable_entries[remote_host]) {
 			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
 			return -EINVAL;
 		}
@@ -857,8 +930,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		if (!header)
 			return -EINVAL;
 
-		smem->partitions[remote_host] = header;
-		smem->cacheline[remote_host] = le32_to_cpu(entry->cacheline);
+		smem->ptable_entries[remote_host] = entry;
 	}
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

