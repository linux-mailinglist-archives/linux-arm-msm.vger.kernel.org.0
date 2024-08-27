Return-Path: <linux-arm-msm+bounces-29556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C5496034F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 09:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 776081C20975
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D38D153BF6;
	Tue, 27 Aug 2024 07:39:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF2F747F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744342; cv=none; b=ssAH0VKhvS3i0Ppa08xdrx6OnGUYJEowubJZQT02Cm4izhPK1YOjsI2b2CYlATJacBFph02KTLrQ+UuJEWqx2m3FnNNXFbTOQ+PAmQwDzPR4SFc6DBqC8JPz75kzceTgd6XroRWRY8+FC9wzCOXgNgb+jWxy24bTIOEdMW9DuiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744342; c=relaxed/simple;
	bh=/xqLIfHvxbDDIrlyJNAiZplVUwrm70DAaFNKp76XXLg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rQaf6unJvf4gsnehWAI8//St3yTrFpwUL7p371qrSTS2v2bBRRSqWpW+PvRb0kkOYAjFslHKnUU7ZP7cCB6Hp5LIDNBml2o0CORZnBAdFrG3MoSlYeVMn1J/kQMVxAsb3YgFOcJMOHsY92LoIFVydJ4Z10PZQ/DF4NltI4fmzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtKCP5DxgzyQb8;
	Tue, 27 Aug 2024 15:38:09 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id AB584180064;
	Tue, 27 Aug 2024 15:38:56 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:38:56 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] mailbox: ti-msgmgr: Use devm_platform_ioremap_resource_byname() helper function
Date: Tue, 27 Aug 2024 15:25:39 +0800
Message-ID: <20240827072539.67340-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

platform_get_resource_byname() and devm_ioremap_resource() can be
replaced by devm_platform_ioremap_resource_byname(), which can
simplify the code logic a bit, No functional change here.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/bus/qcom-ssc-block-bus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index 5931974a21fa..11fc77c31ce8 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -255,7 +255,6 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 	struct qcom_ssc_block_bus_data *data;
 	struct device_node *np = pdev->dev.of_node;
 	struct of_phandle_args halt_args;
-	struct resource *res;
 	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
@@ -277,14 +276,14 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "error when enabling power domains\n");
 
 	/* low level overrides for when the HW logic doesn't "just work" */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
-	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_mpm_sscaon_config0 = devm_platform_ioremap_resource_byname(pdev,
+									     "mpm_sscaon_config0");
 	if (IS_ERR(data->reg_mpm_sscaon_config0))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config0),
 				     "Failed to ioremap mpm_sscaon_config0\n");
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config1");
-	data->reg_mpm_sscaon_config1 = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_mpm_sscaon_config1 = devm_platform_ioremap_resource_byname(pdev,
+									     "mpm_sscaon_config1");
 	if (IS_ERR(data->reg_mpm_sscaon_config1))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config1),
 				     "Failed to ioremap mpm_sscaon_config1\n");
-- 
2.17.1


