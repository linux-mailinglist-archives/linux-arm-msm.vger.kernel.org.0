Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2CC6F7797
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 22:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjEDU72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 16:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEDU71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 16:59:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CED11DA9
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 13:59:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0007iK-2C; Thu, 04 May 2023 21:45:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-0018Fo-4d; Thu, 04 May 2023 21:45:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-001Jhl-Ek; Thu, 04 May 2023 21:45:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 09/18] remoteproc: qcom_q6v5_adsp: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:44 +0200
Message-Id: <20230504194453.1150368-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=w8BbNrcMDsjlvFmJSr9/zSEP0O1sgYg5hpVIF7KDL3U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnG/9e4AuC9ICOeVXodI0aovYz8pzaAl4W/D v3FIAMINT+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJxgAKCRCPgPtYfRL+ Tv5bB/9hNyyor75dsA/tVf0Rlv/eFnL7eyBzSpOAXY/5wN5FvfptFNrr+4A/uWSjC21lqf6r+cW UrI5wvez5ea4/c/oz6lY0upXQGqvUvS2gv0fPb/vgMtVyDjlZn37aSt70jVTDU80Z/dANY4n7Ng d0YCuo9lFhqaCr3RhFdYiNIt5YPIPKdFcqJzRLan48Mn8bgw17owaK1redZFHsLvhODXklWsOO+ hgHKQRjOWxg/vwDryaxYahY9xLjbCLuTTNKtInGCSd6+rlYqcLvaup3X2CE0G8W7TszhRjNdPus 60VbaZsJb+zQ1UNtd7YFirR/qU5N7uTjOtqPA5X2eJFsPCcj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d546ab9dc141..6777a3bd6226 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -763,7 +763,7 @@ static int adsp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int adsp_remove(struct platform_device *pdev)
+static void adsp_remove(struct platform_device *pdev)
 {
 	struct qcom_adsp *adsp = platform_get_drvdata(pdev);
 
@@ -775,8 +775,6 @@ static int adsp_remove(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	rproc_free(adsp->rproc);
-
-	return 0;
 }
 
 static const struct adsp_pil_data adsp_resource_init = {
@@ -859,7 +857,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
 
 static struct platform_driver adsp_pil_driver = {
 	.probe = adsp_probe,
-	.remove = adsp_remove,
+	.remove_new = adsp_remove,
 	.driver = {
 		.name = "qcom_q6v5_adsp",
 		.of_match_table = adsp_of_match,
-- 
2.39.2

