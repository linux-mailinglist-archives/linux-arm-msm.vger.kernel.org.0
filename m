Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF98D7A69E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 19:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbjISRuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 13:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjISRuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 13:50:05 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6026697
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 10:49:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qier9-0006Uo-LT; Tue, 19 Sep 2023 19:49:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qier9-007VWb-6B; Tue, 19 Sep 2023 19:49:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qier8-0034Xf-TC; Tue, 19 Sep 2023 19:49:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 18/49] iio: adc: qcom-pm8xxx-xoadc: Convert to platform remove callback returning void
Date:   Tue, 19 Sep 2023 19:49:00 +0200
Message-Id: <20230919174931.1417681-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mgB08Ssm4kCGcek3HIIGbtIdKUkwaZ+3XGTC/slBrdU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8Euyxw681EZ5uGhj4Q+YhTo7MPmq9R2pOMW OxIKV6NnKmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfBAAKCRCPgPtYfRL+ TkH9CACZxdw5WZfHPWsqVsSjllo1OQQjRcUPaFXp7KoSmGsN+5vBTWPmaJD5odGlcE++3UklBdT bupQNfq6WLLDUjQmVFHBTJb0WGraHk7ZmRrXnxZi8GK9bsbIdpsg8bEot67Q2i5Gcp6TsuVuJ1H aPklMYjyJeu+fvwkAyhzyZZUj5pC03bU0kOjd7D7p3S/uj/733OknU6BEEaM19Z8TTJBCPWrWaL Xodo8X7vLmKE1APSxuv8qimSf5vmDQp1TG7PKSYdiO9xurS750/LyUoLirz/9DSJtCwWvnbmBIM Pf+BnNG5PHPasXz8clp7Ti6vzL8i+/Rc5PvNOPGsF6MeFzeb
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
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 64a3aeb6261c..01c5586df56d 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -957,7 +957,7 @@ static int pm8xxx_xoadc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pm8xxx_xoadc_remove(struct platform_device *pdev)
+static void pm8xxx_xoadc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
@@ -965,8 +965,6 @@ static int pm8xxx_xoadc_remove(struct platform_device *pdev)
 	iio_device_unregister(indio_dev);
 
 	regulator_disable(adc->vref);
-
-	return 0;
 }
 
 static const struct xoadc_variant pm8018_variant = {
@@ -1019,7 +1017,7 @@ static struct platform_driver pm8xxx_xoadc_driver = {
 		.of_match_table = pm8xxx_xoadc_id_table,
 	},
 	.probe		= pm8xxx_xoadc_probe,
-	.remove		= pm8xxx_xoadc_remove,
+	.remove_new	= pm8xxx_xoadc_remove,
 };
 module_platform_driver(pm8xxx_xoadc_driver);
 
-- 
2.40.1

