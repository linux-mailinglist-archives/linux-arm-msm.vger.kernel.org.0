Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BF17820E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjHUAZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjHUAZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:52 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B64BA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:49 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so45122621fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577548; x=1693182348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhz5s4p9df6iSnMVEljVBPUMS53rGAftjG7CgRxMulA=;
        b=AYq5HS7zSH+YdRyj9S8XRsiVGKZiVMf3qvOfjIP6ExBA0G/e/JKOyFCWmARX/xYTp0
         uPrtK+RmNfaNHKr3bCetkOjqjPKBeoJ3orPxcIlwVdZJnWY3opj+nZZNKmAxMnmvR5EG
         YhSuJmdJSC33VG/HwS+PwzG9c3Z357tCgfNuA2Fa4tV5vmR9hSLq9Xofh3vXNN+w679E
         CxldALSsELoFCjZOLKvoqHCuX/3xy+HDOWZhKFcjwTHpekAEjwamKW+aPO8ci4Qa8i+a
         e0YFzXl1L0YXOecZN/dDX7QLeWnY5vaIavLxsQkTaoQeMH6g6eZOASTs+Sqmu7ZTL3Un
         A4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577548; x=1693182348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhz5s4p9df6iSnMVEljVBPUMS53rGAftjG7CgRxMulA=;
        b=dxUbPcubQxoa1toKihaUnuh8tGQ2v8WJHpTfgKjmBorFKpBCStTvAXhJjXdTcdPWQS
         wAbPrcN9lrPDwSBHGlYCfwJSP0L3kPNxAm+vSus6zwpUwwrg+n1JCH6qI1gQo0p3RFJ/
         yTXoi2A5l2TgI7ntyhiEMJanfDD5JaxS5lWewgbhU2R940MchuRLBmCjEl0wn+jItzGo
         kCdeyT3GD7/McIEMlKb2ctp8126SbekXMH8GUGQXicgbdQV7iBBFXFHHOGOIR0is6usl
         PIdHynU7uWcS+XTsvvhpfj8rS38g+a7PC9Ptyz6BflnKQ4UDtL8+hmES3ejBtefPlmRE
         sHBg==
X-Gm-Message-State: AOJu0YzG0FZ8aZQ3xUETEHMrh33Tn+CReeGrVcE33eMx6VBLT3UM0Nh0
        nrxtgSloFKTbTxAmuld64TIHAA==
X-Google-Smtp-Source: AGHT+IFex0jGw34onqGocUkifo4hGv887oiHeh4glBUa0Qn2xd7BenZKOA87pt+IHGS/xU7PwqexGA==
X-Received: by 2002:a2e:9a88:0:b0:2bb:bfb0:7b66 with SMTP id p8-20020a2e9a88000000b002bbbfb07b66mr3831876lji.1.1692577548074;
        Sun, 20 Aug 2023 17:25:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:47 -0700 (PDT)
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
Subject: [PATCH v2 14/16] arm64: dts: qcom: sm8350: switch USB QMP PHY to new style of bindings
Date:   Mon, 21 Aug 2023 03:25:33 +0300
Message-Id: <20230821002535.585660-15-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 39 ++++++++++++----------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a26dff42329c..8faf9c2e7d09 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2229,34 +2229,27 @@ usb_1_qmpphy_dp_in: endpoint {
 			};
 		};
 
-		usb_2_qmpphy: phy-wrapper@88eb000 {
+		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8350-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x200>;
+			reg = <0 0x088eb000 0 0x2000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
-
-			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
-				 <&gcc GCC_USB3_PHY_SEC_BCR>;
-			reset-names = "phy", "common";
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
-			usb_2_ssphy: phy@88ebe00 {
-				reg = <0 0x088ebe00 0 0x200>,
-				      <0 0x088ec000 0 0x200>,
-				      <0 0x088eb200 0 0x1100>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 		};
 
 		dc_noc: interconnect@90c0000 {
@@ -2409,7 +2402,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x20 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.39.2

