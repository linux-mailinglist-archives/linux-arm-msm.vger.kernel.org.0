Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4B6C35F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 16:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjCUPlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 11:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbjCUPlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 11:41:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F039EC0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:40:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6P-0003Fi-2C; Tue, 21 Mar 2023 16:40:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-005iqN-Dh; Tue, 21 Mar 2023 16:40:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6N-006neg-Ow; Tue, 21 Mar 2023 16:40:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/3] rpmsg: qcom_smd: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 16:40:39 +0100
Message-Id: <20230321154039.355098-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
References: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vfP+6zhvD7kjimlQb22nCx08X9KwzGWQAEQx2IhXimk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGc/1+KJIkhAk3rRv1A43kavA2Wz57kw8+MGKD KfKIuYWM5CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBnP9QAKCRCPgPtYfRL+ TjTzB/97fSHtcCeTzilW09t7bjpdrUhPzH56lwctf5C5ZqqU9j5hsyyXJbHJUmXLp7RIUn8pHg2 KLsz4U2O1zW0Zy8LMy+S0QI0Py3K07mXX9e2alCXTAb22/eiVd+En7JIQpp/tuhnVcYtxHkUewz ey4ohNl27HsxuOGspLuNl/m9D55vjcs4utQUhbR8D5pqUP5H3G0kCSQUMVU1DM+Bs/bCNSH24vM PfuaSARxSX7PzV852+Ljgb5rAXuj33nagCyHJa6t4mJXd0whALD0xRegV0I3PLGWqs0X1YtAUdQ K1MnRK60LMiGHI4dUWvj2r9Az4OtbehaGIISD6pyCESr0wSZ
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

qcom_smd_remove() always returned zero, though that isn't completely
trivial to see. So explain that in a comment and convert to
.remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rpmsg/qcom_smd.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 38352f5792f4..7b9c298aa491 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1579,15 +1579,13 @@ static int qcom_smd_remove_edge(struct device *dev, void *data)
  * Shut down all smd clients by making sure that each edge stops processing
  * events and scanning for new channels, then call destroy on the devices.
  */
-static int qcom_smd_remove(struct platform_device *pdev)
+static void qcom_smd_remove(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = device_for_each_child(&pdev->dev, NULL, qcom_smd_remove_edge);
-	if (ret)
-		dev_warn(&pdev->dev, "can't remove smd device: %d\n", ret);
-
-	return ret;
+	/*
+	 * qcom_smd_remove_edge always returns zero, so there is no need to
+	 * check the return value of device_for_each_child.
+	 */
+	device_for_each_child(&pdev->dev, NULL, qcom_smd_remove_edge);
 }
 
 static const struct of_device_id qcom_smd_of_match[] = {
@@ -1598,7 +1596,7 @@ MODULE_DEVICE_TABLE(of, qcom_smd_of_match);
 
 static struct platform_driver qcom_smd_driver = {
 	.probe = qcom_smd_probe,
-	.remove = qcom_smd_remove,
+	.remove_new = qcom_smd_remove,
 	.driver = {
 		.name = "qcom-smd",
 		.of_match_table = qcom_smd_of_match,
-- 
2.39.2

