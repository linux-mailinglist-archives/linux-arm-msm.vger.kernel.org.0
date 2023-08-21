Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367367820D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjHUAZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjHUAZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:45 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DAEAA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:43 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b703a0453fso47856611fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577542; x=1693182342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeyhlBcYF6kNyxOOHtFnOfb9CYrap2bu/TWYuUuCiA8=;
        b=noPH68PhoAP11M2uoW/s9Li/Fv0D7+kTLM0YY1kv5oNdmbqVEIF2GZAq4qv0pLWLsT
         dhY9j7D35ourJz6t6giLmlCAcBu0700jOK6j/e97n1+9MYdcrhvMvAq5aHtC6uwxu62d
         qYEPdmFNjJPNFXR/3+dycnD0djrSPsikeA48UzV+VF/aNBcffNRTScyOl5fpJcJ2fsoQ
         FFd7hK5k7AUP+e0joHzRVE0W30bld6s795ZN7wXjN3Yp8Z/T9XzZnaXexVrd1pVNC1qZ
         9CF3mzlzuxS6ZqTNYz0KDOeO9uCgM5gdAyImuuCvx1LMcsE0YllXzgjjwSqPPh2ZruyZ
         Q/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577542; x=1693182342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeyhlBcYF6kNyxOOHtFnOfb9CYrap2bu/TWYuUuCiA8=;
        b=F8hGGS53+O+S/p5PMmHvr6lv2C7eA4t57wGCOYiZG6Ds633o9a/63NurgscIxpOvXs
         Rja2qlP5J0CVRgxDG+eiwezICPPo1PiQ4BFNWYEbwnjTlUuDCD3yyi9HRQENg9Re1qmO
         pudH2eeBCfeC+5VuY+gLFPHplhsU9Gy+2Rehu8QRuZYSKBqnGT4NpQ3dt85UH37/clUl
         VaTu/QQt1PxOBcmthEGnwy02GDwDJPRalaBaeQyT4NG1Ff1eOAbrgPFi70wZybhZ42UL
         IMwxV/03v9mDs/LOqjbD3d8b//9qlWNU4pDM6pkiiWlbOvXAnS6bSEXs4leuw7FJhAeq
         Cp1g==
X-Gm-Message-State: AOJu0Yyat8Fk8OG+7HjxkcaU3mU+lOZVULl5+I1KEGohO1J6uoQPq7+f
        MDhcNzFhRkYzkzLDEUDrmLpDTA==
X-Google-Smtp-Source: AGHT+IHg6Zt9h4F5UhUCd1cOSxojRqd3DTW+Pc9tnEdz29x0o5lZdxvLCfFvCH6l/wQ9IgLf1i16ZQ==
X-Received: by 2002:a2e:9e09:0:b0:2b6:dac0:affe with SMTP id e9-20020a2e9e09000000b002b6dac0affemr3876779ljk.31.1692577541973;
        Sun, 20 Aug 2023 17:25:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:41 -0700 (PDT)
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
Subject: [PATCH v2 06/16] phy: qcom-qmp-usb: populate offsets configuration
Date:   Mon, 21 Aug 2023 03:25:25 +0300
Message-Id: <20230821002535.585660-7-dmitry.baryshkov@linaro.org>
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

Populate offsets configuration for the rest of USB PHYs to make it
possible to switch them to the new (single-node) bindings style.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 41 +++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 42a1a3f00759..2a094f2345f0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1280,6 +1280,13 @@ static const struct qmp_usb_offsets qmp_usb_offsets_ipq9574 = {
 
 static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
 	.serdes		= 0,
+	.pcs		= 0x600,
+	.tx		= 0x200,
+	.rx		= 0x400,
+};
+
+static const struct qmp_usb_offsets qmp_usb_offsets_v3_qcm2290 = {
+	.serdes		= 0x0,
 	.pcs		= 0xc00,
 	.pcs_misc	= 0xa00,
 	.tx		= 0x200,
@@ -1288,6 +1295,14 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
 	.rx2		= 0x800,
 };
 
+static const struct qmp_usb_offsets qmp_usb_offsets_v4 = {
+	.serdes		= 0,
+	.pcs		= 0x0800,
+	.pcs_usb	= 0x0e00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
 static const struct qmp_usb_offsets qmp_usb_offsets_v5 = {
 	.serdes		= 0,
 	.pcs		= 0x0200,
@@ -1299,6 +1314,8 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v5 = {
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= ipq8074_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_usb3_serdes_tbl),
 	.tx_tbl			= msm8996_usb3_tx_tbl,
@@ -1333,6 +1350,8 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= msm8996_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(msm8996_usb3_serdes_tbl),
 	.tx_tbl			= msm8996_usb3_tx_tbl,
@@ -1385,6 +1404,8 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_uniphy_tx_tbl,
@@ -1403,6 +1424,8 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_qcm2290,
+
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
 	.tx_tbl                 = msm8998_usb3_tx_tbl,
@@ -1419,6 +1442,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_uniphy_tx_tbl,
@@ -1440,6 +1465,8 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_uniphy_tx_tbl,
@@ -1461,6 +1488,8 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sdx55_usb3_uniphy_tx_tbl,
@@ -1482,6 +1511,8 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v5,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sdx65_usb3_uniphy_tx_tbl,
@@ -1503,6 +1534,8 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v5,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8350_usb3_uniphy_tx_tbl,
@@ -1524,7 +1557,7 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.lanes			= 2,
 
-	.offsets		= &qmp_usb_offsets_v3,
+	.offsets		= &qmp_usb_offsets_v3_qcm2290,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -2078,8 +2111,10 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
-	qmp->pcs_misc = base + offs->pcs_misc;
-	qmp->pcs_usb = base + offs->pcs_usb;
+	if (offs->pcs_usb)
+		qmp->pcs_usb = base + offs->pcs_usb;
+	if (offs->pcs_misc)
+		qmp->pcs_misc = base + offs->pcs_misc;
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
 
-- 
2.39.2

