Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CCE731879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344718AbjFOMPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344805AbjFOMPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:15:02 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C2C2966
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:51 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-310e6e6a8d4so1640628f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831289; x=1689423289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LJNYlud7nrLWcLjYZWRISbOkEhmJfj+HftG3WBZPio=;
        b=hucoXbWBf1OiSRCTQeWm56yitj5Lp14xbM8m91gPocDl3fphaLX8DBWtyGjbKmsIC2
         zggeH1Qo5FAiNBr9uyhWSCxy+1zVw3QWAFjFzffMpObdnrsBikUKA9Kao16lghrmXiGG
         IAC6n5IjzEIbvIgeSMyryxFO9KwQDwMJd6qy1pPz2GmC+oPnTMUw66lGRy3w2a0QR6uY
         P/dd7Ae27WkzZ0Ans+P8pGvte7DcfBTPrhQu+sn0XiB6Iliw1nyTjtWk80KRq2xpmgZN
         CvMVFmEePhpDMD187F77kXBZy83TcLpGZg5WPU76GOeW8ZmvbPI4e68XtgDxluX1i4kS
         q5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831289; x=1689423289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LJNYlud7nrLWcLjYZWRISbOkEhmJfj+HftG3WBZPio=;
        b=M7Ig7WXO+c0aw69yBtL/N6yXSkXUgLDVT0+WhzBNlW5YVJePwLclmGb8X279x5cjMC
         fH+aisykxADqiBevHhHfVddtaPjMBKLKffqpGSL9afj6dwh4nVx9wBynzJfaxY2ct4Xy
         v8gTIOrFL54HJ2duoH9IMddYW0HSc7ekCQaQfpmTIdb68H5TemQ9g7KM01K+GjKk7gbw
         HScZdYQbSth5YFsr45NFSks1V3h9v+t2t0/i6AscAC2T2AcV5/Drs5EYbBo1Cb4LNGMI
         L3bczhnmhymxOmOJAqpo+3fRV8MZwLlv/75lgoUl5bRFEdV69symJmbZ0vb9eF31p7qL
         H/Eg==
X-Gm-Message-State: AC+VfDwQCEEr/28+xl5EvlWseJnpTKm1bqn2HMUDmFwaRXnoy6kn+sjP
        9+K+da8SDnhMEZEpjpvggn5G1Q==
X-Google-Smtp-Source: ACHHUZ7dhQeRZTyspniXEVTLFPnO1UuPerWwotxm94aJWSlmAjYzhXbHXkVd8P9CDW1neaFjB7KBLQ==
X-Received: by 2002:a5d:6147:0:b0:30a:f143:25d2 with SMTP id y7-20020a5d6147000000b0030af14325d2mr10110697wrt.5.1686831289396;
        Thu, 15 Jun 2023 05:14:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:48 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 12/23] net: stmmac: dwmac-qcom-ethqos: add support for the optional serdes phy
Date:   Thu, 15 Jun 2023 14:14:08 +0200
Message-Id: <20230615121419.175862-13-brgl@bgdev.pl>
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

On sa8775p platforms, there's a SGMII SerDes PHY between the MAC and
external PHY that we need to enable and configure.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ec3bbd199501..042733b5e80b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/phy/phy.h>
 #include <linux/property.h>
 
 #include "stmmac.h"
@@ -93,6 +94,7 @@ struct qcom_ethqos {
 
 	unsigned int rgmii_clk_rate;
 	struct clk *rgmii_clk;
+	struct phy *serdes_phy;
 	unsigned int speed;
 
 	const struct ethqos_emac_por *por;
@@ -565,6 +567,30 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed)
 	ethqos_configure(ethqos);
 }
 
+static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	ret = phy_init(ethqos->serdes_phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(ethqos->serdes_phy);
+	if (ret)
+		return ret;
+
+	return phy_set_speed(ethqos->serdes_phy, ethqos->speed);
+}
+
+static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+
+	phy_power_off(ethqos->serdes_phy);
+	phy_exit(ethqos->serdes_phy);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -650,6 +676,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_config_dt;
 
+	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->serdes_phy)) {
+		ret = PTR_ERR(ethqos->serdes_phy);
+		goto out_config_dt;
+	}
+
 	ethqos->speed = SPEED_1000;
 	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
@@ -665,6 +697,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->rx_clk_runs_in_lpi = 1;
 
+	if (ethqos->serdes_phy) {
+		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+	}
+
 	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 	if (ret)
 		goto out_config_dt;
-- 
2.39.2

