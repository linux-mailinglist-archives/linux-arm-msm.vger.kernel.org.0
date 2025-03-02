Return-Path: <linux-arm-msm+bounces-49948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302CEA4B31A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 17:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A37491888988
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 16:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54571E9B21;
	Sun,  2 Mar 2025 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="WZKfENVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EB1DF25C
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932588; cv=none; b=bZoqsluvnZA9L5UkOBeQJQn8C5ebXWHAX6NCVQQNFNG7qBCx/7olCmo974cTlZEaL7/jdT+Wj6/iJymB+rFC5TzCPoxoCeetG82+0qO38r06bwlhE2yWUEi3jzrdDk4GV5I3xIzP4ZHI/U9ug3qH6gGjPFEZzJMn5enOH5PTyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932588; c=relaxed/simple;
	bh=fsTld9oZlagzwO1jLAdAh7LD4Z7V5RpIOEJifrFD6wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPzuAaY+x2DZNBfid3SBBMQ7tt5qRA2VdNMQ+9FcJx3YGvCvQHT7hUg2eh9o+BIZ0V99BvVXdOCemy1QT3fPGhNbTiYb7b7ymOkuP06/N0yEmxHZyEkF2uomjCRxGfWV2U1mKcTaHBFfaqu5A0IC+ZBJQvnuFQSgb9wIaf4wQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=WZKfENVw; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id om4YtTJnYVX8Kom4ntOvxG; Sun, 02 Mar 2025 17:22:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740932521;
	bh=mMxtNjaN1D/JnAddRo1l6ksJqaO6xXpwl4cipUHLflM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WZKfENVwhxUj6v4nxcNGyjBX+j+upnfCMMF4zedaTfdezmQZOAJQzYR7vnnE3ZqkL
	 E5Qr5nDtDvl4LNVgCHlJStd++9UYQHzaQ8PRvn2kqN7onrZGCRQR/OTaSzm4Kw5sPW
	 lv2mL+sB5nTdUKeVBewOyy2uL5xrpGgOugU9k05ZYV/yYi+q/LPkj4fuQXU0ZQhF1r
	 MSQdDAABsNB7dMU8iY2166YBUzTeFNcJHi1qxzYC9BXbX+0RpcnSk5hsK2ab1mBF3T
	 GLiAB5C6zrfeTdEX/j4RKefeVBvqQ8ucvwS90GDqU3f3OEhTSqRtVYpHV14IHUzDSL
	 rFxpPy4T7Zeew==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 17:22:01 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andersson@kernel.org,
	Michael.Srba@seznam.cz,
	konradybcio@kernel.org,
	jeffrey.l.hugo@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] bus: qcom-ssc-block-bus: Fix the error handling path of qcom_ssc_block_bus_probe()
Date: Sun,  2 Mar 2025 17:21:35 +0100
Message-ID: <1b89ec7438c9a893c09083e8591772c8ad3cb599.1740932040.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If qcom_ssc_block_bus_pds_enable() fails, the previous call to
qcom_ssc_block_bus_pds_attach() must be undone, as already done in the
remove function.

In order to do that, move the code related to the power domains management
to the end of the function, in order to avoid many changes in all the error
handling path that would need to go through the new error handling path.

Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.

It is also speculative. Power management interaction can be sometimes
tricky and I'm not 100% sure that moving this code in fine.

Review with care.
---
 drivers/bus/qcom-ssc-block-bus.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index c95a985e3498..7f5fd4e0940d 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -264,18 +264,6 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	data->pd_names = qcom_ssc_block_pd_names;
-	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
-
-	/* power domains */
-	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
-
-	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
-	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
-
 	/* low level overrides for when the HW logic doesn't "just work" */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
 	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
@@ -343,11 +331,30 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 
 	data->ssc_axi_halt = halt_args.args[0];
 
+	/* power domains */
+	data->pd_names = qcom_ssc_block_pd_names;
+	data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
+
+	ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "error when attaching power domains\n");
+
+	ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
+	if (ret < 0) {
+		dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
+		goto err_detach_pds_bus;
+	}
+
 	qcom_ssc_block_bus_init(&pdev->dev);
 
 	of_platform_populate(np, NULL, NULL, &pdev->dev);
 
 	return 0;
+
+err_detach_pds_bus:
+	qcom_ssc_block_bus_pds_detach(&pdev->dev, data->pds, data->num_pds);
+
+	return ret;
 }
 
 static void qcom_ssc_block_bus_remove(struct platform_device *pdev)
-- 
2.48.1


