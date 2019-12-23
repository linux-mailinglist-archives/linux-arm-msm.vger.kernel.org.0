Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D003129A25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfLWS7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:36 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54131 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLWS7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:32 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so143598pjc.3;
        Mon, 23 Dec 2019 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CulQ2ExP6GUQxiub5iNVhoHCStywwXMifBLq7s/S0pk=;
        b=H2OtLypZu26xwRAoHkfmTQ6dLHQpJJ15epMWHv3JdQQs1xiDmnIbBvdX5p8SoP63NR
         rrDwAR1ojV5CKjmV4nursw0hSVhDYhezg4aNZc5/7bKtI/xLNTNVESyeUS1ReQ8QUzXY
         UjlHZSp+USG1XCS3YJhbCo1epwt7/p+HAmwZbHV1DoyKW2mpH2yxt1RhlPTT+H9cqBOw
         AY8x17GodBM0jTcLq3+6EoR945XlFBUaoGwXYyPAfUphbu5u0bI6unawWUIQHMkgTvTe
         PovOlROY679qDH1MfZR1zkp55JOxaXvP4G4yILAA2rFEV19iB/YsqSyFWlKbgPCqziiM
         1imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CulQ2ExP6GUQxiub5iNVhoHCStywwXMifBLq7s/S0pk=;
        b=mNKjC5JdBBBo96tgPz75a/1FJxfLj9T6Lmb/T3k7flOFfr9s6Lx38ma4ch1b5py/f8
         QvLiOejAAMzCPDRJ/Mby2l7IjGClhS0OC03MDx6Rwrd/RXWOlEpwOdErD6Pg8/r4BDc4
         SFca9s0Z9IbWEDnPRhJVMUKmgJ10oTEqpY2xmYtYsizZnuVq8OEYj5it4Hs8ONWWaHia
         5HYkb5aUUl/gi9Oi7Bz9xYlSTF+9eMO+kpftzoLuUOPJIMf1acfApATLYQAxM/fHWezb
         +NH1ax+X72Z3He7B8OGL962uN3X+YMYJJx7AfWS6J8KvLnfUHsBh5+KuZYNaEZp+o5EQ
         i2Qg==
X-Gm-Message-State: APjAAAWoIZXakyWYbdK0BOw0zqXBB2G0Ssrk8KoLh8VlG843nM6jaDh6
        nE14IK073bTJsjvv+hVutrA=
X-Google-Smtp-Source: APXvYqzeiLM4mhrhwEk4S029shHvVfQZIjFYMq3cAbFIsqix9vo2bHpZaR9lUgguOerS7aVYGUejXg==
X-Received: by 2002:a17:902:74c5:: with SMTP id f5mr30567441plt.229.1577127572024;
        Mon, 23 Dec 2019 10:59:32 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id a19sm209212pju.11.2019.12.23.10.59.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:31 -0800 (PST)
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
Subject: [PATCH 5/6] iommu/mediatek: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:17 +0000
Message-Id: <20191223185918.9877-6-tiny.windzz@gmail.com>
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
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index e93b94ecac45..3d6bb08b2a54 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -553,7 +553,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 {
 	struct mtk_iommu_data		*data;
 	struct device			*dev = &pdev->dev;
-	struct resource			*res;
 	struct component_match		*match = NULL;
 	struct of_phandle_args		larb_spec;
 	struct of_phandle_iterator	it;
@@ -573,8 +572,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->base = devm_ioremap_resource(dev, res);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-- 
2.17.1

