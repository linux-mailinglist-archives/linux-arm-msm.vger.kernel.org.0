Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDFF778536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 04:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjHKCCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 22:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjHKCCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 22:02:17 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2E12D55
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 19:02:16 -0700 (PDT)
Received: from kwepemi500019.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMRnr1xCrzVjyw;
        Fri, 11 Aug 2023 10:00:16 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500019.china.huawei.com
 (7.221.188.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 10:02:13 +0800
From:   Zhang Zekun <zhangzekun11@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <p.zabel@pengutronix.de>
CC:     <linux-arm-msm@vger.kernel.org>, <zhangzekun11@huawei.com>
Subject: [PATCH] bus: Use devm_platform_ioremap_resource_byname() simplify code logic
Date:   Fri, 11 Aug 2023 09:53:41 +0800
Message-ID: <20230811015341.49852-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500019.china.huawei.com (7.221.188.117)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

platform_get_resource_byname() and devm_ioremap_resource() can be
replaced by devm_platform_ioremap_resource_byname(), which can
simplify the code logic a bit, No functional change here.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/bus/qcom-ssc-block-bus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index 3fef18a43c01..6122df3096bb 100644
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

