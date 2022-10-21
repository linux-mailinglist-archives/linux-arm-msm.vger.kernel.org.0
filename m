Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7836075AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiJULKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 07:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiJULKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 07:10:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FEC182C73;
        Fri, 21 Oct 2022 04:10:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B949161E67;
        Fri, 21 Oct 2022 11:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE4AC41678;
        Fri, 21 Oct 2022 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666350643;
        bh=MJlxcxMDosqe41yr9HR9iZCzCceKjo0OJDOMdw8Qp4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c2OuHzjOHATq6v8vA6g6N1u7n0fdgnWNr0UBj8Ugu7rDWoG2dKjwKyTRwL7CqI9c6
         ROFyYeZiRnIZQIoDiChBemsA7hV4iZvkO8sFTCITLd2GxmWQk4rOrYyF3msyCGluEZ
         Uydgt0xf0a9hDeu9llYxIjLW46bYJyVN6tNX9zp57zZlgghxGhMNrwOqukdnIK+WkI
         OqFMrSSPZG1L7N4O0D7aj9QJCJUW+0Oqybpm5P8FQzG+XwyJWmJP9VjSvlzSkhSsNF
         REq4l6bDVVOQOJDizs5LADD8mqN1X1t+CnwTCMYp/XOFPnwsJdtPybRwTLogT9Emsq
         w5us2eR+OJeZg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1olpv5-0007Km-0i; Fri, 21 Oct 2022 13:10:31 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 08/15] phy: qcom-qmp-pcie: add register init helper
Date:   Fri, 21 Oct 2022 13:09:40 +0200
Message-Id: <20221021110947.28103-9-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021110947.28103-1-johan+linaro@kernel.org>
References: <20221021110947.28103-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Generalise the serdes initialisation helper so that it can be used to
initialise all the PHY registers (e.g. serdes, tx, rx, pcs).

Note that this defers the ungating of the PIPE clock somewhat, which is
fine as it isn't needed until starting the PHY.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 51 +++++++-----------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index dd7e72424fc0..f57d10f20277 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1820,46 +1820,32 @@ static void qmp_pcie_configure(void __iomem *base,
 	qmp_pcie_configure_lane(base, tbl, num, 0xff);
 }
 
-static void qmp_pcie_serdes_init(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tables *tables)
-{
-	void __iomem *serdes = qmp->serdes;
-
-	if (!tables)
-		return;
-
-	qmp_pcie_configure(serdes, tables->serdes, tables->serdes_num);
-}
-
-static void qmp_pcie_lanes_init(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tables *tables)
+static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tables *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *serdes = qmp->serdes;
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 	void __iomem *tx2 = qmp->tx2;
 	void __iomem *rx2 = qmp->rx2;
+	void __iomem *pcs = qmp->pcs;
+	void __iomem *pcs_misc = qmp->pcs_misc;
 
-	if (!tables)
+	if (!tbls)
 		return;
 
-	qmp_pcie_configure_lane(tx, tables->tx, tables->tx_num, 1);
-	qmp_pcie_configure_lane(rx, tables->rx, tables->rx_num, 1);
+	qmp_pcie_configure(serdes, tbls->serdes, tbls->serdes_num);
+
+	qmp_pcie_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
+	qmp_pcie_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_pcie_configure_lane(tx2, tables->tx, tables->tx_num, 2);
-		qmp_pcie_configure_lane(rx2, tables->rx, tables->rx_num, 2);
+		qmp_pcie_configure_lane(tx2, tbls->tx, tbls->tx_num, 2);
+		qmp_pcie_configure_lane(rx2, tbls->rx, tbls->rx_num, 2);
 	}
-}
-
-static void qmp_pcie_pcs_init(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tables *tables)
-{
-	void __iomem *pcs = qmp->pcs;
-	void __iomem *pcs_misc = qmp->pcs_misc;
-
-	if (!tables)
-		return;
 
-	qmp_pcie_configure(pcs, tables->pcs, tables->pcs_num);
-	qmp_pcie_configure(pcs_misc, tables->pcs_misc, tables->pcs_misc_num);
+	qmp_pcie_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_pcie_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
 }
 
 static int qmp_pcie_init(struct phy *phy)
@@ -1932,8 +1918,8 @@ static int qmp_pcie_power_on(struct phy *phy)
 	else
 		mode_tables = cfg->tables_ep;
 
-	qmp_pcie_serdes_init(qmp, &cfg->tables);
-	qmp_pcie_serdes_init(qmp, mode_tables);
+	qmp_pcie_init_registers(qmp, &cfg->tables);
+	qmp_pcie_init_registers(qmp, mode_tables);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -1941,13 +1927,6 @@ static int qmp_pcie_power_on(struct phy *phy)
 		return ret;
 	}
 
-	/* Tx, Rx, and PCS configurations */
-	qmp_pcie_lanes_init(qmp, &cfg->tables);
-	qmp_pcie_lanes_init(qmp, mode_tables);
-
-	qmp_pcie_pcs_init(qmp, &cfg->tables);
-	qmp_pcie_pcs_init(qmp, mode_tables);
-
 	/* Pull PHY out of reset state */
 	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-- 
2.37.3

