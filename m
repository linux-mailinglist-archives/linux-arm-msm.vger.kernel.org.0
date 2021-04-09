Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4110359277
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 05:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhDIDHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 23:07:32 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:47824 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232662AbhDIDHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 23:07:32 -0400
X-UUID: ac3f69d98a1645edb85bebfedd5c5576-20210409
X-UUID: ac3f69d98a1645edb85bebfedd5c5576-20210409
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 410952694; Fri, 09 Apr 2021 11:07:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 11:07:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 11:07:11 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] phy: qcom-qmp: remove redundant error of clock bulk
Date:   Fri, 9 Apr 2021 11:07:10 +0800
Message-ID: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 32FA1E2DB58F90B2EEED82E4AD1BB02B3B0CEDA66E5DA65390E399B2F26CF9072000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is error log in clk_bulk_prepare/enable()

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 9cdebe7..f14b8be 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3598,10 +3598,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		goto err_rst;
-	}
 
 	if (cfg->has_phy_dp_com_ctrl) {
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
@@ -4035,10 +4033,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
-- 
1.8.1.1.dirty

