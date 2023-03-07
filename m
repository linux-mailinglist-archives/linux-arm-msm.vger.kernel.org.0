Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7544A6ADE2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 12:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjCGL71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 06:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjCGL70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 06:59:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B9431E01
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 03:59:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-0006Vp-Bk; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyI-002TFI-9W; Tue, 07 Mar 2023 12:59:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyG-002yjS-RI; Tue, 07 Mar 2023 12:59:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 14/31] phy: qualcomm: phy-qcom-ipq806x-sata: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:43 +0100
Message-Id: <20230307115900.2293120-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BpU8LHVSt/XqXfZwVOK+XjWGgAEHw708aj/r8R+zfKA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBya6OvvUkMkDMmUnFRNeO9txQVuNkKZJvNWXm OUz8SgW9BWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmugAKCRDB/BR4rcrs CWZYB/43tpEzNSBnSv+RjJRTTsFxxOcZVVV/13nL8D9lmMUlUZS5FrY/8OKrqdRjxsbfrgxO8d6 15j6Rm+0YRKPVaGDDv5qtBqWBgeAQGe8e2fYO5eXl54aRGtU9qKfo6SzjiHiSlqTzQemgzXSov6 IOvTOm1zw5zBHlfuaqoMajWS1NLSRBvAFiYRBQBC7tOkqRNSQplAllnm/lsL3t+rke7kT+1YOiJ fa05mop+O0r8i1luFKarLwq8glGp+iDIsAB4RT6K5GvmNx8PC1k2Y42r5WZJx++9ZrIIRVT78AP xGenvrHVNJ6wtrENecNB3Q4Lgn9URerG+Hzs1AzQwcHZMvVy
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
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
index 0fc2a1ed39b3..f0a72b82c770 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
@@ -170,13 +170,11 @@ static int qcom_ipq806x_sata_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int qcom_ipq806x_sata_phy_remove(struct platform_device *pdev)
+static void qcom_ipq806x_sata_phy_remove(struct platform_device *pdev)
 {
 	struct qcom_ipq806x_sata_phy *phy = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(phy->cfg_clk);
-
-	return 0;
 }
 
 static const struct of_device_id qcom_ipq806x_sata_phy_of_match[] = {
@@ -187,7 +185,7 @@ MODULE_DEVICE_TABLE(of, qcom_ipq806x_sata_phy_of_match);
 
 static struct platform_driver qcom_ipq806x_sata_phy_driver = {
 	.probe	= qcom_ipq806x_sata_phy_probe,
-	.remove	= qcom_ipq806x_sata_phy_remove,
+	.remove_new = qcom_ipq806x_sata_phy_remove,
 	.driver = {
 		.name	= "qcom-ipq806x-sata-phy",
 		.of_match_table	= qcom_ipq806x_sata_phy_of_match,
-- 
2.39.1

