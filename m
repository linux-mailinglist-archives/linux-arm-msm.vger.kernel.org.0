Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA617731884
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245503AbjFOMPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344843AbjFOMPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:15:08 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE25C297C
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:53 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f8d1eb535eso15871485e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831292; x=1689423292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePekGJ8XieE9NixEVRESpLaa1JhvD/weUEjagHex2MA=;
        b=evm7xNAU1Y+vxpG10AIfwoj1gkJ/EevC2OhJij9gczApKIXk/aZbKITyFVE7xKsDzj
         CALbrAr/y7+LHTZi09R2OP2P4xrvJvoOdzB3n3idHu1jsntP7aMcd6YMF46NayGDSUYi
         vqn+CE2ewdmie/6XOn3W3RLOWal3NurlFLyaB7is05O4jDdzjOrBHminAhNhmtNFwJCU
         EO0hI6mgeQmJPgF5N6cBFl2cwOkhH4/ohcCNqnfO5HjvEEdtWTNcJ8tILceIZfkPsxvJ
         YtP0hxvQbIE1IxW/zYvbYSPvnkX931OiGmZMQQA5CjQLijW2PbvyYXJs9t9X1yc9yQVR
         mczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831292; x=1689423292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePekGJ8XieE9NixEVRESpLaa1JhvD/weUEjagHex2MA=;
        b=jjwVryn6MNlfVC+JE1I/wYvIYsRt3AHLa0FAt6Lt26GcRMdTjABuFgDM8zK8V4Nene
         xcyqpRNkPX1vGAp7Hc0RM5dHhckMTiXRa0Pjq6vxshnfczyvL5TFluonX8nXFQlm8+fj
         EEn/I4IC7iJlXR35Z5tjoVU7cL0O/zJdons9jj1XWbb0k4DEybzfAnTugZ/Uh5JVipbJ
         OuGxAJ2Tmemt3sF3FUzJV/LA8v3pe2ucmeYcbpcHGj1rjqpM9X6MTWEVtNpwGF7eRTLR
         2IbuxARNgFt7E2iEoB8qmJ2Z1gk4ub9tQk3aKGdT15LfpRz712hZmHOlXCBz7iVEOKf2
         lEQA==
X-Gm-Message-State: AC+VfDwvIvfYvQLjdHZysb2relQiFn3+qPXUqnjNt+Wiq5IjhRDB4KPL
        UJH+qtyZUZ7X5ucD0EFDXbY6Dw==
X-Google-Smtp-Source: ACHHUZ6ED+VRdPOmmkgxF5vHkRNO4wrf79UBrrmxFxoWexMSoVbr6iiM7pFPKLCaBsOTpFpsgu9B7g==
X-Received: by 2002:adf:ecd0:0:b0:311:1853:8a98 with SMTP id s16-20020adfecd0000000b0031118538a98mr856527wro.60.1686831291910;
        Thu, 15 Jun 2023 05:14:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v2 14/23] net: stmmac: dwmac-qcom-ethqos: prepare the driver for more PHY modes
Date:   Thu, 15 Jun 2023 14:14:10 +0200
Message-Id: <20230615121419.175862-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting SGMII, let's make the code a bit more
generic. Add a new callback for MAC configuration so that we can assign
a different variant of it in the future.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a739e1d5c046..0ececc951528 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,11 +92,13 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
+	int (*configure_func)(struct qcom_ethqos *ethqos);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	unsigned int speed;
+	int phy_mode;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -331,13 +333,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	int phase_shift;
-	int phy_mode;
 	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	phy_mode = device_get_phy_mode(dev);
-	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -483,7 +483,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_configure(struct qcom_ethqos *ethqos)
+static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	volatile unsigned int dll_lock;
@@ -559,6 +559,11 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int ethqos_configure(struct qcom_ethqos *ethqos)
+{
+	return ethqos->configure_func(ethqos);
+}
+
 static void ethqos_fix_mac_speed(void *priv, unsigned int speed)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -650,6 +655,22 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		goto out_config_dt;
 	}
 
+	ethqos->phy_mode = device_get_phy_mode(dev);
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		ethqos->configure_func = ethqos_configure_rgmii;
+		break;
+	case -ENODEV:
+		ret = -ENODEV;
+		goto out_config_dt;
+	default:
+		ret = -EINVAL;
+		goto out_config_dt;
+	}
+
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base)) {
-- 
2.39.2

