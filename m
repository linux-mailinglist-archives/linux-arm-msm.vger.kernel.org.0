Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615686B7E83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 18:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjCMRAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 13:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjCMRAH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 13:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFB4234FE
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UvT8dewLuU3QnqVEc1CXfBrmN1ZPxzVWkwUJz3YT87Y=;
        b=b3P+dH06PwygBUVFaUNGL/Enq1w7dAm2+WqgTSt3jBYWQiUlsAcb6PybV6qvgP8kz2U4iV
        ECC8UndJaNravCiS0oB2rnykAwtCjK0coXDhsQSEDs8YC3Obn6OT0qW7tOzlcb7u4a91r3
        Y1D4rv3Ka7Fdizdu26RBHCaCh+5P65M=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-sCv-n-fbOrePX8zX5XRmjw-1; Mon, 13 Mar 2023 12:58:07 -0400
X-MC-Unique: sCv-n-fbOrePX8zX5XRmjw-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-17a03f26ff8so283433fac.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvT8dewLuU3QnqVEc1CXfBrmN1ZPxzVWkwUJz3YT87Y=;
        b=pReeISsTo0HDa8xevSXOf25KtRIfTCIGHpjdS18aFlomn0Sgq5+okXi2ChdrZICD7y
         qoSzIjS+uaNqtBfTKg0DI9Wa5bJUDWL8MZPRzxellcbimWtyBOUzpG7aKGV2UfObmw6s
         JPyDhBHbWHNjm93XzEuMZjP3z9EHTLzLRifqhQr+df4W8ou/lcFTCtuyqbR1RpTLFu+x
         xTCZy6mY6a2ae//hkR995J4IOXj6/RMvFfo+ssGlXiGuxPqeZ/sSyByNAFxlGM1M5ktC
         SImNmYRaHfn+AZhpj7i9TyRDb4d35r2AYtg2a+s5VE2XGd++Q6ns6pxybs8EVJBUUGN2
         yO6A==
X-Gm-Message-State: AO0yUKXAhZl424nrej8Yy63ZPReAJstAQ5BQ5CFvI3T3TMm+zebl46js
        7LpTPaNMdMmnuZ3cFqH6f0sQ6e8VIZ5Ku9Sgn04GcNs7qIx9vQYzay6AYbXScZG+La27uIm2Av9
        T/YaisR6E1z5aIBNqkDEp0jbDpA==
X-Received: by 2002:a05:6808:a19:b0:37f:8776:7fb with SMTP id n25-20020a0568080a1900b0037f877607fbmr15913846oij.24.1678726686588;
        Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WjxF5eMC/5GAjn7mgs0DvZdG92v2v9SNlkN9egFVAPTvhTUYGhYSYuKXbszu7ZOxcCLmAdQ==
X-Received: by 2002:a05:6808:a19:b0:37f:8776:7fb with SMTP id n25-20020a0568080a1900b0037f877607fbmr15913817oij.24.1678726686349;
        Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 09/11] net: ethernet: stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay
Date:   Mon, 13 Mar 2023 11:56:18 -0500
Message-Id: <20230313165620.128463-10-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 732774645c1a..6f272cae330d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -279,6 +279,16 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
+	int phy_mode;
+	int phase_shift;
+
+	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
+	phy_mode = device_get_phy_mode(&ethqos->pdev->dev);
+	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID || phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+		phase_shift = 0;
+	else
+		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
+
 	/* Disable loopback mode */
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
 		      0, RGMII_IO_MACRO_CONFIG2);
@@ -300,9 +310,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
+
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
@@ -336,8 +346,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -375,7 +384,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      0, RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
 			      BIT(12) | GENMASK(9, 8),
 			      RGMII_IO_MACRO_CONFIG);
-- 
2.39.2

