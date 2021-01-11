Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB032F17E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbhAKOQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 09:16:45 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:46109 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbhAKOQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 09:16:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610374581; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=S7ghM8SZchF7c80cwqN9NHmmDjAUzAAus0Q+CMEfR2I=; b=a5vWG6dbmqgztRXFmf5MUcQQmZzm7x5xtDs1A9cYdNPb4/oMU4QDl6bpr1BQqylHuOKaRQwl
 Wsee+3/rsRg6X7F+wnJ6QCCvCn5+YLOpQKj9WcBwVBK0lsCqyGGDhoa41yCMswdKS90OxDGB
 QIQSG801Ed1u94g6SyJX80yXPk8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ffc5d898fb3cda82fc26237 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 14:15:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D58AC43465; Mon, 11 Jan 2021 14:15:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 029ECC43467;
        Mon, 11 Jan 2021 14:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 029ECC43467
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        isaacm@codeaurora.org
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
Date:   Mon, 11 Jan 2021 19:45:04 +0530
Message-Id: <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new page protection flag IOMMU_LLC which can be used
by non-coherent masters to set cacheable memory attributes
for an outer level of cache called as last-level cache or
system cache. Initial user of this page protection flag is
the adreno gpu and then can later be used by other clients
such as video where this can be used for per-buffer based
mapping.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm.c | 3 +++
 include/linux/iommu.h          | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7439ee7fdcdb..ebe653ef601b 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 		else if (prot & IOMMU_CACHE)
 			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
+		else if (prot & IOMMU_LLC)
+			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
+				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
 	if (prot & IOMMU_CACHE)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ffaa389ea128..1f82057df531 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -31,6 +31,12 @@
  * if the IOMMU page table format is equivalent.
  */
 #define IOMMU_PRIV	(1 << 5)
+/*
+ * Non-coherent masters can use this page protection flag to set cacheable
+ * memory attributes for only a transparent outer level of cache, also known as
+ * the last-level or system cache.
+ */
+#define IOMMU_LLC	(1 << 6)
 
 struct iommu_ops;
 struct iommu_group;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

