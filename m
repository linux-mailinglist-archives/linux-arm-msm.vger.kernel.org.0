Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A2C610BA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 09:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiJ1HyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 03:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiJ1HyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 03:54:18 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A321BFBA6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 00:54:16 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id v27so6751906eda.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEh7we78H3C504Ey8uKXhsNpfv9vdx7UebnqIo2Gcv8=;
        b=j0ZZLooRH9i9GWkWCy4Id9RJsOEpEieKVgmJ0bYLgtpvSr+uP1BDaJaW86SWD/akod
         MWsD6O6z/CWvALagOqHG72vqxQuwYD4z7rNO1YS2hS6aDL45Hi1uQ1PrSWgFQREPdjqE
         16pruyrm7v7dIrWy0SV6dfnprMt7mN61HMUdmmi4+7XBQD2dWjL+5oEx5p1PUpi40tiW
         mbHqETFGJfY2wRVlFtnppwbN4yxdmPgvZmz5uPF0PvI6GqFHrLtXV0EXOWKpHx9iRtKP
         GVl1kKE6qKgoxOjC+Ec3qjn2zVm0y9JTswKeFIrvp1ZxptVg2Qhi0IWfWYHIVgYGghvd
         nKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEh7we78H3C504Ey8uKXhsNpfv9vdx7UebnqIo2Gcv8=;
        b=NNO5DabEcMhQb6ksWhU0ptlaHQSa8tOBqE/r5XBtBUylLsfCW/ufs1Y9orlo8ehBFS
         1ZRVMUxyBJhOIS8jq/1hV5GLBq9plP0Ro50V5rN3NBmpwPG0EFVoWnAlm6uuCuvHmhWJ
         ntaHbCCvMMRImJbGJ1jw0OOi+8jgTHCHeMQBp/2TeEx4Ev0a2RdhEsCxiurf+IgWKH1E
         lPWazDecGw3c478UgyFF0mBiFiMq7zERWBrz4QaOS8Mt4gIGTx6gSwTLZfwm6TVZSWZ3
         GkOrKodXKxNaRq2qKTc376alNgt46qOwRDbk5SvkO6qMfAMOxV8uoTbB77RJbzwQME6y
         GKDA==
X-Gm-Message-State: ACrzQf3eJDb9gWZJKJ9ybSCii0wq++R9bnZpBQ0AmfU8fZfaIEG9sTvF
        x3khBQm0Wrjk6B0tvf0kPQmsC63RpHqFHw==
X-Google-Smtp-Source: AMsMyM6ElPrCWCp47BFYHByQwW0VRG8TQjVnN9IB3snxFHTB2FGWQd0k0zG2bArqCSDOleJlzFDXTw==
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id k8-20020a056402340800b0043c2dd3d86bmr49507591edc.108.1666943655226;
        Fri, 28 Oct 2022 00:54:15 -0700 (PDT)
Received: from otso.. (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id v8-20020a170906b00800b0078dce9984afsm1776009ejy.220.2022.10.28.00.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:54:14 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: pm6350: add temp sensor and thermal zone config
Date:   Fri, 28 Oct 2022 09:54:04 +0200
Message-Id: <20221028075405.124809-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add temp-alarm device tree node and a default configuration for the
corresponding thermal zone for this PMIC. Temperatures are based on
downstream values, except for trip2 where 125°C is used instead of 145°C
due to limitations without a configured ADC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
* Decrease trip2 temp to 125degC from 145degC after discussion with
  Matthias

 arch/arm64/boot/dts/qcom/pm6350.dtsi | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/qcom/pm6350.dtsi
index ecf9b9919182..c9575cf0f518 100644
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
+					temperature = <125000>;
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
 			compatible = "qcom,pm6350-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.38.1

