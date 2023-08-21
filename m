Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB637820DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjHUAZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjHUAZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:46 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A148A4
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb734a9081so44123091fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577542; x=1693182342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc8pSN8VZcLAgrrCg9Hdw/Sq6XrZ7CHaLJcqEMsAhS8=;
        b=T3J6E/Cce7gu/EcOphFb73tePGzIaCcRNE+sdB5dXZjOYdVne230GwFXdUh0TVz0OU
         Kf+mRw5kRPAfCOw4vnXbPw306ALV9H1Jm/i0sNkczkbW9/mu+NW5gwJ7NKeCqgbM+q6h
         L0hIfXYXevx9xpVRgVesx+BMpRUFKkZMqMUgfBuzfP/5YXKV6W6Fc3LngL4wOcVmOppL
         1A2dJWB9WdNB9Cjzh/VBxHZ7FdIt4G8LXHeaUPf290mNC8f4dp0OGOtDl5ugAxAJaUaz
         tCbKhp1TXuTlZgwErmiYZkk+p8qZSIuLnEl0hBTKlJIohBbac2e2UYgbr6cEF5fEjpN8
         HXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577542; x=1693182342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc8pSN8VZcLAgrrCg9Hdw/Sq6XrZ7CHaLJcqEMsAhS8=;
        b=HeIUNhoSnY9Alz9xA7Ngveg/jTs/IKDE3mhElGTRzcubRsFxkLqUb54b2TYaVb0A2e
         o28EpVA88qr0OKbMYRWGozH2Jw0nkF10m4kFxe4Z9QxhLalGySA/UhTH6M1sMS6tWf0z
         bNC+yhoDReN1ttJv15GutTYeH65w8MPp//0dfJEMbJE/FW1kbOLS+kx8w59iEpU8mgQY
         w/3JVFaZffwt+daBgdv80b9FTFhorIC0zUplLv9fVo1SFoAgAebb9TFfBRaSqtYwUuYX
         4LQNYnaIMo3CDN8WmJ18raj4CtVPZyjUsasPqg9yKMf4iwpZgfoF2tDq9JDUbZLFzxkG
         fh2g==
X-Gm-Message-State: AOJu0YzLmrIj5LLTu7ooN24UHD2AXOMywK+Go6kPiZzLeurYkWn35k5r
        PeznFI+en67Ie3ZyVHcv6xATJA==
X-Google-Smtp-Source: AGHT+IG0tSRkt2at3c4QXqHobqRkWeulpAmvayv3emW8qdJBVzRM6d9mcDhIvIDsi7QPBiyiB91hBA==
X-Received: by 2002:a05:651c:3dc:b0:2b9:a588:50b9 with SMTP id f28-20020a05651c03dc00b002b9a58850b9mr1547645ljp.18.1692577542767;
        Sun, 20 Aug 2023 17:25:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:42 -0700 (PDT)
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
Subject: [PATCH v2 07/16] arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
Date:   Mon, 21 Aug 2023 03:25:26 +0300
Message-Id: <20230821002535.585660-8-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 35 ++++++++++++---------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 3c8a2f4e26a3..f0458de265ad 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -236,31 +236,26 @@ qusb_phy_1: qusb@59000 {
 
 		ssphy_0: ssphy@78000 {
 			compatible = "qcom,ipq6018-qmp-usb3-phy";
-			reg = <0x0 0x00078000 0x0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0x0 0x00078000 0x0 0x1000>;
 
 			clocks = <&gcc GCC_USB0_AUX_CLK>,
-				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>, <&xo>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&xo>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "gcc_usb0_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB0_PHY_BCR>,
 				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
-			reset-names = "phy","common";
-			status = "disabled";
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb0_ssphy: phy@78200 {
-				reg = <0x0 0x00078200 0x0 0x130>, /* Tx */
-				      <0x0 0x00078400 0x0 0x200>, /* Rx */
-				      <0x0 0x00078800 0x0 0x1f8>, /* PCS */
-				      <0x0 0x00078600 0x0 0x044>; /* PCS misc */
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "gcc_usb0_pipe_clk_src";
-			};
+			status = "disabled";
 		};
 
 		qusb_phy_0: qusb@79000 {
@@ -566,7 +561,7 @@ dwc_0: usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x0 0x08a00000 0x0 0xcd00>;
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phys = <&qusb_phy_0>, <&ssphy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				clocks = <&xo>;
 				clock-names = "ref";
-- 
2.39.2

