Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548596DE574
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjDKUHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjDKUHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C6B5B90
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681243525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FIepYQlnjXM9bxkwUBsKDpgLvRy+HeIo31cmLx81ItE=;
        b=VOgGbQ7uIvJLdrwyVINPvlOO3f8bfD7AKguq4eirI8+G9FqHRACXYoafEauCGWgE/pfDfb
        mTK1+CpEI/d2AvXyAawz4ykuTXovE5XKMuSxl8so94iSYpuWxWNiz8LM5/uw3O33DSP9vn
        0BO9qwKjg8rlHZJcRIQet/7R9ITA3Ds=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-SKXVqhCzOHCuGh-EVd3SZQ-1; Tue, 11 Apr 2023 16:05:24 -0400
X-MC-Unique: SKXVqhCzOHCuGh-EVd3SZQ-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1843282ca4aso4880540fac.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIepYQlnjXM9bxkwUBsKDpgLvRy+HeIo31cmLx81ItE=;
        b=Y2Uwl0HzDiirhmKKrO5E4xFFwgPjHByvnfxETajBBVMOUW2aR7G5dR+mlEtXEGdvNW
         bmUE63RVgvrJZN2BztIu94Brnss/O/ul3KdBNoGJ2II2tQqmdP4aKnh/lkO5+qpmC3Q9
         O48zYIRjs4CMdGAcHzhUf4g1lyzzSPzU1h9GjBsSVKnlooRZHvv6orvidYLKBqaRC9vV
         HMp0RzlHkmV4K2/WvyhKBkymQP/HqYyV7tH3OmzNxtpFmPFVjEz40CwmPKExQEUXNna2
         pa4DAA+9jKcRMQ+qfnbUxw/gcrBcXwClz8zUSiq5FyjCo1jptvR172kpS7H54b2bb5BH
         3G/g==
X-Gm-Message-State: AAQBX9fYGDw4YWCr+V4cFqbijjDamRp+rf1M4+a+8ErhWKgbLbjlTOXO
        DC0V7VkqoQrlYEdRsVQpe39m/exSUGHwlJUdu+bq68PYGQRkyJ4ykHKZsY0n3D6xZ6EOFqSBcgt
        qZIjjmByUuwMqEekEjsw36sXm0Q==
X-Received: by 2002:a05:6808:1806:b0:387:7c32:f338 with SMTP id bh6-20020a056808180600b003877c32f338mr243369oib.5.1681243522189;
        Tue, 11 Apr 2023 13:05:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bFfVeIffAZcncCUz+cjNx96vqEp+ZBkeJMvKBAJcNhepwMSVSsYLyODgnBNJh6wPQnVwCuQA==
X-Received: by 2002:a05:6808:1806:b0:387:7c32:f338 with SMTP id bh6-20020a056808180600b003877c32f338mr243345oib.5.1681243521920;
        Tue, 11 Apr 2023 13:05:21 -0700 (PDT)
Received: from halaney-x13s.attlocal.net (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 13:05:21 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v4 10/12] net: stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay
Date:   Tue, 11 Apr 2023 15:04:07 -0500
Message-Id: <20230411200409.455355-11-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver currently sets a MAC TX delay of 2 ns no matter what the
phy-mode is. If the phy-mode indicates the phy is in charge of the
TX delay (rgmii-txid, rgmii-id), don't do it in the MAC.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * None

Changes since v2:
    * Fix spacing, reverse xmas tree (Jakub)

Changes since v1:
    * Use a consistent subject prefix with other stmmac changes in series (myself)

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 32763566c214..abec6dd27992 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -279,6 +279,17 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
+	int phase_shift;
+	int phy_mode;
+
+	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
+	phy_mode = device_get_phy_mode(&ethqos->pdev->dev);
+	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
+	    phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+		phase_shift = 0;
+	else
+		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
+
 	/* Disable loopback mode */
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
 		      0, RGMII_IO_MACRO_CONFIG2);
@@ -300,9 +311,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
+
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
@@ -336,8 +347,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -375,7 +385,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      0, RGMII_IO_MACRO_CONFIG2);
+			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
 			      BIT(12) | GENMASK(9, 8),
 			      RGMII_IO_MACRO_CONFIG);
-- 
2.39.2

