Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334EE7820DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjHUAZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbjHUAZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:47 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0245A1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:45 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so45122111fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577544; x=1693182344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eil83J6swtIZs9wN/isJUA8e6KGbFpAZ1S8rsr3xUpM=;
        b=h3y07gP9lOpmE5zV4s7Ih/X2qSug5mA39ofNTPjtlzuHRl4DcMf1UhicdHQ4W9jLHT
         SIPrbLLncDGzPBCVC1THMg8wLD+O16+J9ugznzmaRIXv6nlyRxeLHQQhIZ3sxyQOS5ma
         uLD8FgCr5lyw+W1YtAnXHPhfrD/odu14kcrWvNYQqlinPvZZyafokQEg+XaprNf7gXV6
         LPA5xb/fEXWDLofV3n6AvGrxboe91TpoAkxPRFCPh+6CiDqiRQY/ZGwjbVwXNKlM1Za3
         P9Wk4diBOrTrBkkaq/BQRfr2tZ3X1WfSWF5i4+NO1hFzuDofL+bnZhCJpSKPYQFj+Vlm
         4xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577544; x=1693182344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eil83J6swtIZs9wN/isJUA8e6KGbFpAZ1S8rsr3xUpM=;
        b=Z9Jqoewtac4caiMPKeX0D88oT0Ti6c2RWT/tTNZbniyYx/fQhGyn+YIlEElcsMa/Sz
         JXD+8M16VmP6PcH8YOHjMGX0YQn8X536TqlPEMD/pYMf9X6RlBzNROnZk3Fqe74XNoLb
         8WkpGgaQ7aTYSpGyQ7EKYynXOKikYFjMRBSjcytgRV9Ie9oe7YtAv3fdlMWs5D5Ohdfj
         NDTdIPaW4zsqAajNhJoROX/O2CcgKtVpFerUgAI1sojE3ctkohD6P2FVYiLOd0NS/PXH
         zQAjyBmf8TDp8TWR79mh9YOGzJnhkrkjaKOBujMX0XLIRtb0ATZ/MnmjAALrbVqIiLg5
         hmkg==
X-Gm-Message-State: AOJu0Yz9L/f/jtfJUbl9OamIe9OV3yFuTacgBrcaq9n/aaHrqZgLMQxv
        GzRhFwqF+EpmFrnvjMaggfVKEg==
X-Google-Smtp-Source: AGHT+IGAS+VgWXV/RlluMi1DkatRLfetfSxREy7yT4NSeT7TrxlvTahy0/q15189DIKFNhbjMACLkA==
X-Received: by 2002:a2e:9989:0:b0:2b9:36d5:729c with SMTP id w9-20020a2e9989000000b002b936d5729cmr3520345lji.47.1692577544240;
        Sun, 20 Aug 2023 17:25:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:43 -0700 (PDT)
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
Subject: [PATCH v2 09/16] arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
Date:   Mon, 21 Aug 2023 03:25:28 +0300
Message-Id: <20230821002535.585660-10-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 40 ++++++++++++---------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 44298912b3a3..cdf00d22c3bb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -778,7 +778,7 @@ gcc: clock-controller@300000 {
 				 <&pciephy_0>,
 				 <&pciephy_1>,
 				 <&pciephy_2>,
-				 <&ssusb_phy_0>,
+				 <&usb3phy>,
 				 <&ufsphy 0>,
 				 <&ufsphy 1>,
 				 <&ufsphy 2>;
@@ -3048,7 +3048,7 @@ usb3_dwc3: usb@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
+				phys = <&hsusb_phy1>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 				snps,dis_u2_susphy_quirk;
@@ -3060,32 +3060,26 @@ usb3_dwc3: usb@6a00000 {
 
 		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
-			reg = <0x07410000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x07410000 0x1000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
-				<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_CLKREF_CLK>,
+				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3_PHY_BCR>,
-				<&gcc GCC_USB3PHY_PHY_BCR>;
-			reset-names = "phy", "common";
-			status = "disabled";
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
-			ssusb_phy_0: phy@7410200 {
-				reg = <0x07410200 0x200>,
-				      <0x07410400 0x130>,
-				      <0x07410600 0x1a8>;
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "usb3_phy_pipe_clk_src";
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-			};
+			status = "disabled";
 		};
 
 		hsusb_phy1: phy@7411000 {
-- 
2.39.2

