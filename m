Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CA864A0FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbiLLNdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbiLLNdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:33:14 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BB313E12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:12 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p8so18553370lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vnjn+Gco4LuPssa+lXz61R0QkJ5/kGMA8hAnS6Y7rxE=;
        b=IqjsRj6AhapeYbECwnB+e/N9o3iU84aiHjeRwaIk2DaNvKWt9ml2PkWNSyagNvQPwI
         BrR6HhZa673k9mLEsC6Clp/HQ7NcpaWLkhWFgXJrvStD2io+p6zcvgwKtC4x+ygHivCC
         EWON2yWJ7kU/duQpVQUVHfUC1M86JU+ZmHabeJ6aQhwAOZFhL/nNzYRf4lAWgODdQ3uU
         2d1N5Wfl8EGHVugasCRVg2Ed86SmLnrPSjlV8KMqIrSR+tK2zk0bCRj1B+FDawFLIRGL
         y7Op5vQH3WE4ktPe890s2E4spRTNRRfMNUvS82kDrE9LY/fhmAsGClGWFwHNdiWH7m4I
         Gppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vnjn+Gco4LuPssa+lXz61R0QkJ5/kGMA8hAnS6Y7rxE=;
        b=ieRh8dbKvWA49izahi7b3zVX2DhBPQODJ8js2S6GDXD7xmKyevi2jEJI9QHf2ifIyX
         0aO4Ylzv1oNR8rJY4dpnP5o4TbZeMIbCx/FlJQcpuVxXSt85Kp6AHM3hsK2gz2nkckxB
         P0T/KySL997zfCsM42HIXSe6ZjDA6VpM2AUJ6TJ0fvEE/kDnEUMqK9C4XSpxE/U0zBP/
         c5K6dAfeCP1cddBSsIeixfz/MwdYPyofjq38vwe8xANqZdtJ62QikDHOVuIm8d+eJwIs
         SBeYRqlPeTXPnrFVMff+k6Jt1+1dlOIq49SSKSMw9g8aRMEP2jORuOabN5+uwjj9Gom7
         DWdg==
X-Gm-Message-State: ANoB5pm+ONfcDwHcV08VnTyZ1vIOS9xfv5oNUzQrCHplwW92KcrHhqDm
        ctHezNyDBpXIlMM+pCVfQGHx/g==
X-Google-Smtp-Source: AA0mqf5Hrp284+SaOmhGcytZ69l4+VIUpuddDFnEF0fc/8/Zv8ncjUnjlb7LckoG7euuuAs9meabtw==
X-Received: by 2002:a05:6512:1103:b0:4b5:b46d:e60 with SMTP id l3-20020a056512110300b004b5b46d0e60mr4078196lfg.27.1670851991110;
        Mon, 12 Dec 2022 05:33:11 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b0049478cc4eb9sm1624435lfk.230.2022.12.12.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 05:33:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: rename AOSS QMP node to pmu
Date:   Mon, 12 Dec 2022 14:33:02 +0100
Message-Id: <20221212133303.39610-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
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

The Always On Subsystem (AOSS) QMP is not a power domain controller
since commit 135780456218 ("arm64: dts: qcom: sc7180: Use QMP property
to control load state") and few others.  In fact, it was never a power
domain controller but rather control of power state of remote
processors.  This power state control is know handled differently, thus
the AOSS QMP nodes do not have power-domain-cells:

  sc7280-idp.dtb: power-controller@c300000: '#power-domain-cells' is a required property
  From schema: Documentation/devicetree/bindings/power/power-domain.yaml

AOSS QMP is an interface to the actuall AOSS subsystem responsible for
some of power management functions, thus let's call the nodes as "pmu" -
Power Management Unit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 906fb9343bcc..7e781570b2c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3248,7 +3248,7 @@ aoss_reset: reset-controller@c2a0000 {
 			#reset-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sc7180-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 7c24c2129800..b08ddeb7bcec 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4257,7 +4257,7 @@ aoss_reset: reset-controller@c2a0000 {
 			#reset-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sc7280-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 3cb4ca6c53eb..e04f1f751881 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1921,7 +1921,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sc8280xp-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5f1f7cb52c90..2e15a003825e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4965,7 +4965,7 @@ aoss_reset: reset-controller@c2a0000 {
 			#reset-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 0f01ff4feb55..bb20fed0f4f0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1273,7 +1273,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sm6350-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x1000>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d1b64280ab0b..ad6902b13a71 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3589,7 +3589,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sm8150-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fbbbae29e0c2..6faf13ed90c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3741,7 +3741,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sm8250-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 49db223a0777..519e436aeab9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1717,7 +1717,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e0d30dadbf8b..234fe6549fe0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2453,7 +2453,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: pmu@c300000 {
 			compatible = "qcom,sm8450-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
-- 
2.34.1

