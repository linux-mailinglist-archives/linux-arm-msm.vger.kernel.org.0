Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82525EBE74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 11:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiI0JYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 05:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiI0JYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 05:24:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DA6D576C
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:22:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a2so14764735lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pi5ZjEn+JlmZIhK600uOWrj7gLAxy/YegQI3DQt/Yjw=;
        b=hSXdFh6MmAjdDIjc5oIN/+hAWuCLp1x0LtwDWL8mJ0dAEmuoFtoGkI4wNXsfTh5HZ9
         jzXKNLA8LqkKlq4benxDKPz3e/bvNjHZ+XW9F8RH5ZD0h88Ry6EequuwGlZqDFTV7jZK
         s25xuCWXNiIjxgsOp/01D1A2mGmHU1sGip0tWAvmDNowpxZViGfRrmtsjvmIzygh7e8u
         anxDQPacUH6MYvY8k0yqeqbOy71vwrU2PjZNw9fd1aV+LAc1fKTko2txLN7R1/4ZIOtT
         jQ7cE2KHwe+fqXKaq+st+zw7iPzTlUxSYYJgwVeHNrLfQyEBCtVmmF046sA+3WjrttSu
         uyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pi5ZjEn+JlmZIhK600uOWrj7gLAxy/YegQI3DQt/Yjw=;
        b=CqM/VYVOOVgewliq7j8tVQMDLxQiyqA9Dox+5l5Da3qsAYFDA0JVgmVby3TGpg86ec
         NpRDPKjGFUrQ76VqhU5+i0oKBM4cEzOCfgl5JYu9FltaSXBCFF2lOuACv6w75IZt/ElE
         HKCyohAjvp9yGxwpdmFy9eZ3b5uQnk4rYP/0yovdrwtXhdHvzZpUaOMZPbCvPo5G5g0C
         vPdB9+NqXL3aZQzXA4w0Ey5tDvLaSjljBtcbbPGqsFDI4OCSeCNby+Yf2kxs1DYhwEfV
         9UpxVhrnDXHv3gCvJc2yyHwjVgKauku7Uw4f8BgGuJyIPVTPv5Z7+zDptT6IkYIBMx5S
         e2qA==
X-Gm-Message-State: ACrzQf3oSHPtnIpYWhxSa2Nlm8tAc/FRVc/IRia4ZZROT7whWf0gNbFx
        evkfZ0UuXq3K7Arl3tzcE1+neg==
X-Google-Smtp-Source: AMsMyM6EzwFi6xHf/ZZic/l3DnEXCpk6DZxJNM1uyCTvuH/+FpWEIPgYlJxKxrn3+nxR92P8TuOtyA==
X-Received: by 2002:a05:6512:2805:b0:4a0:4fac:a958 with SMTP id cf5-20020a056512280500b004a04faca958mr9621204lfb.291.1664270528816;
        Tue, 27 Sep 2022 02:22:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r28-20020a2e8e3c000000b0026c15d60ad1sm104584ljk.132.2022.09.27.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 02:22:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v6 1/5] phy: qcom-qmp-pcie: split register tables into common and extra parts
Date:   Tue, 27 Sep 2022 12:22:02 +0300
Message-Id: <20220927092207.161501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927092207.161501-1-dmitry.baryshkov@linaro.org>
References: <20220927092207.161501-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 configuration tables are split into two parts: the common one and
the PHY-specific tables. Make this split more formal. Rather than having
a blind renamed copy of all QMP table fields, add separate struct
qmp_phy_cfg_tables and add two instances of this structure to the struct
qmp_phy_cfg. Later on this will be used to support different PHY modes
(RC vs EP).

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 406 +++++++++++++----------
 1 file changed, 222 insertions(+), 184 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5be5348fbb26..ae0d7b49dfa3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1300,31 +1300,30 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
 };
 
