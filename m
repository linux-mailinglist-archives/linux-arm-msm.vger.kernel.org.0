Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68A4787A3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbjHXVU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243664AbjHXVUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C332C1BCA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:06 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5007616b756so357230e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912005; x=1693516805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpBNHpYglDb91ucrUq7ha/N1sRsDyurprg1I9sqkvpM=;
        b=ijpnJWvRvCpqv7sKtKdSlURCZwFQyL0/odtMMXsdbet9Y8ulyBLkjlMBYiiQNFgRVI
         a5S0Mv2CGeZTwT+a39vaZHmYIbD0OuxtMhWxsPh3CXtOWqhvSVlHpqI+LYbRTf4IArRQ
         DD1uVQ/C0ctiIrSg2lzVEBEsGIvmWVJyPcFN2GiBp+n0/cEjylCAc8KEkzubbHc587LB
         vU0gC7AhPkl31CGcq9XUUutd1HuTmAA9qzjpxrbrNN7qUMxIuiCL8gm7w2622ckiqw1g
         uUuWbtaEbg1wAjCvGw6WzvERJihoC2s8QdtUKuz7s4gjpklIQPIEsdGGKCBGh7oSK8m8
         msuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912005; x=1693516805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpBNHpYglDb91ucrUq7ha/N1sRsDyurprg1I9sqkvpM=;
        b=TpRS0sQSsKd8JMH3rrAB5nWJ/XZspNvkwbDOvDmZZzxBY011rhEG8hnm+l/VC918Dl
         Dksllhwr3TIpWe9au5ZX0GR4Ak166KiYnT+R8BfwXKwsTuLL2myEN+PB74j11i7/+/jL
         NYsSpnnWrVPxo5aZhz4HYR6AUJxxN4Kjsj5L8KT6if9ssXKFvFWtLKQHlFOt7BpkHEev
         BjhRVwi+Rn3pmkmtyLOdNOjkoPF2xiyMRPcwrM0CUQfRVl6SQWbXIWBoffYl8xHxUvyw
         NlMownnCbndZWrVPhxLWae6nH72f3V66ftiN12YamVfCtJkBXkXcWzKem9zMtlsGhUYY
         VmQA==
X-Gm-Message-State: AOJu0YxpGcJiacdobu7NcW8GsI9uXFyKsIOCqEz8HCG6JCpCZTZgj/Qj
        wMkis9JxDB/cl2lYEwbf6VklJA==
X-Google-Smtp-Source: AGHT+IFJLL+HnUoq2AGB/0XiOvIYH+a5RAXI9OBzyswtrCLQypr7wS+cDnxRIWbz868/ustNAs2FRw==
X-Received: by 2002:a05:6512:3241:b0:4fe:94a1:da84 with SMTP id c1-20020a056512324100b004fe94a1da84mr10597379lfr.5.1692912005162;
        Thu, 24 Aug 2023 14:20:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:04 -0700 (PDT)
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
Subject: [PATCH v3 13/16] arm64: dts: qcom: sm8250: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:49 +0300
Message-Id: <20230824211952.1397699-14-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++----------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index abe39b0470da..974bdc1a9f34 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3575,32 +3575,26 @@ usb_1_qmpphy: phy@88e8000 {
 
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8250-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x200>;
-			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x088eb000 0 0x1000>;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_EN>,
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
-				      <0 0x088eb800 0 0x800>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
+			status = "disabled";
 		};
 
 		sdhc_2: mmc@8804000 {
@@ -3905,7 +3899,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x20 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.39.2

