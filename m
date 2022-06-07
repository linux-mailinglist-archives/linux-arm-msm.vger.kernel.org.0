Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1FA542580
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiFHFPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 01:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbiFHFPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 01:15:11 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFFC374EEE
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so30276508lfa.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vTUaifT3weOFSUummjFThwFbn8UXYDZjmJKTdkeWH8=;
        b=wY5qfqw6cM0S1sK07WSEpPG5ygXYMjA2ItQQWcmc5tjWFCk4XyxTfzb0BR6+StCyiP
         MFfLbvFzNPmLQXegFgu5AGjtPH4RC7nO7EFTtWRT35Sez9WFlxbiSftaETgjQu+sOL/I
         wOKccN1dYOhF0sO5TfjzyKlySd0Om3OiULoKzlUKFtaSiooiNXucmbNodHmfL6/SmHYP
         yjLsbZP0ozOhusGLx+40ddVaJ5JpJPOHXQCnX4ZlaXKyrNxkl5vgxTOKf6NizKV9YMrZ
         Nso/b6A5Ltzw5BTXxSZ4bl5qqB5xyC1Y0n5ERejcuvrJUyloPa4Vg3Jmk5l8fFbVL4ZN
         /NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vTUaifT3weOFSUummjFThwFbn8UXYDZjmJKTdkeWH8=;
        b=Vuk86+vopOtE/zKFN5D9P+KbRcdKA3Mn2pU6fviQQPe6SgaA5/4uar23ZZUHy/Y5EC
         +WhnyQO7vDFyLNIl63iXyIWzySLiGqQ1nhV6np7YXs2tdtWqr3qTo5mWTJVAFTDDLvp5
         iIjeELSxCqioZA9Hrtc14Mh97l+inM1Wh6a0diCe0k+mQf5LtEGjBdD/CVAEXONvdftQ
         E0y9+R1pKtqxGe+LOL/VR6VaR6n+csPLTlgeE+cXKtQG2bUL2c7DDp9J56EfLRl2wLhB
         3rv+qa0lMRJ8Jk4/yYmZfJdJI77/C0Dw8edBz3ZHB7a5/3dBIsDSBkvlYgowIwufbuDH
         6sOQ==
X-Gm-Message-State: AOAM5338+BwQVmrtXo9IWCKLHUN18nwSK/Io34QpMiSutdJD06u45hdv
        uPdImOuUBC6SdD04y285QDQJFQ==
X-Google-Smtp-Source: ABdhPJzTkOF2X2RwGvSec6H8Q/TpL3P4ZGMRtiOYReeXRTYndf0TkcimK6MdC9KNfyyuTqqbe9aUTg==
X-Received: by 2002:a19:4950:0:b0:479:75f4:4e8f with SMTP id l16-20020a194950000000b0047975f44e8fmr1532537lfj.20.1654637557326;
        Tue, 07 Jun 2022 14:32:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 23/30] phy: qcom-qmp-usb: cleanup the driver
Date:   Wed,  8 Jun 2022 00:31:56 +0300
Message-Id: <20220607213203.2819885-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
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

