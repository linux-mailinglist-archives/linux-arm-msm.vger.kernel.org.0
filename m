Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5EB4E4B7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 04:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241546AbiCWDdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Mar 2022 23:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241539AbiCWDdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Mar 2022 23:33:00 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29AD7006C
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Mar 2022 20:31:31 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q129so510065oif.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Mar 2022 20:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Her+CON9l4wgkaJDnpr2YlL55pStpePMG7/cYiCS/kU=;
        b=Z3zyJsmTrtJQJdSg7rK6ezx3eG2w+7kETHaEEWALmZjvYBgHUdZU4Kdz9rOzdtI03Q
         IuLnfugF4B5M9Ff0rnt/sARNrGlvIQPLZsTf82sEcN61ZTShoi30Nyb13gZjXJlj8Ns6
         o0RG9j0zIe9r/6Vn4JMpbqXus6CIgYZ/LUmtkIp+riJ/c7zWSzRueP7ykisb58Owoxsp
         n2sW+AvG/ShAKbYATvINYzr5ATLcZocaRunx5wVREBigwxibRo8psAE2G4P/VXuDSBh1
         HHCXFPSBDeYVrM2/Li0m7jig3PS20q/B79nGRZKNP5/FXhIRGHs2+DXzQYFnLTbfDoLr
         VGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Her+CON9l4wgkaJDnpr2YlL55pStpePMG7/cYiCS/kU=;
        b=Tr+EoTg89r3l7OX8LZcQF6Cp0vQeIbc/AN7QhPi2Yop4qddmMLGoCgD4IM7Vu045fI
         7wwn/pZnQFUHCZG5F2xi7tbzuzZqjEykDkLL+ctx+no39gc7IjOg8DpBkcCzMEX6sH15
         /l5kGkhst75Iu/46et/vtyqOWmUYaVGDAwz5PY01n5gglsKf9zRlLhT2s9sKz5BPzjFz
         uRUxdtdEkLoXJ678OGIMW2qtrbjfe5ffS1V00v45kAKJeVMCd6BWQKW+yFuohW4C7ywi
         5LisF/DiSpc+YFRr59LhFnrTVcCH3K92BcEXxzlJrlLBbbEmvIyxPkFNgUdBOvpm4uxO
         iBIA==
X-Gm-Message-State: AOAM530slbZTaLHymun//S5GaFFCsQSCBUP/dhmm/bCLE6TM/Kv7x97P
        F/jpUFnIQCOEiGH/CvkLsf1pEBW2O3iFbA==
X-Google-Smtp-Source: ABdhPJwvnI084HJJ4vim9a3sctreUx8ZoiaiGUsBr1kx94Qt+Yxnl03yWN9JXRilkKjBAROxtCkbbQ==
X-Received: by 2002:a54:4104:0:b0:2ec:b263:9979 with SMTP id l4-20020a544104000000b002ecb2639979mr3581918oic.66.1648006290958;
        Tue, 22 Mar 2022 20:31:30 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 23-20020a056870131700b000ddc17aba19sm6514297oab.58.2022.03.22.20.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 20:31:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable RGMII functional clock on resume
Date:   Tue, 22 Mar 2022 20:32:55 -0700
Message-Id: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

When the Qualcomm ethqos driver is properly described in its associated
GDSC power-domain, the hardware will be powered down and loose its state
between qcom_ethqos_probe() and stmmac_init_dma_engine().

The result of this is that the functional clock from the RGMII IO macro
is no longer provides and the DMA software reset in dwmac4_dma_reset()
will time out, due to lacking clock signal.

Re-enable the functional clock, as part of the Qualcomm specific clock
enablement sequence to avoid this problem.

The final clock configuration will be adjusted by ethqos_fix_mac_speed()
once the link is being brought up.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0cc28c79cc61..835caa15d55f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -487,6 +487,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			dev_err(&ethqos->pdev->dev, "rgmii_clk enable failed\n");
 			return ret;
 		}
+
+		/* Enable functional clock to prevent DMA reset to timeout due
+		 * to lacking PHY clock after the hardware block has been power
+		 * cycled. The actual configuration will be adjusted once
+		 * ethqos_fix_mac_speed() is invoked.
+		 */
+		ethqos_set_func_clk_en(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->rgmii_clk);
 	}
-- 
2.33.1

