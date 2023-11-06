Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87997E2AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 18:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjKFRSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 12:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjKFRSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 12:18:02 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9CAD49
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 09:17:59 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03EU-0005YT-Cd; Mon, 06 Nov 2023 18:17:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ET-0075z0-Tl; Mon, 06 Nov 2023 18:17:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ET-00DrJX-KE; Mon, 06 Nov 2023 18:17:49 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 13/18] mfd: qcom-pm8xxx: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 18:17:22 +0100
Message-ID: <20231106171708.3892347-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VHgHPWXb3vjh7slyWR7BvxF1seVXCnHjE2GjX6ekRKc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+jDUJLcmLtQ5N9S/99Nq8qUlUhU+9QV3ftz NJ+Tf5mPQWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkfowAKCRCPgPtYfRL+ TvvWB/0S/LjzXnB9yQz5Bs9V+fKIq1thUp62QgYA6l0Stq9OgKCbGwJkWCRnr8sa9vrTcyIKe9m +Lli2mue7xEOn7t0F0IiIw/PF9w4FCeTyV8W83bJKo6DuzJtOdVkTWkiAqTXOuktsxzmVtD9UuM UuEOGVATCxXeUAfSZXZmIQQtppcgJdXim/PgIBbAzCQ3eiYRr1r00Cj+ZBn0rf7iK+5r/Eo+QgR KZ2w99lyTFwFkDQTQUW8gs13Y8Z5iKq8gR1jJGyzg7pQ+DUHZISbbYM5VyekxrKmyq2A4hY4hsb vJUub2GTp2t7tJs0ztTKPvYMcgyhaFUqh3gUDdODnMqUWsvK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
 drivers/mfd/qcom-pm8xxx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 07c531bd1236..8b6285f687da 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -585,19 +585,17 @@ static int pm8xxx_remove_child(struct device *dev, void *unused)
 	return 0;
 }
 
-static int pm8xxx_remove(struct platform_device *pdev)
+static void pm8xxx_remove(struct platform_device *pdev)
 {
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
 	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
 	irq_domain_remove(chip->irqdomain);
-
-	return 0;
 }
 
 static struct platform_driver pm8xxx_driver = {
 	.probe		= pm8xxx_probe,
-	.remove		= pm8xxx_remove,
+	.remove_new	= pm8xxx_remove,
 	.driver		= {
 		.name	= "pm8xxx-core",
 		.of_match_table = pm8xxx_id_table,
-- 
2.42.0