+struct qmp_phy_cfg_tables {
+	const struct qmp_phy_init_tbl *serdes;
+	int serdes_num;
+	const struct qmp_phy_init_tbl *tx;
+	int tx_num;
+	const struct qmp_phy_init_tbl *rx;
+	int rx_num;
+	const struct qmp_phy_init_tbl *pcs;
+	int pcs_num;
+	const struct qmp_phy_init_tbl *pcs_misc;
+	int pcs_misc_num;
+};
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	int lanes;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
-	const struct qmp_phy_init_tbl *serdes_tbl;
-	int serdes_tbl_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_sec;
-	int serdes_tbl_num_sec;
-	const struct qmp_phy_init_tbl *tx_tbl;
-	int tx_tbl_num;
-	const struct qmp_phy_init_tbl *tx_tbl_sec;
-	int tx_tbl_num_sec;
-	const struct qmp_phy_init_tbl *rx_tbl;
-	int rx_tbl_num;
-	const struct qmp_phy_init_tbl *rx_tbl_sec;
-	int rx_tbl_num_sec;
-	const struct qmp_phy_init_tbl *pcs_tbl;
-	int pcs_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_tbl_sec;
-	int pcs_tbl_num_sec;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl;
-	int pcs_misc_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
-	int pcs_misc_tbl_num_sec;
+	/* Main init sequence for PHY blocks - serdes, tx, rx, pcs */
+	const struct qmp_phy_cfg_tables tables;
+	/*
+	 * Additional init sequence for PHY blocks, providing additional
+	 * register programming. Unless required it can be left omitted.
+	 */
+	const struct qmp_phy_cfg_tables *tables_rc;
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
@@ -1459,14 +1458,16 @@ static const char * const sdm845_pciephy_reset_l[] = {
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= ipq8074_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_pcie_serdes_tbl),
-	.tx_tbl			= ipq8074_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_tx_tbl),
-	.rx_tbl			= ipq8074_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_rx_tbl),
-	.pcs_tbl		= ipq8074_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_pcie_pcs_tbl),
+	.tables = {
+		.serdes		= ipq8074_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq8074_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_tx_tbl),
+		.rx		= ipq8074_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq8074_pcie_rx_tbl),
+		.pcs		= ipq8074_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq8074_pcie_pcs_tbl),
+	},
 	.clk_list		= ipq8074_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -1487,14 +1488,16 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= ipq8074_pcie_gen3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_serdes_tbl),
-	.tx_tbl			= ipq8074_pcie_gen3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
-	.rx_tbl			= ipq8074_pcie_gen3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_rx_tbl),
-	.pcs_tbl		= ipq8074_pcie_gen3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_pcs_tbl),
+	.tables = {
+		.serdes		= ipq8074_pcie_gen3_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq8074_pcie_gen3_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq8074_pcie_gen3_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_rx_tbl),
+		.pcs		= ipq8074_pcie_gen3_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq8074_pcie_gen3_pcs_tbl),
+	},
 	.clk_list		= ipq8074_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -1516,16 +1519,18 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= ipq6018_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(ipq6018_pcie_serdes_tbl),
