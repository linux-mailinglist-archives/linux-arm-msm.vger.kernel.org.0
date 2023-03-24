Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83EFB6C759B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjCXCZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjCXCZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8AB29E21
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so428030lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S94NWGaE+iPkXn59EQLiJgTmgkNI5tBtSDez2BWq9M=;
        b=HS1asvM7t7iGIn78euvsmFcjDitxpXCS6t0FTvHOJwogi+NWlKQy34O/xlTrsWxTup
         FWlwihbVPpGwlxjHsil00nnuU06d7noopZ6/p5jaEKVUUq+VCyV7fyfcqvPc5GjSKgXV
         I4OuYH+pSPtvGXAetBObSuU9xbR129R0ckzo3uLnTb/8KfN61oIFzqSmsNqan68Y+Tak
         k7gcMWmHrWCv44SR9YHPNdq69YK9wm+ypueH68O/dluJ8chgDlhnXudpBXDg4SM4STWI
         z+VRdaQntm47AxYk1uQRE6orDFPCVI9ia01PkytcdJT9YEUdy7iqdTWfqp8EEjQkZBYz
         f78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/S94NWGaE+iPkXn59EQLiJgTmgkNI5tBtSDez2BWq9M=;
        b=fUPutN/GRF7o12c4UW7Q+LRZzlcDCJ+pye2rSENc50Ejdrdyii1x42JEW9isqy2rKd
         zTtQQcLU1+QoH1ir01KhGB81tQFL/6v+4IYzo+thB6oKxq+DsDYx6qSjcAhaW6cm/YpL
         v8hjlXxPovUHpgfC8d/COsq1Rg0DY+Pn/9M3TJ3jwa94ZyDkW7pgUtff/mRf05lT0YWV
         8Iesp0mI4k0iKDjsIsXUfMVp5IM62Fg5RCAuIxGzjD5KHwx1X9ZJvvMEQpxhWbyOlbBQ
         q7JPMZd5Akk29oGWPnmJkFvrrin6msAYtEqCxBBHuphBT7254SckPOzGILjB+r2CSTat
         lV5g==
X-Gm-Message-State: AAQBX9eE2yaFnUulWgNt9/va68MvfeG+MHlAzOFzk689Cult8lFclQsz
        ANygZAnQkpTgfcXzTX/XZkC4GA==
X-Google-Smtp-Source: AKy350ZK4LfkdWT9JXQnVxbm1SXyfCr15VCIJPaBiOwRBMCMcvCeD88aGN0LhUbdRYfiUb/EId48nA==
X-Received: by 2002:a05:6512:971:b0:4e9:a75b:cccb with SMTP id v17-20020a056512097100b004e9a75bcccbmr162990lft.28.1679624722718;
        Thu, 23 Mar 2023 19:25:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 07/41] phy: qcom-qmp-usb: populate offsets configuration
Date:   Fri, 24 Mar 2023 05:24:40 +0300
Message-Id: <20230324022514.1800382-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate offsets configuration for the rest of USB PHYs to make it
possible to switch them to the new (single-node) bindings style.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 99 ++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 8a1dd5d80145..3fe7efafa8b8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1425,8 +1425,12 @@ struct qmp_usb_offsets {
 	u16 serdes;
 	u16 pcs;
 	u16 pcs_usb;
+	u16 pcs_misc;
 	u16 tx;
 	u16 rx;
+	u16 tx2;
+	u16 rx2;
+	u16 dp_com;
 };
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
@@ -1571,6 +1575,59 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static const struct qmp_usb_offsets qmp_usb_offsets_v2 = {
+	.serdes		= 0,
+	.pcs		= 0x0600,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
+static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
+	.serdes		= 0,
+	.pcs		= 0x0800,
+	.pcs_misc	= 0x0600,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
+static const struct qmp_usb_offsets qmp_usb_offsets_v3_combo = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1c00,
+	.pcs_usb	= 0x1f00,
+	.tx		= 0x1200,
+	.rx		= 0x1400,
+	.tx2		= 0x1600,
+	.rx2		= 0x1800,
+	.dp_com		= 0,
+};
+
+static const struct qmp_usb_offsets qmp_usb_offsets_v3_msm8998 = {
+	.serdes		= 0,
+	.pcs		= 0x0c00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+	.tx2		= 0x0600,
+	.rx2		= 0x0800,
+};
+
+static const struct qmp_usb_offsets qmp_usb_offsets_v3_qcm2290 = {
+	.serdes		= 0x0000,
+	.pcs		= 0x0c00,
+	.pcs_misc	= 0x0a00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+	.tx2		= 0x0600,
+	.rx2		= 0x0800,
+};
+
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
@@ -1582,6 +1639,8 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v5 = {
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= ipq8074_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_usb3_serdes_tbl),
 	.tx_tbl			= msm8996_usb3_tx_tbl,
@@ -1602,6 +1661,8 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= msm8996_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(msm8996_usb3_serdes_tbl),
 	.tx_tbl			= msm8996_usb3_tx_tbl,
@@ -1622,6 +1683,8 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_combo,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1645,6 +1708,8 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_combo,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1690,6 +1755,8 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_uniphy_tx_tbl,
@@ -1712,6 +1779,8 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_msm8998,
+
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
 	.tx_tbl                 = msm8998_usb3_tx_tbl,
@@ -1732,6 +1801,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_combo,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_tx_tbl,
@@ -1758,6 +1829,8 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_uniphy_tx_tbl,
@@ -1783,6 +1856,8 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_combo,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_tx_tbl,
@@ -1809,6 +1884,8 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
 static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_uniphy_tx_tbl,
@@ -1834,6 +1911,8 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v4,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sdx55_usb3_uniphy_tx_tbl,
@@ -1859,6 +1938,8 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v5,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sdx65_usb3_uniphy_tx_tbl,
@@ -1884,6 +1965,8 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_combo,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8350_usb3_tx_tbl,
@@ -1910,6 +1993,8 @@ static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_usb_offsets_v5,
+
 	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
 	.tx_tbl			= sm8350_usb3_uniphy_tx_tbl,
@@ -1935,6 +2020,8 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_usb_offsets_v3_qcm2290,
+
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
 	.tx_tbl			= qcm2290_usb3_tx_tbl,
@@ -2506,9 +2593,19 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
-	qmp->pcs_usb = base + offs->pcs_usb;
+	if (offs->pcs_usb)
+		qmp->pcs_usb = base + offs->pcs_usb;
+	if (offs->pcs_misc)
+		qmp->pcs_misc = base + offs->pcs_misc;
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
+	if (cfg->has_phy_dp_com_ctrl)
+		qmp->dp_com = base + offs->dp_com;
+
+	if (cfg->lanes >= 2) {
+		qmp->tx2 = base + offs->tx2;
+		qmp->rx2 = base + offs->rx2;
+	}
 
 	qmp->pipe_clk = devm_clk_get(dev, "pipe");
 	if (IS_ERR(qmp->pipe_clk)) {
-- 
2.30.2

