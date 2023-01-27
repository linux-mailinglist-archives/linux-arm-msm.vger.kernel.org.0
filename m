Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DAC67E3FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbjA0Lr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbjA0LrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:47:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9135772644
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:10 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q5so4764396wrv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXHSr/fS02j1rKaP8taZ8uB8fq7HnfewxcqVIRr5kHo=;
        b=TpJ2a37arH53oBmRWcN0p58sWdpypizl5gE4s7xHIw1CiiQldMUmUexbopijccGnO6
         Cy+k/OdT/SgK/5C16/PkKqjEQOCtERtsbiMXosEuzeKMWiJKy3eLY+jwssChHW1gMvzN
         IjMkTwGhm48BrbHsEf7YKayH8g270Y3mckQTyyTHZgvQkzCBxlYlGAurcIP0KWQ9SdNG
         yiFFCK5vN6Xbw7fkIlerlL2m80uoxjwAPsW15dv353aAWfXUYIpG69mfkIKEygoBb32j
         C4+rJd/QAEVYRVfoYG7yLoIT84bPYDo9QfGON806l+X6rm+76X57sLFuy9/i2Rhtq11Q
         BruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXHSr/fS02j1rKaP8taZ8uB8fq7HnfewxcqVIRr5kHo=;
        b=FX3W3OI48crtsHr8SJuBbT/6ZGHEFhUdT161dZITp+UcbQuQIF6MrlqQsIwyXCDibQ
         0O7hn2wYe0rGKmtcpukxkqCsN38uDCt1yJRYIslDKB6f18WKeIseBCXA1+jUKhpxHg5G
         NJ7bzXys+NpcWZrSe+VcWu/S+2BkXk2o/B/NKBMlCCghZohTgmqNEJrDoUFi9TzxqzED
         Ur80LYREvHkTh56Lgs5r1wGWTiyUbSR+ey+XMLGqJx3fPAG81HHeKcXLp1GE3O0DO3XQ
         Bef2RxGLMjjPRNCR5hNBLNexczlG5NwTNHc7C7xJ07EPWKgTjSR5gR8z8y7IFXBvOcsB
         b/gw==
X-Gm-Message-State: AFqh2kpcEPCUwvj5C4FTBXc3zuJEuYU6edDKfrhLdeEsLV2Pu17WvxKN
        WhvZv5XSJLAmLVEYy1RnhStiHg==
X-Google-Smtp-Source: AMrXdXstYaxVq/y0CPfeCXYOirMJcFr5cuF7T2HGwNwV3a5ptZWE8vrQSJvhwa7Ta/d+hPzBpT9LhQ==
X-Received: by 2002:a05:6000:383:b0:2bc:7ef0:53bd with SMTP id u3-20020a056000038300b002bc7ef053bdmr48272310wrf.17.1674819857575;
        Fri, 27 Jan 2023 03:44:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm3807760wrs.47.2023.01.27.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:44:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/11] arm64: dts: qcom: sc8280xp: align RPMh regulator nodes with bindings
Date:   Fri, 27 Jan 2023 12:43:41 +0100
Message-Id: <20230127114347.235963-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
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

Device node names should be generic and bindings expect certain pattern
for RPMh regulator nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 20c629172477..2f43b2fbc2a1 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -142,7 +142,7 @@ linux,cma {
 };
 
 &apps_rsc {
-	pmc8280-1-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -179,7 +179,7 @@ vreg_l6b: ldo6 {
 		};
 	};
 
-	pmc8280c-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -208,7 +208,7 @@ vreg_l13c: ldo13 {
 		};
 	};
 
-	pmc8280-2-rpmh-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "d";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b60185d9bdea..e41b630141fc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -287,7 +287,7 @@ map1 {
 };
 
 &apps_rsc {
-	pmc8280-1-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -338,7 +338,7 @@ vreg_l6b: ldo6 {
 		};
 	};
 
-	pmc8280c-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 		vdd-bob-supply = <&vreg_vph_pwr>;
@@ -372,7 +372,7 @@ vreg_bob: bob {
 		};
 	};
 
-	pmc8280-2-rpmh-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "d";
 
-- 
2.34.1

