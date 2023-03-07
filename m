Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01596ADE2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 12:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjCGL72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 06:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjCGL70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 06:59:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D22631E06
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 03:59:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-0006WG-He; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyI-002TFW-NZ; Tue, 07 Mar 2023 12:59:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyG-002yjL-EL; Tue, 07 Mar 2023 12:59:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 12/31] phy: qualcomm: phy-qcom-apq8064-sata: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:41 +0100
Message-Id: <20230307115900.2293120-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xYmcyFve/c0FbpaOz5dchKmOAuBz/bovJeKsX3la1pE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkByay9wXJzQAaNNxIc/jrX/U8B7bczddncXxfN ssTXBiIDH6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmsgAKCRDB/BR4rcrs CQhoB/4inwQB2bdEPQLEyFwkEqfXhGQQupQ5JV08tOD59mGkMMOYms7pacUjREWJ6rwh5iw2H7D WeDLsWmNIKI+QmVFCO9Kg1WGIkmaR14NwFVzdPjAJzhGPlGFDXW+pkTwZ0JtwTHHifZ3t4ktCo+ p5+dtXQrgq6/aMkgYRx4dIhHg3wTAl40b7VH5+ySKnUZjDk1qz0MMdwH9fJYE9cYkajjtA2i6Ch cBXy9n+sn3/s0D9//QGxjcZxGGeA2AivYxSSXZnpcR7nLvdqRQ5pFsO2TfXb7ulezRW+zxBi1gO 95DUC/8m1poDO9rk6slT38zOlfyFqKzVp1Gg0ioxv8W3fCXG
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
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index d437a249cd73..8814f4322adf 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -243,13 +243,11 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int qcom_apq8064_sata_phy_remove(struct platform_device *pdev)
+static void qcom_apq8064_sata_phy_remove(struct platform_device *pdev)
 {
 	struct qcom_apq8064_sata_phy *phy = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(phy->cfg_clk);
-
-	return 0;
 }
 
 static const struct of_device_id qcom_apq8064_sata_phy_of_match[] = {
@@ -260,7 +258,7 @@ MODULE_DEVICE_TABLE(of, qcom_apq8064_sata_phy_of_match);
 
 static struct platform_driver qcom_apq8064_sata_phy_driver = {
 	.probe	= qcom_apq8064_sata_phy_probe,
-	.remove	= qcom_apq8064_sata_phy_remove,
+	.remove_new = qcom_apq8064_sata_phy_remove,
 	.driver = {
 		.name	= "qcom-apq8064-sata-phy",
 		.of_match_table	= qcom_apq8064_sata_phy_of_match,
-- 
2.39.1

