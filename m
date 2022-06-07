Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C8953B41C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiFBHJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiFBHJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F6C15704
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s6so6364010lfo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzRuyNz9V61ec/NTcGgrcJ751gmwroZ7QWpL2uRPn/Q=;
        b=dTjG97gNqvB0FILhj5QRs/yEY5M7lJrFT6IxO2TQs0YsnxljwatcTaj+XZF/XGG5bj
         N04L6zRn9SwM34YsFhBzzt9dctrCiSY54GLulfUalOQ/WSd62mga5iPeG6z49zShk6Zw
         FCeAFdy81g4IaCL6Hc92ItH1h8vvMQRqXS+I+aJvRnSvWYR//QoHPWRgmXl260dl5FcV
         3kJa+fuLWosefwJ1fnNiPbOmi2hAvTjFe+LNr3w0ZLwvucifywBFhFP9VPO3Anqrh4OG
         qRwCMDasHBnVGAvGQ5lVzgwFbyh2WKypTLSH3KrZH9C6bbwsDn3J47UdrOXA7LCGj/Jd
         pTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzRuyNz9V61ec/NTcGgrcJ751gmwroZ7QWpL2uRPn/Q=;
        b=QhsQpP0zu7m8+HmAe8mrepAKLDRtAgJfZwVbCVu7a1xQDsfZ1deXp4ILs4JA8UJTCg
         fGDRXa+zPaxMibxByz4dyYTcwQg5sWjLHFGuwSV3wI1gdxvFgGBwAVGPOi6ivRWO8QBT
         wSMuEtFFSw8XlGXxwGpfOj+ALaJLxjzciM8vwFLN2Vbu7Gw1uFfit7ma4xvEt6zjjm95
         u8XOloeyuTWQx//HKVIVFX9sAN3MZV1+ZsuiD24oNyKtyPBA/NuxB5lk9GPgMNS4hUTw
         WHs9t411jYucJjpoiT7ryplOyXyTHme7g8Px1rSkr0nedqyxMwxzJfa/UcJ8T8g4M5Rl
         sFiA==
X-Gm-Message-State: AOAM533iG6aY9dCt1ol5CjSpKAIEGZTBtNF36fJrJl1qIckiXxWCvxQH
        8cu4cRUG9ioStUIFvO3sVI/fNQ==
X-Google-Smtp-Source: ABdhPJyDYZD3lmq6FitcwYYvnQ0CbDXFy7+ru2unrVeqMJLiEmxiJNbXdF2dvWLEpeiSCuky0mOjVw==
X-Received: by 2002:a05:6512:2e7:b0:478:f55e:f490 with SMTP id m7-20020a05651202e700b00478f55ef490mr2554537lfq.486.1654153770375;
        Thu, 02 Jun 2022 00:09:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 21/30] phy: qcom-qmp-pcie-msm8996: cleanup the driver
Date:   Thu,  2 Jun 2022 10:09:00 +0300
Message-Id: <20220602070909.1666068-22-dmitry.baryshkov@linaro.org>
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

