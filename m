Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6935F7FA23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404484AbfHBNbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:31:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51796 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404401AbfHBNbU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:31:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B33919A8764F3C62E15B;
        Fri,  2 Aug 2019 21:31:17 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:31:11 +0800
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
Subject: [PATCH -next 04/12] crypto: img-hash - use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:28:01 +0800
Message-ID: <20190802132809.8116-5-yuehaibing@huawei.com>
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
 drivers/crypto/img-hash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index d27c812..f5a71fa 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -958,9 +958,7 @@ static int img_hash_probe(struct platform_device *pdev)
 	crypto_init_queue(&hdev->queue, IMG_HASH_QUEUE_LENGTH);
 
 	/* Register bank */
-	hash_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	hdev->io_base = devm_ioremap_resource(dev, hash_res);
+	hdev->io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdev->io_base)) {
 		err = PTR_ERR(hdev->io_base);
 		dev_err(dev, "can't ioremap, returned %d\n", err);
-- 
2.7.4


