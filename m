Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DEB4C5826
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiBZUvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiBZUvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:14 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00CB261D3D
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:38 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g39so15042151lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HOLqLbfCIn2aqo8NSXSJoHKk1yF+2y2hXka94aKAaI0=;
        b=JEeKST/g8Zx6/s1/WoGcEKGRq/ozZSOMpynH6syHFZYHUFBKrrL8ghQgijfnMshIpN
         3oxuoPzftkad08G7iK7hCPpau9SgId+au+zgcAk0YU/VERyKXOUSbi3wq0Pqmt8WQ3ox
         Gs4tlY45mWXhErUVNSCX8zA84sYZdXWw7r7BaRCi8znX1vZGxs09/67spiBvbiFSWZ8R
         7kEofav0wdG1GWopOd9yO8cmGDKupy7Rn7zun65kLx8rtGoDI2DOkFMRFJzdtyLWhSyz
         7kYFa9Kp5AuQEQtcHtgMe3Vjt/au3FwpGgKjVDkls70Zbo/VH/DEg51/uSDl4eDoeDyo
         /B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HOLqLbfCIn2aqo8NSXSJoHKk1yF+2y2hXka94aKAaI0=;
        b=HossBntd3oPGULpAQVpkzUOz9eK1Q3GauRQQJQ9xoaM3s/jXORyOPJz2K2apq0ozFn
         e15PQjYTTDj0BxMn/lVziG+orH9gN9WG2GNWTlAHH4zbEwOy6Pq3kD9WH/d9YZS/NGP+
         dV53eppk6vXh/RDpfr+G2KnsM8aHK5q1Ohu82ZRHoh2aT5YKcfbcYTCHh2DDGiR7r7fZ
         UTYccdLwuLcPNK/8adOTMGcZQk3niDWQsA/4pDnrt3oA1sLH39x4d2bMIlWskVKuVEYl
         Wde36qpDuxqngeFAKjLjwyxkMzgDXJMfyAz2TM3KSeCfzyimX89ds3uflCtkgljwmrxw
         Dq0g==
X-Gm-Message-State: AOAM53351GsLH10NYMVi7sypz5Hua1y1+47CYyQxXyICkLFnJ0AYpSFk
        y+j3SbXPv1KY0jNf3IZgptykSQ==
X-Google-Smtp-Source: ABdhPJwGiHECX68qMV3v8XiCZtE06oYSjOd9ne2PeZm2Hz7O8wDRIsZPVtOrXftDVpJ4fv5V86fcsA==
X-Received: by 2002:a05:6512:44f:b0:438:fc0b:dabe with SMTP id y15-20020a056512044f00b00438fc0bdabemr8544535lfk.222.1645908637184;
        Sat, 26 Feb 2022 12:50:37 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: pm8350: add temp sensor and thermal zone config
Date:   Sat, 26 Feb 2022 23:50:29 +0300
Message-Id: <20220226205035.1826360-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
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

Add temp-alarm device tree node and a default configuration for the
corresponding thermal zone for this PMIC. Temperatures are based on
downstream values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
index 308f9ca7c744..b10f33afa5e3 100644
--- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
@@ -6,6 +6,30 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8350_thermal: pm8350c-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8350_temp_alarm>;
+
+			trips {
+				pm8350_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8350_crit: pm8350c-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8350: pmic@1 {
 		compatible = "qcom,pm8350", "qcom,spmi-pmic";
@@ -13,6 +37,13 @@ pm8350: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8350_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8350_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio";
 			reg = <0x8800>;
-- 
2.30.2

