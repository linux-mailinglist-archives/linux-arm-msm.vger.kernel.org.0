Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D386A72BCB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjFLJc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbjFLJa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:30:58 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376634EC8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:58 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso29602505e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561896; x=1689153896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daR94dVplG+ZI9i0IDfMIEFWnwE1eSwGkl16IK6pqwI=;
        b=uoRxZiUPtxnfmNryRY5Rnwq1ha8eB/FcnBi2lahhDqg941OiFCwgMJdV5vgRId9uq4
         /TyZwSbQWan6lMJfE7LV4PJs/RmG9lUGpm9CQl3UDwa8I4V9rGcvZR3ICmwfe7UURu5C
         Bqb5yljGhjDVR0x36RuIYypr9JevX+iHfhUG4LIEvPPOyNEbG48oRl4XsmphWMAb7iLy
         +Zn0VrCahCaKLP0tPf4sEfrnJNcHkyEIPP2IZw7fTxGKacoGuzEulIEIATBzR26s9AuA
         Rw6qAUeAkGBlwewnJvAEzhUnUvU32AjdHyn9AZpXKWcMh65K+O05T+95QC/Kof8VMOzR
         cG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561896; x=1689153896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daR94dVplG+ZI9i0IDfMIEFWnwE1eSwGkl16IK6pqwI=;
        b=Ewp0UbAO3Y7wCFB7IN64LDAXGVhrRyBZHt3Jq+IKzpAgLCLBwc4Pyl5uI666GaxxVU
         IngwrFxiqX29T5+hwHYEgWdScYcSCZCYSf/xY1kcGwfpaVTPf6gzPJtC4sdeXy3ntlz7
         aQ18OmyajEEt2B09XRl+eF1KMTD5JRjuoST3WAeXOOg64v/XAYrtF/HkvdEdhtdFM6Sw
         YkInoWkSnAAdyFK/WNFhkXkXmqJod0xjuPnxr6l8JmmysTj+EIJ1B4bpBMwvDst6CMw7
         rKrWoxqxyD+Q4kAU26ucW4wGj3JDrAGSjvHAkRPl2lx/ek79EUOfFCPIZwb2ympYkeIs
         J7ww==
X-Gm-Message-State: AC+VfDyeFRSdUc8basCwks92d8rK2O7QGxmnVZCjTVW7mQBCB9pfjv4Q
        JGRb85YGutYtgkSwGz8iVG2uAQ==
X-Google-Smtp-Source: ACHHUZ4cn5tCD9DUU4uEafGOaguGceHqrEtxN9LZgaLUZ8+0eUk7TqL8Z4NXEU23GZsCCJkFLtDV6Q==
X-Received: by 2002:a05:600c:224d:b0:3f8:1110:60c2 with SMTP id a13-20020a05600c224d00b003f8111060c2mr4009580wmm.33.1686561896419;
        Mon, 12 Jun 2023 02:24:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 21/26] net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms
Date:   Mon, 12 Jun 2023 11:23:50 +0200
Message-Id: <20230612092355.87937-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

sa8775p uses EMAC version 4, add the relevant defines, rename the
has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
and add the new compatible.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 64 +++++++++++++++----
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 247e3888cca0..047c569e5480 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -89,7 +89,8 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
-	bool has_emac3;
+	bool has_emac_ge_3;
+	bool has_integrated_pcs;
 	struct dwmac4_addrs dwmac4_addrs;
 };
 
@@ -109,7 +110,7 @@ struct qcom_ethqos {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
-	bool has_emac3;
+	bool has_emac_ge_3;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -203,7 +204,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.por = emac_v2_3_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
-	.has_emac3 = false,
+	.has_emac_ge_3 = false,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -219,7 +220,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.por = emac_v2_1_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
-	.has_emac3 = false,
+	.has_emac_ge_3 = false,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -235,7 +236,40 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.por = emac_v3_0_0_por,
 	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
-	.has_emac3 = true,
+	.has_emac_ge_3 = true,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
+static const struct ethqos_emac_por emac_v4_0_0_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x80040800 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
+	.por = emac_v4_0_0_por,
+	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_config_loopback_en = false,
+	.has_emac_ge_3 = true,
+	.has_integrated_pcs = true,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
 		.dma_chan_offset = 0x1000,
@@ -276,7 +310,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
 		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac3) {
+	if (!ethqos->has_emac_ge_3) {
 		rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      0, SDCC_HC_REG_DLL_CONFIG);
 
@@ -317,7 +351,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_DLL_CONFIG2_DDR_CAL_EN, SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac3) {
+	if (!ethqos->has_emac_ge_3) {
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      0, SDCC_HC_REG_DLL_CONFIG2);
 
@@ -387,7 +421,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
 		 */
-		if (ethqos->has_emac3) {
+		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
 				      115, SDCC_HC_REG_DDR_CONFIG);
@@ -422,7 +456,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
 
-		if (ethqos->has_emac3)
+		if (ethqos->has_emac_ge_3)
 			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
@@ -462,7 +496,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->has_emac3)
+		if (ethqos->has_emac_ge_3)
 			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
@@ -512,7 +546,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac3) {
+	if (ethqos->has_emac_ge_3) {
 		if (ethqos->speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -542,7 +576,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac3)
+		if (!ethqos->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -729,7 +763,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac3 = data->has_emac3;
+	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 
 	ethqos->rgmii_clk = devm_clk_get_optional(dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
@@ -769,12 +803,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->has_gmac4 = 1;
-	if (ethqos->has_emac3)
+	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->rx_clk_runs_in_lpi = 1;
+	plat_dat->has_integrated_pcs = data->has_integrated_pcs;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -795,6 +830,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
-- 
2.39.2

