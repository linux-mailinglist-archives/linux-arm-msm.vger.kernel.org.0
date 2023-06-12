Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362ED72BC99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbjFLJbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbjFLJaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:30:17 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7307830F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:49 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso25623845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561888; x=1689153888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjVXwVFp50u0PUxr/5pPlG4sgNjLclV10ezIygBZf1w=;
        b=2LxLhnK7e46mui8dhof9QAMYFAXj+RyNY51koDXFIyUq+oeAgfB5Yunm2wkRuj1JMn
         kZaCwUavQC6RW+LqMlWJwEmkbL8jYXkjd+0ANuO3gB4RfugPiO63GVGDem2oaXmUGXY6
         eAlLWzfGQJsrYyk6s/qe+xejpzIL2oEbCV4biO8JIzCtGSZlK2U1RNqppXvdTzoPFYj1
         3uySIa1BuTRWIipEsHrVcQc4yvQ9rYYM8rlnBgv7OYXKE2GKN9SYzVWyi+JBty3FKAs6
         AGFFcXEHyxxr14wTLOjNholiBRGWtf+J2xMsFuYww1sG2cHVlfE8DjukIKEYzRH+nuip
         3ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561888; x=1689153888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjVXwVFp50u0PUxr/5pPlG4sgNjLclV10ezIygBZf1w=;
        b=GROFBbcEye6lTT6h8tg09c3i+o2lGui8iX69m2/Hk3/uLYhPUYJUP+NSIoTTUAdDLP
         neLJUzMaFX/p8v9OhACUj2Wo69QJYcq4S9MRaF79URyMu12f8sb56Yd8GGkh59yJJps7
         qBVdhKPZi+pMB8C+Q9mY1t78gYncQWPdoHF3ArMZrXO6r/PZ+XI0tqv0VxzqwQBkDjdk
         Id3ty1iG9JeAN/1GeDq1y3qR3YtaJvwna6L3V49VgLavSyHsQY0wWYm28PBQGAmjBAEN
         QeUmNtA9hHQ5VH64L93TIFCV63jGr5ISqqlbruGXzZY6ma7QhX1AT+CzMUDHmJoIp84/
         z2VQ==
X-Gm-Message-State: AC+VfDxz9RCGo+cZ/oG6T9oNwKSP+a9DMjkn8oZEOuCNqWo5vG6uD2Da
        6JxsO1mokAcqUWxYonnjDElcfA==
X-Google-Smtp-Source: ACHHUZ5VMYcwm8OhSaptz22TDIOQZKg2qtYe5RLNTkB2yZzQSZhIqFe5Wt+EaJyET4ed5soNUXNxKQ==
X-Received: by 2002:a05:600c:880f:b0:3f7:148b:c310 with SMTP id gy15-20020a05600c880f00b003f7148bc310mr8862440wmb.13.1686561888007;
        Mon, 12 Jun 2023 02:24:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:47 -0700 (PDT)
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
Subject: [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add support for the optional phy-supply
Date:   Mon, 12 Jun 2023 11:23:44 +0200
Message-Id: <20230612092355.87937-16-brgl@bgdev.pl>
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

On sa8775p-ride we need to enable the power supply for the external PHY.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2f6b9b419601..21f329d2f7eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -8,6 +8,7 @@
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -692,6 +693,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_config_dt;
 
+	ret = devm_regulator_get_enable_optional(dev, "phy");
+	if (ret < 0 && ret != -ENODEV)
+		goto out_config_dt;
+
 	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
 	if (IS_ERR(ethqos->serdes_phy)) {
 		ret = PTR_ERR(ethqos->serdes_phy);
-- 
2.39.2

