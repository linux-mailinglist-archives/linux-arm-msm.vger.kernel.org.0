Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A64228DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 04:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731630AbgGVCGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 22:06:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35958 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731614AbgGVCGt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 22:06:49 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5356BB9FFDCA6C681067;
        Wed, 22 Jul 2020 10:06:46 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 10:06:39 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <akashast@codeaurora.org>, <mka@chromium.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] soc: qcom: geni: Fix unused lable warning
Date:   Wed, 22 Jul 2020 10:06:19 +0800
Message-ID: <20200722020619.25988-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If CONFIG_SERIAL_EARLYCON is not set, gcc warns this:

drivers/soc/qcom/qcom-geni-se.c: In function ‘geni_se_probe’:
drivers/soc/qcom/qcom-geni-se.c:914:1: warning: label ‘exit’ defined but not used [-Wunused-label]
 exit:
 ^~~~

Fixes: 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to fix earlycon crash")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 3413129d73ef..d0e4f520cff8 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -910,8 +910,8 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
 		earlycon_wrapper = wrapper;
 	of_node_put(pdev->dev.of_node);
-#endif
 exit:
+#endif
 	dev_set_drvdata(dev, wrapper);
 	dev_dbg(dev, "GENI SE Driver probed\n");
 	return devm_of_platform_populate(dev);
-- 
2.17.1


