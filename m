Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554996C2CB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 09:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCUIma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 04:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjCUIm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 04:42:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8460D399DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 01:41:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYf-0001Qz-If; Tue, 21 Mar 2023 09:41:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYe-005e9K-QY; Tue, 21 Mar 2023 09:41:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYe-006hGZ-2D; Tue, 21 Mar 2023 09:41:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH 06/10] iommu/msm: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 09:41:21 +0100
Message-Id: <20230321084125.337021-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
References: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aoQ9TIuuruhfdEg3FIQc+1zWpmjLbpmzxR6nXui9sEA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGW2rn/wcylc+EjRkxA+brtCNgum5MDmIv8Woa gyN5hiYABiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBltqwAKCRCPgPtYfRL+ TtZgCACTUxyyXEP9ZfOE0jUbCToeIzyPOnJkS3KR7tD0wSmcVOgfiLwR3Orv8jlJvp9Lciif2M1 7tdx1cGOMx6qNjrGuOVIUhPNq6TrfxEYrAnERPKrQVeyH8P8hY1HzBl+ftIWKSMYyalgJbCmOGX rF1whva47ov2w7DujDTEY0QW1YUBdjHbaQ1SntzXXO2qQlv+aw4B1F8pIl+7lANPJsVWLTPkAHP OuXuCmWGSM1H5kyOXaG/2pTIuwtx3FPMUyrn/VISOzBcAcj1YNmfQ9/4Hi/5NW41ec5BMivlqq4 glg2Ubu7RP0EO9fPsVRMPQ4O0idNUsPp3zjH9imybPdMx7fa
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
 drivers/iommu/msm_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 454f6331c889..79d89bad5132 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -811,13 +811,12 @@ static const struct of_device_id msm_iommu_dt_match[] = {
 	{}
 };
 
-static int msm_iommu_remove(struct platform_device *pdev)
+static void msm_iommu_remove(struct platform_device *pdev)
 {
 	struct msm_iommu_dev *iommu = platform_get_drvdata(pdev);
 
 	clk_unprepare(iommu->clk);
 	clk_unprepare(iommu->pclk);
-	return 0;
 }
 
 static struct platform_driver msm_iommu_driver = {
@@ -826,6 +825,6 @@ static struct platform_driver msm_iommu_driver = {
 		.of_match_table = msm_iommu_dt_match,
 	},
 	.probe		= msm_iommu_probe,
-	.remove		= msm_iommu_remove,
+	.remove_new	= msm_iommu_remove,
 };
 builtin_platform_driver(msm_iommu_driver);
-- 
2.39.2

