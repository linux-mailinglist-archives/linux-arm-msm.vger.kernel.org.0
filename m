Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF81259104C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 13:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbiHLLqF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 07:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbiHLLp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 07:45:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA03785AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 04:45:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o22so1001245edc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lBY6DQi6FykxVe21cRnJ3K9NDKKdbB0Pl4sf77sX8eE=;
        b=hEjR4hhlo09U+rFvOaIUyy1fST0RdqNFtl4gqoQoLH7cX9018o1ZLrGoxSdqvulzwc
         yCkU5kjdI7TQKtFX/dWR97FqQfBZBCGsDZV3ymV3KS6Wdl3mtTPtOe4FIhGmrUs78bsS
         4IKSdKq6/PWQLMU1iklyaC4KtAfXqVhJWuNJt6JBY0nQBvVvVztEz7ecmYX6jv/YImKJ
         txazqCGko8mu5u6GYyTWOG1tRRhrduXZ/C7/K1u8I6GQBulDc+GQkv6b91tA/VpRJqnc
         Qt8U5+rXndNdAtBtitQECwFcNteFLxeZZ3CSD+6oDnj24C1SXgwJ0yaNt6L+EL17aAw7
         MPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lBY6DQi6FykxVe21cRnJ3K9NDKKdbB0Pl4sf77sX8eE=;
        b=uFC9Ta58xZeIesTnU7uNGCLfMDj5r5R7p/4FuJ6cgIhqbFJpBIScEgRp6Mb7ZHMExM
         Ftj7bEjEQMrstZNvFY3W2V1oj/YWUD89Dp0b3EmD8PDMydAYg7+DmvGm+X6/Jzfw2n/0
         PWBmlIbHNEzslzdbTfR0Yga709fy+B4G8x6duCSzwc7u717jfNx0Ix0uMQF3J/m+/xS0
         /pXGGdtkczEpxD0/3KOoytZzpUjmkQMCE0g4bfJ331TKRCNNr2t3idZEfAjybouJcnN4
         LGQ95P+YbiGO1XRlu4lARuxtYtN/4wFBdKXxJxIctYV9vpWsWNGTmF+b60mvWprrWq13
         c5Jg==
X-Gm-Message-State: ACgBeo1azGiOFPyJUqtejpkM8My7JPuBZaqt/3sfaZ48OrxpiIrLYVuz
        5fTWZ4iWOOH47377xru9zL2VhtjtC6ojpg==
X-Google-Smtp-Source: AA6agR7kE5n5oNGAukxfrM9RV45DiF3xaT+dMFX9yohTJ4tmofsIEqX4YuoTfA86E2m/C0i03+thdw==
X-Received: by 2002:a05:6402:5024:b0:440:e4ad:f7b6 with SMTP id p36-20020a056402502400b00440e4adf7b6mr3318507eda.358.1660304754897;
        Fri, 12 Aug 2022 04:45:54 -0700 (PDT)
Received: from otso.arnhem.chello.nl (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jx27-20020a170907761b00b0072b55713daesm720790ejc.56.2022.08.12.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 04:45:54 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pm6350: add temp sensor and thermal zone config
Date:   Fri, 12 Aug 2022 13:44:22 +0200
Message-Id: <20220812114421.1195044-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.1
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

Add temp-alarm device tree node and a default configuration for the
corresponding thermal zone for this PMIC. Temperatures are based on
downstream values.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
With this config I'm getting this in dmesg, not sure if it's a warning
that should be solved or just an informative warning.

[    0.268256] spmi-temp-alarm c440000.spmi:pmic@0:temp-alarm@2400: No ADC is configured and critical temperature is above the maximum stage 2 threshold of 140 C! Configuring stage 2 shutdown at 140 C.

As far as I can tell, based on downstream dts this PMIC doesn't have an
ADC.

 arch/arm64/boot/dts/qcom/pm6350.dtsi | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/qcom/pm6350.dtsi
index c5d85064562b..1d24189680ea 100644
--- a/arch/arm64/boot/dts/qcom/pm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6350.dtsi
@@ -5,6 +5,37 @@
 
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm6350-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm6350_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm6350", "qcom,spmi-pmic";
@@ -35,6 +66,13 @@ pm6350_resin: resin {
 			};
 		};
 
+		pm6350_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm6350_gpios: gpios@c000 {
 			compatible = "qcom,pm6350-gpio";
 			reg = <0xc000>;
-- 
2.37.1

