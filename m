Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BF26C746A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 01:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjCXASC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 20:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXASB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 20:18:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECC544B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:18:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y15so129770lfa.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679617079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5tZLMNjAh2M2jpyVusReltMpzTxxZzGAgNQbIiLgTM=;
        b=FFZPxz5nrSq4c6yaE3oxJJUJsy8sQVI+WVJUq04IdYqGEXvP+Rn2O9m8tYPcOML8nd
         0wxxkJK2HVVGUj3kYimU1Xb61uBqQHWNdw/8fqMG19Eza6gL27NEe99LcZ2t8ZeUUcMK
         EgundMMpkoj4vJEkdoStfqAaTcyjeejFb1oevIaTcAlWmL/TWC7pEcLJnUbHjvLS1sfe
         PRm0Z79q8Prb6zYjACojlNV2kOCOMxt6X0ftG5PIZdXZYxPYdFchlbau2dD7JxonnOGk
         Dcfo8GZiwZvjB+e00Xz4V82ouLNhqID8R708SiS601u9yMmmyNY56K2b0bW8HYw0v+F5
         3PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679617079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5tZLMNjAh2M2jpyVusReltMpzTxxZzGAgNQbIiLgTM=;
        b=bpKSRyhqzRhILDHs4YqM21wUpDP6EUN5DNAR3u0NBHodX41Zl+FVDsL/QW+wOQxi0j
         eVfoPiahpVBYgGOTwdpo43BCPvm48YJMaM+zEIlkKrNcltqIKp6YCN5g8cZvZe4nURiw
         zrNWzK+vwRgj2qLsZ8ZxHAmiuZMqjXJfQWcGtdjqdRb/O31UPIEl1nCc1pWm5CmN8aBP
         RHuQp7OuFU7+KbT5zjr/qSFA19nYxJkpQcvT4pHrUlwjFVmO+XMNbutRYs8NgDhyt1rU
         Vhb9A8vfzDGYbgLzmE8GiyXBbOvMm4SWCTGXJ8rzjJOdwg+KIZKgQ/RpHcfbAVF3nvY1
         5q1w==
X-Gm-Message-State: AAQBX9dvFhSHrAzMoxSIuD5NZjtGgRc2OZhFiYsluR8lIfwyM7KHc8+J
        jzzMDXEu3Vdv52gseqvcVod7xA==
X-Google-Smtp-Source: AKy350YQ8y0gnCHLyne/IGVn1UwNuRGJfuLNzshH+91SiARkQWHfJqp5Hfu1EixYG6IkUB75e6fOVw==
X-Received: by 2002:ac2:548b:0:b0:4dd:af71:a5c3 with SMTP id t11-20020ac2548b000000b004ddaf71a5c3mr124106lfk.58.1679617074214;
        Thu, 23 Mar 2023 17:17:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i17-20020ac25231000000b004eafa77e435sm569147lfl.146.2023.03.23.17.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 17:17:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/2] phy: qcom-qmp-pcie: drop sdm845_qhp_pcie_rx_tbl
Date:   Fri, 24 Mar 2023 03:17:51 +0300
Message-Id: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d671748bc097..d580f3d3e221 100644
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
@@ -2079,8 +2076,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
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

