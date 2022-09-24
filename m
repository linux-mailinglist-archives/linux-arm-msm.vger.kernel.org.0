Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D276F5E88EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 09:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiIXHFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 03:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbiIXHFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 03:05:40 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E96F10AB0F
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:05:35 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZKgc6WxWzWgnQ;
        Sat, 24 Sep 2022 15:01:32 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 15:05:32 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <kishon@ti.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH RESEND 1/4] phy: qcom-qmp-combo: Use dev_err_probe() to simplify code
Date:   Sat, 24 Sep 2022 07:02:57 +0000
Message-ID: <20220924070300.25080-2-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220924070300.25080-1-yuancan@huawei.com>
References: <20220924070300.25080-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 41f938126ff1..da85fbf2cb0c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2755,14 +2755,10 @@ static int qmp_combo_create(struct device *dev, struct device_node *np, int id,
 	 */
 	qphy->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
 	if (IS_ERR(qphy->pipe_clk)) {
-		if (cfg->type == PHY_TYPE_USB3) {
-			ret = PTR_ERR(qphy->pipe_clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev,
-					"failed to get lane%d pipe_clk, %d\n",
-					id, ret);
-			return ret;
-		}
+		if (cfg->type == PHY_TYPE_USB3)
+			return dev_err_probe(dev, PTR_ERR(qphy->pipe_clk),
+					     "failed to get lane%d pipe_clk\n",
+					     id);
 		qphy->pipe_clk = NULL;
 	}
 
@@ -2879,12 +2875,9 @@ static int qmp_combo_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = qmp_combo_vreg_init(dev, cfg);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get regulator supplies: %d\n",
-				ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulator supplies\n");
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-- 
2.17.1

