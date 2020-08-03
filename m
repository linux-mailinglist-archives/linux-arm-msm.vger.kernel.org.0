Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38FD23AD34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 21:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgHCTgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 15:36:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44020 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgHCTgF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 15:36:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596483364; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=J+r2IuMCdiQpFZk2LJ7Mue1k3xmchWvzAhnGNLaZ568=; b=SWEk1IrGMPmzV8LxBHr9yFQYovdfkjE6xogFwiVCXX3Mij+2wmEbfqU+cZR6/+cr3k4AH/zb
 S8nMSnaP4DUulj67UryxUUNkkjtuHJVtIVDpwcIaanRIpN2tG+tsVZ62IqDn5WpVhntkB1xl
 2O3BCgc9nlen7GjI/xvnQY+wq9Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f286723f89b692ba2a0f39b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Aug 2020 19:36:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAEDDC433B2; Mon,  3 Aug 2020 19:36:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE01DC433B2;
        Mon,  3 Aug 2020 19:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE01DC433B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 02/12] iommu/arm-smmu: Add support for split pagetables
Date:   Mon,  3 Aug 2020 13:35:37 -0600
Message-Id: <20200803193547.305660-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803193547.305660-1-jcrouse@codeaurora.org>
References: <20200803193547.305660-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
by the io-pgtable configuration.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 21 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 25 +++++++++++++++++++------
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 37d8d49299b4..976d43a7f2ff 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -552,11 +552,15 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
 			cb->ttbr[1] = 0;
 		} else {
-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
-			cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						  cfg->asid);
+			cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
+				cfg->asid);
 			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
-						 cfg->asid);
+				cfg->asid);
+
+			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+				cb->ttbr[1] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+			else
+				cb->ttbr[0] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
 		}
 	} else {
 		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
@@ -822,7 +826,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
+
+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		domain->geometry.aperture_start = ~0UL << ias;
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+	}
+
 	domain->geometry.force_aperture = true;
 
 	/* Initialise the context bank with our page table cfg */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 83294516ac08..f3e456893f28 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -169,10 +169,12 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_TCR			0x30
 #define ARM_SMMU_TCR_EAE		BIT(31)
 #define ARM_SMMU_TCR_EPD1		BIT(23)
+#define ARM_SMMU_TCR_A1			BIT(22)
 #define ARM_SMMU_TCR_TG0		GENMASK(15, 14)
 #define ARM_SMMU_TCR_SH0		GENMASK(13, 12)
 #define ARM_SMMU_TCR_ORGN0		GENMASK(11, 10)
 #define ARM_SMMU_TCR_IRGN0		GENMASK(9, 8)
+#define ARM_SMMU_TCR_EPD0		BIT(7)
 #define ARM_SMMU_TCR_T0SZ		GENMASK(5, 0)
 
 #define ARM_SMMU_VTCR_RES1		BIT(31)
@@ -350,12 +352,23 @@ struct arm_smmu_domain {
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 {
-	return ARM_SMMU_TCR_EPD1 |
-	       FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
-	       FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
-	       FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
-	       FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
+		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
+		FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
+		FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
+		FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
+
+       /*
+	* When TTBR1 is selected shift the TCR fields by 16 bits and disable
+	* translation in TTBR0
+	*/
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		tcr = (tcr << 16) & ~ARM_SMMU_TCR_A1;
+		tcr |= ARM_SMMU_TCR_EPD0;
+	} else
+		tcr |= ARM_SMMU_TCR_EPD1;
+
+	return tcr;
 }
 
 static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
-- 
2.25.1

