Return-Path: <linux-arm-msm+bounces-3344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F4803D10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D621C20AED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D3F2FE10;
	Mon,  4 Dec 2023 18:31:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBD7113
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 10:31:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj4-0003DX-EP; Mon, 04 Dec 2023 19:31:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj3-00DZmp-UM; Mon, 04 Dec 2023 19:31:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj3-00EE7e-Kg; Mon, 04 Dec 2023 19:31:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH net-next v2 7/9] net: wwan: qcom_bam_dmux: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 19:30:47 +0100
Message-ID:  <49795ee930be6a9a24565e5e7133e6f8383ab532.1701713943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=gecgcvbwx7q0Th+9mTV/aok7FkCDGBOA1YzmdyxXVcQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbhrj/xzui6tM9WRwNtnUzQcyOhsKbD02bNGyC eMLVfMnSvuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW4a4wAKCRCPgPtYfRL+ TldECAC0hnSJMtkR/CIgqW7VpDUGbGYWLuWSvEbYWhswMpsImayQur67L+P/nuG98R2sBicMTw7 gHVH2Sy3K6G8cVZhMKWW2MIIMmd6fEAT03LkW93Gt0j+0xJWpS4SUt1/rEroCTzxgKjrNX7qe/Y 3JFQaPQcjZnj1P+tCYJEmlc4m5vb2wbJUNQYuSfmHXHwsLv9hwB2BnA2HsJvrGRg5jCdxX58aYI ymdRqHjO+F5XkpKwQMcyVqNum+VXyFEFP+GJiiQSnC5Yiek8ggczj8KpVRXzxEelfHnmTQ/DRHe rT60ffp+pg/GK4Pl3NabFP8U4QC3rpt7SVuFRlHyFIpLuEaB
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

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Link: https://lore.kernel.org/r/20231117095922.876489-9-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/wwan/qcom_bam_dmux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 17d46f4d2913..26ca719fa0de 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -846,7 +846,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bam_dmux_remove(struct platform_device *pdev)
+static void bam_dmux_remove(struct platform_device *pdev)
 {
 	struct bam_dmux *dmux = platform_get_drvdata(pdev);
 	struct device *dev = dmux->dev;
@@ -877,8 +877,6 @@ static int bam_dmux_remove(struct platform_device *pdev)
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
-
-	return 0;
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {
@@ -893,7 +891,7 @@ MODULE_DEVICE_TABLE(of, bam_dmux_of_match);
 
 static struct platform_driver bam_dmux_driver = {
 	.probe = bam_dmux_probe,
-	.remove = bam_dmux_remove,
+	.remove_new = bam_dmux_remove,
 	.driver = {
 		.name = "bam-dmux",
 		.pm = &bam_dmux_pm_ops,
-- 
2.42.0