-	.tx_tbl			= ipq6018_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
-	.rx_tbl			= ipq6018_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
-	.pcs_tbl		= ipq6018_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
-	.pcs_misc_tbl		= ipq6018_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(ipq6018_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= ipq6018_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq6018_pcie_serdes_tbl),
+		.tx		= ipq6018_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
+		.rx		= ipq6018_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
+		.pcs		= ipq6018_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+		.pcs_misc	= ipq6018_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq6018_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= ipq8074_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -1545,16 +1550,18 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sdm845_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sdm845_qmp_pcie_serdes_tbl),
-	.tx_tbl			= sdm845_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdm845_qmp_pcie_tx_tbl),
-	.rx_tbl			= sdm845_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdm845_qmp_pcie_rx_tbl),
-	.pcs_tbl		= sdm845_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sdm845_qmp_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sdm845_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sdm845_qmp_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sdm845_qmp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sdm845_qmp_pcie_serdes_tbl),
+		.tx		= sdm845_qmp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sdm845_qmp_pcie_tx_tbl),
+		.rx		= sdm845_qmp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sdm845_qmp_pcie_rx_tbl),
+		.pcs		= sdm845_qmp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sdm845_qmp_pcie_pcs_tbl),
+		.pcs_misc	= sdm845_qmp_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sdm845_qmp_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1575,14 +1582,16 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sdm845_qhp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
-	.tx_tbl			= sdm845_qhp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
-	.rx_tbl			= sdm845_qhp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
-	.pcs_tbl		= sdm845_qhp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
+	.tables = {
+		.serdes		= sdm845_qhp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
+		.tx		= sdm845_qhp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
+		.rx		= sdm845_qhp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
+		.pcs		= sdm845_qhp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1603,24 +1612,28 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sm8250_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
-	.serdes_tbl_sec		= sm8250_qmp_gen3x1_pcie_serdes_tbl,
-	.serdes_tbl_num_sec	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_serdes_tbl),
-	.tx_tbl			= sm8250_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_tx_tbl),
-	.rx_tbl			= sm8250_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_rx_tbl),
-	.rx_tbl_sec		= sm8250_qmp_gen3x1_pcie_rx_tbl,
-	.rx_tbl_num_sec		= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_rx_tbl),
-	.pcs_tbl		= sm8250_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_pcs_tbl),
-	.pcs_tbl_sec		= sm8250_qmp_gen3x1_pcie_pcs_tbl,
-	.pcs_tbl_num_sec		= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sm8250_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_misc_tbl),
-	.pcs_misc_tbl_sec		= sm8250_qmp_gen3x1_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num_sec	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sm8250_qmp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
+		.tx		= sm8250_qmp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8250_qmp_pcie_tx_tbl),
+		.rx		= sm8250_qmp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8250_qmp_pcie_rx_tbl),
+		.pcs		= sm8250_qmp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_tbl),
+		.pcs_misc	= sm8250_qmp_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_misc_tbl),
+	},
+	.tables_rc = &(const struct qmp_phy_cfg_tables) {
+		.serdes		= sm8250_qmp_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_serdes_tbl),
+		.rx		= sm8250_qmp_gen3x1_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_rx_tbl),
+		.pcs		= sm8250_qmp_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= sm8250_qmp_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1641,24 +1654,28 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sm8250_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
-	.tx_tbl			= sm8250_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_tx_tbl),
-	.tx_tbl_sec		= sm8250_qmp_gen3x2_pcie_tx_tbl,
-	.tx_tbl_num_sec		= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_tx_tbl),
-	.rx_tbl			= sm8250_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_rx_tbl),
-	.rx_tbl_sec		= sm8250_qmp_gen3x2_pcie_rx_tbl,
-	.rx_tbl_num_sec		= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_rx_tbl),
-	.pcs_tbl		= sm8250_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_pcs_tbl),
-	.pcs_tbl_sec		= sm8250_qmp_gen3x2_pcie_pcs_tbl,
-	.pcs_tbl_num_sec		= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sm8250_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_misc_tbl),
-	.pcs_misc_tbl_sec		= sm8250_qmp_gen3x2_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num_sec	= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sm8250_qmp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
+		.tx		= sm8250_qmp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8250_qmp_pcie_tx_tbl),
+		.rx		= sm8250_qmp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8250_qmp_pcie_rx_tbl),
+		.pcs		= sm8250_qmp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_tbl),
+		.pcs_misc	= sm8250_qmp_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_pcie_pcs_misc_tbl),
+	},
+	.tables_rc = &(const struct qmp_phy_cfg_tables) {
+		.tx		= sm8250_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_tx_tbl),
+		.rx		= sm8250_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_rx_tbl),
+		.pcs		= sm8250_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc	= sm8250_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1679,14 +1696,16 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= msm8998_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8998_pcie_serdes_tbl),
-	.tx_tbl			= msm8998_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8998_pcie_tx_tbl),
-	.rx_tbl			= msm8998_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8998_pcie_rx_tbl),
-	.pcs_tbl		= msm8998_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(msm8998_pcie_pcs_tbl),
+	.tables = {
+		.serdes		= msm8998_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(msm8998_pcie_serdes_tbl),
+		.tx		= msm8998_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(msm8998_pcie_tx_tbl),
+		.rx		= msm8998_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(msm8998_pcie_rx_tbl),
+		.pcs		= msm8998_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(msm8998_pcie_pcs_tbl),
+	},
 	.clk_list		= msm8996_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
