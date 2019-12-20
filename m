Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49387127925
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 11:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfLTKRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 05:17:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:53258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727327AbfLTKRw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 05:17:52 -0500
Received: from localhost.localdomain (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 358CC2467F;
        Fri, 20 Dec 2019 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576837072;
        bh=gWCt3r6TgCbriGXQfdsqIUuQ6iWj5AjVkeFPdeu1DoU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zzBFMGgg36f7Qz2mrSyFRGxf0x4yGX+0VdWzI4numDiw5hJUtlw7aYyeXaoBwrMkK
         N1kbStn7uv2wCg5ZUgqAVV3bf8uiIZ3MKEUGSi7Z8zAskEwmqEoq2eKxk6kfVULp14
         Y22Sn0XfWMpD+VJEPP37lGD/X1JCRJXzBVuVHtG0=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] phy: qcom-qmp: remove duplicate powerdown write
Date:   Fri, 20 Dec 2019 15:47:18 +0530
Message-Id: <20191220101719.3024693-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191220101719.3024693-1-vkoul@kernel.org>
References: <20191220101719.3024693-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already write to QPHY_POWER_DOWN_CONTROL in qcom_qmp_phy_com_init()
before invoking qcom_qmp_phy_configure() so remove the duplicate write.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 47a66d55107d..2a12a0b3bd72 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -886,7 +886,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
-- 
2.23.0

