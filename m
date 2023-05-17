Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B561370762D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 01:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjEQXEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 19:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjEQXEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 19:04:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63045FCE
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 16:03:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-0008VA-Ei; Thu, 18 May 2023 01:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-000wuH-0v; Thu, 18 May 2023 01:03:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-005Uan-DD; Thu, 18 May 2023 01:02:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 86/97] usb: misc: eud: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:28 +0200
Message-Id: <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gXC9rVl2pw5bincUuXdnbdAsnFWzlYOy2N7dqZnzTgE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzhF3hCq8feIfX5FFMUuN8atMsYG3uYrfx3k sDaBv3npACJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc4QAKCRCPgPtYfRL+ TnStB/0RZND0Jd3VUbIl3YmyvVztDUCf8V+OdnKr2zs48EPYQFkqb9U1bWwbJ8E0OZ3iU8D9i2l 8Y++ARALP7Z+6BWz9gP2OsrNCMQK/5Q+Aesh0WMECpvI4utwJBLpz8yWurT3KoB0BJC6bUm7J6I 71jvrV6L8uwGnHXxAAhwJYsDzQNk4Pu0ikiKDkuoqPYI21hMw5jRFRaNtzP6ijE+c2QConYDqX3 Ljvx7uY0D+f608C8VvZq9WbzNQvScGLMT5MA/LcMj47fwGYZnFoiYL9q23DV6TucSSiEoThLQej L2142iouqhS68syFIunaRFbdOGJTXN/rHcqO7burR39VXUQ4
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
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/misc/qcom_eud.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b7f13df00764..0dc414463759 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -217,7 +217,7 @@ static int eud_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int eud_remove(struct platform_device *pdev)
+static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
@@ -226,8 +226,6 @@ static int eud_remove(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
-
-	return 0;
 }
 
 static const struct of_device_id eud_dt_match[] = {
@@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(of, eud_dt_match);
 
 static struct platform_driver eud_driver = {
 	.probe	= eud_probe,
-	.remove	= eud_remove,
+	.remove_new = eud_remove,
 	.driver	= {
 		.name = "qcom_eud",
 		.dev_groups = eud_groups,
-- 
2.39.2

