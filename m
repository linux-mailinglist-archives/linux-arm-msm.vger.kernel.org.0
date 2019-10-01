Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23479C399D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfJAP46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40168 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389749AbfJAP46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id b24so3814221wmj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hNjIRfETItHrHAwc5fX92U90M7+/WUq/4UckUIkwrKY=;
        b=G8LV0yqz0/7wpieIGxNYSdqop3flOifTawe8gjYNoU94tIFrlXcnUj3In0WrJ/wdp5
         VQ9cyacalBh9d2zHkevulhWmqoNzqVjfNfHuLvNty86B3RuLm7e3Mr6CUADfUDt9/4rh
         ElTOHvJYSAMcl2KiGc1CLnz1bo9A/FAyQkqhyYjX2VnU86puYiMAwPNtAeGBJLDs4W+V
         /Sg/PP3EdmdOFSpdtQDiXNrgGwij23q0uivTY+S2zov015zKUuhEjU2clxOWGo7kcW/+
         nidSwZWD3u4KX7A2YkeACrF7z0Qfjq4/vXNF8B/QWHpAcxvDs81Olc+X0A6qy8Ku0esF
         KYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hNjIRfETItHrHAwc5fX92U90M7+/WUq/4UckUIkwrKY=;
        b=HDOsV1NQmHq6dCgBfr/UUJT+hXfXDVr/F5pAedp+0rbQTyDOZisF9IhHgXv9WlI1qL
         t9aCQXUgRT7vwqutxjYnZrByNfUpEoMpqLRHRUBNSwYcK4YoZJUtGuXBfEaiR9ySX4fd
         lS6OIp8XaAKoQc4nMptSsS8YKxdUSajhsdgqWGmrwRU1En/NblMIR0yxVcB2xBGwPyrI
         7IovvYKo5OtwK3/C3ov11VH0SMdj2TwoG/FvPoLkkM+Emyv+M6m0Ft0ErAwewRzoIkJl
         A+iJwJaQfKMnzSG8Wyol/Hg889C8y/BHq2o7KyUfVnI8pDlwYxatNdn2VMYRyczJmjNW
         DSwA==
X-Gm-Message-State: APjAAAUeYIlnqb4BuCaTJOzoVEhjVtN+Ei9rQA4vbuaBb5aS+l1T2tM6
        S0o1+vMdxBJZPfmUjTtwvo7K51Zw03monw==
X-Google-Smtp-Source: APXvYqx8PnIeAQsmG0Lb0jl1J7pgyjxNk2QYamMWU7XansZtVzuzg1wCO8eZYi/ndnKurupThHzGyw==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr4332465wmc.92.1569945415237;
        Tue, 01 Oct 2019 08:56:55 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:54 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 7/7] iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts
Date:   Tue,  1 Oct 2019 17:56:41 +0200
Message-Id: <20191001155641.37117-8-kholk11@gmail.com>
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
index 555cbc55b073..eaecb009849c 100644
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
@@ -303,6 +304,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
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
@@ -788,10 +795,15 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -ENODEV;
 
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
@@ -833,6 +845,8 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 static const struct of_device_id ctx_of_match[] = {
 	{ .compatible = "qcom,msm-iommu-v1-ns" },
 	{ .compatible = "qcom,msm-iommu-v1-sec" },
+	{ .compatible = "qcom,msm-iommu-v2-ns" },
+	{ .compatible = "qcom,msm-iommu-v2-sec" },
 	{ /* sentinel */ }
 };
 
@@ -850,7 +864,8 @@ static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
 	struct device_node *child;
 
 	for_each_child_of_node(qcom_iommu->dev->of_node, child)
-		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec"))
+		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
+		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec"))
 			return true;
 
 	return false;
-- 
2.21.0

