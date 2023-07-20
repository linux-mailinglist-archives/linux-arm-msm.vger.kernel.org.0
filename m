Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0617475B0DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 16:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjGTOJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 10:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjGTOJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 10:09:31 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E9BB2123
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=A53mg4HX2m8ZOxrMBC
        4avgeVr+RJh3vB4UPCz1BZi0Y=; b=DdwgmMqZAMZkSGLpa+J2zLyniV4vpJApJG
        SM2R3K5conqflGpbYXSwbjyjHLJRC9Iyov/r1mgwPiRTs+rAXx9MwB/voUfwc6/s
        xSGnHeg6w2PUJ1FbfcURmjFfJBEJSU2Dxv0iIid7p7XfE/qtlZFpPDLJ6wif5BPa
        DSpcNqn5g=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g1-3 (Coremail) with SMTP id _____wAXhQLwP7lk_mZEAw--.35300S4;
        Thu, 20 Jul 2023 22:08:53 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] soundwire: use devm_clk_get_enabled() in qcom_swrm_probe()
Date:   Thu, 20 Jul 2023 22:08:45 +0800
Message-Id: <20230720140845.33734-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAXhQLwP7lk_mZEAw--.35300S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UXFy5Zw47Wry8ur45ZFb_yoW8Zr1kpF
        WkWFZYgw48XrWYy3ZrJr4kZF1Fgrs7Ka47uw48Gay8uwn0yrWqq3W8KFy0yanagFWkCw15
        J3W7Xa48ZFs5W3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRimiAUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJxey5V5vE2DVJQAAsV
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

in qcom_swrm_probe(), the return value of function
clk_prepare_enable() should be checked, since it may fail.
using devm_clk_get_enabled() instead of devm_clk_get() and
clk_prepare_enable() can avoid this problem.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/soundwire/qcom.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 7970fdb27ba0..04bc917b7a70 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1549,14 +1549,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	ctrl->hclk = devm_clk_get(dev, "iface");
+	ctrl->hclk = devm_clk_get_enabled(dev, "iface");
 	if (IS_ERR(ctrl->hclk)) {
 		ret = PTR_ERR(ctrl->hclk);
 		goto err_init;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
-
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
@@ -1570,7 +1568,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		goto err_clk;
+		goto err_init;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -1598,7 +1596,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err_clk;
+		goto err_init;
 	}
 
 	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
@@ -1617,7 +1615,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err_clk;
+		goto err_init;
 	}
 
 	qcom_swrm_init(ctrl);
@@ -1647,8 +1645,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 err_master_add:
 	sdw_bus_master_delete(&ctrl->bus);
-err_clk:
-	clk_disable_unprepare(ctrl->hclk);
 err_init:
 	return ret;
 }
-- 
2.17.1

