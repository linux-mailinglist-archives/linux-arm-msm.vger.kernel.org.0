Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4795E60B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiIVLP1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiIVLPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:15:21 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A497755E
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:15:01 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYCJQ45DNzWgwx;
        Thu, 22 Sep 2022 19:11:02 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 19:14:59 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <kishon@ti.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH 7/7] phy: qcom-snps: Use dev_err_probe() to simplify code
Date:   Thu, 22 Sep 2022 11:12:28 +0000
Message-ID: <20220922111228.36355-8-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220922111228.36355-1-yuancan@huawei.com>
References: <20220922111228.36355-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 25022949108b..a59063596214 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -559,12 +559,9 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(hsphy->base);
 
 	hsphy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(hsphy->ref_clk)) {
-		ret = PTR_ERR(hsphy->ref_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get ref clk, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hsphy->ref_clk))
+		return dev_err_probe(dev, PTR_ERR(hsphy->ref_clk),
+				     "failed to get ref clk\n");
 
 	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(hsphy->phy_reset)) {
@@ -577,12 +574,9 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
 
 	ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get regulator supplies: %d\n",
-				ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulator supplies\n");
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-- 
2.17.1

