Return-Path: <linux-arm-msm+bounces-78041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD4BF2487
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D2BE4ED8C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2780279798;
	Mon, 20 Oct 2025 16:02:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DC23E33D;
	Mon, 20 Oct 2025 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976145; cv=none; b=WAn41ebPsq1gvEwTT1ZF1h7bKchQJZi97Vpd8OAqyOMgIWaDIC9YYaUfR85S7QbPGert2fujtB6SlS1OEvDdwlIM7ILQkZkdneJSSaGgtPcf1gIwlG/1wi6fDQPFRG7Cnq0/XzCjZh+cVM/m2eknKwLPRXS0KXwvztrRLlqgoiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976145; c=relaxed/simple;
	bh=/ZvV3Y69oRvNWtCVQEv25ykydeIvnyXyip7Dd2u7jfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVvsPijqQtv2SFB6fmrhCTPTyHQ4JKDISPHIDqD4dUtHS8QKE9nApXfHJhuSrePMSCLEOSRjmrwS1gdidqAY+nSNUAZHBxjbm3HkYuCFxngFEIlUxbSMYJlldsXIzTSlIHZOCmFIwmX4E3FxowaOsAHNeKFqVJJ30/7Ngvw/Ge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-03 (Coremail) with SMTP id rQCowACn830JXfZorNwzEg--.26415S2;
	Tue, 21 Oct 2025 00:02:18 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] soc: qcom: gsbi: fix double disable caused by devm
Date: Tue, 21 Oct 2025 00:02:15 +0800
Message-ID: <20251020160215.523-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACn830JXfZorNwzEg--.26415S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1Dur13Ary3WrW7WF4kJFb_yoW8Wryxpa
	48JF93Cr48JF4Yka9rJw4UZF12y34fta4jgwn3C3s3Z3Z8Zr10qFy8tFy8ZF95XFZ5AFsx
	Jr47tr4rAFn8uFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYBA2j2T7wZzAAAsw

In the commit referenced by the Fixes tag, devm_clk_get_enabled() was
introduced to replace devm_clk_get() and clk_prepare_enable(). While
the clk_disable_unprepare() call in the error path was correctly
removed, the one in the remove function was overlooked, leading to a
double disable issue.

Remove the redundant clk_disable_unprepare() call from gsbi_remove()
to fix this issue. Since all resources are now managed by devres
and will be automatically released, the remove function serves no purpose
and can be deleted entirely.

Fixes: 489d7a8cc286 ("soc: qcom: use devm_clk_get_enabled() in gsbi_probe()")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/soc/qcom/qcom_gsbi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index 8f1158e0c631..a25d1de592f0 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -212,13 +212,6 @@ static int gsbi_probe(struct platform_device *pdev)
 	return of_platform_populate(node, NULL, NULL, &pdev->dev);
 }
 
-static void gsbi_remove(struct platform_device *pdev)
-{
-	struct gsbi_info *gsbi = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(gsbi->hclk);
-}
-
 static const struct of_device_id gsbi_dt_match[] = {
 	{ .compatible = "qcom,gsbi-v1.0.0", },
 	{ },
@@ -232,7 +225,6 @@ static struct platform_driver gsbi_driver = {
 		.of_match_table	= gsbi_dt_match,
 	},
 	.probe = gsbi_probe,
-	.remove = gsbi_remove,
 };
 
 module_platform_driver(gsbi_driver);
-- 
2.25.1


