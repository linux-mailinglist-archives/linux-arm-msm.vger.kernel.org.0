Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9C053B41A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiFBHJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiFBHJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D9F11A2C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h23so6395331lfe.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxp/LOUNp/wzMuqrwN6csZbBn770GyJGGbjQwbOP0ZY=;
        b=EqbuHBlNQD6uHhXuUOAlxc/kxteW/SFHNqjKkQxI6zoOiB1+MiKCmyNWGdNou3N5S1
         jJ6Aey5jzQVRan4Oh9pBqVdMcI+BFYmCfUfbhmqO8Ww1M7dgO8aPvnyXmsKSB5DcMBBT
         CeE8RIjgXVve8MYHv38ZkjM0xdQzfFDhaeyB1y4y9Y+CtUoL8YUim3KarjXkw188dQ5l
         7lVw8e+Gi390+UZ5ICAeLWNA9euY7U+yPHMM0715E2/O1RzhZ29M0o+G1OYkscakxeQ0
         IHzqMGtCsRKE+XYlQXjOvUeniQbj5aSgHRRBJWLHJCCwLkDbGJymHqszy5cqxLkq2u07
         hQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxp/LOUNp/wzMuqrwN6csZbBn770GyJGGbjQwbOP0ZY=;
        b=6hbqoZFEomw8/c7OXiCpN4So9m3jpkUlA2+7VZ4IQ22/HjxdG00VKetAYiP5KDjRG2
         fTo3b25T8kNSCy2lq5brq+1vy2NxQEAZzqUCcnLDDX9BmE5Ks70dCEab+VCF4GOfq3P2
         UO4Dr/lB8/jH9/qTXAnMvCsw2wEZ3MIZiedbc2BC8WEKlfSF1/fEKBW8vz6C29IhYn4P
         Lr3nuAnN4V6t7OzsmLp+qwuoyIU544jEvq49pY79i/oIx+lbzBtMzsb5uaFLNFaCvv8t
         5t01tqj1168d0c6xDYyalbZbgqfze2DEfQcqG+6rwGEnSh2feFoSRT6PsDhLS1G3DPy9
         M0jw==
X-Gm-Message-State: AOAM532MsQ+5gp9eRl4K4+YINYEWoyB5S803uPnIy98re6Ex4VO/qMMi
        LgxpCfEoz/mZdnlXae45DW0B8w==
X-Google-Smtp-Source: ABdhPJxPESxwkPlzeZiK2D0BKmvByjEWb6Uv6rreH7wdnr4G0XZ5XSIvCdsYUZDCdUxZuGeawrav2A==
X-Received: by 2002:ac2:44b3:0:b0:478:ea0b:ddff with SMTP id c19-20020ac244b3000000b00478ea0bddffmr2553269lfm.97.1654153769468;
        Thu, 02 Jun 2022 00:09:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 20/30] phy: qcom-qmp-pcie: cleanup the driver
Date:   Thu,  2 Jun 2022 10:08:59 +0300
Message-Id: <20220602070909.1666068-21-dmitry.baryshkov@linaro.org>
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

Remove the conditionals and options that are not used by any of PCIe PHY
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 213 ++---------------------
 1 file changed, 11 insertions(+), 202 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index b780994692b3..d9e8a3e88890 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1257,22 +1257,6 @@ struct qmp_phy_cfg {
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
@@ -1292,28 +1276,14 @@ struct qmp_phy_cfg {
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
 
-	/* true, if PHY has a separate DP_COM control block */
-	bool has_phy_dp_com_ctrl;
 	/* true, if PHY has secondary tx/rx lanes to be configured */
 	bool is_dual_lane_phy;
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
@@ -1331,11 +1301,7 @@ struct qmp_phy_combo_cfg {
  * @pipe_clk: pipe clock
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
@@ -1350,24 +1316,13 @@ struct qmp_phy {
 	struct clk *pipe_clk;
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
@@ -1376,11 +1331,9 @@ struct qmp_phy_dp_clks {
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
@@ -1390,8 +1343,6 @@ struct qcom_qmp {
 
 	struct mutex phy_mutex;
 	int init_count;
-
-	struct reset_control *ufs_reset;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -1470,8 +1421,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
 
-	.has_phy_com_ctrl	= false,
-	.has_lane_rst		= false,
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= 995,		/* us */
 	.pwrdn_delay_max	= 1005,		/* us */
@@ -1500,8 +1449,6 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 
-	.has_phy_com_ctrl	= false,
-	.has_lane_rst		= false,
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= 995,		/* us */
 	.pwrdn_delay_max	= 1005,		/* us */
@@ -1829,38 +1776,16 @@ static void qcom_qmp_phy_pcie_configure(void __iomem *base,
 
 static int qcom_qmp_phy_pcie_serdes_init(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
-	int ret;
 
 	qcom_qmp_phy_pcie_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
 	if (cfg->serdes_tbl_sec)
 		qcom_qmp_phy_pcie_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
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
-
 	return 0;
 }
 
@@ -1868,9 +1793,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -1908,41 +1831,13 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
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
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
+		qphy_setbits(pcs,
+				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	else
+		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
 
 	mutex_unlock(&qmp->phy_mutex);
 
@@ -1963,7 +1858,6 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -1972,16 +1866,6 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
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
-
 	while (--i >= 0)
 		reset_control_assert(qmp->resets[i]);
 
@@ -1998,37 +1882,9 @@ static int qcom_qmp_phy_pcie_init(struct phy *phy)
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
 	ret = qcom_qmp_phy_pcie_com_init(qphy);
 	if (ret)
 		return ret;
@@ -2051,19 +1907,10 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 
 	qcom_qmp_phy_pcie_serdes_init(qphy);
 
-	if (cfg->has_lane_rst) {
-		ret = reset_control_deassert(qphy->lane_rst);
-		if (ret) {
-			dev_err(qmp->dev, "lane%d reset deassert failed\n",
-				qphy->index);
-			return ret;
-		}
-	}
-
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
-		goto err_reset_lane;
+		return ret;
 	}
 
 	/* Tx, Rx, and PCS configurations */
@@ -2103,10 +1950,6 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 		qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 				       cfg->pcs_tbl_num_sec);
 
-	ret = reset_control_deassert(qmp->ufs_reset);
-	if (ret)
-		goto err_disable_pipe_clk;
-
 	qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
@@ -2123,8 +1966,8 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
 	/* Pull PHY out of reset state */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
 	/* start SerDes and Phy-Coding-Sublayer */
 	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
@@ -2143,9 +1986,6 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 
 err_disable_pipe_clk:
 	clk_disable_unprepare(qphy->pipe_clk);
-err_reset_lane:
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	return ret;
 }
@@ -2158,8 +1998,7 @@ static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
 	clk_disable_unprepare(qphy->pipe_clk);
 
 	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* stop SerDes and Phy-Coding-Sublayer */
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
@@ -2179,10 +2018,6 @@ static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
 static int qcom_qmp_phy_pcie_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	qcom_qmp_phy_pcie_com_exit(qphy);
 
@@ -2348,11 +2183,6 @@ static const struct phy_ops qcom_qmp_phy_pcie_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void qcom_qmp_reset_control_put(void *data)
-{
-	reset_control_put(data);
-}
-
 static
 int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
@@ -2438,20 +2268,6 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 		qphy->pipe_clk = NULL;
 	}
 
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
 	generic_phy = devm_phy_create(dev, np, &qcom_qmp_phy_pcie_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
@@ -2538,13 +2354,6 @@ static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
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

