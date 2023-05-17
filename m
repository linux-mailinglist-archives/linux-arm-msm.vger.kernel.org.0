Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20617075D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 01:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjEQXC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 19:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjEQXC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 19:02:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C7C3AB3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 16:02:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-0007ov-5X; Thu, 18 May 2023 01:02:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-000wp6-QM; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-005UWV-3N; Thu, 18 May 2023 01:02:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 20/97] usb: dwc3-qcom: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:22 +0200
Message-Id: <20230517230239.187727-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zshZZOKhKaOmXjjFZX/6UJ2ZzFeLN5Dfj+shPazq61Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwBD/efn5OCC88J/zQyrTwnXKuKpi6YIJ6a7 bnyjZ0bxM6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcAQAKCRCPgPtYfRL+ Tn3kCACcNTvD1PlNtNphLALqpQ9cn85j8jNjoOgOfCKP4TvGbBpx+75R00rwmCxVxfKmKyw5QrJ vhItHXrWFUzm/Y1TkK+Qjxu1ELgVhsNmb2dh5SgMOphNhGk4jVldhUAi1YR0NmaPYw04fT0EQe3 A5F0vmIpGqXD+xe8AmgygDHyu2R5Dk3rH8y2xCfee9MbZWi8/lggYDHRX1Cyfl44kvKLkoMrUI7 uYbUxfaIMZG9F6nTEFKvLLZk64aO6mmZIxaGe0MSx5E2CRgDLSUAYxYlll5aMD1VAiauteV5jsw g7c8yHQ/XrnVklovjrHzyXl0wkN5ipX1fzz33EZZOmsA/g0V
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
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 959fc925ca7c..167f851c8e59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -938,7 +938,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_qcom_remove(struct platform_device *pdev)
+static void dwc3_qcom_remove(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -958,8 +958,6 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 
 	pm_runtime_allow(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
@@ -1052,7 +1050,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
 
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
-	.remove		= dwc3_qcom_remove,
+	.remove_new	= dwc3_qcom_remove,
 	.driver		= {
 		.name	= "dwc3-qcom",
 		.pm	= &dwc3_qcom_dev_pm_ops,
-- 
2.39.2

