Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39CB7693DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjGaK6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjGaK6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ED01984
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso2781997e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801082; x=1691405882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iOzgGH2Z8B6I/zlnJpsF/Ou/VJRzfCddX4sPCDSEWE=;
        b=ujilhpKWcyfFX27YDhIWeA8BkI9+uTFgbO2fPAHSKLFE/KsQ0EDCsD25ZaW//LAau3
         qkJOhFXJ8w35925tAG7pGIlZ4T+n2BuTqRWXDOsJZHDi88ufhL0ldOt0ZkVWg1YTj3Yl
         gAbsAhX6E5ZH9tNhmzi8ZHe1bF+YWJ5YRSUlxzjnvERhV/zvn2QyOxsEN59G9vnMtwlQ
         MMgoIroSwVfo4ZCZ+lCtTY8n6Pwe3hDlgrsnpfb0SHti/Oes8QlUd/kodrX7zf7hxQWC
         RHt2sxqlBiJ7c+VEv2+diZMpwl69nfNh77AlOYdIdn2ozKYR8/IMvDZPjxwoRg+rFTLA
         bClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801082; x=1691405882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iOzgGH2Z8B6I/zlnJpsF/Ou/VJRzfCddX4sPCDSEWE=;
        b=L3rWTgyDXz6Udv1egE1xOPHrz6TZw21lm+K1L4HVqwHF2PByghbt99RXXe7Ro/4hgJ
         G5hkBnrJicSdaDr+NL3ifWUaVql0Et5WNRI99VBTYVcZINcFlptPNLXzSnM+w3H63ccb
         RJ4jBJXt1ybzl7SPEhOnZdURXl5k8P7LTICJtvCjgPNW3l6Xr2eTD2FPjh45iw6aBXmg
         hthZm8Q7cXR/LJwFh623WUCWD7nzV/QBMUs8Jnx9/v7NRn/CUbq/TRzEVUzaGlNilMjl
         UVViYp05f1Tg3TVL/v3wOw38vqstisKkczY2Nz2xXN0/EnwfqyHJbQAew3HnZxosrBYY
         HzuQ==
X-Gm-Message-State: ABy/qLaH0qJyHFqQ5xaJakvvTBvCDwHCNDJ5BIlbtq/q2tLU9reVBo2g
        BhvkHb3qkwE8BiME/0FnRS1X0w==
X-Google-Smtp-Source: APBJJlHU26elipNbu+i4WdQLIJf04pbhm5j1rywqt4FjdiU9OFzfLzmNPcHI6wbBFCBVcE24qjqfRA==
X-Received: by 2002:ac2:5b05:0:b0:4fb:79b5:5512 with SMTP id v5-20020ac25b05000000b004fb79b55512mr5363038lfn.66.1690801082563;
        Mon, 31 Jul 2023 03:58:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 02/13] phy: qcom-qmp-pcie: simplify clock handling
Date:   Mon, 31 Jul 2023 13:57:48 +0300
Message-Id: <20230731105759.3997549-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some of existing PHYs for new binding we are going to change refgen
to more correct "rchng". Rather than introducing additional code
to handle legacy vs current bindings (and clock names), use
devm_clk_bulk_get_optional().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 78 +++---------------------
 1 file changed, 7 insertions(+), 71 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index e15ea113b2db..f3717cb4a0e1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2194,9 +2194,6 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *serdes_4ln_tbl;
 	int serdes_4ln_num;
 
-	/* clock ids to be requested */
-	const char * const *clk_list;
-	int num_clks;
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -2275,24 +2272,8 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 }
 
 /* list of clocks required by phy */
-static const char * const ipq8074_pciephy_clk_l[] = {
-	"aux", "cfg_ahb",
-};
-
-static const char * const msm8996_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref",
-};
-
-static const char * const sc8280xp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "rchng",
-};
-
-static const char * const sdm845_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen",
-};
-
-static const char * const sa8775p_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "rchng", "phy_aux",
+static const char * const qmp_pciephy_clk_l[] = {
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
 };
 
 /* list of regulators */
@@ -2368,8 +2349,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 		.pcs		= ipq8074_pcie_pcs_tbl,
 		.pcs_num	= ARRAY_SIZE(ipq8074_pcie_pcs_tbl),
 	},
-	.clk_list		= ipq8074_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
@@ -2395,8 +2374,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 		.pcs_misc	= ipq8074_pcie_gen3_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(ipq8074_pcie_gen3_pcs_misc_tbl),
 	},
