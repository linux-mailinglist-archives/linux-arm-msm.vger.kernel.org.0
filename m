Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7776153B421
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiFBHJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbiFBHJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94BA2FE5B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l13so6356771lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99059pas9Sxg6pRZn3ZyiI/lD7J/QNeCLP0B10m6cgA=;
        b=xxe2awCjD2QA/TN6Qx+BQEljP9WiC9YGjyQzkaASpF/FV+C4rSDpSAA+Y6h4hwLdMn
         9/JGZQhptNfcqkCVy1NfoayLoCiwle3whaC9UqFrzYMd2zd73Wh1sJ0s2UZ2y/ejHEoF
         13JNCLHSlOLtY4pT1s0/HswmF/gyimkTxD8cwD0KNjB9eVQusdGcHiKWigfSJsDQdd28
         HUnub0Pg4NHud3rjO4eHgRS0c6ierD3SKe9Ks0F6KhtiaZ+srW6hWHA3jB81jPDimX36
         TzO2n6qY0AqN+K3IBH/0IiPBiERdNQV9w25Gpc8eRd3HZkJa4UjrNAEhcT0+zjl+dn5h
         phug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99059pas9Sxg6pRZn3ZyiI/lD7J/QNeCLP0B10m6cgA=;
        b=2+wiNnZU/1r0BLMbVNGh2c/2a65gYRS5vsBG/5227Z5AJoOLKeIKyUQfHL0jVbcYLJ
         Z3swRLo6cY8P4jHSVpjnbXGra8tV5N6CsCmhtX4/B3E8H2hIRL16Zji/v0EsZPEhaAvo
         nQzTbTJm6C+LYCoTxPQr8MuERTAijl8N1bEk3NJc/g9j2V73DqHfz7hUcT4FgQnb91Za
         IvCTXLuQMyZivxBDTkAwqubefuLfgZybXOYEJaE7BRRdtxVb48MrTHECrZwxg2f4lhor
         gJliVILJbWzGfUGOfug2/+kVbdP3HyO5fwgL87tfjG7URBOb2Y9NZqYx+weDdAvcg1oj
         9mcQ==
X-Gm-Message-State: AOAM531yFY2MSBPHRnHjYC30kRTU0Z5DEjCDJTMCU0mMxKuEbUbkIEBU
        alCaTPWJjWxzPyzqNb3NimoNxw==
X-Google-Smtp-Source: ABdhPJxXfEfWKNcBEIXG3Zcp+SPZlw3Kgw/Tf7/02kzWeVjG+ASJzjyIRBWfBNUqVo60gnWqaaAtzg==
X-Received: by 2002:a05:6512:3e11:b0:473:9f5f:feda with SMTP id i17-20020a0565123e1100b004739f5ffedamr2508332lfv.244.1654153771526;
        Thu, 02 Jun 2022 00:09:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 22/30] phy: qcom-qmp-ufs: cleanup the driver
