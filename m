Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC6B612576
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiJ2VNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJ2VNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:13:21 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB67C3D59B
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bn35so12423307ljb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vhyAiPSD4uUFaHRKAFy1tnHJMbYbW3+WHWNHgLxmNA=;
        b=sP7v5u2PyF1Kc8RODp8A1+7sIUYqokHnvUOQq6E0Wzf6DilMO/YIB4O1V5qIgxjdJ/
         /Lb2r90ZDZSFYG5p5YyF18xWNM+QFdneyA5UiROsstpTnDzKAbgYuY18VtXMH2DjPWrJ
         KsnN5mAeU/EfOi66YG6JwzdCUeWmOQNz2JIc5BwqbTuLjC561OJ3KBt0VlDD3Ga4To7X
         xeinFx1UhAwMEBY4dXtpzynlGqJwFhqPbwvBn3HJrWcRNGCglDczom6SnSN1V0qYG0fC
         quR92366fAdAmvlgVN8bYaihfl92ibt0GpHANygFDGYeBXrOIP/tIthC6aurgIvbo/cL
         e4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vhyAiPSD4uUFaHRKAFy1tnHJMbYbW3+WHWNHgLxmNA=;
        b=0f8W0gwyyd4ts8RWM8FNqt9v3+FwmxY3jbS64icRGyu3fV1fJzQJrRYj2xFeOSzOR1
         pilCNzQtQHwgrdjJ+H2KYs3diboR1t9KLVmaN1IgeDdr1eLq37HdDEAQkeLVkU4p7a+V
         3qUhx8o6zOAGJG7ZimxyKcF0a0CULRuo/Cl7Hmw9oSShDcosYJikL2j9Dtt6hNoueJLa
         ObI2C18eWJuYjeOP15Lu3PvkDAmNTZxVlEQ6h7OXs5ZR9lgwWIQVpb1HdVuOiLgtAawx
         Rixijxl+z08hozKNUE3yjhsWzHH2f00ckzJVIA9+jhgSC4sg4j8ZIh2JjzoNilV3gCLX
         EBVw==
X-Gm-Message-State: ACrzQf2piIllp0sPgRDdwry+aHyZTJNW8WaOKhwCHuMLgYYFf1w3Uns/
        3WcC9X5/Px0qf/9+T6oeGdsTSQ==
X-Google-Smtp-Source: AMsMyM51jSFnXN3E/y7WByCD1hJDTjyjoM70pWw1HfFsNaxkCaMpwqG8zno67LsU2nYiFPWCgNsMWw==
X-Received: by 2002:a2e:a9a9:0:b0:26c:6ec5:290 with SMTP id x41-20020a2ea9a9000000b0026c6ec50290mr2129320ljq.186.1667077999517;
        Sat, 29 Oct 2022 14:13:19 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b004a480c8f770sm433508lfe.210.2022.10.29.14.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 14:13:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 5/7] phy: qcom-qmp-pcie: add support for sm8350 platform
Date:   Sun, 30 Oct 2022 00:13:10 +0300
Message-Id: <20221029211312.929862-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
References: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for a single-lane and two-lane PCIe PHYs found on Qualcomm
SM8350 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 120 ++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 11be1e31c1e0..b32b72c293a5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1312,6 +1312,40 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen3x1_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x1_pcie_rc_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf0),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_TX_PI_QEC_CTRL, 0x02, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_TX_PI_QEC_CTRL, 0x04, 2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_qmp_gen3x2_pcie_rc_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_EQ_CONFIG2, 0x0f),
+};
+
 static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
@@ -2015,6 +2049,80 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tables = {
+		.serdes		= sm8450_qmp_gen3_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_serdes_tbl),
+		.tx		= sm8350_qmp_gen3x1_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_tx_tbl),
+		.rx		= sm8450_qmp_gen3_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3_pcie_rx_tbl),
+		.pcs		= sm8450_qmp_gen3_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_pcs_tbl),
+		.pcs_misc	= sm8450_qmp_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_pcs_misc_tbl),
+	},
+
+	.tables_rc = &(const struct qmp_phy_cfg_tables) {
+		.serdes		= sm8450_qmp_gen3x1_pcie_rc_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rc_serdes_tbl),
+		.rx		= sm8350_qmp_gen3x1_pcie_rc_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_rx_tbl),
+	},
+
+	.clk_list		= sc8280xp_pciephy_clk_l,
+	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8250_pcie_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
+static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tables = {
+		.serdes		= sm8450_qmp_gen3_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_serdes_tbl),
+		.tx		= sm8350_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_tx_tbl),
+		.rx		= sm8450_qmp_gen3_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3_pcie_rx_tbl),
+		.pcs		= sm8450_qmp_gen3_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_pcs_tbl),
+		.pcs_misc	= sc8280xp_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sc8280xp_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+
+	.tables_rc = &(const struct qmp_phy_cfg_tables) {
+		.rx		= sm8350_qmp_gen3x2_pcie_rc_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_rx_tbl),
+		.pcs		= sm8350_qmp_gen3x2_pcie_rc_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_pcs_tbl),
+	},
+
+	.clk_list		= sc8280xp_pciephy_clk_l,
+	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8250_pcie_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -2611,7 +2719,11 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 	qmp->pipe_clks[0].id = "pipe";
 	qmp->pipe_clks[1].id = "pipediv2";
 
-	ret = devm_clk_bulk_get(dev, qmp->num_pipe_clks, qmp->pipe_clks);
+	ret = devm_clk_bulk_get(dev, 1, qmp->pipe_clks);
+	if (ret)
+		return ret;
+
+	ret = devm_clk_bulk_get_optional(dev, qmp->num_pipe_clks - 1, qmp->pipe_clks + 1);
 	if (ret)
 		return ret;
 
@@ -2731,6 +2843,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-modem-pcie-phy",
 		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-gen3x1-pcie-phy",
+		.data = &sm8350_qmp_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-gen3x2-pcie-phy",
+		.data = &sm8350_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy",
 		.data = &sm8450_qmp_gen3x1_pciephy_cfg,
-- 
2.35.1

