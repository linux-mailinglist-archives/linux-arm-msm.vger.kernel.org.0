Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8320314F01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 13:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBIMha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 07:37:30 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:54779 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhBIMh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 07:37:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612874223; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=XA1/wY6qzZKfm1+w+nC9ectbnZF3AqmFvZoAzmlwiLM=; b=SSYjiiyU3K407xp2tGanf5p++FyF4xGbvVneDRf2hyPziK53RYTjlMYM/1AggBRy2pdVYg0u
 EHOzUPQaFtjjDZ1PMDOGJ/8AJRzBIfLn2QOLVpinHLVlxpt360WEHqI8HcVaOlYpWP+dSZzX
 SKeRtm0pJlIJVQfLH2uclSQyhXI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602281d381f6c45dce7a9503 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 12:36:35
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D018FC43462; Tue,  9 Feb 2021 12:36:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CD79C433C6;
        Tue,  9 Feb 2021 12:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CD79C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] iommu: Add device name to iommu map/unmap trace events
Date:   Tue,  9 Feb 2021 18:06:20 +0530
Message-Id: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IOMMU map/unmap traces become hard to decode i.e., it becomes hard
to associate the map/unmap events with the particular device from
the iova/paddr/size parameters alone when there are multiple
devices attached. So it is useful to add the device name to iommu
trace events which can be used to filter out map/unmap traces for
a particular device when we are debugging iommu faults such as
context faults where we are interested with the map/unmap traces
for a specific device.

Before:
  map: IOMMU: iova=0x0000000ffff36000 paddr=0x00000001164d8000 size=4096
  unmap: IOMMU: iova=0x0000000ffff36000 size=4096 unmapped_size=4096

After:
  map: IOMMU: dev=1d84000.ufshc iova=0x0000000fffa88000 paddr=0x00000001063db000 size=4096
  unmap: IOMMU: dev=1d84000.ufshc iova=0x0000000fffa88000 size=4096 unmapped_size=4096

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/iommu.c        |  8 +++++---
 include/linux/iommu.h        |  1 +
 include/trace/events/iommu.h | 20 ++++++++++++--------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d0b0a15dba84..37081b745f38 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1947,8 +1947,10 @@ static int __iommu_attach_device(struct iommu_domain *domain,
 		return -ENODEV;
 
 	ret = domain->ops->attach_dev(domain, dev);
-	if (!ret)
+	if (!ret) {
 		trace_attach_device_to_domain(dev);
+		strscpy(domain->dev_name, dev_name(dev), sizeof(domain->dev_name));
+	}
 	return ret;
 }
 
@@ -2440,7 +2442,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	if (ret)
 		iommu_unmap(domain, orig_iova, orig_size - size);
 	else
-		trace_map(orig_iova, orig_paddr, orig_size);
+		trace_map(orig_iova, orig_paddr, orig_size, domain->dev_name);
 
 	return ret;
 }
@@ -2523,7 +2525,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		unmapped += unmapped_page;
 	}
 
-	trace_unmap(orig_iova, size, unmapped);
+	trace_unmap(orig_iova, size, unmapped, domain->dev_name);
 	return unmapped;
 }
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5e7fe519430a..6064187d9bb6 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -87,6 +87,7 @@ struct iommu_domain {
 	void *handler_token;
 	struct iommu_domain_geometry geometry;
 	void *iova_cookie;
+	char dev_name[32];
 };
 
 enum iommu_cap {
diff --git a/include/trace/events/iommu.h b/include/trace/events/iommu.h
index 72b4582322ff..44e48fb8b677 100644
--- a/include/trace/events/iommu.h
+++ b/include/trace/events/iommu.h
@@ -85,47 +85,51 @@ DEFINE_EVENT(iommu_device_event, detach_device_from_domain,
 
 TRACE_EVENT(map,
 
-	TP_PROTO(unsigned long iova, phys_addr_t paddr, size_t size),
+	TP_PROTO(unsigned long iova, phys_addr_t paddr, size_t size, const char *dev_name),
 
-	TP_ARGS(iova, paddr, size),
+	TP_ARGS(iova, paddr, size, dev_name),
 
 	TP_STRUCT__entry(
 		__field(u64, iova)
 		__field(u64, paddr)
 		__field(size_t, size)
+		__string(dev_name, dev_name)
 	),
 
 	TP_fast_assign(
 		__entry->iova = iova;
 		__entry->paddr = paddr;
 		__entry->size = size;
+		__assign_str(dev_name, dev_name);
 	),
 
-	TP_printk("IOMMU: iova=0x%016llx paddr=0x%016llx size=%zu",
-			__entry->iova, __entry->paddr, __entry->size
+	TP_printk("IOMMU: dev=%s iova=0x%016llx paddr=0x%016llx size=%zu",
+		  __get_str(dev_name), __entry->iova, __entry->paddr, __entry->size
 	)
 );
 
 TRACE_EVENT(unmap,
 
-	TP_PROTO(unsigned long iova, size_t size, size_t unmapped_size),
+	TP_PROTO(unsigned long iova, size_t size, size_t unmapped_size, const char *dev_name),
 
-	TP_ARGS(iova, size, unmapped_size),
+	TP_ARGS(iova, size, unmapped_size, dev_name),
 
 	TP_STRUCT__entry(
 		__field(u64, iova)
 		__field(size_t, size)
 		__field(size_t, unmapped_size)
+		__string(dev_name, dev_name)
 	),
 
 	TP_fast_assign(
 		__entry->iova = iova;
 		__entry->size = size;
 		__entry->unmapped_size = unmapped_size;
+		__assign_str(dev_name, dev_name);
 	),
 
-	TP_printk("IOMMU: iova=0x%016llx size=%zu unmapped_size=%zu",
-			__entry->iova, __entry->size, __entry->unmapped_size
+	TP_printk("IOMMU: dev=%s iova=0x%016llx size=%zu unmapped_size=%zu",
+		  __get_str(dev_name), __entry->iova, __entry->size, __entry->unmapped_size
 	)
 );
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

