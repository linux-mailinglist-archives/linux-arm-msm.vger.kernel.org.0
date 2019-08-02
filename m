Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B29A7FA31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404745AbfHBNbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:31:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4157 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404695AbfHBNbe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:31:34 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id EAAE5B9637CB28C78B30;
        Fri,  2 Aug 2019 21:31:30 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:31:23 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <herbert@gondor.apana.org.au>, <lars.persson@axis.com>,
        <jesper.nilsson@axis.com>, <davem@davemloft.net>,
        <thomas.lendacky@amd.com>, <gary.hook@amd.com>, <krzk@kernel.org>,
        <kgene@kernel.org>, <antoine.tenart@bootlin.com>,
        <matthias.bgg@gmail.com>, <jamie@jamieiles.com>,
        <agross@kernel.org>, <heiko@sntech.de>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <clabbe.montjoie@gmail.com>, <mripard@kernel.org>, <wens@csie.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 10/12] crypto: stm32 - use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:28:07 +0800
Message-ID: <20190802132809.8116-11-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190802132809.8116-1-yuehaibing@huawei.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/stm32/stm32-crc32.c | 4 +---
 drivers/crypto/stm32/stm32-cryp.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 440c9f1..9e11c34 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -255,7 +255,6 @@ static int stm32_crc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_crc *crc;
-	struct resource *res;
 	int ret;
 
 	crc = devm_kzalloc(dev, sizeof(*crc), GFP_KERNEL);
@@ -264,8 +263,7 @@ static int stm32_crc_probe(struct platform_device *pdev)
 
 	crc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	crc->regs = devm_ioremap_resource(dev, res);
+	crc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(crc->regs)) {
 		dev_err(dev, "Cannot map CRC IO\n");
 		return PTR_ERR(crc->regs);
diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 98ae028..2fe6f26 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -1955,7 +1955,6 @@ static int stm32_cryp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_cryp *cryp;
-	struct resource *res;
 	struct reset_control *rst;
 	int irq, ret;
 
@@ -1969,8 +1968,7 @@ static int stm32_cryp_probe(struct platform_device *pdev)
 
 	cryp->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cryp->regs = devm_ioremap_resource(dev, res);
+	cryp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cryp->regs))
 		return PTR_ERR(cryp->regs);
 
-- 
2.7.4


