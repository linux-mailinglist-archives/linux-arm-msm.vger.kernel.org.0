Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB1E51A0A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350421AbiEDNXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350359AbiEDNXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:23:15 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90FA1CB0F
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:19:34 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id l18so2834508ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A1CSj58CI9HvjxPtoHk1cXMAe4tONDfDlnbs+TC55zs=;
        b=kjacRVN950U92kCKYjh6vcjIuJgk83hQ7cHYHqdPwrxYeKCtcs84ow3r1re0g6EmQr
         JDAwe+O6El425hOeYz0ur1YK1e8bWDdGFb94A918Ia3bHwd2ik4e2yGazvfzZmoMPvmF
         Rq3UxMYMb+JeNrvOvvtTEfV1V0tI3pCgd67zIgX4rxVpmZxAIqGgMRqEJ/lhJ1trTvti
         NlD+i237pmP7QLNm9OgJ59XskxD3GWV+MlM8TUg6iuSePzGqLjaKqA1BQiPUorLxj2RU
         j3rzpXZTDv5XpWV5F1x0GAvcyWzphvGeNyhdQBRjIVkruBWl6Gy2T6E75CbhxZDHvy+J
         A9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1CSj58CI9HvjxPtoHk1cXMAe4tONDfDlnbs+TC55zs=;
        b=T+hFKGdW0lgQoPnbyGQJFDBDIxiGRVcpezpiQA0C7A7LYIqp/Sk1Izlw1ZNiSp0a4K
         m0wlB/+d1Kmly990mxMZhQbFOQSUSYGhILvtH6wN/Q3Lzp0zheIc4euDT2zv7HANt7mu
         Ghmlr4tOP/h9WV2mCDSJYQyELIY6rVmZb8zok7qv4ZaiMmzqsZ+HMVwQsra79i1BLwPY
         wrWWNPnGnNHLt4Oyr5+TxHajnX+hb+8dMJdEfasOP7et6wqSk3O2zUKFJQjg0tvIXOas
         4lAGQZLpWUf/fzwho8Of7RazYMx5E5/hsPQ6EbWuJPaurfhM/KQBAH9KWKVVkbEWmEK2
         S5ow==
X-Gm-Message-State: AOAM533V0rczHS8j6xC3xO3rVy5qDGDSISwKKvJzJwO8VEE2JAprQ3TG
        vOtKZj+ob8oY/jKznI+4j5mHjvGtPojOkw==
X-Google-Smtp-Source: ABdhPJx2JP6mkZEtJMs4lGWXhQ6kj+yqnH8vIwhbyTZOBYJo5IEphJ2I+6gA8wvQ0UU6rFx4eqa4Lg==
X-Received: by 2002:a17:907:6da3:b0:6f4:6b70:33d4 with SMTP id sb35-20020a1709076da300b006f46b7033d4mr10793697ejc.51.1651670373199;
        Wed, 04 May 2022 06:19:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/13] arm64: dts: qcom: add missing AOSS QMP compatible fallback
Date:   Wed,  4 May 2022 15:19:15 +0200
Message-Id: <20220504131923.214367-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AOSS QMP bindings expect all compatibles to be followed by fallback
"qcom,aoss-qmp" because all of these are actually compatible with each
other.  This fixes dtbs_check warnings like:

  sm8250-hdk.dtb: power-controller@c300000: compatible: ['qcom,sm8250-aoss-qmp'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 86175d257b1e..925340fbbb59 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3219,7 +3219,7 @@ aoss_reset: reset-controller@c2a0000 {
 		};
 
 		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sc7180-aoss-qmp";
+			compatible = "qcom,sc7180-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
 			mboxes = <&apss_shared 0>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ccf5e95071f9..e2857d3393ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3835,7 +3835,7 @@ aoss_reset: reset-controller@c2a0000 {
 		};
 
 		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sc7280-aoss-qmp";
+			compatible = "qcom,sc7280-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
 						     IPCC_MPROC_SIGNAL_GLINK_QMP
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2700a8145cb9..90a4c09e67f1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3710,7 +3710,7 @@ pdc: interrupt-controller@b220000 {
 		};
 
 		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sm8150-aoss-qmp";
+			compatible = "qcom,sm8150-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
 			mboxes = <&apss_shared 0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dc2562070336..881550cf7557 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3726,7 +3726,7 @@ tsens1: thermal-sensor@c265000 {
 		};
 
 		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sm8250-aoss-qmp";
+			compatible = "qcom,sm8250-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
 						     IPCC_MPROC_SIGNAL_GLINK_QMP
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c0137bdcf94b..e1eba30dc7ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1718,7 +1718,7 @@ tsens1: thermal-sensor@c265000 {
 		};
 
 		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sm8350-aoss-qmp";
+			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
 			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
 						     IRQ_TYPE_EDGE_RISING>;
-- 
2.32.0

