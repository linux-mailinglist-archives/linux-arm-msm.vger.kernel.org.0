Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C88205E60AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiIVLPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiIVLPQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:15:16 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE5C6AEAE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:15:00 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYCLS4m6ZzHqKL;
        Thu, 22 Sep 2022 19:12:48 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 19:14:58 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <kishon@ti.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH 6/7] phy: qcom-qusb2: Use dev_err_probe() to simplify code
Date:   Thu, 22 Sep 2022 11:12:27 +0000
Message-ID: <20220922111228.36355-7-yuancan@huawei.com>
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
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 7529a7e6e5df..2ef638b32e8f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -973,20 +973,14 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(qphy->base);
 
 	qphy->cfg_ahb_clk = devm_clk_get(dev, "cfg_ahb");
-	if (IS_ERR(qphy->cfg_ahb_clk)) {
-		ret = PTR_ERR(qphy->cfg_ahb_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get cfg ahb clk, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(qphy->cfg_ahb_clk))
+		return dev_err_probe(dev, PTR_ERR(qphy->cfg_ahb_clk),
+				     "failed to get cfg ahb clk\n");
 
 	qphy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(qphy->ref_clk)) {
-		ret = PTR_ERR(qphy->ref_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get ref clk, %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(qphy->ref_clk))
+		return dev_err_probe(dev, PTR_ERR(qphy->ref_clk),
+				     "failed to get ref clk\n");
 
 	qphy->iface_clk = devm_clk_get_optional(dev, "iface");
 	if (IS_ERR(qphy->iface_clk))
@@ -1003,12 +997,9 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		qphy->vregs[i].supply = qusb2_phy_vreg_names[i];
 
 	ret = devm_regulator_bulk_get(dev, num, qphy->vregs);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get regulator supplies: %d\n",
-				ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulator supplies\n");
 
 	/* Get the specific init parameters of QMP phy */
 	qphy->cfg = of_device_get_match_data(dev);
-- 
2.17.1