Remove the conditionals and options that are not used by any of USB PHY
devices.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 214 ++----------------------
 1 file changed, 11 insertions(+), 203 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index f2e927e30e6a..a633263c900d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1359,40 +1359,12 @@ struct qmp_phy_cfg {
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
@@ -1409,14 +1381,9 @@ struct qmp_phy_cfg {
 
 	unsigned int start_ctrl;
 	unsigned int pwrdn_ctrl;
-	unsigned int mask_com_pcs_ready;
 	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
 	unsigned int phy_status;
 
-	/* true, if PHY has a separate PHY_COM control block */
-	bool has_phy_com_ctrl;
-	/* true, if PHY has a reset for individual lanes */
-	bool has_lane_rst;
 	/* true, if PHY needs delay after POWER_DOWN */
 	bool has_pwrdn_delay;
 	/* power_down delay in usec */
@@ -1427,14 +1394,6 @@ struct qmp_phy_cfg {
 	bool has_phy_dp_com_ctrl;
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
@@ -1452,11 +1411,7 @@ struct qmp_phy_combo_cfg {
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
@@ -1471,17 +1426,7 @@ struct qmp_phy {
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
@@ -1497,7 +1442,6 @@ struct qmp_phy_dp_clks {
  * @phys: array of per-lane phy descriptors
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
- * @ufs_reset: optional UFS PHY reset handle
  */
 struct qcom_qmp {
 	struct device *dev;
@@ -1511,8 +1455,6 @@ struct qcom_qmp {
 
 	struct mutex phy_mutex;
 	int init_count;
-
-	struct reset_control *ufs_reset;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -2056,37 +1998,12 @@ static void qcom_qmp_phy_usb_configure(void __iomem *base,
 
 static int qcom_qmp_phy_usb_serdes_init(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
-	int ret;
 
 	qcom_qmp_phy_usb_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
-	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_usb_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
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
@@ -2095,7 +2012,6 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
@@ -2158,18 +2074,13 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 	}
 
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
 
@@ -2190,7 +2101,6 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -2199,16 +2109,6 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
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
 
@@ -2225,37 +2125,9 @@ static int qcom_qmp_phy_usb_init(struct phy *phy)
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
 	ret = qcom_qmp_phy_usb_com_init(qphy);
 	if (ret)
 		return ret;
@@ -2271,82 +2143,45 @@ static int qcom_qmp_phy_usb_power_on(struct phy *phy)
 	void __iomem *tx = qphy->tx;
 	void __iomem *rx = qphy->rx;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
 	void __iomem *status;
 	unsigned int mask, val, ready;
 	int ret;
 
 	qcom_qmp_phy_usb_serdes_init(qphy);
 
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
 	qcom_qmp_phy_usb_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_usb_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
-					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_usb_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_usb_configure_lane(qphy->tx2, cfg->regs,
-						    cfg->tx_tbl_sec,
-						    cfg->tx_tbl_num_sec, 2);
 	}
 
 	qcom_qmp_phy_usb_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_usb_configure_lane(rx, cfg->regs,
-					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_usb_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
-		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_usb_configure_lane(qphy->rx2, cfg->regs,
-						    cfg->rx_tbl_sec,
-						    cfg->rx_tbl_num_sec, 2);
 	}
 
 	/* Configure link rate, swing, etc. */
 	qcom_qmp_phy_usb_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-	if (cfg->pcs_tbl_sec)
-		qcom_qmp_phy_usb_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
-				       cfg->pcs_tbl_num_sec);
-
-	ret = reset_control_deassert(qmp->ufs_reset);
-	if (ret)
-		goto err_disable_pipe_clk;
-
-	qcom_qmp_phy_usb_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
-			       cfg->pcs_misc_tbl_num);
-	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_usb_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
-				       cfg->pcs_misc_tbl_num_sec);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
 	/* Pull PHY out of reset state */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
 	/* start SerDes and Phy-Coding-Sublayer */
 	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
@@ -2365,9 +2200,6 @@ static int qcom_qmp_phy_usb_power_on(struct phy *phy)
 
 err_disable_pipe_clk:
 	clk_disable_unprepare(qphy->pipe_clk);
-err_reset_lane:
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	return ret;
 }
@@ -2380,8 +2212,7 @@ static int qcom_qmp_phy_usb_power_off(struct phy *phy)
 	clk_disable_unprepare(qphy->pipe_clk);
 
 	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* stop SerDes and Phy-Coding-Sublayer */
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
@@ -2401,10 +2232,6 @@ static int qcom_qmp_phy_usb_power_off(struct phy *phy)
 static int qcom_qmp_phy_usb_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	qcom_qmp_phy_usb_com_exit(qphy);
 
@@ -2676,11 +2503,6 @@ static const struct phy_ops qcom_qmp_phy_usb_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void qcom_qmp_reset_control_put(void *data)
-{
-	reset_control_put(data);
-}
-
 static
 int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
@@ -2762,20 +2584,6 @@ int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, int id,
 		return ret;
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
 	generic_phy = devm_phy_create(dev, np, &qcom_qmp_phy_usb_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
-- 
2.35.1

