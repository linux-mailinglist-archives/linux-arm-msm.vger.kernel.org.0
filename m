Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CCE627B96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 12:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236612AbiKNLHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 06:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbiKNLH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 06:07:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC0E20F6C;
        Mon, 14 Nov 2022 03:07:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2AE3061014;
        Mon, 14 Nov 2022 11:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD0CC4FEBE;
        Mon, 14 Nov 2022 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668424034;
        bh=yWRopRI5VwUGerLUf/1x9ICJZT2GKSr0hiYYepZPthA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lUGMWj8oS6RCERady4syZnXBHUFAVZ4e8Ir1TuOTW7MJMG/aL6flnSZE1hjb5JB3X
         b5H1gXuK2AyxsflzzkWwrkWyKLi1CnmZPMtU2hEgS459tWAVf4w+zbHxOjhBvkpaCm
         gnoQ6GiE9JrB1ZQBt8ka+ti5Mu4Ly3rEDKMmDrUtgbe20QOcs5XqMAPIFt+8Tna8jw
         XoD+fof+XP+5L7sidu2w55KRwvj35Bn/uXpgzNm/g9tBbXOm/XnRupgXA3Hy4gLjJ/
         dKyAA4JkH9BDpIw24c6YgNVhN0myqh2178OznnlpPckfUoSMPIUAEAoG9PUHvanDal
         vKCwECz2g4GYw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1ouXIY-0001Er-JP; Mon, 14 Nov 2022 12:06:42 +0100
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 10/22] phy: qcom-qmp-combo: separate USB and DP power-on ops
Date:   Mon, 14 Nov 2022 12:06:09 +0100
Message-Id: <20221114110621.4639-11-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221114110621.4639-1-johan+linaro@kernel.org>
References: <20221114110621.4639-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Separate the USB and DP power-on and power-off operations in two
dedicated implementations.

Note that the pipe clock is only used by the USB part of the PHY and
that no DP configuration has a pcs (or rx) table or has has_pwrdn_delay
set.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 100 +++++++++++++---------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7392ae460fd7..748fd32a6f72 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1988,7 +1988,39 @@ static int qmp_combo_dp_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_combo_power_on(struct phy *phy)
+static int qmp_combo_dp_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *tx = qphy->tx;
+
+	qmp_combo_serdes_init(qphy);
+
+	qmp_combo_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+
+	if (cfg->lanes >= 2)
+		qmp_combo_configure_lane(qphy->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+
+	/* Configure special DP tx tunings */
+	cfg->configure_dp_tx(qphy);
+
+	/* Configure link rate, swing, etc. */
+	cfg->configure_dp_phy(qphy);
+
+	return 0;
+}
+
+static int qmp_combo_dp_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	/* Assert DP PHY power down */
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
+
+	return 0;
+}
+
+static int qmp_combo_usb_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2014,39 +2046,30 @@ static int qmp_combo_power_on(struct phy *phy)
 	if (cfg->lanes >= 2)
 		qmp_combo_configure_lane(qphy->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
 
-	/* Configure special DP tx tunings */
-	if (cfg->type == PHY_TYPE_DP)
-		cfg->configure_dp_tx(qphy);
-
 	qmp_combo_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
 	if (cfg->lanes >= 2)
 		qmp_combo_configure_lane(qphy->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	/* Configure link rate, swing, etc. */
-	if (cfg->type == PHY_TYPE_DP)
-		cfg->configure_dp_phy(qphy);
-	else
-		qmp_combo_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_combo_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
 
-	if (cfg->type != PHY_TYPE_DP) {
-		/* Pull PHY out of reset state */
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-		/* start SerDes and Phy-Coding-Sublayer */
-		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL],
-				SERDES_START | PCS_START);
+	/* Pull PHY out of reset state */
+	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-		status = pcs + cfg->regs[QPHY_PCS_STATUS];
-		ret = readl_poll_timeout(status, val, !(val & PHYSTATUS), 200,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev, "phy initialization timed-out\n");
-			goto err_disable_pipe_clk;
-		}
+	/* start SerDes and Phy-Coding-Sublayer */
+	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
+
+	status = pcs + cfg->regs[QPHY_PCS_STATUS];
+	ret = readl_poll_timeout(status, val, !(val & PHYSTATUS), 200,
+			PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev, "phy initialization timed-out\n");
+		goto err_disable_pipe_clk;
 	}
+
 	return 0;
 
 err_disable_pipe_clk:
@@ -2055,28 +2078,23 @@ static int qmp_combo_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qmp_combo_power_off(struct phy *phy)
+static int qmp_combo_usb_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
 	clk_disable_unprepare(qphy->pipe_clk);
 
-	if (cfg->type == PHY_TYPE_DP) {
-		/* Assert DP PHY power down */
-		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
-	} else {
-		/* PHY reset */
-		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	/* PHY reset */
+	qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-		/* stop SerDes and Phy-Coding-Sublayer */
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL],
-				SERDES_START | PCS_START);
+	/* stop SerDes and Phy-Coding-Sublayer */
+	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL],
+			SERDES_START | PCS_START);
 
-		/* Put PHY into POWER DOWN state: active low */
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-				SW_PWRDN);
-	}
+	/* Put PHY into POWER DOWN state: active low */
+	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			SW_PWRDN);
 
 	return 0;
 }
@@ -2090,7 +2108,7 @@ static int qmp_combo_usb_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_power_on(phy);
+	ret = qmp_combo_usb_power_on(phy);
 	if (ret)
 		qmp_combo_com_exit(qphy);
 
@@ -2102,7 +2120,7 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	int ret;
 
-	ret = qmp_combo_power_off(phy);
+	ret = qmp_combo_usb_power_off(phy);
 	if (ret)
 		return ret;
 
@@ -2128,9 +2146,9 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_dp_phy_ops = {
 	.init		= qmp_combo_dp_init,
 	.configure	= qmp_combo_dp_configure,
-	.power_on	= qmp_combo_power_on,
+	.power_on	= qmp_combo_dp_power_on,
 	.calibrate	= qmp_combo_dp_calibrate,
-	.power_off	= qmp_combo_power_off,
+	.power_off	= qmp_combo_dp_power_off,
 	.exit		= qmp_combo_dp_exit,
 	.owner		= THIS_MODULE,
 };
-- 
2.37.4