Remove the conditionals and options that are not used by the MSM8996
PCIe PHY device. Hardcode has_lane_rst and has_phy_com_ctrl as this is
the case for this PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 268 +++---------------
 1 file changed, 41 insertions(+), 227 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 02e5ae7fa213..51da3a3a199e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -266,22 +266,6 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
 	int pcs_misc_tbl_num_sec;
 
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
-
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -301,28 +285,11 @@ struct qmp_phy_cfg {
 	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
 	unsigned int phy_status;
 
-	/* true, if PHY has a separate PHY_COM control block */
-	bool has_phy_com_ctrl;
-	/* true, if PHY has a reset for individual lanes */
-	bool has_lane_rst;
 	/* true, if PHY needs delay after POWER_DOWN */
 	bool has_pwrdn_delay;
 	/* power_down delay in usec */
 	int pwrdn_delay_min;
 	int pwrdn_delay_max;
-
-	/* true, if PHY has a separate DP_COM control block */
-	bool has_phy_dp_com_ctrl;
-	/* true, if PHY has secondary tx/rx lanes to be configured */
-	bool is_dual_lane_phy;
-
-	/* true, if PCS block has no separate SW_RESET register */
-	bool no_pcs_sw_reset;
-};
-
-struct qmp_phy_combo_cfg {
-	const struct qmp_phy_cfg *usb_cfg;
-	const struct qmp_phy_cfg *dp_cfg;
 };
 
 /**
@@ -334,17 +301,12 @@ struct qmp_phy_combo_cfg {
  * @tx: iomapped memory space for lane's tx
  * @rx: iomapped memory space for lane's rx
  * @pcs: iomapped memory space for lane's pcs
- * @tx2: iomapped memory space for second lane's tx (in dual lane PHYs)
- * @rx2: iomapped memory space for second lane's rx (in dual lane PHYs)
  * @pcs_misc: iomapped memory space for lane's pcs_misc
  * @pipe_clk: pipe clock
  * @index: lane index
  * @qmp: QMP phy to which this lane belongs
  * @lane_rst: lane's reset controller
  * @mode: current PHY mode
- * @dp_aux_cfg: Display port aux config
- * @dp_opts: Display port optional config
- * @dp_clks: Display port clocks
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -353,30 +315,18 @@ struct qmp_phy {
 	void __iomem *tx;
 	void __iomem *rx;
 	void __iomem *pcs;
-	void __iomem *tx2;
-	void __iomem *rx2;
 	void __iomem *pcs_misc;
 	struct clk *pipe_clk;
 	unsigned int index;
 	struct qcom_qmp *qmp;
 	struct reset_control *lane_rst;
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
@@ -385,11 +335,9 @@ struct qmp_phy_dp_clks {
  * @phys: array of per-lane phy descriptors
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
- * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
 	struct device *dev;
-	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
 	struct reset_control **resets;
@@ -399,8 +347,6 @@ struct qcom_qmp {
 
 	struct mutex phy_mutex;
 	int init_count;
-
-	struct reset_control *ufs_reset;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -467,8 +413,6 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 	.mask_com_pcs_ready	= PCS_READY,
 	.phy_status		= PHYSTATUS,
 
-	.has_phy_com_ctrl	= true,
-	.has_lane_rst		= true,
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
@@ -512,6 +456,8 @@ static int qcom_qmp_phy_pcie_msm8996_serdes_init(struct qmp_phy *qphy)
 	void __iomem *serdes = qphy->serdes;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
+	void __iomem *status;
+	unsigned int mask, val;
 	int ret;
 
 	qcom_qmp_phy_pcie_msm8996_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
@@ -519,24 +465,20 @@ static int qcom_qmp_phy_pcie_msm8996_serdes_init(struct qmp_phy *qphy)
 		qcom_qmp_phy_pcie_msm8996_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
-	if (cfg->has_phy_com_ctrl) {
-		void __iomem *status;
-		unsigned int mask, val;
 
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
+	qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
+	qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
+		     SERDES_START | PCS_START);
 
-		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
-		mask = cfg->mask_com_pcs_ready;
+	status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
+	mask = cfg->mask_com_pcs_ready;
 
-		ret = readl_poll_timeout(status, val, (val & mask), 10,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev,
-				"phy common block init timed-out\n");
-			return ret;
-		}
+	ret = readl_poll_timeout(status, val, (val & mask), 10,
+				 PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev,
+			"phy common block init timed-out\n");
+		return ret;
 	}
 
 	return 0;
@@ -547,8 +489,6 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	void __iomem *pcs = qphy->pcs;
-	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -586,41 +526,8 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	if (ret)
 		goto err_assert_reset;
 
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
-
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
+	qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
+		     SW_PWRDN);
 
 	mutex_unlock(&qmp->phy_mutex);
 
@@ -650,15 +557,12 @@ static int qcom_qmp_phy_pcie_msm8996_com_exit(struct qmp_phy *qphy)
 		return 0;
 	}
 
-	reset_control_assert(qmp->ufs_reset);
-	if (cfg->has_phy_com_ctrl) {
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET],
-			     SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
-			     SW_PWRDN);
-	}
+	qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
+		     SERDES_START | PCS_START);
+	qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET],
+		     SW_RESET);
+	qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
+		     SW_PWRDN);
 
 	while (--i >= 0)
 		reset_control_assert(qmp->resets[i]);
@@ -676,37 +580,9 @@ static int qcom_qmp_phy_pcie_msm8996_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	int ret;
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
-	if (cfg->no_pcs_sw_reset) {
-		/*
-		 * Get UFS reset, which is delayed until now to avoid a
-		 * circular dependency where UFS needs its PHY, but the PHY
-		 * needs this UFS reset.
-		 */
-		if (!qmp->ufs_reset) {
-			qmp->ufs_reset =
-				devm_reset_control_get_exclusive(qmp->dev,
-								 "ufsphy");
-
-			if (IS_ERR(qmp->ufs_reset)) {
-				ret = PTR_ERR(qmp->ufs_reset);
-				dev_err(qmp->dev,
-					"failed to get UFS reset: %d\n",
-					ret);
-
-				qmp->ufs_reset = NULL;
-				return ret;
-			}
-		}
-
-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
-	}
-
 	ret = qcom_qmp_phy_pcie_msm8996_com_init(qphy);
 	if (ret)
 		return ret;
@@ -729,13 +605,11 @@ static int qcom_qmp_phy_pcie_msm8996_power_on(struct phy *phy)
 
 	qcom_qmp_phy_pcie_msm8996_serdes_init(qphy);
 
