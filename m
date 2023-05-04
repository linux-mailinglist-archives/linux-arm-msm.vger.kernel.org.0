Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03BF6F744D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 21:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbjEDTub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 15:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbjEDTtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 15:49:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607E3AD1A
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 12:46:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0007ja-Jn; Thu, 04 May 2023 21:45:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-0018Fu-KZ; Thu, 04 May 2023 21:45:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-001Jhp-PF; Thu, 04 May 2023 21:45:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 10/18] remoteproc: qcom_q6v5_mss: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:45 +0200
Message-Id: <20230504194453.1150368-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EYnLrzOM2rM4Jue/3vyy45KaW8+/jp3OdNzA5zZlpE8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnI3xxaSoIaxtSvV4e3LTgLaHDJN0PPL9pG+ N8tgLqO0pyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJyAAKCRCPgPtYfRL+ TsPUB/0VcyvP3Isi32TDoXohP1VzYo8DMFJifba0igswSRlsckAczkuiRQF1vTQr1DdFWe7Txm8 dxrDcpEDZmjVTMA9566tkoYUDRYA+7EC7t0fCOwIrth1jB0R1p0PKTy91VNuOd2Ue/wxfWnHOEQ cqa1kZfnOb0rXW6KoWV9JZ/a2EusIbuGumG7JI/0RsJgKXbf66+q6ncbSYQ8r//JtReOg+nlTN+ mD5jwVhp2gR6+ZOkdQqYlnkzq6f11mXeCZAMURW9vyDmAXjWHd1lMx3ConnspfUMrhPGPEJDTGx ycg+naWEWd8QVVQ4gbkw/7g618/dYKCzzj3Yb30xdR+5oYMh
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
 drivers/remoteproc/qcom_q6v5_mss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 8e15e4f85de1..70bffc9f33f6 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2110,7 +2110,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int q6v5_remove(struct platform_device *pdev)
+static void q6v5_remove(struct platform_device *pdev)
 {
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = qproc->rproc;
@@ -2128,8 +2128,6 @@ static int q6v5_remove(struct platform_device *pdev)
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 
 	rproc_free(rproc);
-
-	return 0;
 }
 
 static const struct rproc_hexagon_res sc7180_mss = {
@@ -2482,7 +2480,7 @@ MODULE_DEVICE_TABLE(of, q6v5_of_match);
 
 static struct platform_driver q6v5_driver = {
 	.probe = q6v5_probe,
-	.remove = q6v5_remove,
+	.remove_new = q6v5_remove,
 	.driver = {
 		.name = "qcom-q6v5-mss",
 		.of_match_table = q6v5_of_match,
-- 
2.39.2

