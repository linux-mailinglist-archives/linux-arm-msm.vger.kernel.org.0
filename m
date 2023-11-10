Return-Path: <linux-arm-msm+bounces-459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E427E7D6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 16:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0906C1C20757
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 15:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9D91CA80;
	Fri, 10 Nov 2023 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019E1CA81
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 15:30:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169773A8B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 07:30:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT4-0006KG-Fi; Fri, 10 Nov 2023 16:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT3-0083KH-6A; Fri, 10 Nov 2023 16:30:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT2-00GnwT-TA; Fri, 10 Nov 2023 16:30:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-serial@vger.kernel.org
Subject: [PATCH 26/52] serial: msm: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:29:54 +0100
Message-ID: <20231110152927.70601-27-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LJgsO25Eg8wbVQzDwqFJ8bN3QTncxxhr1VMEufgIMHA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTkx1HE0iNJjsPpzlmXxolLFIaCVZE0CjFTeP7 MihzWtfOwOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU5MdQAKCRCPgPtYfRL+ TiZoB/9r0qVGebSbtTyBYd6LsFJLk7x0aIYEXHi2Gbc9FlSJeON/gmWEtaUmfY2FVfwEk5cetvm fSTkUkogVaC4j5mly2roUfnxIAhMdrm6vy2/p+ommTBTnRu8HCNSVv7+vrayw+lT7xPm2uIV9gl grei+DjQw2HAZbL4Ow1CBSDc07aOrz/bXHt+gIy5KlyxAbXQR0iO2gkv8i63ThbSiNNOXolCo4J wI0f1wFttN8pZsP1VzMLA/GcGnpqEzA/c3CXVOSHAW7s4i0k2/FjxPsqcOEM/We042Z+T+1UR8b j9lPaIm5aLpM//NH3IgQfTNZy95e706/P1yCsYZozUcK5kqb
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
 drivers/tty/serial/msm_serial.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 597264b546fd..7fc8f0b16aef 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1843,13 +1843,11 @@ static int msm_serial_probe(struct platform_device *pdev)
 	return uart_add_one_port(&msm_uart_driver, port);
 }
 
-static int msm_serial_remove(struct platform_device *pdev)
+static void msm_serial_remove(struct platform_device *pdev)
 {
 	struct uart_port *port = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&msm_uart_driver, port);
-
-	return 0;
 }
 
 static const struct of_device_id msm_match_table[] = {
@@ -1882,7 +1880,7 @@ static const struct dev_pm_ops msm_serial_dev_pm_ops = {
 };
 
 static struct platform_driver msm_platform_driver = {
-	.remove = msm_serial_remove,
+	.remove_new = msm_serial_remove,
 	.probe = msm_serial_probe,
 	.driver = {
 		.name = "msm_serial",
-- 
2.42.0


