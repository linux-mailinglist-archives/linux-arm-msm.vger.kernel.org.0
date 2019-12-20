Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5753127920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 11:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfLTKRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 05:17:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:53130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727327AbfLTKRp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 05:17:45 -0500
Received: from localhost.localdomain (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E8222467F;
        Fri, 20 Dec 2019 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576837065;
        bh=AIPv8fFMMsHNljU/EUBaNwyln0JkI1Y+vYsA84xKH64=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lJ2ORSCcvS0TR3JABMss3CAEJC3xAKGknJykh0LoIk5dx0J0UPB43q/DMBs6PrBKi
         PXMqsiEGCg+owBLOM1D2EwPPFLdjpR3dPwyypumyWNwRmg7bSNmTH3twyQPkJaZ5ee
         ZNqaxsY4DJSjS3aHU1tT9VQ/boEd74NXpRR/B9mU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-qmp: Use register defines
Date:   Fri, 20 Dec 2019 15:47:16 +0530
Message-Id: <20191220101719.3024693-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191220101719.3024693-1-vkoul@kernel.org>
References: <20191220101719.3024693-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already define register offsets so use them in register layout.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 66f91726b8b2..1196c85aa023 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -166,8 +166,8 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
 };
 
 static const unsigned int sm8150_ufsphy_regs_layout[] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x180,
+	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
-- 
2.23.0

