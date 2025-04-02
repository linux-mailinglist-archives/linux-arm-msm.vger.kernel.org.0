Return-Path: <linux-arm-msm+bounces-53025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB255A78D33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224C11895A5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0C0238173;
	Wed,  2 Apr 2025 11:35:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32553238159;
	Wed,  2 Apr 2025 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593739; cv=none; b=fpjWJ08ZYPZ8JuUMmtiTS2fnyuYGlmgr5AWi1ZNExsmK9HUvfWGiVk9VECS2/121yhQqVoxf7RIJHrRjigoXiU6RNCyaL2XGZN/qS3ucIyH2C7OxAVpYXvdDQEXDy1XzMgd61T+swI/UqOLQTW61WQmf6hS2rHrKfVHwPMzPl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593739; c=relaxed/simple;
	bh=TbdnfG8wkwkQNcCDVtClAVzFHhMRXauh/c7m5Sv6VTg=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=OJM/mqH+qQe+IbM/XLDbuZwDTBLtFYv4d36KU2AYNrherD4AZmuZ1vYTf/e021m/4ihRO5YUbFEG1cIsMKMZIi3y9Y6ZuaD7Hnml2zFvtZgYk5Dmf8kKOmfzXSE2ZnoTdgqAsK+q3o/atffkaTEbPUxO1t8wIgmPsD8quyseJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSN8X20fdz8R049;
	Wed,  2 Apr 2025 19:35:24 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 532BZKTK064113;
	Wed, 2 Apr 2025 19:35:20 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:35:22 +0800 (CST)
Date: Wed, 2 Apr 2025 19:35:22 +0800 (CST)
X-Zmail-TransId: 2afc67ed20fa174-1da6c
X-Mailer: Zmail v1.0
Message-ID: <20250402193522517tlQ-zKtbUFsLKAMwRTF6-@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <andersson@kernel.org>
Cc: <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <xie.ludan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBidXM6IHFjb20tc3NjLWJsb2NrLWJ1czogVXNlwqBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1l?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 532BZKTK064113
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED20FC.001/4ZSN8X20fdz8R049

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify resource
retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into a single
call, improving code readability and reducing API call overhead.

Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/bus/qcom-ssc-block-bus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index 7f5fd4e0940d..c542ef8ae4a6 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -255,7 +255,6 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 	struct qcom_ssc_block_bus_data *data;
 	struct device_node *np = pdev->dev.of_node;
 	struct of_phandle_args halt_args;
-	struct resource *res;
 	int ret;

 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
@@ -265,14 +264,14 @@ static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);

 	/* low level overrides for when the HW logic doesn't "just work" */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
-	data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_mpm_sscaon_config0 = devm_platform_ioremap_resource_byname(pdev,
+																		 "mpm_sscaon_config0");
 	if (IS_ERR(data->reg_mpm_sscaon_config0))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config0),
 				     "Failed to ioremap mpm_sscaon_config0\n");

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config1");
-	data->reg_mpm_sscaon_config1 = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_mpm_sscaon_config1 = devm_platform_ioremap_resource_byname(pdev,
+																		 "mpm_sscaon_config1");
 	if (IS_ERR(data->reg_mpm_sscaon_config1))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->reg_mpm_sscaon_config1),
 				     "Failed to ioremap mpm_sscaon_config1\n");
-- 
2.25.1

