Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC2373188B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344763AbjFOMPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344689AbjFOMOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:51 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784CE1FF9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:42 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so5601675e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831281; x=1689423281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqkS8wBl8PLRWJLFm1wypKtzLGR0zlssSDIjkM/ys4k=;
        b=i7O7EvVVvTHb8NTsIem/WZeN+QevE1moTxfz0yrSMFq7xKbW/90oxgqty8DCSed4KT
         Fmh3Q5kGqEM+07cEQJIYL2FkA1Fz6Jbq/fgxnUBL1QZ2nCM5gQE8U4fOTxhb3Fa3TLLy
         kEt+ww2DIaCemE7ATvfTqGkoUaz3EVxUhD1Q32FJ7nMyo1FU94RX5TGh366L8c7oYuZ5
         1w3yKzxCeIMnkrvd/DFqU9JvgRSW/kPAmXUmz2X/Qh3nSjT4jYDhuiqIZgBD4+pt/6E3
         jaShgq9ke2fgWBbA0nK3z0JtBupXJuvjOSJrkU6cFrlfKe2/xxyOyq5pSEr3XtCKsYLb
         3DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831281; x=1689423281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqkS8wBl8PLRWJLFm1wypKtzLGR0zlssSDIjkM/ys4k=;
        b=KDeq2p31JRIUHT12bOjG+3+SHvWEkTXSJcMO5dneOMPyoef5TjZQS1yB1TZgHxZNJb
         yz/5EYjDyyRoamirRVp2e9udefT+VcHwBNes78faLFcDOigXgmBN2uASAOXB6BCKMe5A
         HwkLAxvY9OLd5OzqqnwFkeJg6FHmMQIWOa0aTpaSAPlyMwW7uu2lymmo/N1OUtY1CSX1
         Z6XJ52IJlq5sQRf95RLi2+O2Wof7r9elEPAPSdauMeu6mk/EQdLWc4Lxj0SZRFNM/Xp0
         ekoYnjCpelcUrZpXGkYf+GIZRDMsG+0SM38ZwY3LnJbY/lKrWgRsI7zWUqVSOxbhPVDg
         LLog==
X-Gm-Message-State: AC+VfDyA4+31Unt+sjJqMRLBw7N1f4D6RQu9aYOZZvJLmT1fk7+3GpH/
        KUxpP6X6W649kmU6e8UzselSXA==
X-Google-Smtp-Source: ACHHUZ7sMlh6F/QZYZCv/KzWh3NwmaWztRFcznydyaXLXCBeKYCst66Hp1J7muiitR1gAmf6u37luQ==
X-Received: by 2002:a05:600c:3659:b0:3f7:aee8:c23a with SMTP id y25-20020a05600c365900b003f7aee8c23amr4005824wmq.19.1686831280870;
        Thu, 15 Jun 2023 05:14:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:40 -0700 (PDT)
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
Subject: [PATCH v2 06/23] net: stmmac: dwmac-qcom-ethqos: rename a label in probe()
Date:   Thu, 15 Jun 2023 14:14:02 +0200
Message-Id: <20230615121419.175862-7-brgl@bgdev.pl>
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

The err_mem label's name is unclear. It actually should be reached on
any error after stmmac_probe_config_dt() succeeds. Name it after the
cleanup action that needs to be called before exiting.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2da0738eed24..16e856861558 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -615,14 +615,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos = devm_kzalloc(&pdev->dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos) {
 		ret = -ENOMEM;
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base)) {
 		ret = PTR_ERR(ethqos->rgmii_base);
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	data = of_device_get_match_data(&pdev->dev);
@@ -634,16 +634,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
 		ret = PTR_ERR(ethqos->rgmii_clk);
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	ethqos->speed = SPEED_1000;
 	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
@@ -662,11 +662,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	return ret;
 
-err_mem:
+out_config_dt:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
-- 
2.39.2

