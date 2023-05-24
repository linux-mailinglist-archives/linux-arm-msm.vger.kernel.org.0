Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9435270FCCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbjEXRjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbjEXRjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:39:08 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A902139
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f42ba32e24so10651735e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684949944; x=1687541944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR01uBFzZdPUUX3JVQ6JzzMApgf7t8zSCotM2Vr6DfE=;
        b=NV1qpvnBgye9ZjFXBz970aa6CK8ZWRiHkKqSZWZ6jjYRz3Dn5o7IF6qTkVO7wam7qI
         FucNoA1cp8QYE036W3qtUEEG3M9e5tEDAVOa4OR+u4NXTNTKlW8uk5wG7MCfM7eusP88
         0+U5UgXybGpI/LiwBAUtXbWDLM1h9UVtJ/A2aCHelMN4MvW4YZFB8/Lgs6QSdvZFyuH0
         MU3hlj0j76IkuM6AB7NztBfBzy7A2SF80wXmpv7gkaf+GfTtgzSLM4FwSwWekS2u+r6g
         Zlo31nUMx9T7otxDekXjK00CVAlC++qQODywrfZi7VfJa45iTafM+Jv5bVW1nFwNgBib
         sdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949944; x=1687541944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RR01uBFzZdPUUX3JVQ6JzzMApgf7t8zSCotM2Vr6DfE=;
        b=gva/rvnmmPv+ovuhGMH2SowmJocdY9/lPVs5rBiRFCXgqcmexbDxWYSQ3+DfKrylK8
         i7bCjYHBH+EJTl1Rad2JWKY0ZdMHWPtJWN8vZboGo6i5neHzRFQNgsIMPVn8XyNpnphs
         KaW5MJdE4Gi439gr+O6erDHU7/lN1KZVs0wrpv1h5fEpVmK/bMHkQjbKLgfYObMwONpC
         KkeKV6PJy62t5laItbDKIVMXmab3bJyIy4/2MAjH9De3Fw8IfxE2cox3NWq6uETT6ql5
         vF50X52+PE7vSk1UtDJ6MhU3MxggubC4adsCkaaWAINTf6E0Clz9fFk82nHA2IZze9Gt
         XQ+A==
X-Gm-Message-State: AC+VfDxqDj+9ut/8FReLHit75TLHPVSmHAnhwIlr8746WB03G6V33M90
        XuVRhcUjcdIISu06gCHVO9h82JsvdlcQQkuYbLaZ1A==
X-Google-Smtp-Source: ACHHUZ7lGjFpPEdzrGt+uPJitZe2L4rMiROkyzoA2nMDVS/6Aiy51kLhLEuRijt/7UyHsRGSri0AOA==
X-Received: by 2002:a05:600c:2195:b0:3f4:28db:f5ff with SMTP id e21-20020a05600c219500b003f428dbf5ffmr331402wme.35.1684949944686;
        Wed, 24 May 2023 10:39:04 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003f4fb5532a1sm2993053wmi.43.2023.05.24.10.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:39:04 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 24 May 2023 18:38:53 +0100
Subject: [PATCH 2/6] arm64: dts: qcom: pmi8998: enable rradc by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v1-2-f9334afc4505@linaro.org>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=ABo4IHoKMSALk1kEhP6hlLi4WF/PAYKRLRTRnFZsdiE=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkbku1V60J/yS7Bi3fZ024ovpm6xnREWE+PT2X3
 LSNCCYRKJOJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZG5LtQAKCRAFgzErGV9k
 trNFD/950X/nEoI/Q8KwReuv0GftjTf1B3pfCkuGmokAXLsX4BmkwLtnvx2DLFBMNaWFlkb5z2z
 QSiO0gV+jpde39k+dSsr3N+k7p835sxCokp7Ff2tHueGoB9AWa2UemAC6pxHuoHOBRYW5cQfgF2
 hQMNjsxi6vBgOk5LEQC47XEUUop7nqisJXASnofcnHLpv3zBfuQFBnRE1Nn1y1Zh1uaK1n7tnJq
 SqPMtf2j2u4JR7iVtrmr75VPXkaIzMQFjfsaskQcaAmyC1JpHC4QNyZ1eCy1MiyakN7L/YKwPxM
 fxbpLJ7ctGsAiRxSiA6CnuWlY2m/+t98CbikUBW0ZQ7K8YmXrkoEQZxh2eEo3Ig4yZPj1rIQ1pF
 AFd+8dWN2bnKHcLT6HV5bQvzDgZBW9S+V2yXZGw+/pWL6XbFbjdGl4j1+pk0Y7aLFZ0O44Tnck+
 cM6X4XcawTmAe2GHgaRgAOaPqh0khQB44Wadq1XcWFet9xJbsEHDGtxAarCfas0S2xXBGBFs347
 5AWRrDkZAfWxGWO9AqtUq1Vx5TCDahlRWsj1//R5sfZEbtFfqvyEVSZyt5DeJIqxq0TdSpkakS2
 cUhej/o2r/6H3Niu6hhf5yLEL0PJM9Xvn+GpQbMGBD3zxHJHY7x3ePgcXEKZeuIl9HllMbyqxi0
 wxAzyMIPuqQHJBQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need for the RRADC to be disabled by default,
lets just enable it by default and not clutter up DT.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi         | 4 ----
 arch/arm64/boot/dts/qcom/pmi8998.dtsi                        | 2 --
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
 5 files changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 062d56c42385..68e634f8212c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -279,10 +279,6 @@ vol_keys_default: vol-keys-state {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 &qusb2phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index ffe587f281d8..be6f60bfc26c 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -23,8 +23,6 @@ pmi8998_rradc: adc@4500 {
 			compatible = "qcom,pmi8998-rradc";
 			reg = <0x4500>;
 			#io-channel-cells = <1>;
-
-			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..66087af02d74 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -649,10 +649,6 @@ led@5 {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	dai@22 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5c384345c05d..55ee8dcf27c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -480,10 +480,6 @@ pinconf {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 &q6afedai {
 	qi2s@22 {
 		reg = <22>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 5ed975cc6ecb..1915643f1c49 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -346,10 +346,6 @@ &pm8998_resin {
 	status = "okay";
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	dai@22 {

-- 
2.40.1

