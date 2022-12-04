Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2639641BA8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 09:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiLDIqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 03:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiLDIqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 03:46:21 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BF912AF8
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 00:46:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f21so13194476lfm.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JSgb59n7yt285OgnTxrX5jNyxDnhai9FpL9TwOkiUQ=;
        b=E8VTCpcK8U1SYdCoZDpb8MUs+oDGPLLSRjA9wrjxylnZsd1deUIKA/05f4FwxXgDzq
         dFp1FlNdOVBwbv7nXas8aD2swC8DZGkoHZjs5WmLt+HBwwjNVUVAhCegzoFJ9Rk58rb+
         Xk1JnQJnfwRHTpvbRbNFkNIW7uWaS7igIJ/xD7rynjjXFF+QxIODoVOLl3mzg8bOrBuS
         pj2NcN4aG0lDpqLV0R+zMnHCwrxNxtvZGBqPcpjtcjdnTAfyinmiK+k6aLZrmo/0srEg
         lRDMCt9a/OzwmFX5ukqbGVjFMt3YyFLO4YeNrYaXaH8E4Cp2i9boQvTguwZYlA708RWy
         o7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JSgb59n7yt285OgnTxrX5jNyxDnhai9FpL9TwOkiUQ=;
        b=6yv2ECUlM23L35W9IiqtuFZui5Kc/3SQ2S9m7ylxsGiIwkjpa7O7BQRWSe2i5faquE
         QqgRmzPNF9ryH98XJNfKtTOpl21Zc2Ux2f9iS3JtSlm+BY99WTCEEGUYAZRKO5y4qk0i
         0/giSUfdrCWS/DItC46Vex3EQ+chplQvt6VLjg7K3ijyNt5IumwQl5DfNuSige0TnUDq
         3Q3MRmFLuMXNSGp2GquydrzRbTb8tz0neeXQzU0nn7MWjXQ2tSozHJw52Sj3CPXTTtzl
         9Vh5Y0pdRbHzcke8pUwJvke5O2lOLnCCajjwP8MKoYnVU51GwLlEBja7IaPym+zfsR52
         5q9Q==
X-Gm-Message-State: ANoB5pkrVhpN1tJ8kHvRwf4wlRb+HR2c1YjD39rsDg3jysvc2CGGWIqy
        GyDdu7kPhKAzVirlMLTg416GzQbOdDA8MUzZ57s=
X-Google-Smtp-Source: AA0mqf62jLndMfJoLDbjXQ3MjgTBCmWaLCceq3cMUMzDVMw+TCy28658Vo2EzqROT9uvquszoXhoTg==
X-Received: by 2002:ac2:4bd4:0:b0:4b4:aed7:4aa5 with SMTP id o20-20020ac24bd4000000b004b4aed74aa5mr19490634lfq.447.1670143578832;
        Sun, 04 Dec 2022 00:46:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f20-20020ac25cd4000000b004b4bae1a05asm1680759lfq.293.2022.12.04.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 00:46:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI
Date:   Sun,  4 Dec 2022 09:46:14 +0100
Message-Id: <20221204084614.12193-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While changing node names of APQ8084 SDHCI, the ones in IFC6540 board
were not updated leading to disabled and misconfigured SDHCI.

Cc: <stable@vger.kernel.org>
Fixes: 2477d81901a2 ("ARM: dts: qcom: Fix sdhci node names - use 'mmc@'")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts | 20 ++++++++++----------
 arch/arm/boot/dts/qcom-apq8084.dtsi        |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts b/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
index 44cd72f1b1be..116e59a3b76d 100644
--- a/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
+++ b/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
@@ -19,16 +19,16 @@ soc {
 		serial@f995e000 {
 			status = "okay";
 		};
+	};
+};
 
-		sdhci@f9824900 {
-			bus-width = <8>;
-			non-removable;
-			status = "okay";
-		};
+&sdhc_1 {
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
 
-		sdhci@f98a4900 {
-			cd-gpios = <&tlmm 122 GPIO_ACTIVE_LOW>;
-			bus-width = <4>;
-		};
-	};
+&sdhc_2 {
+	cd-gpios = <&tlmm 122 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
 };
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index fe30abfff90a..4b0d2b4f4b6a 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -421,7 +421,7 @@ blsp2_uart2: serial@f995e000 {
 			status = "disabled";
 		};
 
-		mmc@f9824900 {
+		sdhc_1: mmc@f9824900 {
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
 			reg-names = "hc", "core";
@@ -434,7 +434,7 @@ mmc@f9824900 {
 			status = "disabled";
 		};
 
-		mmc@f98a4900 {
+		sdhc_2: mmc@f98a4900 {
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
 			reg-names = "hc", "core";
-- 
2.34.1

