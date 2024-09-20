Return-Path: <linux-arm-msm+bounces-32056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7D97D3F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 11:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5671F1F22505
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 09:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E3D13C683;
	Fri, 20 Sep 2024 09:58:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3525776;
	Fri, 20 Sep 2024 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726826292; cv=none; b=DqLTgDz4wRjBcLetq7100/7hORbdhthq9Vn9dDKVc4dbShaC/fZDHp54C7Yol77qoeVdnPUC3vC1UhS74O7gGwzrIySwgMweGXPkg3w956PGpODc3TNFVLvKAiCtHVEgkAlvsG+/StXRKla+ueoFhSh3Wkf7VuHFf4pRmKh0jBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726826292; c=relaxed/simple;
	bh=RwhP6kD+R+flhdbPt2KYBk40TgGTrF/BeCs82KI6gU0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=foqxRHiUJqJZqahiMRiiYysn66OtCFmO6mCXImv1PtWK99u9CUYzxSTDt6dl+B17tWwFkK5we8NOrcYGK0tzo4wpbk3H7qVDcoavVlBMVz0zjqVDLgTA88UuJAJ6+I2uMYiReIVxMz7E7AeijNlDRYHn0cz9+XMYZFoIsvo8W+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X979V6RB6z20pF5;
	Fri, 20 Sep 2024 17:57:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id A98881400F4;
	Fri, 20 Sep 2024 17:58:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Sep
 2024 17:58:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <stephan@gerhold.net>, <loic.poulain@linaro.org>,
	<ryazanov.s.a@gmail.com>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
Date: Fri, 20 Sep 2024 18:07:11 +0800
Message-ID: <20240920100711.2744120-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)

It's important to undo pm_runtime_use_autosuspend() with
pm_runtime_dont_use_autosuspend() at driver exit time.

But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
is missing in the error path for bam_dmux_probe(). So add it.

Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/wwan/qcom_bam_dmux.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 26ca719fa0de..34a4e8095161 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -823,17 +823,17 @@ static int bam_dmux_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, pc_ack_irq, NULL, bam_dmux_pc_ack_irq,
 					IRQF_ONESHOT, NULL, dmux);
 	if (ret)
-		return ret;
+		goto err_disable_pm;
 
 	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
 					IRQF_ONESHOT, NULL, dmux);
 	if (ret)
-		return ret;
+		goto err_disable_pm;
 
 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
 				    &dmux->pc_state);
 	if (ret)
-		return ret;
+		goto err_disable_pm;
 
 	/* Check if remote finished initialization before us */
 	if (dmux->pc_state) {
@@ -844,6 +844,12 @@ static int bam_dmux_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_set_suspended(dev);
+	return ret;
 }
 
 static void bam_dmux_remove(struct platform_device *pdev)
-- 
2.34.1


