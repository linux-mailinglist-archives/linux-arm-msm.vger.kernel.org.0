Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8186C759E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjCXCZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjCXCZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EA9212BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bi9so376593lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ex2SxWiKHsLi5JuC7h4BWwHvOKFOw+6Zk3M1yOf5+0=;
        b=WRdUTJh6nIZZnWmcVmOK1B5tZB3K/g3487ARz72AStEAvRKG3HE5nKf83Uur55FkLR
         Kama/UwbHoCi3/SC7Kkcg+BEXiVQt3y23+WZsEKnHT3vad47waYWiTIJdyb2HzWhyMZt
         ONKmPBzRM88ebD8tn66b/Hf+8885Y/UQev+Ec6dNSsircHzGv1kWOaMR7sx2xbLX4uAK
         nLyUroBYdpmqfIMMCCaX218Zs6bcTx7zxr/sd93504VO68UdTtOOKsz5khjVvQ8SDDHy
         4AGHX9yas7Mpw4GR/gRaMF0i66We1V9OE8pT2LaDRzIQUr+Q7kvgr5BWGAh7RaZNLB8W
         Yo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ex2SxWiKHsLi5JuC7h4BWwHvOKFOw+6Zk3M1yOf5+0=;
        b=pKwhvuv4hCTKMB8zNowdoIRLHS5OtC9EYZcnkgEN+W+v0Vimg3XwrwRlnpDlj6Nz6A
         1BPiO7PIsYZoktwb+9fQE/lH4RMEK/VFmQWKnBVMadFRmwRGZGp7/+WlcsHTH31Lw7Cg
         RW1086IgJADnB9OICZrR8ipLO3t3TFzHCM7HloDJWj9dsi1x0zWi5NKFjzfs5n//3+mv
         lfFB4tbPi8eCG3vLfzq537vor4TH0lUFyUZEODOzB3+aH4fAR2CS9ceL/3iMcxg23qaA
         hSX7eClgSfzwJxRALLyCUcNv082aKhORwrdbqycGwpVXrIiWDASbyiU5VmnBqU67vq7y
         7XEA==
X-Gm-Message-State: AAQBX9dhrtcMhsc71kjhO1c0vkjzzGfVsw9u5tKxRSZ3cvgfxPk6QAhZ
        WRob36/56Uj8gAKaKfcWBb5Ilg==
X-Google-Smtp-Source: AKy350YK6K1kc0bOCgHGJlc4xpmxkOJAj8pSUqLxxdnuM6nrgiE7nQhqCjY7GUa5eGpgfIL/+VBuCA==
X-Received: by 2002:a05:6512:905:b0:4ea:fa78:3661 with SMTP id e5-20020a056512090500b004eafa783661mr228099lft.31.1679624725430;
        Thu, 23 Mar 2023 19:25:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 10/41] arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:43 +0300
Message-Id: <20230324022514.1800382-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 31 +++++++++++----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9ff4e9d45065..ff540bfcc062 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -220,31 +220,24 @@ qusb_phy_1: qusb@59000 {
 
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
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&xo>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "gcc_usb0_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB0_PHY_BCR>,
 				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
 			reset-names = "phy","common";
 			status = "disabled";
-
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
 		};
 
 		qusb_phy_0: qusb@79000 {
@@ -553,7 +546,7 @@ dwc_0: usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x0 0x08a00000 0x0 0xcd00>;
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phys = <&qusb_phy_0>, <&ssphy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				clocks = <&xo>;
 				clock-names = "ref";
-- 
2.30.2

