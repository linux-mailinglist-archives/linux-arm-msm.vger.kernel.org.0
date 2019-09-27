Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9067BC01DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfI0JKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:10:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37309 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfI0JKD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:10:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so1839516wro.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDR8RfHxA3WQexjQRU+FhsBkTYfjsmwuWajLt1uR8GA=;
        b=Y8bNJbVlQbl39tIfZcW3jVk+/9O+6GSwLntgWOMqPj/9NwDa3ChW5rWFqV9BwCOFae
         3WZD7xngvggoksBv+cKxhuZPb0k8dC+qpDs7BaLpVdQl+mVCDT4an0IrxdtT0goBVZpz
         +dHoh7zLr98EuEgBymBuuJTtZCj2aRBrwm19BErfXhTZP1H5Hhil6KivdGUsAVi32Kt0
         PeOvUoajW61hX8taMI7nLvRaiGK62PbP3gZ2SBwfwj+n5Ge/096P5k+vlkDDOIb9SnpV
         orSLRAbmJCBX7Tq4JlwjoIGInBs3Ckjq+RWV83hYl2TkqAZQsqkzlQQMyMaulRwb33dk
         +TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDR8RfHxA3WQexjQRU+FhsBkTYfjsmwuWajLt1uR8GA=;
        b=onDd1pRe/I7HKKCmzUyccGktn4NtnFCVD6RwBhBMq62d+HXKMavZwnyNvo4XM9WCLp
         +PVzD75JLevgciHTGVoExOuM3Y+epUPydpr/FjGgXfmOZzeo+WNx1h7vqebg7i7J1/XO
         yGIbLUw33VbDg41yRrqjrsny2HGButuGDARdgG6ho/aqeUpYShEVBC7epojrsSUQpcr2
         FnV15cwe5Kq+T207NaNsCgwcwzJ+FA4oHqCc1SN+4FleoJQOzWG/V6325wVHSUm7V39a
         5DEZzmNYbDEDwOdRQ3tbyu4hh6quPiJV9BZvgFhqwFp3UEcn7N5l+XTddRpVl6w542Qm
         lwaw==
X-Gm-Message-State: APjAAAUaAy+zXOPz/FQnyJJGUixibrQzQxz9Yx+cRX1b2UM8OPP4H2mh
        9JLyGlRvV6HjVntB1EJEqlpfMLjY9+k=
X-Google-Smtp-Source: APXvYqyJa9541jCs1yD3MOTwafEeGgPAfsDWIGMlNcZan6hy5JpLKKLAlfV6HEIY87+9qcoG9buz3A==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr2057383wro.67.1569575398102;
        Fri, 27 Sep 2019 02:09:58 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:57 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 6/6] iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts
Date:   Fri, 27 Sep 2019 11:09:47 +0200
Message-Id: <20190927090947.11175-7-kholk11@gmail.com>
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

This IOMMU is yet another Qualcomm variant of known IOMMUs, found in
Family-B SoCs, such as MSM8956, MSM8976, MSM8953, MSM8917 and others,
and that firmware perfectly adheres to this driver logic.
This time, though, the catch is that the secure contexts are also
secured, meaning that these are programmed by the bootloader or TZ
and their "interesting" registers are locked out, so the hypervisor
disallows touching them from the non-secure world: in this case
the OS is supposed to blindly trust the secure configuration of
these contexts and just use them "as they are".

For this reason, it is necessary to distinguish between the v1 and
500/v2 secure contexts in this driver in order to adhere to this
specification. To do this, add a new DT compatible, named
"qcom,msm-iommu-v2-sec" that will trigger the new behavior.

For the sake of completeness, also add a "qcom,msm-iommu-v2-ns" so
that the human eye gets pleased with it when reading the contexts
in the final SoC DT. Of course, the latter is just cosmetic.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/iommu/qcom,iommu.txt  |  2 ++
 drivers/iommu/qcom_iommu.c                    | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 72ae0595efff..861c0cd9c512 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -36,6 +36,8 @@ to non-secure vs secure interrupt line.
   - compatible     : Should be one of:
         - "qcom,msm-iommu-v1-ns"  : non-secure context bank
         - "qcom,msm-iommu-v1-sec" : secure context bank
+        - "qcom,msm-iommu-v2-ns"  : non-secure QSMMUv2/QSMMU500 context bank
+        - "qcom,msm-iommu-v2-sec" : secure QSMMUv2/QSMMU500 context bank
   - reg            : Base address and size of context bank within the iommu
   - interrupts     : The context fault irq.
 
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 03c68fe9439b..2f65a4cdca78 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -56,6 +56,7 @@ struct qcom_iommu_ctx {
 	struct device		*dev;
 	void __iomem		*base;
 	bool			 secure_init;
+	bool			 secured_ctx;
 	u8			 asid;      /* asid and ctx bank # are 1:1 */
 	struct iommu_domain	*domain;
 };
@@ -281,6 +282,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		/* Secured QSMMU-500/QSMMU-v2 contexts cannot be programmed */
+		if (ctx->secured_ctx) {
+			ctx->domain = domain;
+			break;
+		}
+
 		qcom_iommu_reset_ctx(ctx);
 
 		tcr[0] = pgtbl_cfg.arm_lpae_s1_cfg.tcr;
@@ -762,10 +769,15 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "qcom,msm-iommu-v2-sec"))
+		ctx->secured_ctx = true;
+
 	/* clear IRQs before registering fault handler, just in case the
 	 * boot-loader left us a surprise:
 	 */
-	iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
+	if (!ctx->secured_ctx)
+		iommu_writel(ctx, ARM_SMMU_CB_FSR,
+			     iommu_readl(ctx, ARM_SMMU_CB_FSR));
 
 	ret = devm_request_irq(dev, irq,
 			       qcom_iommu_fault,
@@ -807,6 +819,8 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 static const struct of_device_id ctx_of_match[] = {
 	{ .compatible = "qcom,msm-iommu-v1-ns" },
 	{ .compatible = "qcom,msm-iommu-v1-sec" },
+	{ .compatible = "qcom,msm-iommu-v2-ns" },
+	{ .compatible = "qcom,msm-iommu-v2-sec" },
 	{ /* sentinel */ }
 };
 
@@ -824,7 +838,8 @@ static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
 	struct device_node *child;
 
 	for_each_child_of_node(qcom_iommu->dev->of_node, child)
-		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec"))
+		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
+		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec"))
 			return true;
 
 	return false;
-- 
2.21.0

