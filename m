Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1A47D0A06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 09:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376491AbjJTH5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 03:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376524AbjJTH5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 03:57:04 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1A8D60
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 00:56:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN6-0003ZZ-10; Fri, 20 Oct 2023 09:56:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN4-002yW2-41; Fri, 20 Oct 2023 09:56:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN3-002OKM-R5; Fri, 20 Oct 2023 09:56:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 33/42] crypto: qcom-rng - Convert to platform remove callback returning void
Date:   Fri, 20 Oct 2023 09:55:55 +0200
Message-ID: <20231020075521.2121571-77-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kUBCXyNhmAOITBuECHTgq8IeakGTUY+qub8iRJK7S1Y=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQjo36fAg6P9pJEzqmXDFT7xP8FSyfdUU+ILGvN3FAft U9MZVInozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABN53M7B0HKfTWW3nk3DDBND I3vHP8dtY5292nrlHop1eLdMWHYn+hibqqgDR316Q4Vf2pnHwqnlZXrafa5hv/eulpt5cnL/2Zz bFS+vtuakPmPeqXVhvW3yVo+tXu7817OLl/z6uZA1qNvH78iRZ5yzph5iP/u4wc+PzTPJouBMb5 LQvdlG57csd1y4/bSPZZ7KUUbVgHdztnZ7707f3LJrlvYeZxndB4sFJy2uq/+ePvf03aiF0T7dd znTG/7dc3i8yljCdvodgau750zwLyjyyk+YzFRVOu+Vx5SHv2ebeqyrkMpUCrtztjfs2vtDjz4+ 3HZfflL4fNFEe7WZAsUTX1XZ6/nz/6ndc1Bo6orCbjkrAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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
 drivers/crypto/qcom-rng.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index f46b92bb14b5..c670d7d0c11e 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -224,13 +224,11 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_rng_remove(struct platform_device *pdev)
+static void qcom_rng_remove(struct platform_device *pdev)
 {
 	crypto_unregister_rng(&qcom_rng_alg);
 
 	qcom_rng_dev = NULL;
-
-	return 0;
 }
 
 static struct qcom_rng_of_data qcom_prng_of_data = {
@@ -264,7 +262,7 @@ MODULE_DEVICE_TABLE(of, qcom_rng_of_match);
 
 static struct platform_driver qcom_rng_driver = {
 	.probe = qcom_rng_probe,
-	.remove =  qcom_rng_remove,
+	.remove_new =  qcom_rng_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = of_match_ptr(qcom_rng_of_match),
-- 
2.42.0

