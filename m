Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3946E3380
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 22:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjDOUTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 16:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjDOUTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 16:19:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D3226BE
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 13:19:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnmML-000643-8M; Sat, 15 Apr 2023 22:18:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnmMJ-00BUuI-UE; Sat, 15 Apr 2023 22:18:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnmMI-00DUZG-Ue; Sat, 15 Apr 2023 22:18:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] soc: qcom: ramp_controller: Improve error message for failure in .remove()
Date:   Sat, 15 Apr 2023 22:18:48 +0200
Message-Id: <20230415201848.3779001-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=XGqVcoHIQx9s0/ZmljGKaTyrZdyEfKfneW24jL+k0es=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkOwanQbqkKC45PMwoJIH6m2L+VfLGAGodKokF+ 5rUbaRS7feJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZDsGpwAKCRCPgPtYfRL+ TtIGB/9+1kJdyDCmbS5+9yNR1+wRygkeQnx25UHmExiizF1Ziuk2w1As7/cGlRykiu95wgPGrN2 dbPhtzn6vEZ6gxqsFi2y9rnoM1V0KsgrrXYoFTrw/5xtgMoydVEBSGDeUVRliqsstkEh+5b2ITa oScJ/rOFluNlLbgxsbd+Mt8Ru1bk/yLlOn+tnvQIpfFtRKMyy1FhBU+hX+GJ0u0c2Rls4l+eqZV Z8kfMAnxMnjDpwogJZc6CgOWjI0rUcOI6+mQoK+r682v1SFfpwUU2Rw3E0kGBkJkksJ+626Ds2s jUCZuLFgq7P5nwFWxHWcSvmKAvsKnobEo3gedn7OCA28ePMF
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

When a platform_driver's .remove() callback returns an error, the driver
core emits

	remove callback returned a non-zero value. This will be ignored.

. Replace this by a more specific error message. Then convert to
.remove_new() which is equivalent to returning zero unconditionally in
.remove(). See commit 5c5a7680e67b ("platform: Provide a remove callback
that returns no value") for its rationale.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/qcom/ramp_controller.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
index dc74d2a19de2..1ff13661bcce 100644
--- a/drivers/soc/qcom/ramp_controller.c
+++ b/drivers/soc/qcom/ramp_controller.c
@@ -308,12 +308,15 @@ static int qcom_ramp_controller_probe(struct platform_device *pdev)
 	return qcom_ramp_controller_start(qrc);
 }
 
-static int qcom_ramp_controller_remove(struct platform_device *pdev)
+static void qcom_ramp_controller_remove(struct platform_device *pdev)
 {
 	struct qcom_ramp_controller *qrc = platform_get_drvdata(pdev);
+	int ret;
 
-	return rc_write_cfg(qrc, qrc->desc->cfg_ramp_dis,
-			    RC_DCVS_CFG_SID, qrc->desc->num_ramp_dis);
+	ret = rc_write_cfg(qrc, qrc->desc->cfg_ramp_dis,
+			   RC_DCVS_CFG_SID, qrc->desc->num_ramp_dis);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to send disable sequence\n");
 }
 
 static const struct of_device_id qcom_ramp_controller_match_table[] = {
@@ -329,7 +332,7 @@ static struct platform_driver qcom_ramp_controller_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe  = qcom_ramp_controller_probe,
-	.remove = qcom_ramp_controller_remove,
+	.remove_new = qcom_ramp_controller_remove,
 };
 
 static int __init qcom_ramp_controller_init(void)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

