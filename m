Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B923787A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242820AbjHXVUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243648AbjHXVUD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA85D1BEB
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50078eba7afso397738e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911999; x=1693516799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeyhlBcYF6kNyxOOHtFnOfb9CYrap2bu/TWYuUuCiA8=;
        b=LIr+P2Qfud/QJoZPo5WWibefJc3ywVDYnMn6/WPQuItRiJdK5jLEVMmOFp8oUFtwcA
         pDPjjrWnuDFEPfaSR1UEl1HoREknYlVQqFv5+EstYlOiXqDevbtYuiDT2rzQlylRTKgd
         /OOCQWqulMYXuFTLCAjGWvj/mSQ3W601cez75LPjLMHzJs3Le7oc41Re692JiO3yyc+B
         2Seql30cEY92jK9XMIEXEjd8rbdNlCyThZVf6eb/9Y6vIBTNyhXWZTRIAbXmkm4vTk8T
         z0DkiB+dbSn3IKIbc1QClx+G2Xq3hNn5JAPLKRFcLwNYKxMqu87rRdwJnGSOTChU8nk7
         AinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911999; x=1693516799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeyhlBcYF6kNyxOOHtFnOfb9CYrap2bu/TWYuUuCiA8=;
        b=aOSv107jRmjXxpnQC8mbwMHRChnd78fCAfoJGWSHEBd78kMErTf+yjYk1fZ8Nb2f/e
         gpknFPk9pLaIlev0cF3Q8xVEUhul/L5sk04wliNSP0gNDrYkdcSFWTJykTjNEv7njvM2
         RHw+MpW8lWfUNtecLFRFWRs166XOgxdPpXNYpCepb42MHDr4gPO2PbVthDf60o6OEaMU
         pJ1TjZ08pn5JG3Q5aam5n2s4aou8AH0UnVSldlXoV9URgLsDGjza0GmFsqWXoRI/Oz7A
         TECxlyAl2Bf7+/J9BAwfIajPNRs1PNn/GSwpwMAN+XIXqUlRy5s8BU2vB2ThqSaAGxEL
         Arlw==
X-Gm-Message-State: AOJu0Yx6k+PkhlTVkZAb6gvI0TPfJ17+FgaOgZ7Q9YlIdJdGX6qCvVQt
        luXF6vTmoatSnuZS1juxS/cTGw==
X-Google-Smtp-Source: AGHT+IHZw9qQMogH4O1NpLODa4xg3NVisfCxkfeFsG4nZb7pI8xGMxKpmeC5k2th8AGz7xkyx+Rq3g==
X-Received: by 2002:a05:6512:3241:b0:4fd:f889:b9d2 with SMTP id c1-20020a056512324100b004fdf889b9d2mr10728157lfr.38.1692911999257;
        Thu, 24 Aug 2023 14:19:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:19:58 -0700 (PDT)
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
Subject: [PATCH v3 06/16] phy: qcom-qmp-usb: populate offsets configuration
Date:   Fri, 25 Aug 2023 00:19:42 +0300
Message-Id: <20230824211952.1397699-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
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

