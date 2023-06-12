Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527AC72BC94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjFLJbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjFLJaN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:30:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA5630E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f61d79b0f2so4896384e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561885; x=1689153885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jrHnz846sKSAurRWEc8dAdWpKHrp05uQC5lgmZ9ncs=;
        b=Wv5XrDDvy4LtM5L7MWCbVK9pWAo3LoUNOvZQEasGmTIxOi38BcIRca8Fde80aXxOwM
         aXfV6t3++WM8D2t43nXQPbThzdlcHTowM1+1hywltCEBkdLNk5WIBKbHdgnFrbTu6NN6
         G7hD3xTxSxdg2OJyJhkZKd/bIlY8HQYl9S3d+OKQOv7jN/dCgI9Jja2/dN9fpneUfi06
         MbuoGh0EvHikS8mSs/EC9zdBr5OUOZtHEXtCxm4XNW8D1WYAC2ZSXNjfDklDyA/HF1uk
         rv1AHJwKXY2AlZUFovyBCJwKKAz5+/DTFFMP1V3lPGCXMSQIXrZnHCpFQWA4YSRq5Alp
         0QbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561885; x=1689153885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jrHnz846sKSAurRWEc8dAdWpKHrp05uQC5lgmZ9ncs=;
        b=Ksnik0QodLBDN0OohfWrsH7rFALrON7FgrIMHhQLPaYk/Vo8z7mRRW96wnq8EbuDFH
         6Sr9jjeYpHBwV4ZtB2qyS5YBSYOPQ/6o4WADPzTChc9E/rE9HPyh5S9HISGQAlRUYqrf
         WYEBjPA0ApLMXtT54VrYjmI+xlf3K31lDWRSjkf9+PTVXpK4lPfIOPu4157RWgxYbh3V
         kApdAI90/ZvqfXeHnuUDt8Mg2duBAmTrmoT1SQ4v3MKFT6H45Gqp2KVzXzEhd2vBavRU
         8xuIQnVXdTjzbxiKwqxHH1H1+OGshIQlBB4FRdc5szN/JZ+uVA/TeCH0NtgXaY3UU2cw
         4ERQ==
X-Gm-Message-State: AC+VfDz6ci5DujP1omBg0ryQpR48cyVPT6qhSWddRNadRkenkHLhkYWj
        ApZXX1feo1qEY/v4k5txyKDKOA==
X-Google-Smtp-Source: ACHHUZ6uIGRfB9PUuO1IdV3Ad+qQfGck8wohxMrNY4KVFcykXH7H2id2cyMCwfjwU4a96k2jo3xMxA==
X-Received: by 2002:a19:6706:0:b0:4f4:2b83:f4a3 with SMTP id b6-20020a196706000000b004f42b83f4a3mr3564114lfc.51.1686561885364;
        Mon, 12 Jun 2023 02:24:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:44 -0700 (PDT)
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
Subject: [PATCH 13/26] net: stmmac: dwmac-qcom-ethqos: make the rgmii clock optional
Date:   Mon, 12 Jun 2023 11:23:42 +0200
Message-Id: <20230612092355.87937-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
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

On sa8775p there's no RGMII clock so make it optional in the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3438b6229351..252dca400071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -663,7 +663,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac3 = data->has_emac3;
 
-	ethqos->rgmii_clk = devm_clk_get(dev, "rgmii");
+	ethqos->rgmii_clk = devm_clk_get_optional(dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
 		ret = PTR_ERR(ethqos->rgmii_clk);
 		goto out_config_dt;
-- 
2.39.2

