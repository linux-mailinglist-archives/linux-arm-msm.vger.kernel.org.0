Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8E6766150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 03:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjG1Bco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 21:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjG1Bci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 21:32:38 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377DA35BC;
        Thu, 27 Jul 2023 18:32:29 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RBqq72GQ7zrRhC;
        Fri, 28 Jul 2023 09:31:31 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 28 Jul
 2023 09:32:26 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <liaochang1@huawei.com>
Subject: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Date:   Fri, 28 Jul 2023 09:31:47 +0800
Message-ID: <20230728013148.1720978-9-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728013148.1720978-1-liaochang1@huawei.com>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the dev_err_probe function instead of dev_err in the probe function
so that the printed messge includes the return value and also handles
-EPROBE_DEFER nicely.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..9021b8064ae4 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		sizeof(lpi2c_imx->adapter.name));
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");
 	lpi2c_imx->num_clks = ret;
 
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.25.1

