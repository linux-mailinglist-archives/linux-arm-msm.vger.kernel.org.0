Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464A06FB8CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 22:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbjEHUyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 16:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjEHUxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 16:53:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC14D83CD
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 13:53:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0003sL-QU; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0024tT-3u; Mon, 08 May 2023 22:53:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-002YYL-48; Mon, 08 May 2023 22:53:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 56/89] i2c: qcom-geni: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:33 +0200
Message-Id: <20230508205306.1474415-57-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7IO7EmZJRD4Dljfs5yTB/B1kXA7B43zxRH46mudqVDk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIhC9PLR2/Gge+CDt+q1ViUlCh4A9xh5cecl+d93668 sdo0t6qTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmEvGc/Z9lwrM434YLlZOZ Yj1+ZtZwKQfaHNzs2BUZ+W1t+uK1Igu+zGz5uMlh/7MPksxWC5+pmjmLPdHRcnJpK/sd8t+dfUa CQNFn8UL3bF/rG6VBWw/7XHNO3Pic9T5nTNSdZlM9gyQ1iypeBR1R/0SHKNH/02W/ftRf/firQN p7pdSbHzeGqIYutNplG6QmoDZNaU+FVFH1LL2OM9u+X5JaKTgtqvvexu6qm12duq2uIm1VZfZbH gdOEal8HCk+beadbZs2c/Yres7o3btF30WcKWHi4ex5H9+Fv6zrfFTsz9tb63b9kUPqFMb0x5EO S8o/tX88NOveyyqvxXtCmgOce6evf2EUsfON+Tx33Sd9AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-qcom-geni.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 83909b02a03e..b670a67c4fdd 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -936,14 +936,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int geni_i2c_remove(struct platform_device *pdev)
+static void geni_i2c_remove(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&gi2c->adap);
 	release_gpi_dma(gi2c);
 	pm_runtime_disable(gi2c->se.dev);
-	return 0;
 }
 
 static void geni_i2c_shutdown(struct platform_device *pdev)
@@ -1041,7 +1040,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
-	.remove = geni_i2c_remove,
+	.remove_new = geni_i2c_remove,
 	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
-- 
2.39.2

