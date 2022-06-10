Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA32F546CCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 20:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350296AbiFJSzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 14:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350378AbiFJSzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 14:55:50 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5601E7ADD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:48 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id e4so119445ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g2xdbCbqDzIncuP45i58XD17g/B6emE4ldK55IkqvnU=;
        b=HzfSCXgWRJfxYCIZZCARYTSb2XczWHRaBN33MxBNh+UyIwO4QaHTE0t22vI52miHYY
         pN/BaE8UlpdGYhIOrDRjo5yBSxWGZe8WbetqfcrZVsgesQI52CZyG6/J1hDvb6wGL68X
         xxUtGiQgdJjdE29NQXXQniypyGWaSs6mrUic7pEvupXl52fq3CzB/x2uCjOoW7tNmmEQ
         iEBxt1XlEQel85s7SKueE5t5zJC4aTw8nCPZJUj7LXS4h4VcgVCZ/f4dWXY1YHJulbdu
         H9jsVNn0DlFVP4IvktCow+l/n7wapL2I3F9qxkwV63/sFayPys4KxdsariUqMRf5GFAi
         E3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g2xdbCbqDzIncuP45i58XD17g/B6emE4ldK55IkqvnU=;
        b=gi3iLg6aR0aWA8JC9u9wKgtHP5csOv8GvzQ8Y44/jomCAr4ha+VxQwEzlt58CIJC6u
         a7c5ahUCxmCyGx331MvmDaXZ5D68BxGzEZcn30cxoOyxLyso765UEWu1fJRwdYn5qn+u
         P1JPZyuYvPAjJ4l7XIq7exX4EsGyOwETt3sugxgLHMru3lwxRcj4NWVpEehGwKQuR8VW
         7sR1+IphmYx1Hrerur2mSzax4/Zd5woSK6phRohGa6012nAq7oqA2kIpxLDNSdEldgnR
         wMxZ8r6RZLGDuzDSJdYaQRzK4P4FsztWBtervlb4o0bMMdxX0LSrPjCq+Rh7kK1aPAP3
         l17g==
X-Gm-Message-State: AOAM531sixP+ZRI2n7RoEC2opT0Mi67HYllx75ZxoDw7iJ/Abh4embGI
        1mAoAfKeOx8SsUWCHbPZDfKCZw==
X-Google-Smtp-Source: ABdhPJzPKyEEKA9IXKYOpC3AalNHY6eqp5J+wftUS9vE+slOHtINp2E/Bu9ig+dXQvnCSC5tl3cfBQ==
X-Received: by 2002:a2e:8803:0:b0:255:8be7:c03a with SMTP id x3-20020a2e8803000000b002558be7c03amr17533376ljh.487.1654887347060;
        Fri, 10 Jun 2022 11:55:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i14-20020ac2522e000000b0047255d2118esm4816218lfl.189.2022.06.10.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 11:55:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/2] phy: qcom-qmp: fix PCIe PHY support
Date:   Fri, 10 Jun 2022 21:55:42 +0300
Message-Id: <20220610185542.3662484-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
References: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace init/exit ops with power_on/power_off which should be used for
the PCIe PHYs to fix PHY initialization.

Fixes: da07a06b905f ("phy: qcom-qmp-pcie: drop support for non-PCIe PHY types")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index bd9f71456e32..b2cd0cf965d8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2141,8 +2141,8 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 }
 
 static const struct phy_ops qcom_qmp_phy_pcie_ops = {
-	.init		= qcom_qmp_phy_pcie_enable,
-	.exit		= qcom_qmp_phy_pcie_disable,
+	.power_on	= qcom_qmp_phy_pcie_enable,
+	.power_off	= qcom_qmp_phy_pcie_disable,
 	.set_mode	= qcom_qmp_phy_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
-- 
2.35.1

