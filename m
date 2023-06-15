Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03281731882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344437AbjFOMPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344455AbjFOMOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:42 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368BD193
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:41 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30fc90f359fso2982517f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831279; x=1689423279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg9HPnaQs4uw+/BUPOC0tDtzoyUDTGe4TgouVRsxWgE=;
        b=uTY+xgtBs8To4v9GTEN+G7yekk2CqT/3OfaDsJwmVgqkQPcVz7HnQLkldua9jW9pQn
         s5ghUQQ9iwBaJDt4M+PuOIloRdWa754NBFaTnwgjQT9x9NniSfGwuOeuV0hwCz4kWNEN
         d2nsFzZPs0ZUd4babHrA8gBfkI5uIuKp5U8foazQM5HkEd4OoSFMYfi6Z4SKuj4ABDbt
         027bJqZixgL8R9QZNF+XeHUMpcYm9qpbmaNB+Ftmd/2c8up1hpJojsAi92t9RBgBzPRZ
         CVuE/7PT/vT3S9l/cDmTlQj05vBrKb87Lq36F1ISxs8cN7b50TTt1QXU7WTLIzW8QB9K
         oRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831279; x=1689423279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg9HPnaQs4uw+/BUPOC0tDtzoyUDTGe4TgouVRsxWgE=;
        b=jQlfXtp6FoOvMrakHeCpx2ZCZu9syG3uOyCKBoy2iCoirp6Q2oQN16T6Cf9y2qMXI0
         ItCoEAESxrLH9/GQDEiDASh78qA2vO4TjM4XnDQjoBNcpU7Xa+YOXrqlQC6nQD8C/brs
         KzycbeFDh5IxDk9Wb7tOxILUA/FlVeRjLF9pHOa5GOCcIQCFGZ0Y+e6hyyoTj+W44xT1
         STTe5h4510CKntoq3zkHKjAofz6wkgyk6Jh/bIRbQN0qC7Bl94/K/GS1z1de0XXZDV4B
         Q9qGfiuM531xHuS9VZkrYJFgjz2vPvc3TaPi24sEDx++sZ0fToeuDMPKQQc46A11B7Js
         1NIQ==
X-Gm-Message-State: AC+VfDygmreO/0WoHtCH3nbp5r9pG64Zh5+yfRXxdy4mQft8Dp9JKPJB
        dxfpt27ZobuaJAhHjnjT73AvvQ==
X-Google-Smtp-Source: ACHHUZ6Uk6asHy55RemUww5ML8r7mU3nmTyGBsumX9attMu4qXc0CRCwbJ3KGESKakbxKbjqWZ6FPw==
X-Received: by 2002:a5d:4208:0:b0:2f8:e190:e719 with SMTP id n8-20020a5d4208000000b002f8e190e719mr10993391wrq.65.1686831279396;
        Thu, 15 Jun 2023 05:14:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:38 -0700 (PDT)
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
Subject: [PATCH v2 05/23] net: stmmac: dwmac-qcom-ethqos: shrink clock code with devres
Date:   Thu, 15 Jun 2023 14:14:01 +0200
Message-Id: <20230615121419.175862-6-brgl@bgdev.pl>
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

We can use a devm action to completely drop the remove callback and use
stmmac_pltfr_remove() directly for remove. We can also drop one of the
goto labels.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index c801838fae2a..2da0738eed24 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -586,6 +586,11 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	return ret;
 }
 
+static void ethqos_clks_disable(void *data)
+{
+	ethqos_clks_config(data, false);
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -636,6 +641,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_mem;
 
+	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		goto err_mem;
+
 	ethqos->speed = SPEED_1000;
 	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
@@ -653,27 +662,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_clk;
+		goto err_mem;
 
 	return ret;
 
-err_clk:
-	ethqos_clks_config(ethqos, false);
-
 err_mem:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
 
-static void qcom_ethqos_remove(struct platform_device *pdev)
-{
-	struct qcom_ethqos *ethqos = get_stmmac_bsp_priv(&pdev->dev);
-
-	stmmac_pltfr_remove(pdev);
-	ethqos_clks_config(ethqos, false);
-}
-
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
@@ -684,7 +682,7 @@ MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
 
 static struct platform_driver qcom_ethqos_driver = {
 	.probe  = qcom_ethqos_probe,
-	.remove_new = qcom_ethqos_remove,
+	.remove_new = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "qcom-ethqos",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.39.2

