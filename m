Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79389BF274
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfIZMFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33305 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so2470505wrs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MOsVaiINRsQWi6qw1udz6Ri8temeMMS+LWwbQK7C8b8=;
        b=Y3QJp0WsN3oMzWiNiQaGbg0PlhKzNmGO4xOJsBPQzCTBrhcy2Fxu0zkMteZG0XCt7F
         AB77+7fPlGCtsSVdS9KOBWPZD7ydTbFUMv3/mz9i2B1ixi3p+avOkBhHycZI5ZU5bYBV
         uSD09cUlmKKcUgbMaYeEDqr0xP7HbIPh5/EUAfJJqiEtx0Ci/sPafM2Yl7aAYKVZ1ACz
         Q1HN6b6X/yVRWIdU8P68lPbmDJuvoHXRUHPp+Ucoe0XbfJdFqJn+9y/WayoWcxlo/jYg
         3qDaQ5yLId4OhHLGlfAKi1eO5gfebPhpcNukRPR1qkrP/5/V9QL7/y0Az4lHE1Fnm3Kz
         x3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MOsVaiINRsQWi6qw1udz6Ri8temeMMS+LWwbQK7C8b8=;
        b=h9nJdVOjYWKAVNpQ1kTqSAn5ADAzMU/qa2EndWqMDJx6MLfeyu6OcaxnWmnNtCWTqT
         HkiSn1neRcKjS3/YX/cQq5Uj/mc/hl1JZZPm3Zl9c68vqfMqgLBwyOQSPE3UUj+1iBql
         aJsTVApV96DVDAtVy4RmRcgLvARe4VIH44IMtfc8vC9F3eYJO2cZfJb4ep6aNTNdxJW0
         a3HcZ7Va156QbB2qOEAbeyboTsf4/6odetfrdq03Vd/iu94+9lmink54+40jDpO0o9PQ
         fByq7whabsZ6+PfdWq3fhoRlR6UxrSQwx1mc3OwnTGHvY4J077Mo0liPrleZ6TT1jUts
         vRaA==
X-Gm-Message-State: APjAAAUYLL+07zdZmg75Ej4GsZ1iQyv/2JN+9kBU4wHqcg5mGZoP4hUx
        GrYMjJKttDNbMIvsIVbC1sU+2H98WtE=
X-Google-Smtp-Source: APXvYqx7wD+ZGQZkH/FkOlgTDQOFFXVBpRCAr3zs2vWK/gYIxmLmVH17JL+DgYXfDGR43YDUXPPLLQ==
X-Received: by 2002:adf:f081:: with SMTP id n1mr2904579wro.273.1569499520399;
        Thu, 26 Sep 2019 05:05:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:19 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 1/6] iommu/qcom: Use the asid read from device-tree if specified
Date:   Thu, 26 Sep 2019 14:05:11 +0200
Message-Id: <20190926120516.4981-2-kholk11@gmail.com>
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

As specified in this driver, the context banks are 0x1000 apart.
Problem is that sometimes the context number (our asid) does not
match this logic and we end up using the wrong one: this starts
being a problem in the case that we need to send TZ commands
to do anything on a specific context.

For this reason, read the ASID from the DT if the property
"qcom,ctx-num" is present on the IOMMU context node.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
 drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..98102b323196 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -38,6 +38,7 @@ to non-secure vs secure interrupt line.
         - "qcom,msm-iommu-v1-sec" : secure context bank
   - reg            : Base address and size of context bank within the iommu
   - interrupts     : The context fault irq.
+  - qcom,ctx-num   : The number associated to the context bank
 
 ** Optional properties:
 
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index dadc707573a2..5837556af147 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -557,7 +557,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	 * index into qcom_iommu->ctxs:
 	 */
 	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs))
+	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -665,7 +666,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 
 static int get_asid(const struct device_node *np)
 {
-	u32 reg;
+	u32 reg, val;
+	int asid;
 
 	/* read the "reg" property directly to get the relative address
 	 * of the context bank, and calculate the asid from that:
@@ -673,7 +675,16 @@ static int get_asid(const struct device_node *np)
 	if (of_property_read_u32_index(np, "reg", 0, &reg))
 		return -ENODEV;
 
-	return reg / 0x1000;      /* context banks are 0x1000 apart */
+	/* Context banks are 0x1000 apart but, in some cases, the ASID
+	 * number doesn't match to this logic and needs to be passed
+	 * from the DT configuration explicitly.
+	 */
+	if (of_property_read_u32(np, "qcom,ctx-num", &val))
+		asid = reg / 0x1000;
+	else
+		asid = val;
+
+	return asid;
 }
 
 static int qcom_iommu_ctx_probe(struct platform_device *pdev)
-- 
2.21.0

