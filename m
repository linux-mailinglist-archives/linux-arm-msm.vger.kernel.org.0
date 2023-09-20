Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA60C7A824C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 14:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235973AbjITM7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 08:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbjITM7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:01 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151881A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 05:58:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-0005Hn-FG; Wed, 20 Sep 2023 14:58:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007gzo-2G; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-003IDv-PI; Wed, 20 Sep 2023 14:58:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 23/52] input: pm8941-pwrkey - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:00 +0200
Message-Id: <20230920125829.1478827-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+Cya8auCZYXraL2ZhN0lNfUtJzINrULP5iO4cvvhxkY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxNPW40yovhzJcSR0lMk0KO9b+523EEDrzU1 zycL+ecV7qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsTQAKCRCPgPtYfRL+ TlAiB/wIe4fGfnZLoRrKENZa9wq/NMRaW6bjGEyGeM38qc3zDjAbAcHkyJ76Bz0Zp2I6aju0ixY tBIAowUu+O2sWUsFqdKZF+PnOY6FA7drM7dkyHjHLGFVKpCjXBnKqEQF58sSqfwO6+kQkx5JVUn gwklSLYZgNSOou2TbepnjC9vFvaXeav8LiZ+d4W6SF+OIPcnC8B4TYSK/uA5mU2ldQ++gE/5A23 2G/c0dfSykFFHCNHAaBjpoHAjCpsvrHBbxPFUGJi4yBDesYMbFR9s6LKyXrR61pZ3p5lFYR0Hqt S5lXxMnNIonOQqVJ9nZQdS1eFQeS1iwNtqiLXm1+wKiTuwB/
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
 drivers/input/misc/pm8941-pwrkey.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index ba747c5b2b5f..bab710023d8f 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -408,14 +408,12 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pm8941_pwrkey_remove(struct platform_device *pdev)
+static void pm8941_pwrkey_remove(struct platform_device *pdev)
 {
 	struct pm8941_pwrkey *pwrkey = platform_get_drvdata(pdev);
 
 	if (pwrkey->data->supports_ps_hold_poff_config)
 		unregister_reboot_notifier(&pwrkey->reboot_notifier);
-
-	return 0;
 }
 
 static const struct pm8941_data pwrkey_data = {
@@ -467,7 +465,7 @@ MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
 
 static struct platform_driver pm8941_pwrkey_driver = {
 	.probe = pm8941_pwrkey_probe,
-	.remove = pm8941_pwrkey_remove,
+	.remove_new = pm8941_pwrkey_remove,
 	.driver = {
 		.name = "pm8941-pwrkey",
 		.pm = pm_sleep_ptr(&pm8941_pwr_key_pm_ops),
-- 
2.40.1