@@ -1703,16 +1722,18 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
-	.tx_tbl			= sc8180x_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
-	.rx_tbl			= sc8180x_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_rx_tbl),
-	.pcs_tbl		= sc8180x_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sc8180x_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sc8180x_qmp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
+		.tx		= sc8180x_qmp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
+		.rx		= sc8180x_qmp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sc8180x_qmp_pcie_rx_tbl),
+		.pcs		= sc8180x_qmp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_tbl),
+		.pcs_misc	= sc8180x_qmp_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1732,16 +1753,18 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sdx55_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sdx55_qmp_pcie_serdes_tbl),
-	.tx_tbl			= sdx55_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdx55_qmp_pcie_tx_tbl),
-	.rx_tbl			= sdx55_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdx55_qmp_pcie_rx_tbl),
-	.pcs_tbl		= sdx55_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sdx55_qmp_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sdx55_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sdx55_qmp_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sdx55_qmp_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sdx55_qmp_pcie_serdes_tbl),
+		.tx		= sdx55_qmp_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sdx55_qmp_pcie_tx_tbl),
+		.rx		= sdx55_qmp_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sdx55_qmp_pcie_rx_tbl),
+		.pcs		= sdx55_qmp_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sdx55_qmp_pcie_pcs_tbl),
+		.pcs_misc	= sdx55_qmp_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sdx55_qmp_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1762,16 +1785,18 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= sm8450_qmp_gen3x1_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_serdes_tbl),
-	.tx_tbl			= sm8450_qmp_gen3x1_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_tx_tbl),
-	.rx_tbl			= sm8450_qmp_gen3x1_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rx_tbl),
-	.pcs_tbl		= sm8450_qmp_gen3x1_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sm8450_qmp_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_serdes_tbl),
+		.tx		= sm8450_qmp_gen3x1_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_tx_tbl),
+		.rx		= sm8450_qmp_gen3x1_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rx_tbl),
+		.pcs		= sm8450_qmp_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1792,16 +1817,18 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 	.lanes			= 2,
 
-	.serdes_tbl		= sm8450_qmp_gen4x2_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_serdes_tbl),
-	.tx_tbl			= sm8450_qmp_gen4x2_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_tx_tbl),
-	.rx_tbl			= sm8450_qmp_gen4x2_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_rx_tbl),
-	.pcs_tbl		= sm8450_qmp_gen4x2_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sm8450_qmp_gen4x2_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_pcs_misc_tbl),
+	.tables = {
+		.serdes		= sm8450_qmp_gen4x2_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_serdes_tbl),
+		.tx		= sm8450_qmp_gen4x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_tx_tbl),
+		.rx		= sm8450_qmp_gen4x2_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_rx_tbl),
+		.pcs		= sm8450_qmp_gen4x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_pcs_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_pcs_misc_tbl),
+	},
 	.clk_list		= sdm845_pciephy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
@@ -1850,17 +1877,49 @@ static void qmp_pcie_configure(void __iomem *base,
 	qmp_pcie_configure_lane(base, regs, tbl, num, 0xff);
 }
 
-static int qmp_pcie_serdes_init(struct qmp_phy *qphy)
+static void qmp_pcie_serdes_init(struct qmp_phy *qphy, const struct qmp_phy_cfg_tables *tables)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
-	int serdes_tbl_num = cfg->serdes_tbl_num;
 
-	qmp_pcie_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
-	qmp_pcie_configure(serdes, cfg->regs, cfg->serdes_tbl_sec, cfg->serdes_tbl_num_sec);
+	if (!tables)
+		return;
 
