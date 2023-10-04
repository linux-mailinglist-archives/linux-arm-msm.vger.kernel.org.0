Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D47B805F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 15:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242581AbjJDNNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 09:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242435AbjJDNNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 09:13:33 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AF9A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Oct 2023 06:13:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qo1gk-0007QL-6G; Wed, 04 Oct 2023 15:13:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qo1gj-00B2i4-K2; Wed, 04 Oct 2023 15:13:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qo1gj-008zDM-AP; Wed, 04 Oct 2023 15:13:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 17/21] EDAC/qcom: Convert to platform remove callback returning void
Date:   Wed,  4 Oct 2023 15:12:50 +0200
Message-Id: <20231004131254.2673842-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZdUYs8E4yW1qYtOFseUEWaVj1C6IqHPDURRLLjD5VEM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlHWTDX30yQTmnzTVc0atLlvnhRS5wCNqI5VLIh Phs/vMLUyKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZR1kwwAKCRCPgPtYfRL+ To9CCACYSSjTOy5bkEF3+1kytG7zdjaSFU8aPcDigJxBlEC3wKwDP8JksIDurQ2Y6D56+HbSpSm aImlaWRxOTBg/DR3TDHx+DIX8eSu6U1Y+sxibQzOVWddvcjK+I9NJ8579x+DFhfJyisVDrjgi+s u9dY/KCdmBu5GkxAQENX8ybdnxYHvQWpANWrueqtnqT1yQmVXNrRRYPAsZIbKHtKJWEb9rdzsOM QTsMmdu/vkNRI+asPPfkdZFIEAcuOh+g7NiyU/1TPAZgNPdCaIkbaD8HC6EYd6FHVH/YT1TRpwk j9YlTDFB6j+Z0ukGq5l4vqmJjzypTxkT4UzfvX1lU7M6omyW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/edac/qcom_edac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index b2db545c6810..5539917c01dd 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -390,14 +390,12 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int qcom_llcc_edac_remove(struct platform_device *pdev)
+static void qcom_llcc_edac_remove(struct platform_device *pdev)
 {
 	struct edac_device_ctl_info *edev_ctl = dev_get_drvdata(&pdev->dev);
 
 	edac_device_del_device(edev_ctl->dev);
 	edac_device_free_ctl_info(edev_ctl);
-
-	return 0;
 }
 
 static const struct platform_device_id qcom_llcc_edac_id_table[] = {
@@ -408,7 +406,7 @@ MODULE_DEVICE_TABLE(platform, qcom_llcc_edac_id_table);
 
 static struct platform_driver qcom_llcc_edac_driver = {
 	.probe = qcom_llcc_edac_probe,
-	.remove = qcom_llcc_edac_remove,
+	.remove_new = qcom_llcc_edac_remove,
 	.driver = {
 		.name = "qcom_llcc_edac",
 	},
-- 
2.40.1

