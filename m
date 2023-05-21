Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6670B059
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjEUUit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbjEUUir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCF1E6
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:45 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3b337e842so2251331e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701523; x=1687293523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipIpnvvz2faNH2PQomJqDmzvLwid0OYECHsRed/GvzM=;
        b=vpNcjA2RJwkZ+0seY10HVA4rtBUNuYNGL67oepwvA9flTSCyWgca8p/bAI+zMYSPJY
         0SukNel7M1iHpCv88vHP4rF3h1zEcVqzCR4vR0FmoKiOgGTWwYhUPSALg92Tas5SiwS7
         un+Cx+wrLIjQm6kdG4Ysc/veDIRrIA/oHaamjW34DVQyAAgqXzFWMGWk7J7J2elZkmIr
         X7bEucbPEgmRj2F4NAwFeZQM41DjB2T4+yH7W0btLEepIPLWa8oJBKlkTXY69/uIx35b
         tDr5mmuI66XHgVIOFBhfeu9BUBGFbdwDFH2GQ5tgj/wyq2rLPU6e8nyWScMxUjq7slzD
         u5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701523; x=1687293523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipIpnvvz2faNH2PQomJqDmzvLwid0OYECHsRed/GvzM=;
        b=DCTj4PbDnaVxR3bDAx8TbdCBSSD/UpWqX/K/a+Vuii2kDQ+j80hWPn4Q8ESMkdn7pz
         pna4xKMqhSkjIOyharzCivFMRYobzZEbSo6PVMDG4162feGNmG9iE99oiQTafWOP1tsG
         YoQTQ13ImW4NKBvSJLXZ+hYGKzsywSxAhywtSlQHU9Dzrh82GvFDf8rrReskUlChLLuM
         WXu3yEzTBNP6lnuRvebQsXyxVFTa7LsJpmIf5HvMZ1Lg7iz7caHI7uB0RprHcIAMRyp5
         GwEV6Qv0VT8b5S3iWZl3aPTWR5v7DwvOr64+ue43iccSiNXBR2lZ2J0vQKnNfrrnPlDV
         nGcw==
X-Gm-Message-State: AC+VfDxCjp2cx82RpZ7IaHy1eQeilTZFN3cxVa0HaOcAUUJSKxxBxVTU
        sFNLvEHn9DdfqVSKXFtktBapdw==
X-Google-Smtp-Source: ACHHUZ5TU2S+6fccLTwNQlwg97JA37P9xmi+kvr/l96GTEU926NkrahUMzpP3Mofi/RbBcKyq5/V3Q==
X-Received: by 2002:ac2:418f:0:b0:4f1:4f43:c182 with SMTP id z15-20020ac2418f000000b004f14f43c182mr2089195lfh.62.1684701523649;
        Sun, 21 May 2023 13:38:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 11/11] arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:34 +0300
Message-Id: <20230521203834.22566-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
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

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 595533aeafc4..44a67c9274bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -741,9 +741,9 @@ gcc: clock-controller@100000 {
 				 <&pcie0_lane>,
 				 <&pcie1_lane>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 			clock-names = "bi_tcxo",
 				      "sleep_clk",
@@ -4064,7 +4064,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d88000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -4114,10 +4114,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8450-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref", "ref_aux", "qref";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -4125,17 +4123,11 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		sdhc_2: mmc@8804000 {
-- 
2.39.2

