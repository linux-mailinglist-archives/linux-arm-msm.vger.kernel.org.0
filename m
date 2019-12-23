Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF02F129A24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfLWS7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:36 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41949 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfLWS7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:34 -0500
Received: by mail-pg1-f195.google.com with SMTP id x8so9234033pgk.8;
        Mon, 23 Dec 2019 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5ZbWphWmX6hvFuVRk+RWFgQofrZKH9eYm1th2d0tMTE=;
        b=sj3ScPvYKe5RHFI5xmOOMlBPRjGR/tgOjWkESOKIqqPmaDssnIshdfvUqClYJX9tBI
         aWTj09Nymr7gywt/h1PZWcO4ZCSrk4jUIfNb9EczsWNEBsdXnKKNITMxCjyYVu+s19l7
         YAXAq4G5jR40lkSkK0YEvsK99KKl/GnrZZaTiZ3SpESVNG2IP5Ulkq1MmJRItVOmbX6v
         XMrllxsXefXzoO2sZFtT//QIbDgjkg0TqQCyXeh2aZuxSrgKCrkqi5gQmYuZ8AUI75qV
         YnI+G38Iba0W+Ixlv9IzdrnX4eE2J66bcVf5qNE5uqUZPU3l5fAfYo7YPXp3fl8fFIqR
         lw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5ZbWphWmX6hvFuVRk+RWFgQofrZKH9eYm1th2d0tMTE=;
        b=J+SLzP1pNZlqKJyp8Eu4ZLuqJcmYs2FHj07OAOMAkKzrUjAdVzC2uBPse68XIM6JXY
         7fwRVBMNJCPiXZ0DYXB/Yfmp6XJ2N5gkRW7ALavqImF+axBxfksKK6kUbQVqTamy0O2M
         UGGeogHyYdAx6i9kUJcWW5T22LWD7FTco5hPansjSkzuxmkZV6S0cwHYBJKRvdaoOmDK
         C6wYlbzE+pZISQUnn3CGHAAiwYLInuWNngmDNibbFucbQojSR/VusQlB8i1JFWOzyBFD
         Rvjlghw1ByNm4C5Yxfp3ksiRGsj/YK5w7pr1usIaX3zsxCRu8m0knkzOKhVRv7Ygs5fH
         oHTA==
X-Gm-Message-State: APjAAAX1mH/8AiFIKVm9bbud2jpDIoocyHI8mmTZO1o2/a6ut92ywPDG
        kVkycrgVCNZyiE/EW7Mt6so=
X-Google-Smtp-Source: APXvYqyfnDFqyHRd1X6VzN2h1ANIGyik0u9/k4DGw0m2HkGzu2Jgf7Z0vBWv5sTHp/iv1nwqNbTz6Q==
X-Received: by 2002:a63:214f:: with SMTP id s15mr34495783pgm.238.1577127574002;
        Mon, 23 Dec 2019 10:59:34 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id d5sm21091646pfd.107.2019.12.23.10.59.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:33 -0800 (PST)
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
Subject: [PATCH 6/6] iommu/rockchip: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:18 +0000
Message-Id: <20191223185918.9877-7-tiny.windzz@gmail.com>
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
 drivers/iommu/rockchip-iommu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index b33cdd5aad81..c6d50396f4c2 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1138,7 +1138,6 @@ static int rk_iommu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_iommu *iommu;
-	struct resource *res;
 	int num_res = pdev->num_resources;
 	int err, i;
 
@@ -1156,10 +1155,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < num_res; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			continue;
-		iommu->bases[i] = devm_ioremap_resource(&pdev->dev, res);
+		iommu->bases[i] = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(iommu->bases[i]))
 			continue;
 		iommu->num_mmu++;
-- 
2.17.1

