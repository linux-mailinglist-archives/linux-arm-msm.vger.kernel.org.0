Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D997890AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 23:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjHYVqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 17:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjHYVqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 17:46:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B41E2720
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:45:55 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so20648551fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692999953; x=1693604753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHKlZ8/4vaMktrF5hqTmRR8yv61d2HdxgXhZLjedCzc=;
        b=sjKPXzlfM2nvbwNPq0Bv5uXVuMAUSG11WG1WylCgUXINWrQmznp7Eq5PP1Zd3cg56b
         4eUmsCeZiO29oxXPzXT3WB6kg8lR1M5FqgArLvhGbmjun1oqk4F1EO43N/xODw7xtP6Z
         arZVw8Muj7GPiYbJGEfb8SSFWiL1euTchQZJTLdfHlqTo7BpZllhb3QBjHNsJaid7X7/
         /45S84JnFBSyS/9R1TU0Jss7jL+UXTLCssRJaXRswrFzNqqPXpuUj6VD0S2edYeQESSy
         9kHOiu9rqLQJhh4F15bHkfQIiDA2GK1nQ6i9LC3bFqXZvU3vUk69PTV/kXObIk+nqB1x
         +cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692999953; x=1693604753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHKlZ8/4vaMktrF5hqTmRR8yv61d2HdxgXhZLjedCzc=;
        b=WCaUUNGei4eJsiNYjwVs3+3eRlDftYRbQtDpGAjdq04BQyA24J/VreX3Jzm40nJy0C
         XQIcWU4zVFlmUcgoRggSfHzPRW+h/DlRS9/P8qkYYoz1PWAYBCRr+tBfOHnwOKl/WfBr
         2AtpMUWiTUwja51anDXU7qNr3n6bakuBh5PxcdcxA6U2Q+9EsHWeac4wkI8gmHELdX3C
         UmhfYMCwF7bJICf1qtCDVv1DSeT2f3sXzv42SJXMjIeLzsOD3ffLPj7humvmKsVuGBGV
         zRiMPkX8okZJ6pffPyOkylx1Fye8LdXOuANXW9zEB+jNbu03HcsBcO7VxONjN7LyVo8N
         PEsQ==
X-Gm-Message-State: AOJu0Yw586Onz1k3QawVZL5nurELkudGW7OdGFcgDgeS5exJ1Jvnd0eh
        fQcJCjqjSBDhzAZ/7LuuaExb0+HrTAkTKl/qDPI=
X-Google-Smtp-Source: AGHT+IFGP147b15BsApx3z8nN+KUd5VqFrpAFFx+WqmwseVKgBMozVfi+jQFD+0P/EaZWolV35vS+g==
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id 15-20020a05651c00cf00b002bcbdbd1542mr12191190ljr.11.1692999953418;
        Fri, 25 Aug 2023 14:45:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f26-20020a2e6a1a000000b002b94327308asm486819ljc.133.2023.08.25.14.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:45:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8350-hdk: add pmr735a regulators
Date:   Sat, 26 Aug 2023 00:45:50 +0300
Message-Id: <20230825214550.1650938-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
References: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8350 HDK uses pmr735a to supply some of the voltages (e.g. to
WiFi/BT chip). Declare corresponding regulators together with voltage
boundaries.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 69870f69fe4f..30ff85250505 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -321,6 +321,81 @@ vreg_l10c_1p2: ldo10 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-2 {
+		compatible = "qcom,pmr735a-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+
+		vdd-l1-l2-supply = <&vreg_s2e_0p85>;
+		vdd-l3-supply = <&vreg_s1e_1p25>;
+		vdd-l4-supply = <&vreg_s1c_1p86>;
+		vdd-l5-l6-supply = <&vreg_s1c_1p86>;
+		vdd-l7-bob-supply = <&vreg_bob>;
+
+		vreg_s1e_1p25: smps1 {
+			regulator-name = "vreg_s1e_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1280000>;
+		};
+
+		vreg_s2e_0p85: smps2 {
+			regulator-name = "vreg_s2e_0p85";
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <976000>;
+		};
+
+		vreg_s3e_2p20: smps3 {
+			regulator-name = "vreg_s3e_2p20";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2352000>;
+		};
+
+		vreg_l1e_0p9: ldo1 {
+			regulator-name = "vreg_l1e_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+		};
+
+		vreg_l2e_1p2: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l4e_1p7: ldo4 {
+			regulator-name = "vreg_l4e_1p7";
+			regulator-min-microvolt = <1776000>;
+			regulator-max-microvolt = <1872000>;
+		};
+
+		vreg_l5e_0p8: ldo5 {
+			regulator-name = "vreg_l5e_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		vreg_l6e_0p8: ldo6 {
+			regulator-name = "vreg_l6e_0p8";
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <904000>;
+		};
+
+		vreg_l7e_2p8: ldo7 {
+			regulator-name = "vreg_l7e_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+	};
 };
 
 &cdsp {
-- 
2.39.2

