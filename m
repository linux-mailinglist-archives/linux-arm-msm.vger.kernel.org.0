Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0700A74F2C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjGKOwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjGKOwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:52:04 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E30310D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:02 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso92848171fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087120; x=1691679120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGT5Q/iqZovw+ufKbmULu/XxjFgFyS18Dblh86WXpZw=;
        b=bnZAPOjh4KWQuA3muMVkq2193L9NEomYMr2fVoC4SmLp9OQBj+skAwoehWp9Yc5zxP
         1q0pCDWrYkK79vZeyJ87TxWKMOEcA/YsGxRd+b14VkquUZ0o6xdd9xVcrlAuiO3/cfq1
         SLtLFLs0aqFNhwUIbOzXVGIqNFDDKmrL5lFTfUsWkUx5ozjRWxCEMcoTck9mQGv3QOgi
         XE3TSvZszWGHAr+PJlX2yRrK74ucXpczTujkhoYsXQGQGvJi2DDVu5sXCL2dBHdxCRqS
         8JkV6Ef4y1pIWMsCV2/ud3gMg+I4aPPSXXsqX3n21LVwisopuKVVqFXNl9Rjnt1q96SU
         /OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087120; x=1691679120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGT5Q/iqZovw+ufKbmULu/XxjFgFyS18Dblh86WXpZw=;
        b=UrflxSlqazDsG3HWO6mY7AsD9ETwVMuv4NSaUuJPGPCJ63oLC9XzYCpKJBuJ2QRkQJ
         XxTXorWGy/p0t3uGd9mJtehRWIP0wFodBbbIdIThme++1x+8WdnANC4rQHouq+KY1d3K
         c83AJaNZHDDKWe5jIclJboUh8DmuasitpPLs5fQjwrLyqDeMkbeGlTJ0rhzWdL1TpNqP
         4L2YI28C3d4IZWl+6zba6it6Lek5mPNYtDlU2fW1JH+M+tmO6vU5B7kgcN+aRULHHEV9
         tt5iZgaTRa/78RFYwtzNzQQrlL1MMIaVz3IalIpJycu8KxDJduPsXES76jGutwCO+D0d
         TNVQ==
X-Gm-Message-State: ABy/qLatXFP3E3OXG1KWe13oWIixFP8Md4FVFkV2Yoj4khafIPEFhsJQ
        +ILoY+pm4i7TBmm3DR8SBS7Gtw==
X-Google-Smtp-Source: APBJJlHGlfCisEJ1r3067MlOB69M9JQb+0QyvAoAwg99bOLfS+cNVahEIFJwgihi5eVpkiuXxQ/z/A==
X-Received: by 2002:a05:651c:d7:b0:2b5:95a8:4126 with SMTP id 23-20020a05651c00d700b002b595a84126mr12257705ljr.52.1689087120429;
        Tue, 11 Jul 2023 07:52:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:52:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 08/11] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 17:51:50 +0300
Message-Id: <20230711145153.4167820-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6ff7cdacd44d..4381527da3fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2025,7 +2025,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2070,10 +2070,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2083,16 +2081,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.39.2

