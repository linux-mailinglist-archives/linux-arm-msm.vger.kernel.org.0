Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF27452F4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 11:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhKPKns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 05:43:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:51664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234350AbhKPKnC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 05:43:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B1B36321B;
        Tue, 16 Nov 2021 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637059204;
        bh=LKtUNo+Ptcd/YQ16xYGBnhORd2bTIpSekrD4tpIsZdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UzwjbUFweX+788xhBrvLd9Xh/zFX58bQe92APMBTm8LEnJT7XzdLDoLnFFlZmsgzm
         M3x1dyTkT/VxEI5/6yQSp7RZxMnMtecpmx1mpVza27Ap8LVDGMmALiMjIHRxXIocRS
         1sJgNAhUWMXmsaCsuKM5jLwn42e+UC0NnMKm7uW9F/q4YupjqZQCnvd89n6G3siOzu
         TRVyabPV5eBsYy8hEDW2T5ne3874s7tCYTJvkuIB/ulMyQqzreRCFuVSC+BXhq3PBM
         x2C/sOG/yvEyuViQwivz+llKeWUCemC1xqqCIXZ9X3AUlqd3ag7XKHxeDy+K7HGSoZ
         uJR1bBbrukSlA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] phy: qualcomm: qmp: Add missing struct documentation
Date:   Tue, 16 Nov 2021 16:09:48 +0530
Message-Id: <20211116103951.34482-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116103951.34482-1-vkoul@kernel.org>
References: <20211116103951.34482-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dp-* members were added to qmp_phy_combo_cfg but documentation was
missed, so add that.

drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_aux_cfg' not described in 'qmp_phy'
drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_opts' not described in 'qmp_phy'
drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_clks' not described in 'qmp_phy'

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 456a59d8c7d0..c96639d5f581 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2973,6 +2973,9 @@ struct qmp_phy_combo_cfg {
  * @qmp: QMP phy to which this lane belongs
  * @lane_rst: lane's reset controller
  * @mode: current PHY mode
+ * @dp_aux_cfg: Display port aux config
+ * @dp_opts: Display port optional config
+ * @dp_clks: Display port clocks
  */
 struct qmp_phy {
 	struct phy *phy;
-- 
2.31.1