Date:   Thu,  2 Jun 2022 10:09:01 +0300
Message-Id: <20220602070909.1666068-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the conditionals and options that are not used by any of UFS PHY
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 293 +-----------------------
 1 file changed, 12 insertions(+), 281 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 0bf1990651b6..e9b32a3d5adb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -599,47 +599,16 @@ struct qmp_phy_cfg {
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_sec;
-	int serdes_tbl_num_sec;
 	const struct qmp_phy_init_tbl *tx_tbl;
 	int tx_tbl_num;
-	const struct qmp_phy_init_tbl *tx_tbl_sec;
-	int tx_tbl_num_sec;
 	const struct qmp_phy_init_tbl *rx_tbl;
 	int rx_tbl_num;
-	const struct qmp_phy_init_tbl *rx_tbl_sec;
-	int rx_tbl_num_sec;
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_tbl_sec;
-	int pcs_tbl_num_sec;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl;
-	int pcs_misc_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
-	int pcs_misc_tbl_num_sec;
-
-	/* Init sequence for DP PHY block link rates */
-	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
-	int serdes_tbl_rbr_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
-	int serdes_tbl_hbr_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
-	int serdes_tbl_hbr2_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr3;
-	int serdes_tbl_hbr3_num;
-
-	/* DP PHY callbacks */
-	int (*configure_dp_phy)(struct qmp_phy *qphy);
-	void (*configure_dp_tx)(struct qmp_phy *qphy);
-	int (*calibrate_dp_phy)(struct qmp_phy *qphy);
-	void (*dp_aux_init)(struct qmp_phy *qphy);
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
-	/* resets to be requested */
-	const char * const *reset_list;
-	int num_resets;
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -649,22 +618,9 @@ struct qmp_phy_cfg {
 
 	unsigned int start_ctrl;
 	unsigned int pwrdn_ctrl;
-	unsigned int mask_com_pcs_ready;
 	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
 	unsigned int phy_status;
 
-	/* true, if PHY has a separate PHY_COM control block */
-	bool has_phy_com_ctrl;
-	/* true, if PHY has a reset for individual lanes */
-	bool has_lane_rst;
-	/* true, if PHY needs delay after POWER_DOWN */
-	bool has_pwrdn_delay;
-	/* power_down delay in usec */
-	int pwrdn_delay_min;
-	int pwrdn_delay_max;
-
-	/* true, if PHY has a separate DP_COM control block */
-	bool has_phy_dp_com_ctrl;
 	/* true, if PHY has secondary tx/rx lanes to be configured */
 	bool is_dual_lane_phy;
 
@@ -672,11 +628,6 @@ struct qmp_phy_cfg {
 	bool no_pcs_sw_reset;
 };
 
-struct qmp_phy_combo_cfg {
-	const struct qmp_phy_cfg *usb_cfg;
-	const struct qmp_phy_cfg *dp_cfg;
-};
-
 /**
  * struct qmp_phy - per-lane phy descriptor
  *
@@ -689,14 +640,9 @@ struct qmp_phy_combo_cfg {
  * @tx2: iomapped memory space for second lane's tx (in dual lane PHYs)
  * @rx2: iomapped memory space for second lane's rx (in dual lane PHYs)
  * @pcs_misc: iomapped memory space for lane's pcs_misc
- * @pipe_clk: pipe clock
  * @index: lane index
  * @qmp: QMP phy to which this lane belongs
- * @lane_rst: lane's reset controller
  * @mode: current PHY mode
- * @dp_aux_cfg: Display port aux config
- * @dp_opts: Display port optional config
- * @dp_clks: Display port clocks
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -708,27 +654,15 @@ struct qmp_phy {
 	void __iomem *tx2;
 	void __iomem *rx2;
 	void __iomem *pcs_misc;
-	struct clk *pipe_clk;
 	unsigned int index;
 	struct qcom_qmp *qmp;
-	struct reset_control *lane_rst;
 	enum phy_mode mode;
-	unsigned int dp_aux_cfg;
-	struct phy_configure_opts_dp dp_opts;
-	struct qmp_phy_dp_clks *dp_clks;
-};
-
-struct qmp_phy_dp_clks {
-	struct qmp_phy *qphy;
-	struct clk_hw dp_link_hw;
-	struct clk_hw dp_pixel_hw;
 };
 
 /**
  * struct qcom_qmp - structure holding QMP phy block attributes
  *
  * @dev: device
- * @dp_com: iomapped memory space for phy's dp_com control block
  *
  * @clks: array of clocks required by phy
  * @resets: array of resets required by phy
@@ -741,10 +675,8 @@ struct qmp_phy_dp_clks {
  */
 struct qcom_qmp {
 	struct device *dev;
-	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -871,7 +803,6 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
 
-	.is_dual_lane_phy	= false,
 	.no_pcs_sw_reset	= true,
 };
 
@@ -983,37 +914,12 @@ static void qcom_qmp_phy_ufs_configure(void __iomem *base,
 
 static int qcom_qmp_phy_ufs_serdes_init(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
-	int ret;
 
 	qcom_qmp_phy_ufs_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
-	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_ufs_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
-				       cfg->serdes_tbl_num_sec);
-
-	if (cfg->has_phy_com_ctrl) {
-		void __iomem *status;
-		unsigned int mask, val;
-
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-
-		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
-		mask = cfg->mask_com_pcs_ready;
-
-		ret = readl_poll_timeout(status, val, (val & mask), 10,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev,
-				"phy common block init timed-out\n");
-			return ret;
-		}
-	}
 
 	return 0;
 }
@@ -1022,10 +928,8 @@ static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *dp_com = qmp->dp_com;
-	int ret, i;
+	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (qmp->init_count++) {
@@ -1040,71 +944,22 @@ static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 		goto err_unlock;
 	}
 
-	for (i = 0; i < cfg->num_resets; i++) {
-		ret = reset_control_assert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset assert failed\n",
-				cfg->reset_list[i]);
-			goto err_disable_regulators;
-		}
-	}
-
-	for (i = cfg->num_resets - 1; i >= 0; i--) {
-		ret = reset_control_deassert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset deassert failed\n",
-				qphy->cfg->reset_list[i]);
-			goto err_assert_reset;
-		}
-	}
-
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
 	if (ret)
