Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25108C399A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389755AbfJAP44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37729 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389730AbfJAP44 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:56 -0400
Received: by mail-wm1-f68.google.com with SMTP id f22so3837049wmc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cgkBIqWvnVkQ9N/MHRrfLaa6SBKNUc7qvNtHetLnKc=;
        b=LgHSlTJtM6cK49Al1Z12BQ+7Ier1q5prnBaqn1S3RLrKU/T3qh6vHmdePSmc3lGQtf
         Goah4jYL7Tg1wDAUGk+I7aVapLc5so3swNqB2NEkMK5hWUt+Surd4uDMTzMKtvn9UqTp
         8y0DSIh/gAb95dD/RSzAQ2eOPE/6gPTElFbYnn0h9uCSu8bo1TJrS6lBmUip524qCSWU
         4pRL6aRUPspYO1HojLppoVIASv3O7fXSWuXMH/sPJ8Ag2/MJZEgpm7bbzbutR1GwVZlt
         t7Ca2zAM4RlfWRqxTKEHXvfHp8FWhVL1t/TMq5hrDOdGtKfbIi+370Iu8GHa7ifnF7Nu
         XUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cgkBIqWvnVkQ9N/MHRrfLaa6SBKNUc7qvNtHetLnKc=;
        b=gTgVXiYOkNgXGqLjwGWdxLDtSwIYzTnL5pmZ9lHdOVP1k+Sy7epKv7Ddx/0DDiyh5o
         B8lufXLvR1L1xuXlbXPColNWfoVy23HW93v7JuE1IxCVmc/jyW/GMiD6mhBjPiVTNxVx
         8cvJ1XYipCw4Cjt3N3Wh2/ZHMcEEVYItxmGEJf/FTZdDqa73FzQ/6GR4G3Y3RxaU0RwS
         AXUh/9FfBJJ3CCK9H1VyiAJvgesbi/lpcyjK7PvclSzvU4w3Neaz2NZ4ltp1hpKqBAmm
         J0sixQI7KFVuyTb3G30bDqb5wkDSpjBriYiuNDUFIkiujdvJ3C2ILu5jv+Gi9Skkdlvw
         ig5w==
X-Gm-Message-State: APjAAAX9N4T2PATYHZH6eRVpiILeYD+2ZJcCk6QwgsnB5XnzsPz2nW4i
        ztz4UfOEpDlxK2a9zYPSiH0PuC8gr5IGfw==
X-Google-Smtp-Source: APXvYqw9YakoyUGtMa2OVJLxprPkitOKXvxCKUMc+ka7ce13jXusaTSuhmRvS+qox3IhiSpWQdFHMA==
X-Received: by 2002:a05:600c:238a:: with SMTP id m10mr4675523wma.51.1569945412138;
        Tue, 01 Oct 2019 08:56:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:51 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 4/7] iommu/qcom: Properly reset the IOMMU context
Date:   Tue,  1 Oct 2019 17:56:38 +0200
Message-Id: <20191001155641.37117-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
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

