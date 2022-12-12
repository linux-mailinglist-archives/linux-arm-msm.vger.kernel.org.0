Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CEF649D47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbiLLLQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbiLLLQS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:16:18 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE864B12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:49 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y25so17934165lfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQIYVXEjJEJ0OT39Qk1zAHhbsycQaa2GSSPi8Gc4rAA=;
        b=ZpVP3WTKicT0uaaQ9/7achRS1ZAapQV0S1DPWe7tPuL0e4+XnknJuDg/ZiiPMrGpCf
         HzRVMUCGOUBkqQAX6gJ2z1h+qrkasxrXMHNXLAsBsnWblRIHyI+3r1RGlLVQ74FL16wE
         3xuBTEEoLYwr+67XZz6xBkBz+NSnoSEmzqCjD0tJT1YMLs11O3HBLMolPG8o8Cazh1OW
         tHqCNbBOnomkwESSyIfe+W8QFjBynzv9I6SV9YCi+SJuLAeMcCMW2MnlF0kUV+LOU46K
         nG/idFYhdMUka+0X8BFBQhjNrcu/Ddol8Op6ziX5y5NAONHniku/fS8oRLZetWuAeM4q
         4oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQIYVXEjJEJ0OT39Qk1zAHhbsycQaa2GSSPi8Gc4rAA=;
        b=agigInPxz8banW1PWGdPlCeHB1hWpddp2wPkVXpx2h33dIadxsHmzgR+uix5zV6jLj
         xtqSXLt4TuLWzhrtBMeLyk/awrlWXItIkV6Fa+EErHKveXWa5rLqghEoTXQ+UE0wU0g3
         dEwdTrh8L5bL1v4c7NUgvBLQjxD3xo8jNZ17z9zV5tto+1udpbR7X/v5hS/WORekRh+4
         thUp3+QF8Yi07RuYuKy2lllSwRkIURpOSyvN/iEHOv7eMXfHiJCWEUarv7eIzpKqpYsG
         id86vgL0MqdGf2f5HnbTF1Uq/UWQVvLCdkzPDb4EOXadE2odzmLilFsaHt4XkA2ozneU
         r4ZQ==
X-Gm-Message-State: ANoB5pllhp84NNjKTraEi3korOl/K5zXlOTs+P7vyRm+gfJkN3I3JEhZ
        6h7quAXi3+LTa9Xrqbem+h9q/DjNzl1p6Qsw
X-Google-Smtp-Source: AA0mqf6aPcb7R8C5IszTOPEnsK8wMaGFb7TkZnf0uR1fNjOGPHEdqgWtRBKtmdhf5xeehU3dUzwlKQ==
X-Received: by 2002:ac2:414c:0:b0:4a4:68b8:c2dd with SMTP id c12-20020ac2414c000000b004a468b8c2ddmr4010406lfi.52.1670843447919;
        Mon, 12 Dec 2022 03:10:47 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b004b57a810e09sm1599110lfe.288.2022.12.12.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:10:47 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: qcom: msm8996: Use lowercase hex
Date:   Mon, 12 Dec 2022 12:10:30 +0100
Message-Id: <20221212111037.98160-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212111037.98160-1-konrad.dybcio@linaro.org>
References: <20221212111037.98160-1-konrad.dybcio@linaro.org>
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

Use lowercase hex, as that's the preferred and overwhermingly present
style.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |  4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index d8734913482f..94310530f7ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -62,14 +62,14 @@ led@0 {
 			reg = <0>;
 			chan-name = "button-backlight";
 			led-cur = /bits/ 8 <0x32>;
-			max-cur = /bits/ 8 <0xC8>;
+			max-cur = /bits/ 8 <0xc8>;
 		};
 
 		led@1 {
 			reg = <0>;
 			chan-name = "button-backlight1";
 			led-cur = /bits/ 8 <0x32>;
-			max-cur = /bits/ 8 <0xC8>;
+			max-cur = /bits/ 8 <0xc8>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 616b5b1b1fb0..f429a7b4a568 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1265,23 +1265,23 @@ opp-560000000 {
 				};
 				opp-510000000 {
 					opp-hz = /bits/ 64 <510000000>;
-					opp-supported-hw = <0xFF>;
+					opp-supported-hw = <0xff>;
 				};
 				opp-401800000 {
 					opp-hz = /bits/ 64 <401800000>;
-					opp-supported-hw = <0xFF>;
+					opp-supported-hw = <0xff>;
 				};
 				opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
-					opp-supported-hw = <0xFF>;
+					opp-supported-hw = <0xff>;
 				};
 				opp-214000000 {
 					opp-hz = /bits/ 64 <214000000>;
-					opp-supported-hw = <0xFF>;
+					opp-supported-hw = <0xff>;
 				};
 				opp-133000000 {
 					opp-hz = /bits/ 64 <133000000>;
-					opp-supported-hw = <0xFF>;
+					opp-supported-hw = <0xff>;
 				};
 			};
 
@@ -3386,7 +3386,7 @@ slimbam: dma-controller@9184000 {
 
 		slim_msm: slim-ngd@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
-			reg = <0x091c0000 0x2C000>;
+			reg = <0x091c0000 0x2c000>;
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&slimbam 3>, <&slimbam 4>;
 			dma-names = "rx", "tx";
-- 
2.38.1

