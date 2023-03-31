Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58CB86D23BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 17:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbjCaPND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 11:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjCaPMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 11:12:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87843C174
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 08:12:53 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 20so23440174lju.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680275572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/XAz5u4W7EF3PznGOG4CKpssJVKtnSZng4vT2/ozGA=;
        b=hHr8JtfB99Morqcmu5qj1P0BeG1OIBh94IbA6t6kXmMFkIsH2V6OhN/Svm9k3NrhoX
         sV7szFzUsSUt5IsxCEPTFoTxnrQeYg5Pc5YyIkRkJCaDlNhnfy8zxi3WF9r1XGQdzGhu
         +w3SvAdpmO9g8oRvbiFHPpbX930VT6Z+joddNcQmVoxpniOOjCp3Fn0/vA2S0+kLJvi9
         0S5e/Xe1f2QP+eigyEe4vlfTnj0xw0A0kYw6RgMrP+av3RZGvJ421oHQDAOPBTr4qc22
         snOC2uEy0t6JM1iAihzSCzi00BsFm3rVdQNR9qD2JErIj/c+/2HHASMoyUUAHwTio6SF
         c24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680275572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/XAz5u4W7EF3PznGOG4CKpssJVKtnSZng4vT2/ozGA=;
        b=bXESA3BnNja029TI+0EUhdjzgqeTHiKq057fQOqQDrf6WZ/yoZdajMM248kLIm3Fvd
         65a331HyiWrfgSmf42LIkrXZYLm/wB/m7DEKHUxry32P7X9B2GrRNlzBtstiiDqLErO6
         PDXG//L0M1aFkOjtn7CeybnY1oo6AKm8/XmQ033IMUCMGoiJIlHh40oMk5q/nQxDKWZZ
         AQ470bvElpwg/IWdKoFnsf69XSi/b303KtbSsugfgavZtbEqIs/PUOgIvGMivtH43pMr
         hdL03C5SXl5EfOWx1ijRb5uv5L+FuhNy89bzG5b2Tez5M7ODMZbOXt82WEi5/pBLQqUt
         tDLw==
X-Gm-Message-State: AAQBX9cOrndvGs4y05TVJwm0GGdO3fkKbEiT0fws8W4FEaKx9CspsgmU
        bcLmItpHN3adxm3LfMomjDfV/A==
X-Google-Smtp-Source: AKy350aikhYuCpaVA47lPInLKEbaA8Ifr7Ed7rw8aSpLWpeZKI0vEV3Hp67lKcoeXSpgZEjs9h7BtQ==
X-Received: by 2002:a2e:a40e:0:b0:2a6:22fd:6b08 with SMTP id p14-20020a2ea40e000000b002a622fd6b08mr678220ljn.3.1680275571946;
        Fri, 31 Mar 2023 08:12:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a2e9808000000b002934b5d6a61sm395709ljj.121.2023.03.31.08.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:12:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH RESEND v2 2/2] phy: qcom-qmp-pcie: drop sdm845_qhp_pcie_rx_tbl
Date:   Fri, 31 Mar 2023 18:12:50 +0300
Message-Id: <20230331151250.4049-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331151250.4049-1-dmitry.baryshkov@linaro.org>
References: <20230331151250.4049-1-dmitry.baryshkov@linaro.org>
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

The SDM845 QHP PHY doesn't have designated RX region. Corresponding RX
table is empty, so we can drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index f378c1ebefd7..df505279edfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -725,9 +725,6 @@ static const struct qmp_phy_init_tbl sdm845_qhp_pcie_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RSM_START, 0x01),
 };
 
-static const struct qmp_phy_init_tbl sdm845_qhp_pcie_rx_tbl[] = {
-};
-
 static const struct qmp_phy_init_tbl sdm845_qhp_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG, 0x3f),
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG, 0x50),
@@ -2212,8 +2209,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 		.serdes_num	= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
 		.tx		= sdm845_qhp_pcie_tx_tbl,
 		.tx_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
-		.rx		= sdm845_qhp_pcie_rx_tbl,
-		.rx_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
 		.pcs		= sdm845_qhp_pcie_pcs_tbl,
 		.pcs_num	= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
 	},
-- 
2.30.2

