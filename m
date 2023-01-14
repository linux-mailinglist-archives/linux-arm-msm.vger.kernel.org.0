Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF70266A9DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 08:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjANHLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 02:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjANHLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 02:11:17 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5272105
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:10:57 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id p24so25540842plw.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF/lP8i6/bvX2WOvYdvQtXMAtlIxWZ4/WtUnoDch0P4=;
        b=pXIXVySKf8INquka7iLKSXPe66fspzDGSvWYIshcF8iETrjM7PY0FKIzwmBCqtzqja
         hwGoIZfzKwyp/4jUUdR7l4rxIBZVhPNlyT21eZDA1gAwX4Mvg47uXQDtBGZRwLwInqnu
         siM+WFYtXYg7NG2mIoQE9LN4Fd43WA1/VWLJwT0xwXjG6LqUmu8qV3jwqV5wQs43BpWh
         S8AYdys5rozikW914ueqrGaU8+NjxzgFw2HYzK0VX+NKAfdoICYc1kvvqDI+JoN3rTjz
         J3svM+VIrmNsbTNz+qrQ9+xQFuv6p01qlZVwDVKIWkYPmpO9A5YFsyLT2EgFfVPUL0OU
         d8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF/lP8i6/bvX2WOvYdvQtXMAtlIxWZ4/WtUnoDch0P4=;
        b=ty6nEm8VOA7w5riEPPuCv2ts+vU1gE9PWwZ1LE4LvWdhCPX3yFp8sLOeQVH/dabI6m
         o51iaec0cl6EI7SlNFd5rluFK9w6JR5qRs1eI1ttm15se1EBMFnnZFa1HkPI3TE8wgmW
         s2zNy3L33Cn839crQw4XVPUxa0nZPvfrcOpwG5oYrNxCSdlfYk8q+3Bk7Yed5DA7nRFQ
         uid8ad8WNUkmeDV90QrOQdNG+U+ZEBEk18xrJ74OliM6hL6/whVCDd4XELBsMv1ExAsV
         0iCK+ikgYDryHzhTnlXeJiOfUZ+eL2MHn0WtxVBb+IhZ6fs1UVdIrJobu0DUlBkBDDkA
         PEbQ==
X-Gm-Message-State: AFqh2koAmA1IYDWAK8nBs8MVfDuBT8FeQkxiuvXQgKtDyjKpLJRmyXFA
        V04Wh4BnkrIkVpl1pDNwaJK/
X-Google-Smtp-Source: AMrXdXtT3Pmw0+Gtll6XZhsbkX9VbgMkkfUCA5LcR4JJsXbq1T9WjYqU7jhuoQ4hXpFUoeixu4YRNg==
X-Received: by 2002:a05:6a20:1586:b0:9d:efd3:66c1 with SMTP id h6-20020a056a20158600b0009defd366c1mr116328768pzj.8.1673680257307;
        Fri, 13 Jan 2023 23:10:57 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.156])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902e30a00b00192a04bc620sm15225358plc.295.2023.01.13.23.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 23:10:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org
Cc:     andersson@kernel.org, quic_cang@quicinc.com,
        quic_asutoshd@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 10/12] phy: qcom-qmp-ufs: Add HS G4 mode support to SM8350 SoC
Date:   Sat, 14 Jan 2023 12:40:07 +0530
Message-Id: <20230114071009.88102-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230114071009.88102-1-manivannan.sadhasivam@linaro.org>
References: <20230114071009.88102-1-manivannan.sadhasivam@linaro.org>
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

UFS PHY in SM8350 SoC is capable of operating at HS G4 mode. Hence, add the
required register settings using the tables_hs_g4 struct instance.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # Qdrive3/sa8540p-ride
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 421359ca62ba..b784eed2eb1f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -576,6 +576,34 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
+static const struct qmp_phy_init_tbl sm8350_ufsphy_g4_tx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xe5),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_g4_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x81),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x2d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0x3c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_g4_pcs[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),
+};
+
 struct qmp_ufs_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -882,6 +910,14 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 		.serdes		= sm8350_ufsphy_hs_b_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_hs_b_serdes),
 	},
+	.tbls_hs_g4 = {
+		.tx		= sm8350_ufsphy_g4_tx,
+		.tx_num		= ARRAY_SIZE(sm8350_ufsphy_g4_tx),
+		.rx		= sm8350_ufsphy_g4_rx,
+		.rx_num		= ARRAY_SIZE(sm8350_ufsphy_g4_rx),
+		.pcs		= sm8350_ufsphy_g4_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
+	},
 	.clk_list		= sdm845_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
 	.vreg_list		= qmp_phy_vreg_l,
-- 
2.25.1

