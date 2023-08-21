Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD467820D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjHUAZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjHUAZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:43 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3A8A3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:41 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so43216971fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577539; x=1693182339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U70UpewjmCnbT8KiMd545bdbi+bVcnHm968V6y9dNR4=;
        b=WqwDzXa07cH2P+gEggPIEpMGcP3UlKHrMQFaJx0JeIgnttfK2e+aBwnRpGCbiPNnns
         dsXUe8Tspv34TKvAK0BjMuMNmkCja6GnYcX1Kf2OUrG9DA+vEwiHdsmZeSR7AFCr4UEW
         5xJaQM9GIwPwEpSdeKE+l/JrzpIi3JAzaUwJasauKn5kbLicj5AVuRxnHIqeuYHJymSY
         aBbLcaVqdE6ba2Ffs7pWFWlQMfN/C8vfYivymR8jKKrVupplSurNOrnkIQHc39nEVGTq
         aBoo27GicCm3OT0j28EYW9CQZarWYAMm6lsodw6IONH5KAi26/Gtatgx6ZiGVJnDrQ7x
         pi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577539; x=1693182339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U70UpewjmCnbT8KiMd545bdbi+bVcnHm968V6y9dNR4=;
        b=dy9ozBAuv3CkfanF0Qa2a2b7UbX5ichjxveTHYQtsO8X8NuTruSLOnC7WaYyhB0VLa
         JH7MPd78MFPFKyUOZuX11RNO1k+LfC3aARcYq6rnaGdexzzyUTUci8hrGeloXdjLUiFf
         Fwa/o+1aU5gI3vM+1eeAn5jg6iwaW+mEvE0FCdvOiBRezbWK/29+h0ApRkauLMkzkvNq
         O5Qi+NyyMswLWUzqMMq3u2aAnRB2k46GnV2aXetDF0g8V2xkBuqxQeZXB/WcFFN2VLZD
         ElFYegpjpDXSEDs4bQVpbKU739JxsJQU7aCRXVar7WLNet02ShMOOBtyMFb+S3wsp4Kq
         X30Q==
X-Gm-Message-State: AOJu0YyGsCaMcFoSuTuRmsNDixtfaj5b37rQMwueHpDeZYbVm9W3T6ae
        i0RvmxRHeOG3qG/42VTZxcNWwA==
X-Google-Smtp-Source: AGHT+IHVA5ajitOI0oYDQY20lJuAVFU4M5LIvPwbaXzAhx5YSK8J0MwyKCyyvxYD4jBaAmGtz5J9RA==
X-Received: by 2002:a2e:7d01:0:b0:2b9:ee3e:2412 with SMTP id y1-20020a2e7d01000000b002b9ee3e2412mr4203514ljc.22.1692577539384;
        Sun, 20 Aug 2023 17:25:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:38 -0700 (PDT)
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
Subject: [PATCH v2 03/16] phy: qcom-qmp-usb: rework reset handling
Date:   Mon, 21 Aug 2023 03:25:22 +0300
Message-Id: <20230821002535.585660-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
References: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All legacy bindings of USB PHYs use "phy", "common" resets, while newer
style bindings use "phy", "phy_phy" resets. In preparation for
converting existing legacy PHY bindings to use newer scheme, drop reset
lists from configuration struture and reference reset lists directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 71 +++++++++----------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 626cf4bf396b..8f43de20fb8c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1172,9 +1172,6 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_usb_tbl;
 	int pcs_usb_tbl_num;
 
