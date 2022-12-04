Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28E1641B93
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 09:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiLDIaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 03:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiLDIaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 03:30:04 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01332175AA;
        Sun,  4 Dec 2022 00:30:02 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQ0G2605CzRpVL;
        Sun,  4 Dec 2022 16:29:14 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sun, 4 Dec
 2022 16:30:00 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <mathieu.poirier@linaro.org>,
        <govinds@codeaurora.org>, <gokulsri@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH] remoteproc: qcom: q6v5: Fix missing clk_disable_unprepare() in q6v5_wcss_qcs404_power_on()
Date:   Sun, 4 Dec 2022 16:27:57 +0800
Message-ID: <20221204082757.18850-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

q6v5_wcss_qcs404_power_on() have no fail path for readl_poll_timeout().
Add fail path for readl_poll_timeout().

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index de232337e082..ba24d745b2d6 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -351,7 +351,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	if (ret) {
 		dev_err(wcss->dev,
 			"xo cbcr enabling timed out (rc:%d)\n", ret);
-		return ret;
+		goto disable_xo_cbcr_clk;
 	}
 
 	writel(0, wcss->reg_base + Q6SS_CGC_OVERRIDE);
@@ -417,6 +417,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
 	val &= ~Q6SS_CLK_ENABLE;
 	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
+disable_xo_cbcr_clk:
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
 	val &= ~Q6SS_CLK_ENABLE;
 	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
-- 
2.17.1

