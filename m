Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8CC97D0A01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 09:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376558AbjJTH5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376445AbjJTH44 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 03:56:56 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA2FD75
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 00:56:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN5-0003YZ-Os; Fri, 20 Oct 2023 09:56:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN3-002yVz-Tt; Fri, 20 Oct 2023 09:56:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN3-002OKH-Ki; Fri, 20 Oct 2023 09:56:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Thara Gopinath <thara.gopinath@gmail.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 32/42] crypto: qce - Convert to platform remove callback returning void
Date:   Fri, 20 Oct 2023 09:55:54 +0200
Message-ID: <20231020075521.2121571-76-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=G0/igmENqnZ6cetBxXxRJSgWvtgANtFuylMhEvhkrEs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjKOev/uBpsw9uCPahZqZFYXVWH0XyuLyrZ2n hpZuBDHox+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIyjgAKCRCPgPtYfRL+ TmgqCACzXUPxe9GXPXocrWR3io0dlnoG8qXO+qNu6fd8JiB8sDCgkZbDZ9Xmfq3Ee4FuxB/HVFw wZt2FPa+3jWFZy7lbtaiPTsViNBGtLt+fvZ04pNNfG5XfscPlcS0cBmRTpIFR/CsDadRRXq6h/v UdTkfly25Fc8DYLuGc8dVfkJ+wYlh2YsrJUqd8dRmh7ws9+OlS9PF0AV480Ze2zlwBxmfFfxn9s FojrBd3LBwWanky3ws71R4/wquSF3m3rV1uLFssO1lQmrRNTQCL5TQFK5AXJeHcYkMaJe66ow1a SOEGUl1cvblO0sxdaRdchp1FQE6M+RrFZCpEMhbtPlrWDJ3E
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/crypto/qce/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index fce49c0dee3e..28b5fd823827 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -277,7 +277,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qce_crypto_remove(struct platform_device *pdev)
+static void qce_crypto_remove(struct platform_device *pdev)
 {
 	struct qce_device *qce = platform_get_drvdata(pdev);
 
@@ -287,7 +287,6 @@ static int qce_crypto_remove(struct platform_device *pdev)
 	clk_disable_unprepare(qce->bus);
 	clk_disable_unprepare(qce->iface);
 	clk_disable_unprepare(qce->core);
-	return 0;
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
@@ -300,7 +299,7 @@ MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
 
 static struct platform_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
-	.remove = qce_crypto_remove,
+	.remove_new = qce_crypto_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
-- 
2.42.0

