Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429A86F77C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 23:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEDVE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 17:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjEDVEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 17:04:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352F97EF9
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 14:04:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-0007mp-C4; Thu, 04 May 2023 21:45:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0018G9-NO; Thu, 04 May 2023 21:45:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-001Ji0-Kz; Thu, 04 May 2023 21:45:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 13/18] remoteproc: qcom_wcnss: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:48 +0200
Message-Id: <20230504194453.1150368-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wPCGQ3JvapnfUS9R6SCqKUY+mu+gIbMPpiPT6sWua18=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnL24Hw6S4/I1v3fN5apzb8C+43L/r3A1bNW +08kV4Cj1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJywAKCRCPgPtYfRL+ TrUgB/46lfgC70m6DYG/9veyjxPxlNSXPXGC5ddSpS/35Ma/LlLV1jZtLlACs5c+4Cuh/T48fUj rtqib8B4sTUthru1Ntan0gZGytvq3r+zbMjLOEMZSDVWSiTKbasdJEXfNIRQ2q5R5vUNQmiI7bJ zpDNszZsjm2/Jwu7ngYP49dMI0E/8hKNGChxsWR3AvSGSRU446t7ep8Ox5TXXs5xt9AFMyOVy4J uqPxHeB+ftKsNvjhj/gIDfaRfL1GkegzFnAdhF538hQiUCIyrBtB7CtP5fUhBwaD62q7sTwRVWh BmxoQihmLxIK0OEexyq5ctc7zTPycfxksn/X1jcgfX+YG/oT
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
 drivers/remoteproc/qcom_wcnss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 0fc317265064..1ed0647bc962 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -666,7 +666,7 @@ static int wcnss_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wcnss_remove(struct platform_device *pdev)
+static void wcnss_remove(struct platform_device *pdev)
 {
 	struct qcom_wcnss *wcnss = platform_get_drvdata(pdev);
 
@@ -678,8 +678,6 @@ static int wcnss_remove(struct platform_device *pdev)
 	qcom_remove_smd_subdev(wcnss->rproc, &wcnss->smd_subdev);
 	wcnss_release_pds(wcnss);
 	rproc_free(wcnss->rproc);
-
-	return 0;
 }
 
 static const struct of_device_id wcnss_of_match[] = {
@@ -693,7 +691,7 @@ MODULE_DEVICE_TABLE(of, wcnss_of_match);
 
 static struct platform_driver wcnss_driver = {
 	.probe = wcnss_probe,
-	.remove = wcnss_remove,
+	.remove_new = wcnss_remove,
 	.driver = {
 		.name = "qcom-wcnss-pil",
 		.of_match_table = wcnss_of_match,
-- 
2.39.2

