Return-Path: <linux-arm-msm+bounces-460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7A7E7D6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 16:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D824E1C20AF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9A91CA83;
	Fri, 10 Nov 2023 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0821CA81
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 15:30:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4553AE02
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 07:30:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT5-0006NU-Fo; Fri, 10 Nov 2023 16:30:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT4-0083Ka-71; Fri, 10 Nov 2023 16:30:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT3-00Gnwo-U3; Fri, 10 Nov 2023 16:30:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-serial@vger.kernel.org
Subject: [PATCH 31/52] serial: qcom_geni: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:29:59 +0100
Message-ID: <20231110152927.70601-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jSi3z2or1rdpGNyOiJdggwaRQkzjjaHHI+qrhcFS8qE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQ/n/o/xgXSPPabC8Q2PtD8+jPCUyrTzc1iYuyUDi3xL ZXnFnzuZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiaiwcDB21eRahC5vZfv/R MNTjOqW8p7RS75CRZHtMaEJhZ5hdidxplekqMbrMa3r+FjzVWO0vKsrSM2/Cx7Ou6S5WDvfeFW5 silo06U1Tzu87OzmcemT6ds7b8TlVqU8z/+6LTd8OGW3ee/7K5VAbzi+a1R2nfj/QNwtbYawu7q 02+cT3J6rLHjZ8D9mX3q8XIN1atepy6t75lpy72G6+W/DSKfBrheaCFfWzXggXHqm+eWy3h1O+g RgLK08U2/riCfnxeZLJ79/UxbRYBFd1/mH4fLTm7vzHgdZGTK5sC3TcDVdHW4T6PvN9r6wzv1t3 ifSSfre4ebyRAef4ueY0eYlV9DrWdbtvLaz0n3BOaT8A
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
 drivers/tty/serial/qcom_geni_serial.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7e78f97e8f43..e63a8fbe63bd 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1696,7 +1696,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int qcom_geni_serial_remove(struct platform_device *pdev)
+static void qcom_geni_serial_remove(struct platform_device *pdev)
 {
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->private_data.drv;
@@ -1704,8 +1704,6 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
-
-	return 0;
 }
 
 static int qcom_geni_serial_sys_suspend(struct device *dev)
@@ -1805,7 +1803,7 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
 
 static struct platform_driver qcom_geni_serial_platform_driver = {
-	.remove = qcom_geni_serial_remove,
+	.remove_new = qcom_geni_serial_remove,
 	.probe = qcom_geni_serial_probe,
 	.driver = {
 		.name = "qcom_geni_serial",
-- 
2.42.0


