Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382D6414A00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 15:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhIVNBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 09:01:55 -0400
Received: from mx24.baidu.com ([111.206.215.185]:55544 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231344AbhIVNBz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 09:01:55 -0400
Received: from BJHW-Mail-Ex03.internal.baidu.com (unknown [10.127.64.13])
        by Forcepoint Email with ESMTPS id F28FCEE13D26D10CED01;
        Wed, 22 Sep 2021 21:00:23 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex03.internal.baidu.com (10.127.64.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 22 Sep 2021 21:00:23 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 22 Sep 2021 21:00:23 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] phy: qcom-qmp: Make use of the helper function devm_add_action_or_reset()
Date:   Wed, 22 Sep 2021 21:00:16 +0800
Message-ID: <20210922130017.692-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The helper function devm_add_action_or_reset() will internally
call devm_add_action(), and gif devm_add_action() fails then it will
execute the action mentioned and return the error code. So
use devm_add_action_or_reset() instead of devm_add_action()
to simplify the error handling, reduce the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index f14032170b1c..084e3d96264e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -5154,11 +5154,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
-	if (ret)
-		phy_clk_release_provider(np);
-
-	return ret;
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
 /*
@@ -5350,11 +5346,7 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
-	if (ret)
-		phy_clk_release_provider(np);
-
-	return ret;
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
 static const struct phy_ops qcom_qmp_phy_gen_ops = {
-- 
2.25.1

