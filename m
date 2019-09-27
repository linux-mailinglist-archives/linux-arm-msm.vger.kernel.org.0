Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEABBC01D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfI0JJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:09:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46145 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfI0JJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:09:57 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so1791805wrv.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
        b=hxcwnRY5g2OErPiFxaUbfpFJ9ctrTXDnVSdUZMnMZvpc8R8xWk4a6yuR39Opn2wQSe
         Rdlzb8HPdc3gRHtaj+NqJs9bZk7WBwaP5kKacF96siA2aUlxGCuP9r56DBAJ2jrtGfnq
         uMWLNMWhB9oiZ25tBNsb1hHy9N50w+aROulTz2StTEQvQf6ggFVqPDYBfaoGW+sUXkwo
         a9JbjuwTjG9MOGK0aY0zKqc94aTWRf3YmlUjkJTj8M+R+fOQFTZRQ2a8ROcvv3KAElDB
         8e+goYRjmYZ8F3BjxfwDz7te5jw5nLahiFImgHPchtnkRJ/gpYCmqHQi7IT5zZqBk4xE
         AdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
        b=PhwzRbXdROg4nl2TeVzyDgkkoR0QsP2ZgzHzPbv4SJzrSjuLlOSZWc/mcnwjyccWPe
         n8hDppxpsXBC5xv+pGgvtqI5pKiA+cOejELPKHg0a2zU+LREJBzID+L+20PUWPfYwRxk
         UsUvVlKyBtcpXSQ9OOYZ0YAjFgrzzqNa3ROXWX5brk49EL8trdRVZnv6+ZAOwfD8K5Oq
         UqxZtY5V2r2GcoMyHsRv3oIRm4SSwBgoKifDZOGoRpgh3/pc/qjZcmlXvvCk3hMIfi8v
         +EjsRRYUERkgl39L76bkykwkqt0OOMQ6yTv26XS8xFnVdMrboqjibyZM/eEHL47jKBul
         FQZg==
X-Gm-Message-State: APjAAAX8rUAeIOHesPtfhGdxDQvWgPbR9bV6Te7htzai0c+BkDZu+DEN
        IpbJYz1SlQFcWcvH5ePE3HWELZppVi0=
X-Google-Smtp-Source: APXvYqwB//2FykcH09Wh56p9ftThgdopQyr4u9pGWP1pbEIfcWkZ3VzhVpLpY4C7MADtO6X9CgEkBQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr2071587wro.83.1569575394957;
        Fri, 27 Sep 2019 02:09:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 3/6] iommu/qcom: Properly reset the IOMMU context
Date:   Fri, 27 Sep 2019 11:09:44 +0200
Message-Id: <20190927090947.11175-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927090947.11175-1-kholk11@gmail.com>
References: <20190927090947.11175-1-kholk11@gmail.com>
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
index 8431fb97a50f..2f31da2e7add 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -198,6 +198,23 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
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
@@ -245,6 +262,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		qcom_iommu_reset_ctx(ctx);
+
 		/* TCR */
 		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
 				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
@@ -390,8 +409,8 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
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

