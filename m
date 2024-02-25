Return-Path: <linux-arm-msm+bounces-12463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231986288D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 01:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBDB1F2182D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 00:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB88353A0;
	Sun, 25 Feb 2024 00:19:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC87C5382
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708820365; cv=none; b=P8syqJi0ly42ZenlJnc0NHlImfHOCqfUx2a3WxIetRPzU70WqRGI2h/bt9iu2s6qxVVMMzmzva8mQnUYRy/cldLO6k/Z7SgfAE/L/C52r1N1J7j8SazK01mmfY2wB/BoKiTY7t4TjJKAXg2m6Ij0LO35kLuFgXwL35yPwgyUt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708820365; c=relaxed/simple;
	bh=nduO32j5qsm2coGafczycwKiA7C3nN/RZtlpKylZp5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BqPbXq6li4U+a3c5auUEYJkFPSWzjNaNdLGpR24VaUyU+qPB4fNr6hJ5vNHkkrb3cAFBYJUCAlnLDchoRDGrSE0S0XnvWpVjxM4F6OJTEZMPTT3bo0M2nfMiqR1cLPBH+Guc6I5YkZ1Q3QAtPmwSlW1M4xwFLYttmFJQpXmsAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Eg-00083G-Sz; Sun, 25 Feb 2024 01:19:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Ef-002hqj-KN; Sun, 25 Feb 2024 01:19:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Ef-00BECA-1l;
	Sun, 25 Feb 2024 01:19:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH] slimbus: Convert to platform remove callback returning void
Date: Sun, 25 Feb 2024 01:19:12 +0100
Message-ID: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nduO32j5qsm2coGafczycwKiA7C3nN/RZtlpKylZp5w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2od/k84X9L/jnA4xVjpD/FS1Oq1ut4DOBU2JD nWnORsIjxyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdqHfwAKCRCPgPtYfRL+ Tma/B/9fj/E01fkh3HM/1jPSKl/FEuPGo9t5r8YvISAPTQg/Y1E4YAwcY1KH0t02RNpMTGBXmIQ ciEYUjifs409s/zUJODLnI47S0y2rMlWop/92joRodcPvI/vdbjVFdCnPubLRuZrObS2t4rQb8L R+oZ1ielvLZGqdazd32u61DXasmc6VffzGKhaN3TXmLOs/ddLgF+pRzSoRURyzF0dBEd7S82cab v/NhhX0NKz7GPIDbnCXY+/8erBosc4DdhiEvQLRqP2SPcISksX31aYfkUG8tLShob7Rvldmr49I DYo+ZnJmtVudPSz93oS36Homhhd2GQHXSfyGoqjhtBp7/nqN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert the slimbus drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/slimbus/qcom-ctrl.c     |  5 ++---
 drivers/slimbus/qcom-ngd-ctrl.c | 11 ++++-------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 400b7b385a44..7d632fad1300 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -626,7 +626,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_slim_remove(struct platform_device *pdev)
+static void qcom_slim_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ctrl *ctrl = platform_get_drvdata(pdev);
 
@@ -635,7 +635,6 @@ static int qcom_slim_remove(struct platform_device *pdev)
 	clk_disable_unprepare(ctrl->rclk);
 	clk_disable_unprepare(ctrl->hclk);
 	destroy_workqueue(ctrl->rxwq);
-	return 0;
 }
 
 /*
@@ -721,7 +720,7 @@ static const struct of_device_id qcom_slim_dt_match[] = {
 
 static struct platform_driver qcom_slim_driver = {
 	.probe = qcom_slim_probe,
-	.remove = qcom_slim_remove,
+	.remove_new = qcom_slim_remove,
 	.driver	= {
 		.name = "qcom_slim_ctrl",
 		.of_match_table = qcom_slim_dt_match,
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..a5aa364f562e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1675,14 +1675,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
+static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	platform_driver_unregister(&qcom_slim_ngd_driver);
-
-	return 0;
 }
 
-static int qcom_slim_ngd_remove(struct platform_device *pdev)
+static void qcom_slim_ngd_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
@@ -1697,7 +1695,6 @@ static int qcom_slim_ngd_remove(struct platform_device *pdev)
 
 	kfree(ctrl->ngd);
 	ctrl->ngd = NULL;
-	return 0;
 }
 
 static int __maybe_unused qcom_slim_ngd_runtime_idle(struct device *dev)
@@ -1740,7 +1737,7 @@ static const struct dev_pm_ops qcom_slim_ngd_dev_pm_ops = {
 
 static struct platform_driver qcom_slim_ngd_ctrl_driver = {
 	.probe = qcom_slim_ngd_ctrl_probe,
-	.remove = qcom_slim_ngd_ctrl_remove,
+	.remove_new = qcom_slim_ngd_ctrl_remove,
 	.driver	= {
 		.name = "qcom,slim-ngd-ctrl",
 		.of_match_table = qcom_slim_ngd_dt_match,
@@ -1749,7 +1746,7 @@ static struct platform_driver qcom_slim_ngd_ctrl_driver = {
 
 static struct platform_driver qcom_slim_ngd_driver = {
 	.probe = qcom_slim_ngd_probe,
-	.remove = qcom_slim_ngd_remove,
+	.remove_new = qcom_slim_ngd_remove,
 	.driver	= {
 		.name = QCOM_SLIM_NGD_DRV_NAME,
 		.pm = &qcom_slim_ngd_dev_pm_ops,

base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0


