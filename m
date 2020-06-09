Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B9E1F39EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgFILkt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:40:49 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53408 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728902AbgFILks (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:40:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591702847; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+UGRQoOwBERu2zKIIAlIPKPWCL9327VwkFms0xPlYEQ=; b=SVKXB/iclJYHGu6LMlJn+4hgyiWUdcxD8uT7zTKYk0A6yOWgximWMq5cLqY4eINUSaKd7Guz
 jJesVq3EuGdup70i4XmQieS4FjT6jTonKSQ/fqRbB6t6E8qNS1IGv8W/c9C9N8PnUavnyVU5
 DP92YsJKH69xgR08HcKLILfasAA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5edf753f3b3439f23ae37ca7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 11:40:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11C2BC433CB; Tue,  9 Jun 2020 11:40:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABDB2C43391;
        Tue,  9 Jun 2020 11:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABDB2C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        aneela@codeaurora.org
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V1 2/2] soc: qcom: smem: map only partitions used by local HOST
Date:   Tue,  9 Jun 2020 17:10:04 +0530
Message-Id: <1591702804-26223-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
References: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SMEM driver is IO mapping complete region and CPU is doing a speculative
read into a partition where local HOST does not have permission resulting
in a NOC error.

Map only those partitions which are accessibly to local HOST.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 226 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 167 insertions(+), 59 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c1bd310..4a152d6 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -193,6 +193,19 @@ struct smem_partition_header {
 	__le32 offset_free_cached;
 	__le32 reserved[3];
 };
+/**
+ * struct smem_partition_desc - descriptor for partition
+ * @virt_base:	starting virtual address of partition
+ * @phys_base:	starting physical address of partition
+ * @cacheline:	alignment for "cached" entries
+ * @size:	size of partition
+ */
+struct smem_partition_desc {
+	void __iomem *virt_base;
+	u32 phys_base;
+	u32 cacheline;
+	u32 size;
+};
 
 static const u8 SMEM_PART_MAGIC[] = { 0x24, 0x50, 0x52, 0x54 };
 
