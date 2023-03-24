Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881A16C75A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbjCXCZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjCXCZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4BD2A147
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g17so412077lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+frEJD7jqIJGNLH4G4tDWoCi5qXMfozMayc1Na/pusw=;
        b=zidhzd/n0o+kqcw6Pv4+tTr1IcV2OcbAy1mLYGW3TdAhkCvk/lVXReAFFBpy6CBf29
         eUNlouxGQYVys8EhujNJsNkZwB5YrPH+Pm/51fZQPCvmwNPRc/HVzkHzDBTg3yF8FEE+
         BOUZUjebCYjBgiHE9sTwIXRTT/824vaTwghBY3QTwKO1CArLk7hn26TdF2HKAGA1wKra
         Hv7TNn+B7SUyebP5QFaqTdWHKiosT27yQ0HeIN4xhGB0PwfD/fxos5MKHfLNBhmKRrO4
         GfCJNjwd3Q6pv8gi8xt0XA8mzx2f5qux94R+K4PUpYK7y1vClnd0pkkJJ/Tizf42q/Mm
         d53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+frEJD7jqIJGNLH4G4tDWoCi5qXMfozMayc1Na/pusw=;
        b=qLDRDSEr2ZUGVD85GZlSbFjuRM2+jJb7IX+lGUk7x+la7ntUa9z0q4l7Bq08qIkuA8
         TAKeE8bQ1O6LKTtVrgWX4kbXfUmrQ7vnjxs3W0qVxx2fkdO2JZyEESS0avLtH0RgFoIm
         DHAlWP92bm7u8m3bTqHJOWqUmNwAhjtxxezu+KA+FR09YDkN8nuGGGJqtWu9+UyturOY
         7/Hhky/cDbL67Rco5B2OHSOVEcYSDVcu6iCGRjCz0Jq5hHmtzZ7Fw0c+o3paSpBfnhIV
         PgDmRdBpJz6/rTzqlfoIITNCAaIxHD4ApOv/jHJRkPruIlsv3Dcz7WsY8ayz/Xwns8A1
         VeFw==
X-Gm-Message-State: AAQBX9cQNVSBr2RRqSSPeRKyNkKZJ/ZI3tmtmDAo/OrPDp2ZyM50WFLC
        vF8XWPf418F0/wpmlUhpGfVIOg==
X-Google-Smtp-Source: AKy350bzEKEmQSe4JKecZ4kxqM/M1I0Qw0keiJ+obL89lB0Aqdq29et65r+1lmX0p3zqp4TPlCkC0Q==
X-Received: by 2002:ac2:4911:0:b0:4e8:47cd:b4ba with SMTP id n17-20020ac24911000000b004e847cdb4bamr272439lfi.13.1679624732966;
        Thu, 23 Mar 2023 19:25:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 16/41] arm64: dts: qcom: sm8250: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:49 +0300
Message-Id: <20230324022514.1800382-17-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 +++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..0b9ca147c1b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3573,32 +3573,26 @@ dp_phy: dp-phy@88ea200 {
 
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8250-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x200>;
+			reg = <0 0x088eb000 0 0x1000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref_clk_src",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
-
-			usb_2_ssphy: phy@88eb200 {
-				reg = <0 0x088eb200 0 0x200>,
-				      <0 0x088eb400 0 0x200>,
-				      <0 0x088eb800 0 0x800>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		sdhc_2: mmc@8804000 {
@@ -3773,7 +3767,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x20 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.30.2

