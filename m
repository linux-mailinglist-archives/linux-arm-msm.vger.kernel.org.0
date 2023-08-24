Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F48787A34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243655AbjHXVU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243650AbjHXVUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E8F1BD8
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff9b389677so358180e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912000; x=1693516800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc8pSN8VZcLAgrrCg9Hdw/Sq6XrZ7CHaLJcqEMsAhS8=;
        b=kfyZaJCOyigH2bHO0UclDifKimrMbeJ5LHILl13/7TcrbMr3LScQ95lxOAfjaXcFIv
         LpOEwOBrOk33X84I6b7p82S2eo5D+eqfO5iVTZ68sF0IApxaju5MXLLihKZyZ4x9bEVo
         hZkLUpyn98Vvou0UUGV1X/WRybmfPsL3hEgVkJxCWEsDvY82n7r9SMV6XPREQPaTqA4O
         +I4rlDFgIhACMzt9Sfur5wYnFLn0wY/8ZzWiKI+IZdCDoWQIBnFz+II+RvljeJVH5v3Z
         +FFtSh+cjoS8Q1aMJL/8O7zsQhPnOCNA6kzwn8w3CqftC28nps96PVjlyYxN9wCrJte5
         muqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912000; x=1693516800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc8pSN8VZcLAgrrCg9Hdw/Sq6XrZ7CHaLJcqEMsAhS8=;
        b=aDSD9DPdVlB+unHXCsfOQLuRGIWDT2mDEMfP/fvIZwMNYpE7EYx+lQITGPaemNvH+J
         VuthBmNEXr3PQJGvJDZsLkCQWgL3kJQyqywhNU4zQ27uufV06IzbQpeU70LEwnL6j3HL
         EAuZ08ir2U8bHQ7UPoO/Sk7zFLb8QDQD57LmUP5gR91nKT3H0c6PQ7i0RHOdWwiTGY8M
         6dWa6BKqA9Qc3RBfH0nhHgixtjNI/A18HQNsDs/IbZ+rrYs+srS9hik11FZqqY8vz0rl
         ZpOVLgfVIftSKDaVBSiQydMCDiR92aYTrdQyyKFSwngXpRoezNh2RMtPzZEqkb2spqfk
         o/2g==
X-Gm-Message-State: AOJu0YzehOFh46Bh426AX/k3nkkgPHCorg2bv4lNmjvFzKLsvWnbBDlH
        nd3dN9Hzh3H4vf+p1xPov9WTYA==
X-Google-Smtp-Source: AGHT+IGPplUXgMOlKf/8SoZyUc4KgnLrO1Fzxwjvb1nw5lZqwzUWenteFutCv9/WWKyxJQWCKVEAuQ==
X-Received: by 2002:a05:6512:2803:b0:500:8725:1351 with SMTP id cf3-20020a056512280300b0050087251351mr9808353lfb.47.1692912000003;
        Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:19:59 -0700 (PDT)
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
Subject: [PATCH v3 07/16] arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:43 +0300
Message-Id: <20230824211952.1397699-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

