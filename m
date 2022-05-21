Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFCE52FDA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245227AbiEUPOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbiEUPOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:14:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8EE554AD
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f4so18733158lfu.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AvVifaO9p+JFw30NVykbo4mkyi37xpDmxYCbuCucK8M=;
        b=gJFk/utYk7tEDr3TiCLcmebSKUjrCeU+VIZ6I+wLtkFUise5ohQVyMMxkrUvbVVIwr
         E3ZcTVr90anB6NFLfq0bitQyQL7x0UnNTYKmeSbVuXYtomM7v3HFB2K8gon3+s/+n9i5
         OmwzJpXQDl5aCssHquJf56G+YdZmKsMS5g/eOVsexujdKrWyxNs7zzjLZq6M5RUmXIJ/
         s7KeJuwXhVeeX58ogd3cJIyLhvc1OK38/l/4Li/ovJk6vJbGXz0TgWRPxpYVZ25SqevJ
         +NZTK5cIWbjeR11e3RnppLBIRye0w6xjToTEUVNva9yvdmxvuv48QfU6zeytRrLrNdXI
         +0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AvVifaO9p+JFw30NVykbo4mkyi37xpDmxYCbuCucK8M=;
        b=jhgr2kIQrr8KB2KzN+mUmiXYB5uCgAVMUAKaoE0FOpctznRMmxQgc8i9QS8KCJJY1u
         Ugs8IhbuvQVjxUZg4ZRCjspk8gTGNzbbxcSDcgefMOmJHv2JylhaTcdy7NS47yz9X6ln
         ZX7FrIT/RKaW0nkz4Fu1C8f0XOAjnXVtnRjO2OcKQAIsldbTZ/MGzKzzcP2vWeBi1bEO
         jCxqlJv+mSTad4awXTxr+Qik+CPVUKaSy2oDQCz/ONst2P4o0i3fHhRiRGQhkYfY87zz
         5EB/R9gXj90d6WswAzWoD9Tk9YJNTBnILdIwXd5hG+F+srLmqVzO609gpA2EQ2rAFHw3
         kfKA==
X-Gm-Message-State: AOAM531pUEjfugYpFVYvwVBQbvVP10W297RWKuh5svcdEfC/fMgiL339
        X2oLgg2Awngoy3IHR2lq/q7BPg==
X-Google-Smtp-Source: ABdhPJyEF/PmsCSZKm9rhGinAIjLGKp+WnOdtCw5Ykbhm++dVKLJfZ0m3F//cu2F69h8E9bJVeu4/g==
X-Received: by 2002:a05:6512:3502:b0:476:c68d:8b0d with SMTP id h2-20020a056512350200b00476c68d8b0dmr10868706lfs.113.1653146086058;
        Sat, 21 May 2022 08:14:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 4/4] arm: dts: qcom-apq8064: create tsens device node
Date:   Sat, 21 May 2022 18:14:37 +0300
Message-Id: <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create separate device node for thermal sensors on apq8064 platform.
Move related properties to the newly created device tree node.
This harmonizes apq8064 and ipq8064 device trees and allows gcc device
to be probed earlier by removing dependency on QFPROM nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..0d323c208978 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -105,7 +105,7 @@ cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 7>;
+			thermal-sensors = <&tsens 7>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -126,7 +126,7 @@ cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 8>;
+			thermal-sensors = <&tsens 8>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -147,7 +147,7 @@ cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 9>;
+			thermal-sensors = <&tsens 9>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -168,7 +168,7 @@ cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 10>;
+			thermal-sensors = <&tsens 10>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -810,14 +810,23 @@ tsens_backup: backup_calib {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-apq8064";
+			compatible = "qcom,gcc-apq8064", "syscon";
 			reg = <0x00900000 0x4000>;
-			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-			nvmem-cell-names = "calib", "calib_backup";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-			#thermal-sensor-cells = <1>;
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <11>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.35.1