@@ -249,9 +262,9 @@ struct smem_region {
  * struct qcom_smem - device data for the smem device
  * @dev:	device pointer
  * @hwlock:	reference to a hwspinlock
- * @global_partition_entry: pointer to global partition entry when in use
- * @ptable_entries: list of pointers to partitions table entry of current
- *		processor/host
+ * @ptable_base: virtual base of partition table
+ * @global_partition_desc: descriptor for global partition when in use
+ * @partition_desc: list of partition descriptor of current processor/host
  * @item_count: max accepted item number
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
@@ -261,9 +274,11 @@ struct qcom_smem {
 
 	struct hwspinlock *hwlock;
 
-	struct smem_ptable_entry *global_partition_entry;
-	struct smem_ptable_entry *ptable_entries[SMEM_HOST_COUNT];
 	u32 item_count;
+	struct smem_ptable *ptable_base;
+	struct smem_partition_desc global_partition_desc;
+	struct smem_partition_desc partition_desc[SMEM_HOST_COUNT];
+
 	struct platform_device *socinfo;
 
 	unsigned num_regions;
@@ -276,12 +291,6 @@ static struct qcom_smem *__smem;
 /* Timeout (ms) for the trylock of remote spinlocks */
 #define HWSPINLOCK_TIMEOUT     1000
 
-static struct smem_partition_header *
-ptable_entry_to_phdr(struct smem_ptable_entry *entry)
-{
-	return __smem->regions[0].virt_base + le32_to_cpu(entry->offset);
-}
-
 static struct smem_private_entry *
 phdr_to_last_uncached_entry(struct smem_partition_header *phdr)
 {
@@ -348,7 +357,7 @@ static void *cached_entry_to_item(struct smem_private_entry *e)
 }
 
 static int qcom_smem_alloc_private(struct qcom_smem *smem,
-				   struct smem_ptable_entry *entry,
+				   struct smem_partition_desc *p_desc,
 				   unsigned item,
 				   size_t size)
 {
@@ -358,8 +367,8 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	void *cached;
 	void *p_end;
 
-	phdr = ptable_entry_to_phdr(entry);
-	p_end = (void *)phdr + le32_to_cpu(entry->size);
+	phdr = p_desc->virt_base;
+	p_end = (void *)phdr + p_desc->size;
 
 	hdr = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
@@ -452,7 +461,7 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
  */
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 {
-	struct smem_ptable_entry *entry;
+	struct smem_partition_desc *p_desc;
 	unsigned long flags;
 	int ret;
 
@@ -474,12 +483,12 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 	if (ret)
 		return ret;
 
-	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
-		entry = __smem->ptable_entries[host];
-		ret = qcom_smem_alloc_private(__smem, entry, item, size);
-	} else if (__smem->global_partition_entry) {
-		entry = __smem->global_partition_entry;
-		ret = qcom_smem_alloc_private(__smem, entry, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
+		p_desc = &__smem->partition_desc[host];
+		ret = qcom_smem_alloc_private(__smem, p_desc, item, size);
+	} else if (__smem->global_partition_desc.virt_base) {
+		p_desc = &__smem->global_partition_desc;
+		ret = qcom_smem_alloc_private(__smem, p_desc, item, size);
 	} else {
 		ret = qcom_smem_alloc_global(__smem, item, size);
 	}
@@ -530,22 +539,20 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 }
 
 static void *qcom_smem_get_private(struct qcom_smem *smem,
-				   struct smem_ptable_entry *entry,
+				   struct smem_partition_desc *p_desc,
 				   unsigned item,
 				   size_t *size)
 {
 	struct smem_private_entry *e, *end;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
-	u32 partition_size;
 	size_t cacheline;
 	u32 padding_data;
 	u32 e_size;
 
-	phdr = ptable_entry_to_phdr(entry);
-	partition_size = le32_to_cpu(entry->size);
-	p_end = (void *)phdr + partition_size;
-	cacheline = le32_to_cpu(entry->cacheline);
+	phdr = p_desc->virt_base;
+	p_end = (void *)phdr + p_desc->size;
+	cacheline = p_desc->cacheline;
 
 	e = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
@@ -562,7 +569,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				e_size = le32_to_cpu(e->size);
 				padding_data = le16_to_cpu(e->padding_data);
 
-				if (e_size < partition_size
+				if (e_size < p_desc->size
 				    && padding_data < e_size)
 					*size = e_size - padding_data;
 				else
@@ -598,7 +605,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				e_size = le32_to_cpu(e->size);
 				padding_data = le16_to_cpu(e->padding_data);
 
-				if (e_size < partition_size
+				if (e_size < p_desc->size
 				    && padding_data < e_size)
 					*size = e_size - padding_data;
 				else
@@ -637,7 +644,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
  */
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 {
-	struct smem_ptable_entry *entry;
+	struct smem_partition_desc *p_desc;
 	unsigned long flags;
 	int ret;
 	void *ptr = ERR_PTR(-EPROBE_DEFER);
@@ -654,12 +661,12 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
-		entry = __smem->ptable_entries[host];
-		ptr = qcom_smem_get_private(__smem, entry, item, size);
-	} else if (__smem->global_partition_entry) {
-		entry = __smem->global_partition_entry;
-		ptr = qcom_smem_get_private(__smem, entry, item, size);
+	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
+		p_desc = &__smem->partition_desc[host];
+		ptr = qcom_smem_get_private(__smem, p_desc, item, size);
+	} else if (__smem->global_partition_desc.virt_base) {
+		p_desc = &__smem->global_partition_desc;
+		ptr = qcom_smem_get_private(__smem, p_desc, item, size);
 	} else {
 		ptr = qcom_smem_get_global(__smem, item, size);
 	}
@@ -681,30 +688,30 @@ EXPORT_SYMBOL(qcom_smem_get);
 int qcom_smem_get_free_space(unsigned host)
 {
 	struct smem_partition_header *phdr;
-	struct smem_ptable_entry *entry;
+	struct smem_partition_desc *p_desc;
 	struct smem_header *header;
 	unsigned ret;
 
 	if (!__smem)
 		return -EPROBE_DEFER;
 
-	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
-		entry = __smem->ptable_entries[host];
-		phdr = ptable_entry_to_phdr(entry);
+	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
+		p_desc = &__smem->partition_desc[host];
+		phdr = p_desc->virt_base;
 
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
 
-		if (ret > le32_to_cpu(entry->size))
+		if (ret > p_desc->size)
 			return -EINVAL;
-	} else if (__smem->global_partition_entry) {
-		entry = __smem->global_partition_entry;
-		phdr = ptable_entry_to_phdr(entry);
+	} else if (__smem->global_partition_desc.virt_base) {
+		p_desc = &__smem->global_partition_desc;
+		phdr = p_desc->virt_base;
 
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
 
-		if (ret > le32_to_cpu(entry->size))
+		if (ret > p_desc->size)
 			return -EINVAL;
 	} else {
 		header = __smem->regions[0].virt_base;
@@ -718,6 +725,15 @@ int qcom_smem_get_free_space(unsigned host)
 }
 EXPORT_SYMBOL(qcom_smem_get_free_space);
 
+static int addr_in_range(void *virt_base, unsigned int size, void *addr)
+{
+	if (virt_base && addr >= virt_base &&
+			addr < virt_base + size)
+		return 1;
+
+	return 0;
+}
+
 /**
  * qcom_smem_virt_to_phys() - return the physical address associated
  * with an smem item pointer (previously returned by qcom_smem_get()
@@ -727,17 +743,36 @@ EXPORT_SYMBOL(qcom_smem_get_free_space);
  */
 phys_addr_t qcom_smem_virt_to_phys(void *p)
 {
-	unsigned i;
+	struct smem_partition_desc *p_desc;
+	struct smem_region *area;
+	u64 offset;
+	u32 i;
+
+	for (i = 0; i < SMEM_HOST_COUNT; i++) {
+		p_desc = &__smem->partition_desc[i];
+
+		if (addr_in_range(p_desc->virt_base, p_desc->size, p)) {
+			offset = p - p_desc->virt_base;
+
+			return (phys_addr_t)p_desc->phys_base + offset;
+		}
+	}
+
+	p_desc = &__smem->global_partition_desc;
+
+	if (addr_in_range(p_desc->virt_base, p_desc->size, p)) {
+		offset = p - p_desc->virt_base;
+
+		return (phys_addr_t)p_desc->phys_base + offset;
+	}
 
 	for (i = 0; i < __smem->num_regions; i++) {
-		struct smem_region *region = &__smem->regions[i];
+		area = &__smem->regions[i];
 
-		if (p < region->virt_base)
-			continue;
-		if (p < region->virt_base + region->size) {
-			u64 offset = p - region->virt_base;
+		if (addr_in_range(area->virt_base, area->size, p)) {
+			offset = p - area->virt_base;
 
-			return (phys_addr_t)region->aux_base + offset;
+			return (phys_addr_t)area->aux_base + offset;
 		}
 	}
 
@@ -761,7 +796,7 @@ static struct smem_ptable *qcom_smem_get_ptable(struct qcom_smem *smem)
 	struct smem_ptable *ptable;
 	u32 version;
 
-	ptable = smem->regions[0].virt_base + smem->regions[0].size - SZ_4K;
+	ptable = smem->ptable_base;
 	if (memcmp(ptable->magic, SMEM_PTABLE_MAGIC, sizeof(ptable->magic)))
 		return ERR_PTR(-ENOENT);
 
@@ -800,9 +835,15 @@ qcom_smem_partition_header(struct qcom_smem *smem,
 		struct smem_ptable_entry *entry, u16 host0, u16 host1)
 {
 	struct smem_partition_header *header;
+	u32 phys_addr;
 	u32 size;
 
-	header = smem->regions[0].virt_base + le32_to_cpu(entry->offset);
+	phys_addr = smem->regions[0].aux_base + le32_to_cpu(entry->offset);
+	header = devm_ioremap_wc(smem->dev,
+                                  phys_addr, le32_to_cpu(entry->size));
+
+	if (!header)
+		return NULL;
 
 	if (memcmp(header->magic, SMEM_PART_MAGIC, sizeof(header->magic))) {
 		dev_err(smem->dev, "bad partition magic %02x %02x %02x %02x\n",
@@ -846,7 +887,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	bool found = false;
 	int i;
 
-	if (smem->global_partition_entry) {
+	if (smem->global_partition_desc.virt_base) {
 		dev_err(smem->dev, "Already found the global partition\n");
 		return -EINVAL;
 	}
@@ -881,7 +922,11 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
 	if (!header)
 		return -EINVAL;
 
-	smem->global_partition_entry = entry;
+	smem->global_partition_desc.virt_base = (void __iomem *)header;
+	smem->global_partition_desc.phys_base = smem->regions[0].aux_base +
+						 le32_to_cpu(entry->offset);
+	smem->global_partition_desc.size = le32_to_cpu(entry->size);
+	smem->global_partition_desc.cacheline = le32_to_cpu(entry->cacheline);
 
 	return 0;
 }
@@ -921,7 +966,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 			return -EINVAL;
 		}
 
-		if (smem->ptable_entries[remote_host]) {
+		if (smem->partition_desc[remote_host].virt_base) {
 			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
 			return -EINVAL;
 		}
@@ -930,7 +975,14 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		if (!header)
 			return -EINVAL;
 
-		smem->ptable_entries[remote_host] = entry;
+		smem->partition_desc[remote_host].virt_base =
+						(void __iomem *)header;
+		smem->partition_desc[remote_host].phys_base =
+			smem->regions[0].aux_base + le32_to_cpu(entry->offset);
+		smem->partition_desc[remote_host].size =
+						le32_to_cpu(entry->size);
+		smem->partition_desc[remote_host].cacheline =
+						le32_to_cpu(entry->cacheline);
 	}
 
 	return 0;
@@ -965,6 +1017,61 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
 	return 0;
 }
 
+static int qcom_smem_map_toc(struct qcom_smem *smem, struct device *dev,
+				const char *name, int i)
+{
+	struct device_node *np;
+	struct resource r;
+	int ret;
+
+	np = of_parse_phandle(dev->of_node, name, 0);
+	if (!np) {
+		dev_err(dev, "No %s specified\n", name);
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(np, 0, &r);
+	of_node_put(np);
+	if (ret)
+		return ret;
+
+	smem->regions[i].aux_base = (u32)r.start;
+	smem->regions[i].size = resource_size(&r);
+	/* map starting 4K for smem header */
+	smem->regions[i].virt_base = devm_ioremap_wc(dev, r.start, SZ_4K);
+	/* map last 4k for toc */
+	smem->ptable_base = devm_ioremap_wc(dev,
+				r.start + resource_size(&r) - SZ_4K, SZ_4K);
+
+	if (!smem->regions[i].virt_base || !smem->ptable_base)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int qcom_smem_mamp_legacy(struct qcom_smem *smem)
+{
+	struct smem_header *header;
+	u32 phys_addr;
+	u32 p_size;
+
+	phys_addr = smem->regions[0].aux_base;
+	header = smem->regions[0].virt_base;
+	p_size = header->available;
+
+	/* unmap previously mapped starting 4k for smem header */
+	devm_iounmap(smem->dev, smem->regions[0].virt_base);
+
+	smem->regions[0].size = p_size;
+	smem->regions[0].virt_base = devm_ioremap_wc(smem->dev,
+						      phys_addr, p_size);
+
+	if (!smem->regions[0].virt_base)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_smem_probe(struct platform_device *pdev)
 {
 	struct smem_header *header;
@@ -987,7 +1094,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	smem->dev = &pdev->dev;
 	smem->num_regions = num_regions;
 
-	ret = qcom_smem_map_memory(smem, &pdev->dev, "memory-region", 0);
+	ret = qcom_smem_map_toc(smem, &pdev->dev, "memory-region", 0);
 	if (ret)
 		return ret;
 
@@ -1011,6 +1118,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		smem->item_count = qcom_smem_get_item_count(smem);
 		break;
 	case SMEM_GLOBAL_HEAP_VERSION:
+		qcom_smem_mamp_legacy(smem);
 		smem->item_count = SMEM_ITEM_COUNT;
 		break;
 	default:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

