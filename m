Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307562D9936
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 14:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732436AbgLNNsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 08:48:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9204 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgLNNsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 08:48:11 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CvjNX5XC4zks1j;
        Mon, 14 Dec 2020 21:46:36 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 21:47:15 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <joro@8bytes.org>, <will@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] iommu: msm_iommu: Delete useless kfree code
Date:   Mon, 14 Dec 2020 21:47:46 +0800
Message-ID: <20201214134746.5044-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The parameter of kfree function is NULL, so kfree code is useless, delete it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/iommu/msm_iommu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 3615cd6241c4..1286674a1322 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -319,7 +319,7 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-		goto fail_nomem;
+		return NULL;
 
 	INIT_LIST_HEAD(&priv->list_attached);
 
@@ -328,10 +328,6 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
 	priv->domain.geometry.force_aperture = true;
 
 	return &priv->domain;
-
-fail_nomem:
-	kfree(priv);
-	return NULL;
 }
 
 static void msm_iommu_domain_free(struct iommu_domain *domain)
-- 
2.22.0

