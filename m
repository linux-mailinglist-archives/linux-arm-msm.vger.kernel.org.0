Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37709654273
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 15:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbiLVOLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 09:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbiLVOLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 09:11:23 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CCE2B629
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 06:11:00 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso5813647pjp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 06:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1UFhNdO1o0gDS1tF9SgoK3kS5M8eBWT75QUSAO1ZD8=;
        b=VXRgTMDzptAXmy3p6keS8iCv7K9rStV+RmCHZ6O4p8JEQAyI6UyUk0RcWq26FhkAzn
         twntzqF5OchG+WwL1iEd4AYmHuIYHOLhiyIUHjdFy3oKzCY9mfGKMe7QVUtAoIrVMiEK
         gq3L54YZTWCRGdJbtapcQsIq3qqSEqk4EGB6vLt34WDE7ZA/JPp0wyJUJcz5PnsuJkbu
         jNmC23KIRddiyCcpcg8MbMSdrSD00qKHawmRLr/ALy22s9u7pIm1/WbFL19mAbFae5Ag
         pG+rRIFD6X9LSBSB4yPw6G8p9ky1SGminnDHqg08ikIOkOdjoVIVmVt9GcMJRdSRZcRo
         mcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1UFhNdO1o0gDS1tF9SgoK3kS5M8eBWT75QUSAO1ZD8=;
        b=f5wkdtGS/Wg5x551n6SWb530FM16c75d8KYQH+1EcWA7h8nINiIzQwkue46zr322pd
         fhStqUENMj/kQ/wLohqmILchMUGB1xzPHKVOa6Cc1/zi0JEjkEPFm3C/DV2CqUvZeqIQ
         lSt+3PfTagf8qNfhZBNi9559iPmrMnIsmKJKbZNnYuYMBV5IDpcG4XB8TH8JK2tYKPYA
         2OhEInyHL7ft7Ak4mekG/WPngnYcxSrHHYv26KaVgO8sT3dXaNqnsPBs4uUkrKr5HRsO
         JAuIYzDgr6J1uWb5S9oCR+XrGkbGXvePxYQoX75OeC6ufhVuIhS4nWcMoP7+aWkT/VO3
         dVFQ==
X-Gm-Message-State: AFqh2kp1dHIjZ6RgX+G6gJA77i4Dx+Qz4eWfDTSIdi3E3IfR6XCKVHb6
        +q3Olh272YgkelOq9377nD8Z
X-Google-Smtp-Source: AMrXdXtVSmwopXhBNErDAIBHL9PIZQQbI6ebbTSOyOk3c7y1Bth0/u5wG0sqe6cXDniS93SBsy62sg==
X-Received: by 2002:a05:6a20:e187:b0:aa:c42:bab with SMTP id ks7-20020a056a20e18700b000aa0c420babmr7693887pzb.59.1671718260379;
        Thu, 22 Dec 2022 06:11:00 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.177])
        by smtp.gmail.com with ESMTPSA id f8-20020a655908000000b0047829d1b8eesm832031pgu.31.2022.12.22.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 06:10:59 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 07/23] phy: qcom-qmp-ufs: Add HS G4 mode support to SM8150 SoC
Date:   Thu, 22 Dec 2022 19:39:45 +0530
Message-Id: <20221222141001.54849-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
References: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
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

UFS PHY in SM8150 SoC is capable of operating at HS G4 mode. Hence, add the
required register settings using the tables_hs_g4 struct instance.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # Qdrive3/sa8540p-ride
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 97d0baa9bac3..269f96a0f752 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -374,6 +374,10 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
 };
 
+static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x75),
+};
+
 static const struct qmp_phy_init_tbl sm8150_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
@@ -411,6 +415,25 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
 };
 
+static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x81),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x6c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x3c),
+};
+
 static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
@@ -421,6 +444,11 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
+static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),
+};
+
 static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
@@ -762,6 +790,14 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 		.serdes		= sm8150_ufsphy_hs_b_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_hs_b_serdes),
 	},
+	.tbls_hs_g4 = {
+		.tx		= sm8150_ufsphy_hs_g4_tx,
+		.tx_num		= ARRAY_SIZE(sm8150_ufsphy_hs_g4_tx),
+		.rx		= sm8150_ufsphy_hs_g4_rx,
+		.rx_num		= ARRAY_SIZE(sm8150_ufsphy_hs_g4_rx),
+		.pcs		= sm8150_ufsphy_hs_g4_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
-- 
2.25.1

