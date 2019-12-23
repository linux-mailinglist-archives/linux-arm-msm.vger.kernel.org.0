Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEBB1129A0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLWS72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:28 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37150 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbfLWS72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:28 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so149308pjb.2;
        Mon, 23 Dec 2019 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bLznaHMy4KKZ0cyTMqudvu5r2Rqk/jELD1oKLNSR2dU=;
        b=RjgIjnGy+JvVdj2w8xB8Td7Jcp/uaEDjiyOG1FJNw7ItOBOMlDiBexx/UkW6dkkAGm
         voY0QC4zCFHaNyKdZbneErqsNlEEsUkH+mUTUEX4IGwRuLutautx5/QiGR7Dg54OfMF4
         Pzd2xf3gtJb7iLRKy3oLhDhaoannVg2g07KyLU/4m8Tg9yffQkks69i7RNV4T7iLy6Dw
         leXWNSpzbps7unh9oz1fwH+msb7iJL7CO2jLuJIISG1WX9/pxpG18Yu7So73y4H8ZtNa
         74d58L/NAst17PBprENwJOgzCuTFMGvNh/uHdQUQxylZpO1+sNfkhBafPyxxAqhwGPS0
         uB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bLznaHMy4KKZ0cyTMqudvu5r2Rqk/jELD1oKLNSR2dU=;
        b=evNxMDDKKycYBgs+NZJ8htDJPjne26ZZnI6PLp6unplTH7K4xigOe5r9dZwHkw9DAq
         ndbZvGUaMytBxJ6B9jvhyN075UwVPVyzi+Fi9glZMx1iQjpgXXKitBlKgETLACS6/J0W
         +nWdihzOPfk3vOxqz7jr5UVKsbnWgHHGc4M7ZseMomtAfEVcB+JI3x7qpXYKPBo+qWDh
         JSNmFMrYcG6p3JvkDZFnmAkETFcQv3qHYOFnIYpGxBCEL6On02E4dCIhds6zQqnjugWK
         uIJwEkUirdbty1/DEYAo4LRV9/lKFXkKH/ky5rR5CZre40JSxc0hfoUQvuNDb/UtQrCv
         15mg==
X-Gm-Message-State: APjAAAU8aOqtTWMOLHsG4XN1kQ319pd7Gohoa2c1tprENWH/7lo3GDhf
        xESx+O4WI5TzG6Zur9XELa4=
X-Google-Smtp-Source: APXvYqwSmasDf38gpvZQ5kYkHfbJ9oeF2AFKtP2Fehgro57BEHYXKQsly+hr8s0/HHHdkDEArOHtIA==
X-Received: by 2002:a17:902:b788:: with SMTP id e8mr32700948pls.1.1577127567423;
        Mon, 23 Dec 2019 10:59:27 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id x4sm25703139pff.143.2019.12.23.10.59.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:26 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
        krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
        mst@redhat.com, jasowang@redhat.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        virtualization@lists.linux-foundation.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 3/6] iommu/qcom: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:15 +0000
Message-Id: <20191223185918.9877-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 52f38292df5b..bf94d4d67da4 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -709,7 +709,6 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	struct qcom_iommu_ctx *ctx;
 	struct device *dev = &pdev->dev;
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev->parent);
-	struct resource *res;
 	int ret, irq;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -719,8 +718,7 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	ctx->dev = dev;
 	platform_set_drvdata(pdev, ctx);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
-- 
2.17.1

