Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79B87820EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjHUAZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbjHUAZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C39B8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:51 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso4712651fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577549; x=1693182349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2cQbFAa2dZ8daCARAy1nE0Yfl5a2H4VUsq7LUs1D2Q=;
        b=w2iBr07HV/8Ow4TEf2gDain01qRE+rxcl8X3CvdlfrqTupYTHWEQwHyxrZVhM8x7n8
         kVKy5UjlsWNdUQ5IuxnAVVRZmANR1KHvMeW6/I6gPDPX68rTtOhct+n3Zhs+q4eURe5G
         hDyoMy17v19PKck/TGAon85OodpNs1u+4jIMNPzGceFb/ebsg8BE/vvPoPkrR/1moLYw
         8cP/HBpvQPnmxSR4QcJP7m8qUT8l8mUkTjnS6hxLaj8McrdH+TnGKjYGlW6YNAN7V6DB
         2vapZLy080C3/MjSxrNgA8u7BQHjQNr1KJ6lsBX1YgvLWPtVG0BFfRddF8LatTR7ihQY
         71JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577549; x=1693182349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2cQbFAa2dZ8daCARAy1nE0Yfl5a2H4VUsq7LUs1D2Q=;
        b=gHqfccqPVzkpUH8l5/goICoqwA1o7gaFJgiVCa4LhlRMxgrniPAeVKYp5xou0JemP0
         ESmu/WrXItHux2D8/2j3E1+mWGsIa/w2/UAnHiIE8Q/sN6ZRz1rDUudZ24u+ry6WJa4I
         HHhZmgo+f5Eo+EVwyAvejHkAhLIIRz+uuhn5Jj0B+VPO7UZXUf8KBVbyktLffC9N9nQM
         LZ9kG/zYLcTMib62+q7LFf2usIiCvl5ozUq6d0Rua9LE4vbdVxVZZIJkYzvxtm30FoW5
         ZGupG6yQZC9rHgF76wqjgVRFhktVqyf045y0Rb2Sa59ulOE/Ar+O8A4Cm+e4c9d5niJC
         oXng==
X-Gm-Message-State: AOJu0Ywy4d7IFI7YfTBFUsmhVMCoAnx/91dgSq9UWO0opVTLb/pz1M0w
        rZbcGDV2GNh4eCxGLWQsx3nq3g==
X-Google-Smtp-Source: AGHT+IGiPuaS+EIwN/EbTXdgbiGsljU6WSGT7dDSOesCS8ouxH/oNWhd4sZyjvaA4is1238BsHnv5w==
X-Received: by 2002:a2e:9e07:0:b0:2b6:e283:32cb with SMTP id e7-20020a2e9e07000000b002b6e28332cbmr3320113ljk.23.1692577549595;
        Sun, 20 Aug 2023 17:25:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:49 -0700 (PDT)
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
Subject: [PATCH v2 16/16] ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings
Date:   Mon, 21 Aug 2023 03:25:35 +0300
Message-Id: <20230821002535.585660-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
References: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 35 +++++++++++---------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 1a3583029a64..27e2cc84c363 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -233,32 +233,27 @@ usb_hsphy: phy@ff4000 {
 
 		usb_qmpphy: phy@ff6000 {
 			compatible = "qcom,sdx65-qmp-usb3-uni-phy";
-			reg = <0x00ff6000 0x1c8>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00ff6000 0x2000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_PRIM_CLKREF_EN>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
-			resets = <&gcc GCC_USB3PHY_PHY_BCR>,
-				 <&gcc GCC_USB3_PHY_BCR>;
-			reset-names = "phy", "common";
+			resets = <&gcc GCC_USB3_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
 			status = "disabled";
 
-			usb_ssphy: phy@ff6200 {
-				reg = <0x00ff6e00 0x160>,
-				      <0x00ff7000 0x1ec>,
-				      <0x00ff6200 0x1e00>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		system_noc: interconnect@1620000 {
@@ -520,7 +515,7 @@ usb_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x1a0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phys = <&usb_hsphy>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.39.2

