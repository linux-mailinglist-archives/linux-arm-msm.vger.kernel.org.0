Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532AD7FA2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404659AbfHBNbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:31:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4156 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404534AbfHBNbb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:31:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8921D36A4EFDC54AC5A2;
        Fri,  2 Aug 2019 21:31:25 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:31:19 +0800
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
Subject: [PATCH -next 08/12] crypto: sunxi-ss - use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:28:05 +0800
Message-ID: <20190802132809.8116-9-yuehaibing@huawei.com>
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
 drivers/crypto/sunxi-ss/sun4i-ss-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/sunxi-ss/sun4i-ss-core.c b/drivers/crypto/sunxi-ss/sun4i-ss-core.c
index 2e87042..9aa6fe0 100644
--- a/drivers/crypto/sunxi-ss/sun4i-ss-core.c
+++ b/drivers/crypto/sunxi-ss/sun4i-ss-core.c
@@ -225,7 +225,6 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 
 static int sun4i_ss_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	u32 v;
 	int err, i;
 	unsigned long cr;
@@ -240,8 +239,7 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 	if (!ss)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ss->base = devm_ioremap_resource(&pdev->dev, res);
+	ss->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ss->base)) {
 		dev_err(&pdev->dev, "Cannot request MMIO\n");
 		return PTR_ERR(ss->base);
-- 
2.7.4


