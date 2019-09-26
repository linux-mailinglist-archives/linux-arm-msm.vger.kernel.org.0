Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5676ABF277
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfIZMFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33309 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfIZMFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so2470591wrs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
        b=KvyXExCFYgZX6hiDrHxGgq7np5TAMGddN73hQ6wryiTG4y5Mij4z/kcZIRTTRtzUd9
         uON0HxTM/e3O51l7EaEoTbN9wj57ajBfY6efnOeH8Fe2rGJGCp4wayoFCk/BsxPVxY+E
         LrYInqLWz2fuTBz4o/G44hswvp/36Mu9+85VkxdJPQEYrpycFYJtToFpSyXOy3AXKxpY
         HD+sJbHGN1Ms1yWN6kJt5V7OSVsl9xgFLhWUDCDF6vrbRdKnMYYjBjtzBQ1tYscj1NEo
         ww75zAnzZGKxFMKRCKW8rxTKHYhzZLqyne95j9OfyYqFTNV+RbWSyzh5FztrbqYZUfaB
         YVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
        b=JvBYVq+mj/66iviID5GVUyJ//zChJMdtH8+z7TWe/DxwFzC9WZJlbF10HCTo6NEsyY
         YOin0nZdxz3IFjFE2VDY0KZgAqs1eEaOMQz97Q9dRdefpCXbT4Yi3BxTG1urDVgODsvo
         SK2nOfsoHJj+0OcOhEE2ypoQ/c+p9t6naS85dSig/78xEWj0AhHl8OaY/j+JVv1oAXJC
         7YO2wVzDspxOd0ZNHax0qYq71k5r5oAmGRUiH1sSvCFi39DrYS1M+xiAbjKn0qE2LQhI
         yVVXZuU1RpuCCMllIXVJAop4kH6zE60SOGqOm90F3zjc98gnAxPxVs2YLtNQJW5pl/Wd
         oaFw==
X-Gm-Message-State: APjAAAXeZzycPJ7SsgzC0k7SFiVAZTa16Cr4WiWzZS6JrU8pGk00LPvI
        JPnwPlbPEN+m5t7+iG0S++DG0YZJ3W4=
X-Google-Smtp-Source: APXvYqz4S+fUrzO5k8RXSgTfSI56EHZkCQoE681+xglSQMvATlcFp3o/C3o/mCebzXaw9AWE/XoHNA==
X-Received: by 2002:a5d:6451:: with SMTP id d17mr2985861wrw.260.1569499521912;
        Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 3/6] iommu/qcom: Properly reset the IOMMU context
Date:   Thu, 26 Sep 2019 14:05:13 +0200
Message-Id: <20190926120516.4981-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
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

