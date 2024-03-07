Return-Path: <linux-arm-msm+bounces-13616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5168755BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 19:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 685DD1F21AC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 18:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F39C12FF8C;
	Thu,  7 Mar 2024 18:04:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E917722
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709834661; cv=none; b=jxKl2x8ApRGHYwLepBbuoBLo1wgZarnZ1N6hrsedwMODmkSCWdh/3n39v5p3riYy/ebQrUYpgwQ/yjGQoEnvNej3GkTTaEtnFeYBeGEdCiQprREim5dXL5/Qp7XdxThG/2E2B9IKuknT0wvj10EWXSp85QLBSKjXSR4J+nmX8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709834661; c=relaxed/simple;
	bh=yc3g+/Nd0Pmwxjkl5V0c/NkFhMJ9uLA4cRIf408SeNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GjHW0ii+lGcJZN9UOacTPgBlorpHC6LgeWhR+MaXKoz/k5BrRlCk3pqO/AZBOLubNhAGN+Y2z1unABfdqqBnUMoVhgDFb4UJsJdXXzPdJ5LaQwW+mKIjo6mEWHqRKdMGFcgRNmIOrgBxqNp09NRJ2rowcUf6ty6JAPM5Ev38Zsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riI6D-00083p-Fl; Thu, 07 Mar 2024 19:04:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riI6C-004zVU-8k; Thu, 07 Mar 2024 19:04:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riI6C-001Sgr-0Z;
	Thu, 07 Mar 2024 19:04:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH] soundwire: qcom: Convert to platform remove callback returning void
Date: Thu,  7 Mar 2024 19:03:59 +0100
Message-ID: <20240307180359.190008-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yc3g+/Nd0Pmwxjkl5V0c/NkFhMJ9uLA4cRIf408SeNw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6gGPZNGepLlfgoCna5QMiHA9JERGJwnpgjMym Hlx2ao8oeuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeoBjwAKCRCPgPtYfRL+ TjfjB/4zXDBVH77xtXV3ubd9f3ubktiED7cdyL+RSJsZQwDLU9+74pI5FA5WJoGsOQfvt0oNoFb X0q+dMB+83aaAIzA86WU90jisBQKoVbUqlFKHWXPHHpxqxBjezC5oCIwKcpVVR6cPGinU23bRQ3 h3/+gxD9wtuG1+RtBMldZ7oNoLArZmosFc+06ZwaprkPaJucVN+NeXRxhRx8tRe24ihCs3HIzLg AdvMch1REn9kuP2uvDBRk+m1IgxqNN3ZpgTgDn52Oq1eI9n7uO04pqmCDvpM129gLO0NuOPC7TA 14WYQGWpIjCX4biJyrtgjqS5zie5JzcA1SEwb56b/IZPSQr7
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soundwire/qcom.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3c4d6debab1f..fb70afe64fcc 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1636,14 +1636,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_swrm_remove(struct platform_device *pdev)
+static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
 	sdw_bus_master_delete(&ctrl->bus);
 	clk_disable_unprepare(ctrl->hclk);
-
-	return 0;
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
@@ -1769,7 +1767,7 @@ MODULE_DEVICE_TABLE(of, qcom_swrm_of_match);
 
 static struct platform_driver qcom_swrm_driver = {
 	.probe	= &qcom_swrm_probe,
-	.remove = &qcom_swrm_remove,
+	.remove_new = qcom_swrm_remove,
 	.driver = {
 		.name	= "qcom-soundwire",
 		.of_match_table = qcom_swrm_of_match,

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0


