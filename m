Return-Path: <linux-arm-msm+bounces-32202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5197EAFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 13:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A6B3B20759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9F182C60;
	Mon, 23 Sep 2024 11:47:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24706433D6;
	Mon, 23 Sep 2024 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092068; cv=none; b=U9zKydx5srllyPX/bA2GvH53ikIy7dOf9DAZUZAtxn9eS/EcNzwZWYJnyx44WtlO25/l5FY99Jr5yN2TTFd9S/rBOnHisQGrAd2o12/Sb01kGIZ1H6Jmr5TFLwr2K6Kw8JBtsNo/cv7O2f3/4lCQgxVR2eui1k8iCgynkpiarf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092068; c=relaxed/simple;
	bh=vGEtl2dx+wLKXYLoTRA44ll9w1yabp9wwxFdAIE0Ew0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ITWpaTUja84tLhmbDdcBmCJO0K7a0sQKLOMAFYVznp1iZdrgY+DyGkSRdFzovAA0mRf7pTIj5KKbEaMzXlnAENOxPw8XSpPYthPJVgwBIx8yEbi4H/4xj3i4UiYKc6L5lCMXX2dqiHwgXQ12XNU7okAcJc4SY/WhcNkerKNQVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XC1QH5lJxzfcbh;
	Mon, 23 Sep 2024 19:45:27 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A3321800A7;
	Mon, 23 Sep 2024 19:47:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 19:47:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <stephan@gerhold.net>, <loic.poulain@linaro.org>,
	<ryazanov.s.a@gmail.com>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
Date: Mon, 23 Sep 2024 19:57:43 +0800
Message-ID: <20240923115743.3563079-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

It's important to undo pm_runtime_use_autosuspend() with
pm_runtime_dont_use_autosuspend() at driver exit time.

But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
is missing in the error path for bam_dmux_probe(). So add it.

Found by code review. Compile-tested only.

Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Drop the unneeded pm_runtime_set_suspended().
- Add Suggested-by.
- Update the commit message.
---
 drivers/net/wwan/qcom_bam_dmux.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 26ca719fa0de..5dcb9a84a12e 100644
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
@@ -844,6 +844,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	return ret;
 }
 
 static void bam_dmux_remove(struct platform_device *pdev)
-- 
2.34.1


