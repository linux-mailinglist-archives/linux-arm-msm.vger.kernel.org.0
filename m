Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024A65B3348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbiIIJOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbiIIJOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:14:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5911F628
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:14:38 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m15so1619465lfl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yo3fzEL2MH9/Z5sCPMvSryXTswiCiE4zCueiwPbmMJw=;
        b=I09q540wNgASCcfzkVQFssE8sMbveIIhcA6Z09GplrHWUYsk8KFZbvf43Zird/1nn2
         zNSKcIXJwooz5QySJVxaAH9LJuCgA+il9evcpFbs4IydwQAgjKAbjt4sRdWA6hZ+Rm3U
         dTkNUUBAypaE1sovauis+U2JEbyKS9BRsp3qc+nLNqpPqMWtwlKZwX9OYhIzK9qAatCM
         ESrGoRMHVsJ6o78GhTHdh1+EAo0sYG3FyrQ6uMtU1g+mozXzySNZSlIUGeKVgC8sohTt
         tIcu9lqyAoXZLKdcVe6cujzu5u7Xuym/XtKohvMSknSDAtjfKSmvsPDYEutGx57AX7AO
         fOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yo3fzEL2MH9/Z5sCPMvSryXTswiCiE4zCueiwPbmMJw=;
        b=m/R9DCAjD+3PNKWvdu4O+hYZMDFeX6jagez08Du4DVMFarnwW2IqWOym0OO57rOh4p
         etWt+kv5Fsc5awrDsBAl30H0vs96Yx9uy717CGZu4mG15cGzpbJso1aZ1zx6+vTRbn/v
         m3TNMu2AgMap+xaVB4/miil413I0ZZv/K3wKTLEYEw+A19nZ99jgrmtaE4ZRIaxdxrE3
         lKzTnzn6oQgXlKb9ZGr+VBT51ltQdCyUn4I9XFmLxZcP4SE6bspT52OZ51KuTekwZiVW
         xCYD9kU4fCpIrK0ymV1nmXmo4tslo7AaQCwHnEnUG1Iq1bj+CNyiMrUTkFy1SPLOX4xT
         wybA==
X-Gm-Message-State: ACgBeo3eUaNHU0eQCDKfJzA+0vAzxXAek8mWSroEe4LTibLCsxWbm9kv
        0UVaG6KKe8YnotJ3N9mlFnkN5Q==
X-Google-Smtp-Source: AA6agR7zjwZxZLgPdwIfmRIGIY6qewPODEd+YdPLR/bq/XdiO2fld+WmNT11SsXRIBXgOfiXe4ZTjw==
X-Received: by 2002:a05:6512:b11:b0:492:edb9:9d74 with SMTP id w17-20020a0565120b1100b00492edb99d74mr4000341lfu.663.1662714876660;
        Fri, 09 Sep 2022 02:14:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e4c1a000000b0026acbb6ed1asm201615lja.66.2022.09.09.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:14:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 2/9] phy: qcom-qmp-pcie: drop if (table) conditions
Date:   Fri,  9 Sep 2022 12:14:26 +0300
Message-Id: <20220909091433.3715981-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909091433.3715981-1-dmitry.baryshkov@linaro.org>
References: <20220909091433.3715981-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused if (table) conditions, since the function
qcom_qmp_phy_pcie_configure_lane() has this check anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 3ddbb8e89f04..536a6ac835c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1930,8 +1930,7 @@ static int qcom_qmp_phy_pcie_serdes_init(struct qmp_phy *qphy)
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 
 	qcom_qmp_phy_pcie_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
-	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_pcie_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
+	qcom_qmp_phy_pcie_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
 	return 0;
@@ -2037,44 +2036,38 @@ static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 	/* Tx, Rx, and PCS configurations */
 	qcom_qmp_phy_pcie_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_pcie_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
+	qcom_qmp_phy_pcie_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_pcie_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_pcie_configure_lane(qphy->tx2, cfg->regs,
+		qcom_qmp_phy_pcie_configure_lane(qphy->tx2, cfg->regs,
 						    cfg->tx_tbl_sec,
 						    cfg->tx_tbl_num_sec, 2);
 	}
 
 	qcom_qmp_phy_pcie_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_pcie_configure_lane(rx, cfg->regs,
+	qcom_qmp_phy_pcie_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_pcie_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
-		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_pcie_configure_lane(qphy->rx2, cfg->regs,
+		qcom_qmp_phy_pcie_configure_lane(qphy->rx2, cfg->regs,
 						    cfg->rx_tbl_sec,
 						    cfg->rx_tbl_num_sec, 2);
 	}
 
 	qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-	if (cfg->pcs_tbl_sec)
-		qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+	qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 				       cfg->pcs_tbl_num_sec);
 
 	qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
-	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
+	qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
 	/*
-- 
2.35.1

