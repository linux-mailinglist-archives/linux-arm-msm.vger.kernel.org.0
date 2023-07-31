Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550C67693DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjGaK6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjGaK6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDB71997
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe0c566788so6988969e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801083; x=1691405883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRDB6y7BOiVI1Vr/oVyT96U0NLtYbPnf2p0lWekO/No=;
        b=WIP4m6bb5gPcLIV0aCyq10N3LTVSdgiJ7o/MjomfbI/RxdiIxVRqJ2SsQ5LfAOD7vx
         h+6mbWi4X6jh8VwqycEy+Ajl4Re/WQ0SwRpzL3oX6+ZuB9NuqbqzLEt37+AW3pj8ItfX
         tILuVzewAXEsosRuyY5LKdVKi9PRihf9sr2CBj1hKWwxVVeRNoxxzzcFjattI0bQEgdC
         hy3NALm3hAj0UFKktgjcVEH5UcjhJ35p4Gmuz2lLnbIkDNlSdRKf1UelQ862Ua3yLEdd
         FLLdT1jH4uz26qN2TF29GrmBYMhzZPIBEsv0or50cd4Rq3LUic2o/URN/IMkoHCutAve
         vU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801083; x=1691405883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRDB6y7BOiVI1Vr/oVyT96U0NLtYbPnf2p0lWekO/No=;
        b=SqT9I0f/3Wua6CclExWq9PGGPQ9P8HxWH2tApR2FdYKvBOYkXXiSmKkk3g4hR+XVWQ
         dIG7ED6xgnpz/R76YAxz0IamK2vr7XG0zh4Ode/259sJ4EywwGJCc04P3YGGIzl/wLeW
         n8ZoQ4mF5iux2hKdxnsZryYUdCTyVMyTj1qDevbVN02Cu6wEGMpto1UWA3zTn7DppiIW
         7hrL16+FbDqSsHKjvLaEQgj2ZFzlIuoMIu51Hlxs3enfKhps/2m3ozN/aVKyqT9nT8Tu
         VL5ujYpBQqrxJfb29fzb/VO5x3uLO1LhpRS1HfXU+ZgVG+i+4NbsqBzNthDidghwdu1A
         uA7w==
X-Gm-Message-State: ABy/qLZ89zTjJq3pPAASvwOngIy/IAUrGEDOhYIu50s2nCp0Jt9YLdZA
        qGr2eVKu6n4jdF7ty2EgohYpIQ==
X-Google-Smtp-Source: APBJJlHbSIL4cwbiyzPPcCK0HAhip6BS1jeEFTN/e9eMy7sLisNPLEbn3snuYLVwtogM9VUf2Nolfg==
X-Received: by 2002:ac2:5b1d:0:b0:4fd:d1df:9bda with SMTP id v29-20020ac25b1d000000b004fdd1df9bdamr5309658lfn.42.1690801083340;
        Mon, 31 Jul 2023 03:58:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.02
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
Subject: [PATCH v2 03/13] phy: qcom-qmp-pcie: populate offsets configuration
Date:   Mon, 31 Jul 2023 13:57:49 +0300
Message-Id: <20230731105759.3997549-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate offsets configuration for the rest of UFS PHYs to make it
possible to switch them to the new (single-node) bindings style.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index f3717cb4a0e1..f304a2c4a5c2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2294,6 +2294,56 @@ static const char * const sdm845_pciephy_reset_l[] = {
 	"phy",
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_qhp = {
+	.serdes		= 0,
+	.pcs		= 0x1800,
+	.tx		= 0x0800,
+	/* no .rx for QHP */
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v2 = {
+	.serdes		= 0,
+	.pcs		= 0x0800,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v3 = {
+	.serdes		= 0,
+	.pcs		= 0x0800,
+	.pcs_misc	= 0x0600,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x1 = {
+	.serdes		= 0,
+	.pcs		= 0x0800,
+	.pcs_misc	= 0x0c00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x2 = {
+	.serdes		= 0,
+	.pcs		= 0x0a00,
+	.pcs_misc	= 0x0e00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+	.tx2		= 0x0600,
+	.rx2		= 0x0800,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v4_20 = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1200,
+	.pcs_misc	= 0x1600,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.serdes		= 0,
 	.pcs		= 0x0200,
@@ -2304,6 +2354,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.rx2		= 0x1800,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1200,
+	.pcs_misc	= 0x1400,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_20 = {
 	.serdes		= 0x1000,
 	.pcs		= 0x1200,
@@ -2339,6 +2399,8 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v2,
+
 	.tbls = {
 		.serdes		= ipq8074_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(ipq8074_pcie_serdes_tbl),
@@ -2362,6 +2424,8 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
 	.tbls = {
 		.serdes		= ipq8074_pcie_gen3_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(ipq8074_pcie_gen3_serdes_tbl),
@@ -2389,6 +2453,8 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
 static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
 	.tbls = {
 		.serdes		= ipq6018_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(ipq6018_pcie_serdes_tbl),
@@ -2414,6 +2480,8 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v3,
+
 	.tbls = {
 		.serdes		= sdm845_qmp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sdm845_qmp_pcie_serdes_tbl),
@@ -2439,6 +2507,8 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_qhp,
+
 	.tbls = {
 		.serdes		= sdm845_qhp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
@@ -2460,6 +2530,8 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
 	.tbls = {
 		.serdes		= sm8250_qmp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
@@ -2495,6 +2567,8 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_pcie_offsets_v4x2,
+
 	.tbls = {
 		.serdes		= sm8250_qmp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
@@ -2530,6 +2604,8 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v3,
+
 	.tbls = {
 		.serdes		= msm8998_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(msm8998_pcie_serdes_tbl),
@@ -2555,6 +2631,8 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_pcie_offsets_v4x2,
+
 	.tbls = {
 		.serdes		= sc8180x_qmp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
@@ -2682,6 +2760,8 @@ static const struct qmp_phy_cfg sc8280xp_qmp_gen3x4_pciephy_cfg = {
 static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_pcie_offsets_v4_20,
+
 	.tbls = {
 		.serdes		= sdx55_qmp_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sdx55_qmp_pcie_serdes_tbl),
@@ -2819,6 +2899,8 @@ static const struct qmp_phy_cfg sdx65_qmp_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_pcie_offsets_v5,
+
 	.tbls = {
 		.serdes		= sm8450_qmp_gen3_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen3_pcie_serdes_tbl),
@@ -2852,6 +2934,8 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_pcie_offsets_v5_20,
+
 	.tbls = {
 		.serdes		= sm8450_qmp_gen4x2_pcie_serdes_tbl,
 		.serdes_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_serdes_tbl),
-- 
2.39.2

