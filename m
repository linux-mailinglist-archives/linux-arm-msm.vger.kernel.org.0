Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF576B2703
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 15:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjCIOg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjCIOgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 09:36:16 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB77E7CBD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 06:35:57 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q16so2098644wrw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678372555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+4iTbADfgePV9IaoTlALLpKBSR+3BkgWEf0N/93c3w=;
        b=7CM+sRIZEZzZHkrIxKc366M1h5Bp0A5IcJ0WU99BayzAY5UWdoY1cTvthO6gNblPTc
         3NwF22dW44TtSbHoOLIypIbOoVH911IwyHyzI3347fwMejquUSr+1euYiSaAz95Ilytt
         2KrmeRD256vcOMb048vLEmUmmrukCGPTFfoIADSGe97tFQcz3Z6cO952FaUsZHCt5Qql
         MJS7MiVePN2Bi7Pgkt+L/TF9vhBnKszVquySGZ39RFu00+Zko8Vb3y8G3Qro03ase4vO
         fXm2OZ7pJPaXty9uoLrudlSkxXkJ510/E6Ns/dNjR2/wpTJKG1/HoRsa7eOZd0p5C1zy
         fwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+4iTbADfgePV9IaoTlALLpKBSR+3BkgWEf0N/93c3w=;
        b=vngrQM3BiEtMsxG5XxADn+CH7ln1kC5zvCsd+vrILNG5Kv6pC8LGHjIdvvrUYfuu93
         YkvdEWFcBtLLbtQswE7uKK2XMoqhspoSz2PrBsLBwrnObr3FwGnEjHCkAsF/v2ajGXUt
         g6y0XqdueQwCkuK++Leu+tm1SCIRdR96kxVAB8+U9vQogKPMoURJEKAap/0psyrojoEG
         HOTs93SgPEPt34C7K/FPnUzteR10mcJ69+vBgV11UAb12v6HfP91q/Rz9of13HxCXZRe
         4qKJI48tZPC3k1MIbL/loUYT7DU+HtzkGJkahXtzN5Z0JdOcrCrlilIdIMDxJRvaApYo
         kxOg==
X-Gm-Message-State: AO0yUKXfKVvA9ru3pBmCeui7nBuqGa44Sxr/s5pi/SMwit6zuoJHlLhz
        zcJTG1c55tG5XXcitBnRI1iYkg==
X-Google-Smtp-Source: AK7set8TD20B/UbZ1W660L4jklnRY/yYpKoZpPIWINJlUCWfunBhlSJmLKW5EsblItl2FKnNYAjojg==
X-Received: by 2002:adf:f982:0:b0:2cb:76d4:42ea with SMTP id f2-20020adff982000000b002cb76d442eamr13819987wrr.36.1678372555665;
        Thu, 09 Mar 2023 06:35:55 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id z4-20020adfd0c4000000b002c5493a17efsm17871405wrh.25.2023.03.09.06.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: sm8150: add the QUPv3 high-speed UART node
Date:   Thu,  9 Mar 2023 15:35:50 +0100
Message-Id: <20230309143551.200694-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230309143551.200694-1-brgl@bgdev.pl>
References: <20230309143551.200694-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the high-speed UART node to the dtsi for sm8150.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 13e0ce828606..cd0351a33516 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1334,6 +1334,20 @@ spi9: spi@a84000 {
 				status = "disabled";
 			};
 
+			uart9: serial@a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				reg-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart9_default>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c10: i2c@a88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a88000 0 0x4000>;
@@ -2425,6 +2439,13 @@ qup_spi9_default: qup-spi9-default-state {
 				bias-disable;
 			};
 
+			qup_uart9_default: qup-uart9-default-state {
+				pins = "gpio41", "gpio42";
+				function = "qup9";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_i2c10_default: qup-i2c10-default-state {
 				pins = "gpio9", "gpio10";
 				function = "qup10";
-- 
2.37.2

