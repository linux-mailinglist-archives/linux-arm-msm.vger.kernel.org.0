Return-Path: <linux-arm-msm+bounces-31312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A79719B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E611C23092
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECED1B791A;
	Mon,  9 Sep 2024 12:43:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B121B78E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885792; cv=none; b=Zuqai3CWEEnryyQRFZ/SWtBrTQRvD/Qd+LEAo5g35E9kUgPm/PmdRbgLfqSSm1idji/8oIKr+bN6NKS9W4EjPZL4dXGMsnW6b1JQux3OQFaIfKQiHdbW1UfIa1H7Yb5pU25QPNyFyqfTeyZhdNpNMlGPyKtg/nvMioSwV7ISddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885792; c=relaxed/simple;
	bh=Dqp5ecNxZw5g63/smkaU9qFaQVRWAtKNcpXz2Ib8jSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BILzR8t9gfAoWsLYmOUUk6JHNQOCPBrJwygwVm1GMRqdOufw/rNCS6RdeSdBxIR6RIlgUmE3vFGUt8gUTkVjsALsiZsOEKc715AO3QaB5pjo2jSTvuTu24hFaSc/MM/YuLE8mDPJSg39ABlUFykOToG1NaxlUmfdFsIOI0HbVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X2RMF3bP2z1xx4Z;
	Mon,  9 Sep 2024 20:43:05 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F47414022D;
	Mon,  9 Sep 2024 20:43:07 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:06 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 2/4] soc: aspeed: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:19 +0800
Message-ID: <20240909122921.12627-3-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240909122921.12627-1-zhangzekun11@huawei.com>
References: <20240909122921.12627-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use dev_err_probe() directly in the driver probe phase, and we
don't need to judge if the error code is not equal to -EPROBE_DEFER.
This can simplify the code a bit.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 888b5840c015..33d9f8f2e662 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -293,12 +293,10 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(lpc_snoop->clk)) {
-		rc = PTR_ERR(lpc_snoop->clk);
-		if (rc != -EPROBE_DEFER)
-			dev_err(dev, "couldn't get clock\n");
-		return rc;
-	}
+	if (IS_ERR(lpc_snoop->clk))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk),
+				     "couldn't get clock\n");
+
 	rc = clk_prepare_enable(lpc_snoop->clk);
 	if (rc) {
 		dev_err(dev, "couldn't enable clock\n");
-- 
2.17.1


