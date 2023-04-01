Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADC26D328F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 18:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjDAQUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 12:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjDAQUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 12:20:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC4C1B7D5
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 09:20:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxM-0008Un-4u; Sat, 01 Apr 2023 18:19:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxK-008GST-Tr; Sat, 01 Apr 2023 18:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxK-009khV-7r; Sat, 01 Apr 2023 18:19:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 38/49] mtd: rawnand: qcom: Convert to platform remove callback returning void
Date:   Sat,  1 Apr 2023 18:19:27 +0200
Message-Id: <20230401161938.2503204-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=G28o7xn3QeMDu6fYFFRYPya7v5M/PkKU71x1+qlTeuM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlIoSNlhz8SuPP1vj89aETRFZubu7irTsjfo seAd3212iyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZSAAKCRCPgPtYfRL+ TlG6B/0ToTS5PmudnWMvPXc08gvHEHveyRmqI7ZmtdZLRYRCCj8qe8KsVhsQcsJTd73Z6ggGkOx TIW4NvZh9lWSMxLI5pd+hdAkIuoROHvfnlXH5VJXAYJf8qXO8NDozk4tiwuwB+tUDdDo/FIgeX4 JMKBWLS9FOnI0boY53KWw/Acb0j/SZBqN0emeA61Bko07JE/6hTwRtF6KXSzUp9tUdf9/4nzsJG XyO3X64lRIA591mmoYy9Mh28lXwszMvqT++JT83dKptAPuSNDT2/xvToXkCrISLTyi2xw/Q3gne MbcghY8XSx32hMyRSr9OehzOlAQAkKS0GGMRmET4yKitNY3q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 198a44794d2d..218c8a840e32 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3315,7 +3315,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_nandc_remove(struct platform_device *pdev)
+static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -3337,8 +3337,6 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 
 	dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
-
-	return 0;
 }
 
 static const struct qcom_nandc_props ipq806x_nandc_props = {
@@ -3405,7 +3403,7 @@ static struct platform_driver qcom_nandc_driver = {
 		.of_match_table = qcom_nandc_of_match,
 	},
 	.probe   = qcom_nandc_probe,
-	.remove  = qcom_nandc_remove,
+	.remove_new = qcom_nandc_remove,
 };
 module_platform_driver(qcom_nandc_driver);
 
-- 
2.39.2