-	/* resets to be requested */
-	const char * const *reset_list;
-	int num_resets;
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -1206,6 +1203,7 @@ struct qmp_usb {
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -1246,11 +1244,11 @@ static const char * const qmp_usb_phy_clk_l[] = {
 };
 
 /* list of resets */
-static const char * const msm8996_usb3phy_reset_l[] = {
+static const char * const usb3phy_legacy_reset_l[] = {
 	"phy", "common",
 };
 
-static const char * const qcm2290_usb3phy_reset_l[] = {
+static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
@@ -1296,8 +1294,6 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(ipq8074_usb3_rx_tbl),
 	.pcs_tbl		= ipq8074_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_usb3_pcs_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout,
@@ -1316,8 +1312,6 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(ipq9574_usb3_rx_tbl),
 	.pcs_tbl		= ipq9574_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(ipq9574_usb3_pcs_tbl),
-	.reset_list		= qcm2290_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout,
@@ -1334,8 +1328,6 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(msm8996_usb3_rx_tbl),
 	.pcs_tbl		= msm8996_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(msm8996_usb3_pcs_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v2_usb3phy_regs_layout,
@@ -1354,8 +1346,6 @@ static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
 	.pcs_tbl		= sa8775p_usb3_uniphy_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_tbl),
-	.reset_list		= qcm2290_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v5_usb3phy_regs_layout,
@@ -1374,8 +1364,6 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
 	.pcs_tbl		= sc8280xp_usb3_uniphy_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_pcs_tbl),
-	.reset_list		= qcm2290_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v5_usb3phy_regs_layout,
@@ -1392,8 +1380,6 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_uniphy_rx_tbl),
 	.pcs_tbl		= qmp_v3_usb3_uniphy_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_uniphy_pcs_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout,
@@ -1412,8 +1398,6 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.reset_list             = msm8996_usb3phy_reset_l,
-	.num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list              = qmp_phy_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -1432,8 +1416,6 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_pcs_tbl),
 	.pcs_usb_tbl		= sm8150_usb3_uniphy_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8150_usb3_uniphy_pcs_usb_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v4_usb3phy_regs_layout,
@@ -1455,8 +1437,6 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
 	.pcs_usb_tbl		= sm8250_usb3_uniphy_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_usb_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v4_usb3phy_regs_layout,
@@ -1478,8 +1458,6 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
 	.pcs_usb_tbl		= sm8250_usb3_uniphy_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_usb_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v4_usb3phy_regs_layout,
@@ -1501,8 +1479,6 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
 	.pcs_usb_tbl		= sm8350_usb3_uniphy_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_usb_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v5_usb3phy_regs_layout,
@@ -1524,8 +1500,6 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
 	.pcs_usb_tbl		= sm8350_usb3_uniphy_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_usb_tbl),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v5_usb3phy_regs_layout,
@@ -1547,8 +1521,6 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.reset_list		= qcm2290_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(qcm2290_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout,
@@ -1605,13 +1577,13 @@ static int qmp_usb_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset assert failed\n");
 		goto err_disable_regulators;
 	}
 
-	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset deassert failed\n");
 		goto err_disable_regulators;
@@ -1626,7 +1598,7 @@ static int qmp_usb_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -1638,7 +1610,7 @@ static int qmp_usb_exit(struct phy *phy)
 	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
@@ -1880,22 +1852,25 @@ static int qmp_usb_vreg_init(struct qmp_usb *qmp)
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qmp_usb_reset_init(struct qmp_usb *qmp)
+static int qmp_usb_reset_init(struct qmp_usb *qmp,
+			      const char *const *reset_list,
+			      int num_resets)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
 	int i;
 	int ret;
 
-	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
+	qmp->resets = devm_kcalloc(dev, num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < cfg->num_resets; i++)
-		qmp->resets[i].id = cfg->reset_list[i];
+	for (i = 0; i < num_resets; i++)
+		qmp->resets[i].id = reset_list[i];
+
+	qmp->num_resets = num_resets;
 
-	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
@@ -2064,6 +2039,11 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 
 	qmp->num_clks = ret;
 
+	ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
+				 ARRAY_SIZE(usb3phy_legacy_reset_l));
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -2105,6 +2085,11 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 				     "failed to get pipe clock\n");
 	}
 
+	ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
+				 ARRAY_SIZE(usb3phy_reset_l));
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -2126,10 +2111,6 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	if (!qmp->cfg)
 		return -EINVAL;
 
-	ret = qmp_usb_reset_init(qmp);
-	if (ret)
-		return ret;
-
 	ret = qmp_usb_vreg_init(qmp);
 	if (ret)
 		return ret;
-- 
2.39.2

