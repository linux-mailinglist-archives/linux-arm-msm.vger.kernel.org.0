Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A45787A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243660AbjHXVU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243663AbjHXVUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D1C1BC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ff9b389677so358264e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912004; x=1693516804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycYgwyr/6UwKw05jbUywqAg4PjJTQ2L3FELP5qNE/wY=;
        b=n6yZuolq0io1VBg/XNpq3HJfNBZrkM8EX8vPxv3C7jd725afVb0zSuSrrqW/YEBIUP
         qXB4bJw11gZgc6uAP+dyr+GIbvrfr6MDn/VomwASyzwFFmz2zvZDmIiCkVCTWmM22Bi4
         /K8GxDERyVdsU6aKjefVcjSC5HSt/RKBDCkgkUUVmY11QHo0jIk+wJekyOPhjSIin/zG
         u6O7d+wT9v9GaDUNGszixEdRk0hqbtkYr3zzAOmT9qhqHHFIteluw8pJxffJ2OJ6oZ+q
         BDXWHQ8/RBpL7j8/ztx+al4TZOvMlhhjmNGDl/xoq4GYvppaSvQ5fE1XUz2FiemcBc51
         ityw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912004; x=1693516804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycYgwyr/6UwKw05jbUywqAg4PjJTQ2L3FELP5qNE/wY=;
        b=AVpsD/9rvmhymP0Nbp/u/FlUZwZQw6g4I9bh75wnmt3L2o41ojsoQfYGS7czy82VXi
         K+k9UjbBk3RW+9AHP32JGyRNHss0DTq/D708S6OdHvJDM+rIZgU1NO/1CLW9QZzT7K5s
         ZXyqKaUJPnd3iMccJSDz7rNk9oBU1USAdZhpWPYvfgGdRGK+7g6Z1Duh2Bx49eaR6KgT
         puFs+o/Lo7Q1XknkLvnCLP8tx+O6F9zrefAfrRAgQ0JH2zUbf5feBceZFLI92F66Aihg
         5tqF5UNbUmEUZ0dNunip70X2VhD9dffZ+0GOyjxN+/KzefMZxqtdigrCitaDaCHWK+jH
         GYgg==
X-Gm-Message-State: AOJu0Yx00EOIoHEgVjp5/tbFrGiI/nLR9Ec4T3qHOUBxxLB0NcL+hZ50
        KeKVH0DJ/A3Lu70SC/mwu+YQ9g==
X-Google-Smtp-Source: AGHT+IEuoWh1oqjbNkq5s2su0pYLByrkLX7fOaAVRW11wy1GIWq2RFZPhXQEed5n/nvUKn9ELcrKiA==
X-Received: by 2002:a19:6552:0:b0:500:7e70:ddf7 with SMTP id c18-20020a196552000000b005007e70ddf7mr9470617lfj.52.1692912004382;
        Thu, 24 Aug 2023 14:20:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 12/16] arm64: dts: qcom: sm8150: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:48 +0300
Message-Id: <20230824211952.1397699-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 39 ++++++++++++----------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d9f0d7410661..380712aee977 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3442,33 +3442,26 @@ usb_1_qmpphy: phy@88e8000 {
 
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8150-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x200>;
-			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x088eb000 0 0x1000>;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
-			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
-				 <&gcc GCC_USB3_PHY_SEC_BCR>;
-			reset-names = "phy", "common";
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb_2_ssphy: phy@88eb200 {
-				reg = <0 0x088eb200 0 0x200>,
-				      <0 0x088eb400 0 0x200>,
-				      <0 0x088eb800 0 0x800>,
-				      <0 0x088eb600 0 0x200>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
+			status = "disabled";
 		};
 
 		sdhc_2: mmc@8804000 {
@@ -3631,7 +3624,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x160 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.39.2

