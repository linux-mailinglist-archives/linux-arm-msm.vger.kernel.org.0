Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C576F77BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 23:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjEDVDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 17:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjEDVDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 17:03:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CCA120BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 14:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0007ju-QQ; Thu, 04 May 2023 21:45:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-0018G1-Ta; Thu, 04 May 2023 21:45:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-001Jhx-8p; Thu, 04 May 2023 21:45:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 12/18] remoteproc: qcom_q6v5_wcss: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:47 +0200
Message-Id: <20230504194453.1150368-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hEYOLla0s10ljNMOkN+X1sTxpgifBXFer6YgKTNfGws=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnKlnGL4MZgBwGnntyjvdSP2hUu+n+fNJe2s EAWRsPSgGCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJygAKCRCPgPtYfRL+ TqufB/9GUwk/g09ooQe/jDzDQJPbJwctnWtt1laYnXkW4jhRPl3mmyIxWnFUfSM4Ta0PKAfFpxH G1hppe8O1jO2gRCjJep1Fzy0xA6irdpvZgkzEReHOLy1JRO1+9nxX6C0p0jUqichDCMOy8u5Ftd yIY6eWBH0KjHEMFjvwL20s0+q9qOpq3Vv7wDEvlwWzVCrasIf7+Ople8fHfZACkmM1NMvRYG/ow jGIDX8xEsgVntVnx5Xj9TvUY5zjecUoKMG21SS5ZGqIKZKYHUR8LNVCEA81JNcgKFqZTp8DmmBZ nqXhoU732Zjn9DryQkuCR0td+X1lVzM9xvvja1LDQlwC/YbH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ba24d745b2d6..b437044aa126 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1074,7 +1074,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int q6v5_wcss_remove(struct platform_device *pdev)
+static void q6v5_wcss_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -1082,8 +1082,6 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	qcom_q6v5_deinit(&wcss->q6v5);
 	rproc_del(rproc);
 	rproc_free(rproc);
-
-	return 0;
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
@@ -1117,7 +1115,7 @@ MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
 
 static struct platform_driver q6v5_wcss_driver = {
 	.probe = q6v5_wcss_probe,
-	.remove = q6v5_wcss_remove,
+	.remove_new = q6v5_wcss_remove,
 	.driver = {
 		.name = "qcom-q6v5-wcss-pil",
 		.of_match_table = q6v5_wcss_of_match,
-- 
2.39.2