-	return 0;
+	qmp_pcie_configure(serdes, cfg->regs, tables->serdes, tables->serdes_num);
+}
+
+static void qmp_pcie_lanes_init(struct qmp_phy *qphy, const struct qmp_phy_cfg_tables *tables)
+{
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *tx = qphy->tx;
+	void __iomem *rx = qphy->rx;
+
+	if (!tables)
+		return;
+
+	qmp_pcie_configure_lane(tx, cfg->regs, tables->tx, tables->tx_num, 1);
+
+	if (cfg->lanes >= 2)
+		qmp_pcie_configure_lane(qphy->tx2, cfg->regs, tables->tx, tables->tx_num, 2);
+
+	qmp_pcie_configure_lane(rx, cfg->regs, tables->rx, tables->rx_num, 1);
+	if (cfg->lanes >= 2)
+		qmp_pcie_configure_lane(qphy->rx2, cfg->regs, tables->rx, tables->rx_num, 2);
+}
+
+static void qmp_pcie_pcs_init(struct qmp_phy *qphy, const struct qmp_phy_cfg_tables *tables)
+{
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *pcs = qphy->pcs;
+	void __iomem *pcs_misc = qphy->pcs_misc;
+
+	if (!tables)
+		return;
+
+	qmp_pcie_configure(pcs, cfg->regs,
+			   tables->pcs, tables->pcs_num);
+	qmp_pcie_configure(pcs_misc, cfg->regs,
+			   tables->pcs_misc, tables->pcs_misc_num);
 }
 
 static int qmp_pcie_init(struct phy *phy)
@@ -1932,15 +1991,13 @@ static int qmp_pcie_power_on(struct phy *phy)
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *tx = qphy->tx;
-	void __iomem *rx = qphy->rx;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
 	void __iomem *status;
 	unsigned int mask, val, ready;
 	int ret;
 
-	qmp_pcie_serdes_init(qphy);
+	qmp_pcie_serdes_init(qphy, &cfg->tables);
+	qmp_pcie_serdes_init(qphy, cfg->tables_rc);
 
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
@@ -1949,31 +2006,11 @@ static int qmp_pcie_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_pcie_configure_lane(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_pcie_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec, cfg->tx_tbl_num_sec, 1);
-
-	if (cfg->lanes >= 2) {
-		qmp_pcie_configure_lane(qphy->tx2, cfg->regs, cfg->tx_tbl,
-					cfg->tx_tbl_num, 2);
-		qmp_pcie_configure_lane(qphy->tx2, cfg->regs, cfg->tx_tbl_sec,
-					cfg->tx_tbl_num_sec, 2);
-	}
-
-	qmp_pcie_configure_lane(rx, cfg->regs, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_pcie_configure_lane(rx, cfg->regs, cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
-
-	if (cfg->lanes >= 2) {
-		qmp_pcie_configure_lane(qphy->rx2, cfg->regs, cfg->rx_tbl,
-					cfg->rx_tbl_num, 2);
-		qmp_pcie_configure_lane(qphy->rx2, cfg->regs, cfg->rx_tbl_sec,
-					cfg->rx_tbl_num_sec, 2);
-	}
-
-	qmp_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-	qmp_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl_sec, cfg->pcs_tbl_num_sec);
+	qmp_pcie_lanes_init(qphy, &cfg->tables);
+	qmp_pcie_lanes_init(qphy, cfg->tables_rc);
 
-	qmp_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
-	qmp_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec, cfg->pcs_misc_tbl_num_sec);
+	qmp_pcie_pcs_init(qphy, &cfg->tables);
+	qmp_pcie_pcs_init(qphy, cfg->tables_rc);
 
 	/*
 	 * Pull out PHY from POWER DOWN state.
@@ -2240,7 +2277,8 @@ static int qmp_pcie_create(struct device *dev, struct device_node *np, int id,
 		qphy->pcs_misc = qphy->pcs + 0x400;
 
 	if (IS_ERR(qphy->pcs_misc)) {
-		if (cfg->pcs_misc_tbl || cfg->pcs_misc_tbl_sec)
+		if (cfg->tables.pcs_misc ||
+		    (cfg->tables_rc && cfg->tables_rc->pcs_misc))
 			return PTR_ERR(qphy->pcs_misc);
 	}
 
-- 
2.35.1

