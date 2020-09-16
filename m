Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8C326C993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgIPTNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:13:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12763 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727383AbgIPTNd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 15:13:33 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 935D8DFE62249CDE7127;
        Wed, 16 Sep 2020 19:08:25 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 19:08:24 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] soc: use devm_platform_ioremap_resource_byname
Date:   Wed, 16 Sep 2020 19:15:17 +0800
Message-ID: <20200916111517.99670-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/soc/qcom/llcc-qcom.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..70fbe70c6213 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
 static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		const char *name)
 {
-	struct resource *res;
 	void __iomem *base;
 	struct regmap_config llcc_regmap_config = {
 		.reg_bits = 32,
@@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		.fast_io = true,
 	};
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res)
-		return ERR_PTR(-ENODEV);
-
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource_byname(pdev, name);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
-- 
2.17.1

