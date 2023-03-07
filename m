Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174BB6ADE31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 12:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjCGL73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 06:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCGL70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 06:59:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054D431E04
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 03:59:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-0006Vc-Bi; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyI-002TFH-7W; Tue, 07 Mar 2023 12:59:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyG-002yjO-LN; Tue, 07 Mar 2023 12:59:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 13/31] phy: qualcomm: phy-qcom-eusb2-repeater: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:42 +0100
Message-Id: <20230307115900.2293120-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=coYW9pWrr7E2/EphPOTo9VhmqHcN1CT2RwChjTdikrY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBya24P5M0wKf7HSaNgxHarPDhCEn3rBAMUmPT HuoVQ/KPWiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmtgAKCRDB/BR4rcrs CfqICACGmDiagBmsuLHmNtEd4ad06qzHj4o/GbYfYOn00Bxoyf0J46p/r7LKnPoGpQTUtjDvNpP LgOuE2v8R+64XG0jmMzVC5dk8GCWhKAx+G2zAoQjFbKo1CUHUeHUg1Y4s7StDUi/adbvIjnIvFh k73krBXEzl6x16MlotR7CniAUyd1UJdXzgkHJJFAEWOlMqS6LqUioALpS7VtSfATf8pB/cWBhni unti+HYKLDkce3IZsicO5YS5cRZmkZI6PBiC1HuI1w2bNeVZJrwA8VHxlQ74mUI+WvSXjBnzND0 SXAAXFMCs8CT8sz0ybxi21TJGowqwSz1MHaSAP+mAIQm8Zhl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 3f265ac2df20..90f8543ba265 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -223,16 +223,14 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int eusb2_repeater_remove(struct platform_device *pdev)
+static void eusb2_repeater_remove(struct platform_device *pdev)
 {
 	struct eusb2_repeater *rptr = platform_get_drvdata(pdev);
 
 	if (!rptr)
-		return 0;
+		return;
 
 	eusb2_repeater_exit(rptr->phy);
-
-	return 0;
 }
 
 static const struct of_device_id eusb2_repeater_of_match_table[] = {
@@ -246,7 +244,7 @@ MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);
 
 static struct platform_driver eusb2_repeater_driver = {
 	.probe		= eusb2_repeater_probe,
-	.remove		= eusb2_repeater_remove,
+	.remove_new	= eusb2_repeater_remove,
 	.driver = {
 		.name	= "qcom-eusb2-repeater",
 		.of_match_table = eusb2_repeater_of_match_table,
-- 
2.39.1