-	if (cfg->has_lane_rst) {
-		ret = reset_control_deassert(qphy->lane_rst);
-		if (ret) {
-			dev_err(qmp->dev, "lane%d reset deassert failed\n",
-				qphy->index);
-			return ret;
-		}
+	ret = reset_control_deassert(qphy->lane_rst);
+	if (ret) {
+		dev_err(qmp->dev, "lane%d reset deassert failed\n",
+			qphy->index);
+		return ret;
 	}
 
 	ret = clk_prepare_enable(qphy->pipe_clk);
@@ -751,40 +625,17 @@ static int qcom_qmp_phy_pcie_msm8996_power_on(struct phy *phy)
 		qcom_qmp_phy_pcie_msm8996_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
-	/* Configuration for other LANE for USB-DP combo PHY */
-	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_pcie_msm8996_configure_lane(qphy->tx2, cfg->regs,
-					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_pcie_msm8996_configure_lane(qphy->tx2, cfg->regs,
-						    cfg->tx_tbl_sec,
-						    cfg->tx_tbl_num_sec, 2);
-	}
-
 	qcom_qmp_phy_pcie_msm8996_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
 		qcom_qmp_phy_pcie_msm8996_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
-	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_pcie_msm8996_configure_lane(qphy->rx2, cfg->regs,
-					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
-		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_pcie_msm8996_configure_lane(qphy->rx2, cfg->regs,
-						    cfg->rx_tbl_sec,
-						    cfg->rx_tbl_num_sec, 2);
-	}
-
 	qcom_qmp_phy_pcie_msm8996_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 	if (cfg->pcs_tbl_sec)
 		qcom_qmp_phy_pcie_msm8996_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 				       cfg->pcs_tbl_num_sec);
 
-	ret = reset_control_deassert(qmp->ufs_reset);
-	if (ret)
-		goto err_disable_pipe_clk;
-
 	qcom_qmp_phy_pcie_msm8996_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
@@ -801,8 +652,8 @@ static int qcom_qmp_phy_pcie_msm8996_power_on(struct phy *phy)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
 	/* Pull PHY out of reset state */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
 	/* start SerDes and Phy-Coding-Sublayer */
 	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
@@ -822,8 +673,7 @@ static int qcom_qmp_phy_pcie_msm8996_power_on(struct phy *phy)
 err_disable_pipe_clk:
 	clk_disable_unprepare(qphy->pipe_clk);
 err_reset_lane:
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
+	reset_control_assert(qphy->lane_rst);
 
 	return ret;
 }
@@ -836,8 +686,7 @@ static int qcom_qmp_phy_pcie_msm8996_power_off(struct phy *phy)
 	clk_disable_unprepare(qphy->pipe_clk);
 
 	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* stop SerDes and Phy-Coding-Sublayer */
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
@@ -857,10 +706,8 @@ static int qcom_qmp_phy_pcie_msm8996_power_off(struct phy *phy)
 static int qcom_qmp_phy_pcie_msm8996_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
+	reset_control_assert(qphy->lane_rst);
 
 	qcom_qmp_phy_pcie_msm8996_com_exit(qphy);
 
@@ -1065,31 +912,7 @@ int qcom_qmp_phy_pcie_msm8996_create(struct device *dev, struct device_node *np,
 	if (!qphy->pcs)
 		return -ENOMEM;
 
-	/*
-	 * If this is a dual-lane PHY, then there should be registers for the
-	 * second lane. Some old device trees did not specify this, so fall
-	 * back to old legacy behavior of assuming they can be reached at an
-	 * offset from the first lane.
-	 */
-	if (cfg->is_dual_lane_phy) {
-		qphy->tx2 = of_iomap(np, 3);
-		qphy->rx2 = of_iomap(np, 4);
-		if (!qphy->tx2 || !qphy->rx2) {
-			dev_warn(dev,
-				 "Underspecified device tree, falling back to legacy register regions\n");
-
-			/* In the old version, pcs_misc is at index 3. */
-			qphy->pcs_misc = qphy->tx2;
-			qphy->tx2 = qphy->tx + QMP_PHY_LEGACY_LANE_STRIDE;
-			qphy->rx2 = qphy->rx + QMP_PHY_LEGACY_LANE_STRIDE;
-
-		} else {
-			qphy->pcs_misc = of_iomap(np, 5);
-		}
-
-	} else {
-		qphy->pcs_misc = of_iomap(np, 3);
-	}
+	qphy->pcs_misc = of_iomap(np, 3);
 
 	if (!qphy->pcs_misc)
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
@@ -1117,18 +940,16 @@ int qcom_qmp_phy_pcie_msm8996_create(struct device *dev, struct device_node *np,
 	}
 
 	/* Get lane reset, if any */
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
+	snprintf(prop_name, sizeof(prop_name), "lane%d", id);
+	qphy->lane_rst = of_reset_control_get_exclusive(np, prop_name);
+	if (IS_ERR(qphy->lane_rst)) {
+		dev_err(dev, "failed to get lane%d reset\n", id);
+		return PTR_ERR(qphy->lane_rst);
 	}
+	ret = devm_add_action_or_reset(dev, qcom_qmp_reset_control_put,
+				       qphy->lane_rst);
+	if (ret)
+		return ret;
 
 	generic_phy = devm_phy_create(dev, np, &qcom_qmp_phy_pcie_msm8996_ops);
 	if (IS_ERR(generic_phy)) {
@@ -1183,13 +1004,6 @@ static int qcom_qmp_phy_pcie_msm8996_probe(struct platform_device *pdev)
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
-- 
2.35.1

