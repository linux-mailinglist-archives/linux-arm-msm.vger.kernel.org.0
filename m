Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDF679B265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344915AbjIKVPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241847AbjIKPQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 11:16:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31045120
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:16:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfidk-00069m-CE; Mon, 11 Sep 2023 17:15:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfidj-005a7S-FW; Mon, 11 Sep 2023 17:15:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qfidh-000igm-W3; Mon, 11 Sep 2023 17:15:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove callback returning void
Date:   Mon, 11 Sep 2023 17:15:48 +0200
Message-Id: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bX1MW8+1wZBVxTfQwby6K9/t5il+Vswf92hv70gjQVs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBk/y8jygiIoFpJ0EtdFbFcr0qZwZUSpJLq25Dus aDm2cqAfMeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZP8vIwAKCRCPgPtYfRL+ TliuB/9a/6uVl/T7KCMAF5D1v0A6Vv0h/saI88s9Pm9AMmyUUkKhCIANj+hOR94EWXR3IoWsK3B qyaqr8h/NHaWqNyGJFw9jXXwg2STqwtaw6h9XYYeuIZnIhSDA4FdmxWTt2TNxxocw8/DsNcA4nG Br4FRGOA+ENf3+5zq6N307M/rwoV2ypY77qqrvqZ/HH7AofUw/sbpjzjBaTGJROgjZ+SgbVPpNN JQGD9FI7umKXpz5c8FdUrPPmYDQDVaByQmrglOxl24dgT+uQtIIdv46u5K/RsJNrrK6WgQi9+HR ssaMnY2VfxN48sFLykVvmhOeF5sZSiGtTFUyR0qiuZ8IuZZL
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
are converted, .remove_new() is renamed to .remove().

qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
changing this function to return void instead, the driver can be
converted trivially to use .remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/qcom/clk-cbf-8996.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 53f205a3f183..fe24b4abeab4 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -250,13 +250,11 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct cl
 	return 0;
 }
 
-static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
+static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
 {
 	struct icc_provider *provider = platform_get_drvdata(pdev);
 
 	icc_clk_unregister(provider);
-
-	return 0;
 }
 #define qcom_msm8996_cbf_icc_sync_state icc_sync_state
 #else
@@ -266,7 +264,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
 
 	return 0;
 }
-#define qcom_msm8996_cbf_icc_remove(pdev) (0)
+#define qcom_msm8996_cbf_icc_remove(pdev) { }
 #define qcom_msm8996_cbf_icc_sync_state NULL
 #endif
 
@@ -340,9 +338,9 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 	return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
 }
 
-static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
+static void qcom_msm8996_cbf_remove(struct platform_device *pdev)
 {
-	return qcom_msm8996_cbf_icc_remove(pdev);
+	qcom_msm8996_cbf_icc_remove(pdev);
 }
 
 static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
@@ -354,7 +352,7 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
 
 static struct platform_driver qcom_msm8996_cbf_driver = {
 	.probe = qcom_msm8996_cbf_probe,
-	.remove = qcom_msm8996_cbf_remove,
+	.remove_new = qcom_msm8996_cbf_remove,
 	.driver = {
 		.name = "qcom-msm8996-cbf",
 		.of_match_table = qcom_msm8996_cbf_match_table,

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.40.1