-		goto err_assert_reset;
-
-	if (cfg->has_phy_dp_com_ctrl) {
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
-			     SW_PWRDN);
-		/* override hardware control for reset of qmp phy */
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
-
-		/* Default type-c orientation, i.e CC1 */
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
-
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
-			     USB3_MODE | DP_MODE);
+		goto err_disable_regulators;
 
-		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
-
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
-	}
-
-	if (cfg->has_phy_com_ctrl) {
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
-			     SW_PWRDN);
-	} else {
-		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
-			qphy_setbits(pcs,
-					cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-					cfg->pwrdn_ctrl);
-		else
-			qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
-					cfg->pwrdn_ctrl);
-	}
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
+		qphy_setbits(pcs,
+			     cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			     cfg->pwrdn_ctrl);
+	else
+		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+			     cfg->pwrdn_ctrl);
 
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
 
-err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_unlock:
@@ -1117,8 +972,6 @@ static int qcom_qmp_phy_ufs_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
-	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (--qmp->init_count) {
@@ -1127,17 +980,6 @@ static int qcom_qmp_phy_ufs_com_exit(struct qmp_phy *qphy)
 	}
 
 	reset_control_assert(qmp->ufs_reset);
-	if (cfg->has_phy_com_ctrl) {
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET],
-			     SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
-			     SW_PWRDN);
-	}
-
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -1198,77 +1040,35 @@ static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 	void __iomem *tx = qphy->tx;
 	void __iomem *rx = qphy->rx;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
 	void __iomem *status;
 	unsigned int mask, val, ready;
 	int ret;
 
 	qcom_qmp_phy_ufs_serdes_init(qphy);
 
-	if (cfg->has_lane_rst) {
-		ret = reset_control_deassert(qphy->lane_rst);
-		if (ret) {
-			dev_err(qmp->dev, "lane%d reset deassert failed\n",
-				qphy->index);
-			return ret;
-		}
-	}
-
-	ret = clk_prepare_enable(qphy->pipe_clk);
-	if (ret) {
-		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
-		goto err_reset_lane;
-	}
-
 	/* Tx, Rx, and PCS configurations */
 	qcom_qmp_phy_ufs_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_ufs_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
-					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_ufs_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_ufs_configure_lane(qphy->tx2, cfg->regs,
-						    cfg->tx_tbl_sec,
-						    cfg->tx_tbl_num_sec, 2);
 	}
 
 	qcom_qmp_phy_ufs_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_ufs_configure_lane(rx, cfg->regs,
-					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_ufs_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
-		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_ufs_configure_lane(qphy->rx2, cfg->regs,
-						    cfg->rx_tbl_sec,
-						    cfg->rx_tbl_num_sec, 2);
 	}
 
 	qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-	if (cfg->pcs_tbl_sec)