-	.clk_list		= ipq8074_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
@@ -2424,8 +2401,6 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 		.pcs_misc	= ipq6018_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(ipq6018_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= ipq8074_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= NULL,
@@ -2451,8 +2426,6 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 		.pcs_misc	= sdm845_qmp_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sdm845_qmp_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2474,8 +2447,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 		.pcs		= sdm845_qhp_pcie_pcs_tbl,
 		.pcs_num	= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
 	},
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2511,8 +2482,6 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 		.pcs_misc	= sm8250_qmp_gen3x1_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_gen3x1_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2548,8 +2517,6 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 		.pcs_misc	= sm8250_qmp_gen3x2_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sm8250_qmp_gen3x2_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2573,8 +2540,6 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 		.pcs		= msm8998_pcie_pcs_tbl,
 		.pcs_num	= ARRAY_SIZE(msm8998_pcie_pcs_tbl),
 	},
-	.clk_list		= msm8996_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
 	.reset_list		= ipq8074_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2602,8 +2567,6 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 		.pcs_misc	= sc8180x_qmp_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2637,8 +2600,6 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x1_pciephy_cfg = {
 		.serdes_num	= ARRAY_SIZE(sc8280xp_qmp_gen3x1_pcie_rc_serdes_tbl),
 	},
 
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2672,8 +2633,6 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x2_pciephy_cfg = {
 		.serdes_num	= ARRAY_SIZE(sc8280xp_qmp_gen3x2_pcie_rc_serdes_tbl),
 	},
 
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2710,8 +2669,6 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x4_pciephy_cfg = {
 	.serdes_4ln_tbl		= sc8280xp_qmp_gen3x4_pcie_serdes_4ln_tbl,
 	.serdes_4ln_num		= ARRAY_SIZE(sc8280xp_qmp_gen3x4_pcie_serdes_4ln_tbl),
 
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2752,8 +2709,6 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_pcs_misc_tbl),
 	},
 
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2789,8 +2744,6 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x1_pciephy_cfg = {
 		.rx_num		= ARRAY_SIZE(sm8350_qmp_gen3x1_pcie_rc_rx_tbl),
 	},
 
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2826,8 +2779,6 @@ static const struct qmp_phy_cfg sm8350_qmp_gen3x2_pciephy_cfg = {
 		.pcs_num	= ARRAY_SIZE(sm8350_qmp_gen3x2_pcie_rc_pcs_tbl),
 	},
 
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2855,8 +2806,6 @@ static const struct qmp_phy_cfg sdx65_qmp_pciephy_cfg = {
 			.pcs_misc       = sdx65_qmp_pcie_pcs_misc_tbl,
 			.pcs_misc_num   = ARRAY_SIZE(sdx65_qmp_pcie_pcs_misc_tbl),
 		},
-	.clk_list               = sdm845_pciephy_clk_l,
-	.num_clks               = ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list             = sdm845_pciephy_reset_l,
 	.num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list              = qmp_phy_vreg_l,
@@ -2890,8 +2839,6 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 		.rx_num		= ARRAY_SIZE(sm8450_qmp_gen3x1_pcie_rc_rx_tbl),
 	},
 
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2932,8 +2879,6 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
 	},
 
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2961,8 +2906,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen3x2_pciephy_cfg = {
 		.pcs_misc	= sm8550_qmp_gen3x2_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_misc_tbl),
 	},
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2992,8 +2935,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
 		.ln_shrd		= sm8550_qmp_gen4x2_pcie_ln_shrd_tbl,
 		.ln_shrd_num		= ARRAY_SIZE(sm8550_qmp_gen4x2_pcie_ln_shrd_tbl),
 	},
-	.clk_list		= sc8280xp_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sc8280xp_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= sm8550_qmp_phy_vreg_l,
@@ -3029,8 +2970,6 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
-	.clk_list		= sa8775p_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sa8775p_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -3065,8 +3004,6 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
-	.clk_list		= sa8775p_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sa8775p_pciephy_clk_l),
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -3189,7 +3126,7 @@ static int qmp_pcie_init(struct phy *phy)
 		goto err_assert_reset;
 	}
 
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
 	if (ret)
 		goto err_assert_reset;
 
@@ -3210,7 +3147,7 @@ static int qmp_pcie_exit(struct phy *phy)
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -3393,9 +3330,8 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 
 static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
-	int num = cfg->num_clks;
+	int num = ARRAY_SIZE(qmp_pciephy_clk_l);
 	int i;
 
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
@@ -3403,9 +3339,9 @@ static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->clks[i].id = cfg->clk_list[i];
+		qmp->clks[i].id = qmp_pciephy_clk_l[i];
 
-	return devm_clk_bulk_get(dev, num, qmp->clks);
+	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
 static void phy_clk_release_provider(void *res)
-- 
2.39.2

