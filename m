Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E44635157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbiKWHt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236339AbiKWHtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:49:21 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FB0FA722
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:12 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id g10so15908177plo.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c56xjSGwfmMkQ772Tv3sbW08SSFT7wB9ddz0u8vdom0=;
        b=li29VgAjITZO6SGICTr8jhTQdZaqyt3QloHToZFrlSGFlR52juA/aWYv5sW73RWZ8a
         cAdXa34eBmfA6Z+P0dn2seGG0LQouJYhQIXDBGhUOatQU0m8/Dzhbpet9+3aEsQ7R7jA
         lgTgp4nepX26Wwj9nfQcVSCZKWc2H4Cemu2XXEMVhQt3o/NHJNB8S36lU8NG5b9CkYmj
         2aRXl5legESQs5vpgUmyFL3rp8x/BvWNdI65+nN0FOKu4v3npUhNFbvqAD1nqyr4gxks
         bBodox4aEHDxBZuwSi2BzlaAtoOLg3iryZVh0bAeTd9Z7xPvTyvYJ3lWiZYo0P7zjnGp
         5S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c56xjSGwfmMkQ772Tv3sbW08SSFT7wB9ddz0u8vdom0=;
        b=hlhZ53in1wXqXVQ0/tO4A3aIQ0Z7St82IJ0EteEiOjtOMH5xeYBXdhd6Czp60aRngb
         zsEXP7QMhWX8R+pl20lPeWBIZ+nb8QUaCaQDWFxZYp5nkwnuAzq6rlw/ZjMqQiUOS+LI
         90SAgl0ROIAYVXuKU1YIqSV5Gitui6O6fBpciWvDspXzBvjkES4S2IpnwS2gaiJCRh6H
         9Y1SNr2h24k9yAoymaCQ93eKXCwH0Gcl4L9OYt8TZo4+Wj5XPDT2LBStGdK59cKik3Cn
         /l/UyUPt+O1GdruKCTic/BWRMNa+XMaqiJMmBxgafpUTqPzzxoRVq+MDPtXdJFEDgoJD
         672Q==
X-Gm-Message-State: ANoB5pnTE7HfgVm2u0HhKi4ruxS/2Vn9Rlq8MOfbuvT7iHEr4dMu0xut
        dr+3FKd+nyE6+X9QWHWMO8sK
X-Google-Smtp-Source: AA0mqf7NTKwctMv+R4DVCUMIJsdTpjLzt1ZHzlUtNiQ1vtiHoKHPf9Spa1heVuWusQhxhHryUQ35fQ==
X-Received: by 2002:a17:902:cf4b:b0:186:7a1d:b6ee with SMTP id e11-20020a170902cf4b00b001867a1db6eemr12532417plg.67.1669189751898;
        Tue, 22 Nov 2022 23:49:11 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:49:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 06/20] phy: qcom-qmp-ufs: Move HS Rate B register setting to tbls_hs_b
Date:   Wed, 23 Nov 2022 13:18:12 +0530
Message-Id: <20221123074826.95369-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
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

Since now there is support for configuring the HS Rate B mode properly,
let's move the register setting to tbls_hs_b struct for all SoCs.

This allows the PHY to be configured in Rate A initially and then in
Rate B if requested by the UFS driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 33 +++++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 1b6e76bf82e5..f6a962df9df1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -228,8 +228,9 @@ static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL1, 0xff),
 	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL2, 0x00),
+};
 
-	/* Rate B */
+static const struct qmp_phy_init_tbl sm6115_ufsphy_hs_b_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x44),
 };
 
@@ -305,8 +306,9 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE1, 0x32),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE1, 0x0f),
+};
 
-	/* Rate B */
+static const struct qmp_phy_init_tbl sdm845_ufsphy_hs_b_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x44),
 };
 
@@ -371,8 +373,9 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+};
 
-	/* Rate B */
+static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_b_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
 };
 
@@ -420,7 +423,6 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
-
 };
 
 static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
@@ -458,8 +460,9 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+};
 
-	/* Rate B */
+static const struct qmp_phy_init_tbl sm8350_ufsphy_hs_b_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
 };
 
@@ -712,6 +715,10 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 		.pcs		= sdm845_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sdm845_ufsphy_pcs),
 	},
+	.tbls_hs_b = {
+		.serdes		= sdm845_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_hs_b_serdes),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -738,6 +745,10 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 		.pcs		= sm6115_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sm6115_ufsphy_pcs),
 	},
+	.tbls_hs_b = {
+		.serdes		= sm6115_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sm6115_ufsphy_hs_b_serdes),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -763,6 +774,10 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 		.pcs		= sm8150_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_pcs),
 	},
+	.tbls_hs_b = {
+		.serdes		= sm8150_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_hs_b_serdes),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -787,6 +802,10 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_pcs),
 	},
+	.tbls_hs_b = {
+		.serdes		= sm8350_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_hs_b_serdes),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -811,6 +830,10 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 		.pcs		= sm8350_ufsphy_pcs,
 		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_pcs),
 	},
+	.tbls_hs_b = {
+		.serdes		= sm8350_ufsphy_hs_b_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_hs_b_serdes),
+	},
 	.clk_list		= sm8450_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
-- 
2.25.1

