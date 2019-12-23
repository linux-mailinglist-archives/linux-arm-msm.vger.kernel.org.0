Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA913129768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 15:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfLWOba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 09:31:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:51874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbfLWObM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 09:31:12 -0500
Received: from vkoul-mobl.Dlink (unknown [106.51.110.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BDD320715;
        Mon, 23 Dec 2019 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577111471;
        bh=cXpw5tyrhRILWYrrExKOFYSPljwmd3fk8wpc94J0Z9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wU32q3lmWLOwJpvTPjJcVYmnT46STKX8xTsdrBmD2kfNN7MH+fnoRj9PS+crkty9h
         j4f+c4Tl7CP9392OacW5Sgq2v4/t8EONGrlw8Zn/1oa0ocvsxXA2quuo7JQDBlSJIJ
         yl5Zeyf4I9Rkl5Neuclkc54k9KTU3JddhFHZVheg=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] phy: qcom-qmp: remove no_pcs_sw_reset for sm8150
Date:   Mon, 23 Dec 2019 20:00:45 +0530
Message-Id: <20191223143046.3376299-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191223143046.3376299-1-vkoul@kernel.org>
References: <20191223143046.3376299-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8150 QMPY phy for UFS and onwards the PHY_SW_RESET is present in PHY's
PCS register so we should not mark no_pcs_sw_reset for sm8150 and
onwards

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 4f2e65c7cf45..ce5e18f188c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1389,7 +1389,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 	.pwrdn_ctrl		= SW_PWRDN,
 
 	.is_dual_lane_phy	= true,
-	.no_pcs_sw_reset	= true,
 };
 
 static void qcom_qmp_phy_configure(void __iomem *base,
-- 
2.23.0

