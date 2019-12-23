Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A716129A09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfLWS71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:27 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46847 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfLWS70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:26 -0500
Received: by mail-pf1-f193.google.com with SMTP id n9so1726802pff.13;
        Mon, 23 Dec 2019 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
        b=HqLoU5OvR8ugzzxNAKVEVtBkjiqSufaKIUZEDpKdXp94Y/bUt4KrKLTKl5UQqNAl44
         KA1fNRoJ6aNwieatce2GqNLQOnq3UaqeJtl909ctqCyPbdF0LXDmaJcS432q9CSkhn4B
         dtiCTNvUBMjcOk0W2u3xT65sebwLH0CmduWcb75OfItc8DLFy4cAVoitzIDAMhzcNtfg
         Io5nLgK9BvT4faeoz5v59U2R5s86MLJT3XvGKf64+RHwRrSqizeESPFrxInRHcYca0GM
         6LqgvwaDt95S1xY3LDJ6L2k9xpIofsqFoI/ZRs3ID25B6iWoEeKIDGA52xAh1bQzdw9z
         aAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
        b=HU3amjks5bQfXdBjfJkWJcWIL03cd3XgWHZBUhYjZVrvA1FEWEXEy53QSvQTl9tHTG
         g/YJbqswuM8e1sDkVJaIscOa2wdlB0rsgBO7p4OSSvk8FMHG/9Pmv3VdNJC8giM6b9mW
         90hyOlcAygHOOVIw4utH9cmcQMSNYQuWUFeFsZKv31X0cN9TVpbWuNL2FbQ7RlboCjAp
         PLOjRK5aRkQSiyOID9e/TaK/rhDvHZMdHooH5NMxfmXL7XrofTjI+HL7ZxJCp/vLb85L
         93pP8SMgv9lRH4vQmlmlSdom8nYslaLxuNSSE7KTL1lnQYtT1c+3E/lhYqnRarq1nsPg
         Leug==
X-Gm-Message-State: APjAAAW/RYaAuTHEpDU3BO+EoAmyGSfUM3+zg1znNjJ74CssurRVNDnR
        t4WpD0pZivhykaaZFIl6qJtuQybArkg=
X-Google-Smtp-Source: APXvYqzDhJWagEWSF5CD+5+GERxPnQgzx1vAVm8NgEcWmvblC2Ftuyzdp3PuA5nDZwdfH/7PhfYRpw==
X-Received: by 2002:a62:3343:: with SMTP id z64mr32628043pfz.150.1577127565404;
        Mon, 23 Dec 2019 10:59:25 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id u12sm3892956pfm.165.2019.12.23.10.59.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:25 -0800 (PST)
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
Subject: [PATCH 2/6] iommu/exynos: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:14 +0000
Message-Id: <20191223185918.9877-3-tiny.windzz@gmail.com>
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
 drivers/iommu/exynos-iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..42d8407267ef 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -571,14 +571,12 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	int irq, ret;
 	struct device *dev = &pdev->dev;
 	struct sysmmu_drvdata *data;
-	struct resource *res;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->sfrbase = devm_ioremap_resource(dev, res);
+	data->sfrbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->sfrbase))
 		return PTR_ERR(data->sfrbase);
 
-- 
2.17.1

