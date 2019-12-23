Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D51D129A27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfLWS7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:22 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:56050 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfLWS7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:22 -0500
Received: by mail-pj1-f67.google.com with SMTP id d5so139163pjz.5;
        Mon, 23 Dec 2019 10:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TCR4AR5ucUHlq9yNJFguI2NxlI68W/tsOUZcT+YMNl0=;
        b=eb4L4pil+JCG+cmdA0+Y497EM/NtrHh8JtUYUrydX0icSwue7g/LT7YybIYtTTcV/M
         MDaDFzfK3rGsshR2RJN/EE3X86kt4E4btFV3briwaxtCutIASq/3rWfK0hgKIeBr+pCL
         1DrjLmswrvXHxs3IvDOhgMcK+NehUow+N4Tv6eZIfMecsqBWCVjOwfJB/B9FMksOPQ/b
         fk3OA/ihwGFJVxTedK7BuI7EMQMK1YysKr8bZUBHso5sGbkgqhpLR2KssbBPoVEOEyug
         qB+K4Y29piISqu3qBMy6P1HWvW8dFPImPXFO3HIM7wgp0lRloRUfgj2KHzIbucnt9eu/
         uC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TCR4AR5ucUHlq9yNJFguI2NxlI68W/tsOUZcT+YMNl0=;
        b=U9Y7nV/SY6xQBlPC97tb8MnkxZBWS/o/pECUDfaZsMimPjH/nsM+yqMC37TtxKupIR
         9eQ/GbPAV0Dw9x89c9P8dOXn6XX0ivvCPoz+m/UvHCiKJEiPQR0BubuPo0i0cysTOzTi
         Ia9Zra1B2+Y9Km5gAbIY+kRhAFj3FSUBkz5fEkx+PjC8ghagmq9Oa3Dw1aCOHG8IHamw
         DhCO1m7+Bp9zjJfCV2562B27bKamL/jwpcJ3/7JdFbTs/ESfjB9NasJsIsprpnpBKGKV
         aWUBrB8IybDOCgmVbnH5MvqrbK8YUj4oBNbev4nwcJEU1OUXMqI99EuVvFPKITmYIwlU
         JTyA==
X-Gm-Message-State: APjAAAWTJDrYvrL3cUck96A+WT7Fp25g6raGd/twJqqIQBVDCySF7+SL
        Dz+VVyvUkXArOw51PFjV9x4=
X-Google-Smtp-Source: APXvYqz84TR8y+QXxgUTlt23B6h//l3KypRdsMB1YXrNQMBidJsu/m2w0mjr/wrZCM0wu9iBN7SuOQ==
X-Received: by 2002:a17:902:b186:: with SMTP id s6mr32565870plr.333.1577127561141;
        Mon, 23 Dec 2019 10:59:21 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id r62sm25858012pfc.89.2019.12.23.10.59.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:20 -0800 (PST)
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
Subject: [PATCH 1/6] iommu/omap: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:12 +0000
Message-Id: <20191223185918.9877-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/omap-iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index be551cc34be4..297c1be7ecb0 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1175,7 +1175,6 @@ static int omap_iommu_probe(struct platform_device *pdev)
 	int err = -ENODEV;
 	int irq;
 	struct omap_iommu *obj;
-	struct resource *res;
 	struct device_node *of = pdev->dev.of_node;
 	struct orphan_dev *orphan_dev, *tmp;
 
@@ -1218,8 +1217,7 @@ static int omap_iommu_probe(struct platform_device *pdev)
 	spin_lock_init(&obj->iommu_lock);
 	spin_lock_init(&obj->page_table_lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	obj->regbase = devm_ioremap_resource(obj->dev, res);
+	obj->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(obj->regbase))
 		return PTR_ERR(obj->regbase);
 
-- 
2.17.1

