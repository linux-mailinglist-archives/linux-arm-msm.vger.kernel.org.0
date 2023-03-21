Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E4C6C35F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 16:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjCUPlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 11:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjCUPlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 11:41:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B58DEC43
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:40:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-0003Fc-Tv; Tue, 21 Mar 2023 16:40:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-005iqK-8z; Tue, 21 Mar 2023 16:40:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6N-006ned-I6; Tue, 21 Mar 2023 16:40:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/3] rpmsg: qcom_glink_rpm: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 16:40:38 +0100
Message-Id: <20230321154039.355098-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
References: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6lj3vlyNinDoNTo4QZwyTeJ7afyM68ayWd/4RXMK5yQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGc/z6Dh2K3UyhZxLpzqSp/Hnnh9G3yGVLlnPu 95XHfx4ZNGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBnP8wAKCRCPgPtYfRL+ TlpGCACqTRlnylgQPlRehsNoN8is2AwcF1J/7UoD6UJ07PVE89+roVmaIZ062H5zCcULQJYSEzx SxjxBGtQ7q5CLvE1spK5X+YNAvi3kOEM4XaNGHUCv0M2yh35J3KbgwG6pveVma2A1pl7FCiD/2z hOVfRY6etcY0toj1veuinq0m6AXLIl2pmYvAuvbEBMBXRTqvYqKqKRiV/yN9leo3CmIl2E1i6B7 2VCGFr0QLJ3w/ceRjrG7BgKg48vG8knqmvNAkCFpSdAJpsYkf3I1iEji83+G3Oql6MIelR7TKso 5/t3spLf+b4nnl9cqBT3uGZnsiwsXW4TsaDVFlJZfEInuJd4
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
 drivers/rpmsg/qcom_glink_rpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index f94bb7d4f1ec..357272d7062e 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -361,7 +361,7 @@ static int glink_rpm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int glink_rpm_remove(struct platform_device *pdev)
+static void glink_rpm_remove(struct platform_device *pdev)
 {
 	struct glink_rpm *rpm = platform_get_drvdata(pdev);
 	struct qcom_glink *glink = rpm->glink;
@@ -371,8 +371,6 @@ static int glink_rpm_remove(struct platform_device *pdev)
 	qcom_glink_native_remove(glink);
 
 	mbox_free_channel(rpm->mbox_chan);
-
-	return 0;
 }
 
 static const struct of_device_id glink_rpm_of_match[] = {
@@ -383,7 +381,7 @@ MODULE_DEVICE_TABLE(of, glink_rpm_of_match);
 
 static struct platform_driver glink_rpm_driver = {
 	.probe = glink_rpm_probe,
-	.remove = glink_rpm_remove,
+	.remove_new = glink_rpm_remove,
 	.driver = {
 		.name = "qcom_glink_rpm",
 		.of_match_table = glink_rpm_of_match,
-- 
2.39.2

