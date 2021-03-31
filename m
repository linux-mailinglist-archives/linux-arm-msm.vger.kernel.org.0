Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFE535030D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbhCaPQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbhCaPQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:16:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7DBC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b14so29659059lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v03saRp/WhgRD5q+jtfmlvYSag8e2e59zjMW6jOssB8=;
        b=nz/PJrhVJ6zogp2nNFR9iuYpN5nGeiHZpfjTFws4oipoFjIbbPHkiTzuqW9Xok0DGW
         7HgdgKSOZd68xWbo7725Zn3s3HpezvpP5U7vJ8ezjhh/WzieyTd+KA8e2tnUG4CfuXDQ
         UcRG9mh+bd02M77GeWSzPdrke6+rKSgSvIi1MfgSb3XAPMEbNCLxicIrPNBLBvZZNacV
         wueveq79g/k6I7MjJfYj4d+adjr+s9I8uAgMrjM0CitBy1dKu1andwGOYHiz5Zk29M26
         YyRI+1KXOXmiaB89J+fl2kBAoWIVyALn5eG5tjQit3L9QjWbg4oqZII2N1aCwS8KT8lS
         Nkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v03saRp/WhgRD5q+jtfmlvYSag8e2e59zjMW6jOssB8=;
        b=KVYBsB3o8uRABSAX3tir7ZkYLUU4pXs1ny7Iiitc2WgHS6XtZ29l5vr2jsbq/NfDFd
         fSAn5mO8UeAHXuRQ9XuTRvVmEQvEVzkQnn6dW6gpw97UCN9QNRsWHffttPBsutdRjuGK
         vVjgTSAVo874ixUtQymR4hkXJFHu/C2FKRSO9JlWSXKHfGKH+5NWAayroPxtiAQCRZfc
         ahzDK3zbwvLb3d1HjhQfI8p9UTL+ONbxNXteEFd7pgliELTbOWRPhSaKnGxim0vkUIRq
         3KK2Q46PHlmopyK1bRA8cMsOEFzEM0URQf/R/zX8AKan5hSpfV8lQXTsJ8kw7zTVnfW5
         fsIw==
X-Gm-Message-State: AOAM531+IMBmeaeRvdk2RVNZXOvJrJkbuZSsqVJjFriDwcBcNQwEVfWt
        DhYzF7n7fnsrT1S9KbrYt7uvKQ==
X-Google-Smtp-Source: ABdhPJyzCpftsmXdsKgo5Q9u7rxYmSiXKAkzlJ5clMmhqTLJUUBheo3v4+25qHuMkdvIN9NTi5Czvg==
X-Received: by 2002:a19:380a:: with SMTP id f10mr2496178lfa.294.1617203787824;
        Wed, 31 Mar 2021 08:16:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t201sm266738lff.70.2021.03.31.08.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:16:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 3/7] phy: qcom-qmp: move DP functions to callbacks
Date:   Wed, 31 Mar 2021 18:16:10 +0300
Message-Id: <20210331151614.3810197-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
References: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to adding support for V4 DP PHY move DP functions to
callbacks at struct qmp_phy_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 73 ++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 1c79a713780d..854f6ff7faef 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2268,6 +2268,8 @@ static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
 };
 
+struct qmp_phy;
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	/* phy-type - PCIE/UFS/USB */
@@ -2307,6 +2309,12 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *serdes_tbl_hbr3;
 	int serdes_tbl_hbr3_num;
 
+	/* DP PHY callbacks */
+	int (*configure_dp_phy)(struct qmp_phy *qphy);
+	void (*configure_dp_tx)(struct qmp_phy *qphy);
+	int (*calibrate_dp_phy)(struct qmp_phy *qphy);
+	void (*dp_aux_init)(struct qmp_phy *qphy);
+
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -2423,6 +2431,11 @@ struct qcom_qmp {
 	struct reset_control *ufs_reset;
 };
 
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy);
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy);
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy);
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy);
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -2871,6 +2884,11 @@ static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
 
 	.has_phy_dp_com_ctrl	= true,
 	.is_dual_lane_phy	= true,
+
+	.dp_aux_init = qcom_qmp_v3_phy_dp_aux_init,
+	.configure_dp_tx = qcom_qmp_v3_phy_configure_dp_tx,
+	.configure_dp_phy = qcom_qmp_v3_phy_configure_dp_phy,
+	.calibrate_dp_phy = qcom_qmp_v3_dp_phy_calibrate,
 };
 
 static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
@@ -3332,7 +3350,7 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	return 0;
 }
 
-static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 {
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
@@ -3403,7 +3421,7 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	unsigned int v_level = 0, p_level = 0;
@@ -3451,21 +3469,7 @@ static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
 	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
 }
 
-static int qcom_qmp_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
-{
-	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
-
-	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
-	if (qphy->dp_opts.set_voltages) {
-		qcom_qmp_phy_configure_dp_tx(qphy);
-		qphy->dp_opts.set_voltages = 0;
-	}
-
-	return 0;
-}
-
-static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
@@ -3561,9 +3565,8 @@ static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
  * We need to calibrate the aux setting here as many times
  * as the caller tries
  */
-static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
 {
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
 	u8 val;
 
@@ -3576,6 +3579,32 @@ static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
+static int qcom_qmp_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+
+	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (qphy->dp_opts.set_voltages) {
+		cfg->configure_dp_tx(qphy);
+		qphy->dp_opts.set_voltages = 0;
+	}
+
+	return 0;
+}
+
+static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+
+	if (cfg->calibrate_dp_phy)
+		return cfg->calibrate_dp_phy(qphy);
+
+	return 0;
+}
+
 static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -3748,7 +3777,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 		return ret;
 
 	if (cfg->type == PHY_TYPE_DP)
-		qcom_qmp_phy_dp_aux_init(qphy);
+		cfg->dp_aux_init(qphy);
 
 	return 0;
 }
@@ -3802,7 +3831,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 
 	/* Configure special DP tx tunings */
 	if (cfg->type == PHY_TYPE_DP)
-		qcom_qmp_phy_configure_dp_tx(qphy);
+		cfg->configure_dp_tx(qphy);
 
 	qcom_qmp_phy_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
@@ -3821,7 +3850,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 
 	/* Configure link rate, swing, etc. */
 	if (cfg->type == PHY_TYPE_DP) {
-		qcom_qmp_phy_configure_dp_phy(qphy);
+		cfg->configure_dp_phy(qphy);
 	} else {
 		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-- 
2.30.2

