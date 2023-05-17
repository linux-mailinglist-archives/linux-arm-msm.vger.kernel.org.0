Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5303C707630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 01:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjEQXEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 19:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjEQXEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 19:04:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C01672B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 16:03:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAg-0000Cb-KR; Thu, 18 May 2023 01:03:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-000wuv-Tq; Thu, 18 May 2023 01:03:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-005UbC-Oq; Thu, 18 May 2023 01:03:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 92/97] usb: typec: qcom-pmic-typec: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:34 +0200
Message-Id: <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e9Uv9LXrIIGsj5N351WmwTwqQfqC/Nbvqs89zTJbUdU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmE8NKp8mp4Xq7nDade9dgUJTePfG6+oXnrO/dJfWr GcS5JLpZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiu6PY/8peCU0J65u319Q6 wzufO3x+52nFf8G8fy/OnbZOev186TsdsWpSvpd9Mr4HxBks2vPRyLns7YKy1VeFntoob9Td/i1 N9oFTu/jcfvMag5s/ZxXLe9m9WyvLHBy3VYFHeppoZffJc7lcU27k2v2TfbGMIfJx+XTZuQzHDX OFjDZG7zF+7PG42yfUjOVD0xSx2vxJEX89vx1ZxGDX2Hx7f6aih61cZeBL5+iNprdnXr5bHh4ZW ldwMCB71nu32/yiBnIld57vPH5o0mEJqfwpf27Lai20iDbjEjl/W+CejoeKd4THFu4Lyqo3rvBM XaZ0t/9EhnhggcvtOyvqvTfJSt1/c+9OYNVzQYsj4VNcAQ==
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
 drivers/usb/typec/qcom-pmic-typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
index 432ea62f1bab..924af87fb26d 100644
--- a/drivers/usb/typec/qcom-pmic-typec.c
+++ b/drivers/usb/typec/qcom-pmic-typec.c
@@ -228,7 +228,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_pmic_typec_remove(struct platform_device *pdev)
+static void qcom_pmic_typec_remove(struct platform_device *pdev)
 {
 	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
 
@@ -237,8 +237,6 @@ static int qcom_pmic_typec_remove(struct platform_device *pdev)
 
 	typec_unregister_port(qcom_usb->port);
 	usb_role_switch_put(qcom_usb->role_sw);
-
-	return 0;
 }
 
 static const struct of_device_id qcom_pmic_typec_table[] = {
@@ -253,7 +251,7 @@ static struct platform_driver qcom_pmic_typec = {
 		.of_match_table = qcom_pmic_typec_table,
 	},
 	.probe = qcom_pmic_typec_probe,
-	.remove = qcom_pmic_typec_remove,
+	.remove_new = qcom_pmic_typec_remove,
 };
 module_platform_driver(qcom_pmic_typec);
 
-- 
2.39.2