-		qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
-				       cfg->pcs_tbl_num_sec);
 
 	ret = reset_control_deassert(qmp->ufs_reset);
 	if (ret)
-		goto err_disable_pipe_clk;
-
-	qcom_qmp_phy_ufs_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
-			       cfg->pcs_misc_tbl_num);
-	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_ufs_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
-				       cfg->pcs_misc_tbl_num_sec);
-
-	if (cfg->has_pwrdn_delay)
-		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
+		return ret;
 
 	/* Pull PHY out of reset state */
 	if (!cfg->no_pcs_sw_reset)
@@ -1284,17 +1084,10 @@ static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 				 PHY_INIT_COMPLETE_TIMEOUT);
 	if (ret) {
 		dev_err(qmp->dev, "phy initialization timed-out\n");
-		goto err_disable_pipe_clk;
+		return ret;
 	}
-	return 0;
-
-err_disable_pipe_clk:
-	clk_disable_unprepare(qphy->pipe_clk);
-err_reset_lane:
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
-	return ret;
+	return 0;
 }
 
 static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
@@ -1302,8 +1095,6 @@ static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
-	clk_disable_unprepare(qphy->pipe_clk);
-
 	/* PHY reset */
 	if (!cfg->no_pcs_sw_reset)
 		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
@@ -1326,10 +1117,6 @@ static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
 static int qcom_qmp_phy_ufs_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	qcom_qmp_phy_ufs_com_exit(qphy);
 
@@ -1387,31 +1174,6 @@ static int qcom_qmp_phy_ufs_vreg_init(struct device *dev, const struct qmp_phy_c
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_ufs_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
-{
-	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	int i;
-
-	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
-				   sizeof(*qmp->resets), GFP_KERNEL);
-	if (!qmp->resets)
-		return -ENOMEM;
-
-	for (i = 0; i < cfg->num_resets; i++) {
-		struct reset_control *rst;
-		const char *name = cfg->reset_list[i];
-
-		rst = devm_reset_control_get_exclusive(dev, name);
-		if (IS_ERR(rst)) {
-			dev_err(dev, "failed to get %s reset\n", name);
-			return PTR_ERR(rst);
-		}
-		qmp->resets[i] = rst;
-	}
-
-	return 0;
-}
-
 static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -1435,11 +1197,6 @@ static const struct phy_ops qcom_qmp_ufs_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void qcom_qmp_reset_control_put(void *data)
-{
-	reset_control_put(data);
-}
-
 static
 int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
@@ -1447,7 +1204,6 @@ int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct phy *generic_phy;
 	struct qmp_phy *qphy;
-	char prop_name[MAX_PROP_NAME];
 	int ret;
 
 	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
@@ -1503,20 +1259,6 @@ int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 	if (!qphy->pcs_misc)
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
 
-	/* Get lane reset, if any */
-	if (cfg->has_lane_rst) {
-		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
-		qphy->lane_rst = of_reset_control_get_exclusive(np, prop_name);
-		if (IS_ERR(qphy->lane_rst)) {
-			dev_err(dev, "failed to get lane%d reset\n", id);
-			return PTR_ERR(qphy->lane_rst);
-		}
-		ret = devm_add_action_or_reset(dev, qcom_qmp_reset_control_put,
-					       qphy->lane_rst);
-		if (ret)
-			return ret;
-	}
-
 	generic_phy = devm_phy_create(dev, np, &qcom_qmp_ufs_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
@@ -1600,13 +1342,6 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 	if (IS_ERR(serdes))
 		return PTR_ERR(serdes);
 
-	/* per PHY dp_com; if PHY has dp_com control block */
-	if (cfg->has_phy_dp_com_ctrl) {
-		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(qmp->dp_com))
-			return PTR_ERR(qmp->dp_com);
-	}
-
 	expected_phys = cfg->nlanes;
 
 	mutex_init(&qmp->phy_mutex);
@@ -1615,10 +1350,6 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_ufs_reset_init(dev, cfg);
-	if (ret)
-		return ret;
-
 	ret = qcom_qmp_phy_ufs_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-- 
2.35.1

