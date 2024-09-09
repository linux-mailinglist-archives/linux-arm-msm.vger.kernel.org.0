Return-Path: <linux-arm-msm+bounces-31311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A29719B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 835F31C22DAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D23A1B5ECA;
	Mon,  9 Sep 2024 12:43:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A61B7901
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885792; cv=none; b=ddFEq8lu8XNDELPH3Xs5CM4PJcXlebWx/JhkGjfg0TjQnu1aKMOivkYS9K5SfeRKe9iJM95A4yIEkx5JVS+oeirTr/ob1+cAvuWB+XVv/wiQVYqcqykoI2daK/FUPi2gWiAFcDfn0A84sEsJYjVbsgb9j52wmWASZuDmkcFkxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885792; c=relaxed/simple;
	bh=becaD6o/hyjDE95IqcfZ70JhkM459gnX8U9qnW8KvKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbwO2NwMvB+EmZy5bQ1fYMy47I1ecZQxxc+lhxvs7qFZfC6aKuY9APFQYDwICU0ReeqOPlFHllramstx8B9NdX0LmwMLwW840NB7fwYIa1TzV6HZ9riO1bx09SURIsuaeaSHZHIUBcIKn4sI59lecuAwbAkiPmPxQ12w+ExYXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2RLn6Hs0z1j8Ly;
	Mon,  9 Sep 2024 20:42:41 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B53A18002B;
	Mon,  9 Sep 2024 20:43:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:07 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 4/4] soc: qcom: smp2p: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:21 +0800
Message-ID: <20240909122921.12627-5-zhangzekun11@huawei.com>
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
 drivers/soc/qcom/smp2p.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cefcbd61c628..2731449e2201 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -467,12 +467,9 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
-	if (ret < 0 && ret != -EEXIST) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(smp2p->dev,
-				"unable to allocate local smp2p item\n");
-		return ret;
-	}
+	if (ret < 0 && ret != -EEXIST)
+		return dev_err_probe(smp2p->dev, ret,
+				     "unable to allocate local smp2p item\n");
 
 	out = qcom_smem_get(pid, smem_id, NULL);
 	if (IS_ERR(out)) {
-- 
2.17.1


