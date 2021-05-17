Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EEE3823BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 07:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhEQFiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 01:38:46 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:4178 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234022AbhEQFip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 01:38:45 -0400
X-UUID: 8690de4fc6514704b14a0ddcd502e1ac-20210517
X-UUID: 8690de4fc6514704b14a0ddcd502e1ac-20210517
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 574679692; Mon, 17 May 2021 13:37:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 May 2021 13:37:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 13:37:23 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] phy: qcom-qmp: remove redundant error of clock bulk
Date:   Mon, 17 May 2021 13:37:21 +0800
Message-ID: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 5CC1D6D304A0BEF7EF3422F5471F0CEC2843A0B05FCE63BE7801B45554CA7BFB2000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is error log in clk_bulk_prepare/enable()

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add reviewed-by Bjorn
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 7877f70cf86f..882b8ecae235 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3993,10 +3993,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		goto err_rst;
-	}
 
 	if (cfg->has_phy_dp_com_ctrl) {
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
@@ -4430,10 +4428,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
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
2.18.0

