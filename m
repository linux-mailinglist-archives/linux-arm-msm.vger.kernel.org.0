Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E685F11FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbiI3SxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiI3Swy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF40169E54
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f21so1258668lfm.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lLaIbaAZiieufLEEmr0IZ4e+KtMk5fZh+A5xCNb1n3A=;
        b=hRzGBrBebTqAr3FhSuZoHydXtaLtaRjLRuJ+qlTbehzgpKVr5M7t+kVCyWl78x0eH3
         mT1gacXTYIx5YsYgmIuK8wn2vCFLZuiO/JEhc//PpJJnZO68KQTbiSu5LrXRPUIspzdI
         h10rkAU95u7/seV73PQn4ZQTiFDv8qWZGpJVy0CJy/fCewy9l3HlOvOdL5ml7wcFCccE
         KM/z9Uu8xUW8Miymw4ScWcUFlKKJv5X7e47uh8dtiOtZ3/nn20nrOxKd1MtFvrIFDvKN
         LCIaqfLYbvWAmfsupPf0tAkIj7q0d9j9OI8da1mOBlXeME9/TX2aJGNCRVGGRKuVszQ9
         F9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lLaIbaAZiieufLEEmr0IZ4e+KtMk5fZh+A5xCNb1n3A=;
        b=Hi3mG9R6/5/CXG+4OVBKrTdeGVqBfhFtDZ1y2N85ygCb9RE+WMDftExQ7gztiLkQdt
         s8m96oBLV4L6yUKJRqAVArLh6HqtyJOUGf8wCc5xGO1bXUcOxOT4TcShTqwltkEfvIBj
         d/US2QxWfwazgF+XUCzS6d4CHqTnRoj5XcNlco/uqKHYUk1ZJPhUAgG7wrMcgCx+b/4D
         EPGZahV+YiwYeh2/+aZ1nnoPfFXxdWCSPqmWYiR2rLAb1rILEwkex7p2CIg8KPnBrbcQ
         UuWty0IPazq9EyDf/AYZdQuwybSPrQLiw3knmg54m/Ym3rZX1/qsG3dxY/npm1asCS7E
         Zv5Q==
X-Gm-Message-State: ACrzQf0JvTaOUPrvSUcds4PLqX9aMaTjKUaW8k5398zIvgTdUYCNdYKR
        LsbjeQDfhZYT0cHZDLgumcQXtQ==
X-Google-Smtp-Source: AMsMyM4I/XJmB3ExsCL/ToLriH7fXQiMV96w3xeCtBbIJn0CD3qGgiUo6WX7O80/Dd1Tg4Q75XpH8A==
X-Received: by 2002:a05:6512:ac2:b0:49a:2fec:aa4a with SMTP id n2-20020a0565120ac200b0049a2fecaa4amr3660330lfu.348.1664563971286;
        Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 19/23] ARM: dts: qcom: msm8960: drop amba device node
Date:   Fri, 30 Sep 2022 21:52:32 +0300
Message-Id: <20220930185236.867655-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The separate amba device node doesn't add anything significant to the
DT. The OF parsing code already creates ambda_device or platform_device
depending on the compatibility lists. Drop the amba node and reorder
sdcc nodes according to node addresses.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 68 +++++++++++++----------------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 487ab9b8d23b..30abf53b062d 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -297,44 +297,38 @@ rng@1a500000 {
 			clock-names = "core";
 		};
 
-		amba {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			sdcc1: mmc@12400000 {
-				status = "disabled";
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				reg = <0x12400000 0x8000>;
-				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
-				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <8>;
-				max-frequency = <96000000>;
-				non-removable;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				vmmc-supply = <&vsdcc_fixed>;
-			};
+		sdcc3: mmc@12180000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			status = "disabled";
+			reg = <0x12180000 0x8000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <192000000>;
+			no-1-8-v;
+			vmmc-supply = <&vsdcc_fixed>;
+		};
 
-			sdcc3: mmc@12180000 {
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				status = "disabled";
-				reg = <0x12180000 0x8000>;
-				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
-				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <4>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				max-frequency = <192000000>;
-				no-1-8-v;
-				vmmc-supply = <&vsdcc_fixed>;
-			};
+		sdcc1: mmc@12400000 {
+			status = "disabled";
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			reg = <0x12400000 0x8000>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <8>;
+			max-frequency = <96000000>;
+			non-removable;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			vmmc-supply = <&vsdcc_fixed>;
 		};
 
 		tcsr: syscon@1a400000 {
-- 
2.35.1

