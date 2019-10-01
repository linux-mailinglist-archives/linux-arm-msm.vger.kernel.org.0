Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F10C4360
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfJAWCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47000 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfJAWCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so17240197wrv.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cgkBIqWvnVkQ9N/MHRrfLaa6SBKNUc7qvNtHetLnKc=;
        b=YnBSu9gZVLrXtQwQdqW3hmS32pySCSFuVuUDsUmP22VBIEv1/qbqzMxykfTX6jG7q5
         m8E+FANl+2Vg3LsYGzw1t5i4tmtlWbYDP9Vf0YTbBdGeo4H1qPrHYlObWKWvbxYzLAC2
         X4qe2CLsqPmFSAgpzAquZUlJvWRGkGypxRemURe3NrSEFdOKn/OJSgEl2N4X7P5Cc6Q4
         CVwfBZIbu84YEOg4lPml2u+bRcfEpLdk8RhJ7ILfYwI5vwmnIV6/53sr6JlcBqOGM5PH
         bDCT+jk2NruDmJpJiKZm858+uVjUbuxY9QVbF0pAutxrhGi4ohATa9/WuqANegcQazXU
         206A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cgkBIqWvnVkQ9N/MHRrfLaa6SBKNUc7qvNtHetLnKc=;
        b=KVi8giEHx1XCadhS212YuVCWOUvJQMMK29vxR3vkFrE4/IibOEH4qBOHq9BgLX96t5
         w2WGMnRJj5/Bvx9Dk30VLsv+4gHU7fU/h2Q9QrrCGV5ZtYnfx8ip1COGqic6L/p5gBwy
         6awQUtZLErz0OqX5s+OGbwzaBrRbnrTJyQ4Ux7HzO6OSo+MVw7RBYrpG0h9FPsYcE8cB
         qIWSh+rXEbo6W145ZPg1vkoZfujDQVfsKzMMEZgMHQ0dXRAQZjzI1rCy29D15aDLioLS
         OJmRjI+1JalU87yvfI9uwyA5u8upPGlP8S/OY7O2aZB/ebA6ETEqz2L+TRfB7wb2nLDH
         touQ==
X-Gm-Message-State: APjAAAWHRgQmYFYce3OAmfvdqsiLqQJoRjDD4hZiC8MEMwtqC8DB5gc8
        shu3sTRPeOar40AHWe4jRL1z1dnPkKiPZg==
X-Google-Smtp-Source: APXvYqyLP2W4fkfDJ0bBhSsMguSSPO4YqaLBDbTQuRW7rSo1g028l2jCO3bFuIjHhw9fdpXI7sA+pg==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr18521206wrm.137.1569967332257;
        Tue, 01 Oct 2019 15:02:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 4/7] iommu/qcom: Properly reset the IOMMU context
Date:   Wed,  2 Oct 2019 00:02:02 +0200
Message-Id: <20191001220205.6423-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
References: <20191001220205.6423-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

To avoid context faults reset the context entirely on detach and
to ensure a fresh clean start also do a complete reset before
programming the context for domain initialization.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c8957ec83b92..b4a38ef129e3 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -220,6 +220,23 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void qcom_iommu_reset_ctx(struct qcom_iommu_ctx *ctx)
+{
+	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_FSR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_PAR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_TCR2, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_TCR, 0);
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, 0);
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
+
+	/* Should we issue a TLBSYNC there instead? */
+	mb();
+}
+
 static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				  struct qcom_iommu_dev *qcom_iommu,
 				  struct iommu_fwspec *fwspec)
@@ -267,6 +284,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		qcom_iommu_reset_ctx(ctx);
+
 		/* TCR */
 		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
 				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
@@ -412,8 +431,8 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
 
-		/* Disable the context bank: */
-		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+		/* Disable and reset the context bank */
+		qcom_iommu_reset_ctx(ctx);
 
 		ctx->domain = NULL;
 	}
-- 
2.21.0

