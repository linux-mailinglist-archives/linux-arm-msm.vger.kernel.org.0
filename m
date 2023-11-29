Return-Path: <linux-arm-msm+bounces-2459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC27FD7C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1728B210F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CA200A7;
	Wed, 29 Nov 2023 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ePlShHCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1CBE9A;
	Wed, 29 Nov 2023 05:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZuVjrWr8wX46bqcce9
	Cf5hGZQTG2aZ8czUpTlfy7WnQ=; b=ePlShHCijkw4pyW/7v1OmPiWnVfkyxMOwo
	XICgzvJ+GihHruj9VN3wwxyhCDdBYYhgUkeZ+4CHS1k4ZDq0Tapti/6ytRiisjiy
	xkFkUqGMtvtgiEW5UAV3JsF6t0Jpx/B9ktA4h9zQsHfR98VcVLD8yInXfInCErTd
	vqUX6upns=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3v9IJOmdl5eXHBQ--.12960S2;
	Wed, 29 Nov 2023 21:18:02 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: agross@kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	sre@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [power/reset] msm-poweroff: Add error handling
Date: Wed, 29 Nov 2023 05:17:59 -0800
Message-Id: <20231129131759.33938-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3v9IJOmdl5eXHBQ--.12960S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xr4kGryxKry3Zw13uF1xZrb_yoW8JrW7pr
	4kCr1Ykr43Cw47ZF4jvF1xCFyruan3t3y7CrWxGw1xZw4DXr95tr1UtFyUtF47Kry7XFyS
	vF4avry8uF43uFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi89N3UUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgU3gletj5Qh6wABso
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This patch introduces error handling for the
register_restart_handler call in the msm_restart_probe function
within drivers/power/reset/msm-poweroff.c. Previously, the
function lacked error checking after calling
register_restart_handler, which could potentially lead to
unnoticed failures during system restart operations.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/power/reset/msm-poweroff.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/msm-poweroff.c b/drivers/power/reset/msm-poweroff.c
index d96d248a6e25..9fd84dfa6882 100644
--- a/drivers/power/reset/msm-poweroff.c
+++ b/drivers/power/reset/msm-poweroff.c
@@ -35,11 +35,18 @@ static void do_msm_poweroff(void)
 
 static int msm_restart_probe(struct platform_device *pdev)
 {
+	int ret;
+
 	msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(msm_ps_hold))
 		return PTR_ERR(msm_ps_hold);
 
-	register_restart_handler(&restart_nb);
+	ret = register_restart_handler(&restart_nb);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to register restart handler: %d\n", ret);
+		return ret;
+	}
 
 	pm_power_off = do_msm_poweroff;
 
-- 
2.17.1


