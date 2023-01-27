Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53F567E412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjA0LsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234023AbjA0Lrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:47:39 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58C87E05F
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:33 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bk16so4702367wrb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7JP8lZJxD2t7M0HfkJf1AMtP5tYBjuwTLpntblivYc=;
        b=S52qqGzaIprv1Lj6xyZfrmwE+0NuNqc7ILmjX6gPp72h/rKAeyFlA7ErV9xClk8/oC
         z87HFrMb3hzC4SsEfHrsdM+KznVTf4Dx7F2fznPvIO82NfxrZiDqOVImBKsIci5sGH5G
         r2Dz1rBWDfkj8z6N5DlW/G6Ffj7ZQULS8mikuguuQgZzhNi9+pc7w7fzc7qEVQcRyfmU
         fEgKLAjPJVopie3I34uveynHxiFc1X4c85wXqIf371y2gpisKDTsxjNwAxSMkRf7aTBo
         XYX+z0Ga73tUmGpxP62FOOOChGZRHrLleg2nWYut8Jb/k07KvjXs0nbQCE4j/0oaQ6rz
         /p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7JP8lZJxD2t7M0HfkJf1AMtP5tYBjuwTLpntblivYc=;
        b=THGBBrTN6qpXcZpwQYZdFmqe+f604Guvf0y7tnuQ8OysY6h+1453DQnkPFmqEohvAn
         dJxaeXvOw//j+wRG3VkM+keYWwf4nYFxA56P3McqdLc1xiqdzsYr+Fx1eF8gL+gNgmMB
         dAcgh6JmA5jpeexN4TFxB5lj2vnJVy0gDi5H6Feu4W4oc0CgMFZdgknNtZ3YCpjhycxW
         X5+j/gapkePlhzkuZX+pFkl39bcXUDYaUYX/l9AO/XOIejnI2aw5bOJPEJ+v9ZuPGon7
         g0F8X+iKjOax3eLNTjrWAtWGkVFjih2CqrMz15xLKyC+qIQHUiCa57lNoYBPLkmKhcPi
         iE1w==
X-Gm-Message-State: AFqh2krNrEzSjzizHP4pMots+os6ZIStEQMhmIh28COHHk0j/oQ6+9Io
        Eo0JMkljVHjVdZypWSc00utsGw==
X-Google-Smtp-Source: AMrXdXtKCTpYnnfbPAFd3/a7YYid759xlKS+mmZawne8CEYgHS4x6DG2VbW/bRlY7NdA3Ce69/Il6Q==
X-Received: by 2002:a5d:404c:0:b0:2be:1258:897d with SMTP id w12-20020a5d404c000000b002be1258897dmr33902198wrp.43.1674819866574;
        Fri, 27 Jan 2023 03:44:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm3807760wrs.47.2023.01.27.03.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:44:26 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/11] arm64: dts: qcom: sm8450: align RPMh regulator nodes with bindings
Date:   Fri, 27 Jan 2023 12:43:47 +0100
Message-Id: <20230127114347.235963-11-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                 | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                 | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 5bdc2c1159ae..feef3837e4cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -99,7 +99,7 @@ vph_pwr: vph-pwr-regulator {
 };
 
 &apps_rsc {
-	pm8350-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -190,7 +190,7 @@ vreg_l9b_1p2: ldo9 {
 		};
 	};
 
-	pm8350c-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -303,7 +303,7 @@ vreg_l13c_3p0: ldo13 {
 		};
 	};
 
-	pm8450-rpmh-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8450-rpmh-regulators";
 		qcom,pmic-id = "h";
 
@@ -346,7 +346,7 @@ vreg_l3h_0p91: ldo3 {
 
 	};
 
-	pmr735a-rpmh-regulators {
+	regulators-3 {
 		compatible = "qcom,pmr735a-rpmh-regulators";
 		qcom,pmic-id = "e";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 134ffdfc2c63..f7592946c783 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -39,7 +39,7 @@ vph_pwr: vph-pwr-regulator {
 };
 
 &apps_rsc {
-	pm8350-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -130,7 +130,7 @@ vreg_l9b_1p2: ldo9 {
 		};
 	};
 
-	pm8350c-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -242,7 +242,7 @@ vreg_l13c_3p0: ldo13 {
 		};
 	};
 
-	pm8450-rpmh-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8450-rpmh-regulators";
 		qcom,pmic-id = "h";
 
@@ -285,7 +285,7 @@ vreg_l3h_0p91: ldo3 {
 
 	};
 
-	pmr735a-rpmh-regulators {
+	regulators-3 {
 		compatible = "qcom,pmr735a-rpmh-regulators";
 		qcom,pmic-id = "e";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 53d0ee2dbfa9..5be52468489b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -116,7 +116,7 @@ vph_pwr: vph-pwr-regulator {
 };
 
 &apps_rsc {
-	pm8350-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -212,7 +212,7 @@ pm8350_l9: ldo9 {
 		};
 	};
 
-	pm8350c-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -348,7 +348,7 @@ pm8350c_l13: ldo13 {
 		};
 	};
 
-	pm8450-rpmh-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8450-rpmh-regulators";
 		qcom,pmic-id = "h";
 
@@ -392,7 +392,7 @@ pm8450_l3: ldo3 {
 		};
 	};
 
-	pmr735a-rpmh-regulators {
+	regulators-3 {
 		compatible = "qcom,pmr735a-rpmh-regulators";
 		qcom,pmic-id = "e";
 
-- 
2.34.1

