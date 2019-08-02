Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C667FA28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404565AbfHBNb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:31:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51126 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404502AbfHBNb0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:31:26 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id BE7269234E05EA62B8D9;
        Fri,  2 Aug 2019 21:31:23 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:31:17 +0800
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
Subject: [PATCH -next 07/12] crypto: picoxcell - use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:28:04 +0800
Message-ID: <20190802132809.8116-8-yuehaibing@huawei.com>
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
 drivers/crypto/picoxcell_crypto.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/picoxcell_crypto.c b/drivers/crypto/picoxcell_crypto.c
index b985cb85..9a939b4 100644
--- a/drivers/crypto/picoxcell_crypto.c
+++ b/drivers/crypto/picoxcell_crypto.c
@@ -1624,7 +1624,7 @@ MODULE_DEVICE_TABLE(of, spacc_of_id_table);
 static int spacc_probe(struct platform_device *pdev)
 {
 	int i, err, ret;
-	struct resource *mem, *irq;
+	struct resource *irq;
 	struct device_node *np = pdev->dev.of_node;
 	struct spacc_engine *engine = devm_kzalloc(&pdev->dev, sizeof(*engine),
 						   GFP_KERNEL);
@@ -1653,8 +1653,7 @@ static int spacc_probe(struct platform_device *pdev)
 
 	engine->name = dev_name(&pdev->dev);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	engine->regs = devm_ioremap_resource(&pdev->dev, mem);
+	engine->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(engine->regs))
 		return PTR_ERR(engine->regs);
 
-- 
2.7.4


