Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED75464557C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 09:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiLGIhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 03:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiLGIhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 03:37:12 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0F4614D
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 00:37:11 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NRrC00KngzpW8C;
        Wed,  7 Dec 2022 16:33:00 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Dec 2022 16:36:35 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <srinivas.kandagatla@linaro.org>,
        <sdharia@codeaurora.org>, <gregkh@linuxfoundation.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] slimbus: qcom-ctrl: fix possible memory leak in qcom_slim_probe()
Date:   Wed, 7 Dec 2022 16:36:34 +0800
Message-ID: <20221207083634.1759211-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kfree() should be called to free ctrl->wr_comp when something
fails, we should also free it in qcom_slim_remove(), otherwise
there will be a memory leak, so use devm_kcalloc instead of kcalloc
to fix it.

Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/slimbus/qcom-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 400b7b385a44..e4d92ce52c41 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -529,8 +529,8 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	ctrl->tx.sl_sz = SLIM_MSGQ_BUF_LEN;
 	ctrl->rx.n = QCOM_RX_MSGS;
 	ctrl->rx.sl_sz = SLIM_MSGQ_BUF_LEN;
-	ctrl->wr_comp = kcalloc(QCOM_TX_MSGS, sizeof(struct completion *),
-				GFP_KERNEL);
+	ctrl->wr_comp = devm_kcalloc(&pdev->dev, QCOM_TX_MSGS, sizeof(struct completion *),
+				     GFP_KERNEL);
 	if (!ctrl->wr_comp)
 		return -ENOMEM;
 
-- 
2.25.1

