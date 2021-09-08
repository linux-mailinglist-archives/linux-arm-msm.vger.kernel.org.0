Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0644034D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 09:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347520AbhIHHK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 03:10:59 -0400
Received: from mx20.baidu.com ([111.202.115.85]:54928 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232308AbhIHHK6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 03:10:58 -0400
Received: from BC-Mail-Ex16.internal.baidu.com (unknown [172.31.51.56])
        by Forcepoint Email with ESMTPS id 349EE15A96DA0F9E3D0B;
        Wed,  8 Sep 2021 15:09:41 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex16.internal.baidu.com (172.31.51.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 8 Sep 2021 15:09:40 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 15:09:40 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Niklas Cassel <nks@flawful.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/6] soc: qcom: ocmem: Make use of the helper function devm_platform_ioremap_resource_byname()
Date:   Wed, 8 Sep 2021 15:09:26 +0800
Message-ID: <20210908070930.214-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908070930.214-1-caihuoqing@baidu.com>
References: <20210908070930.214-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/soc/qcom/ocmem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index f1875dc31ae2..d2dacbbaafbd 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -300,7 +300,6 @@ static int ocmem_dev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	unsigned long reg, region_size;
 	int i, j, ret, num_banks;
-	struct resource *res;
 	struct ocmem *ocmem;
 
 	if (!qcom_scm_is_available())
@@ -321,8 +320,7 @@ static int ocmem_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
-	ocmem->mmio = devm_ioremap_resource(&pdev->dev, res);
+	ocmem->mmio = devm_platform_ioremap_resource_byname(pdev, "ctrl");
 	if (IS_ERR(ocmem->mmio)) {
 		dev_err(&pdev->dev, "Failed to ioremap ocmem_ctrl resource\n");
 		return PTR_ERR(ocmem->mmio);
-- 
2.25.1

