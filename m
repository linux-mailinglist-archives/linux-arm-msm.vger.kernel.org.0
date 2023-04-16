Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6C76E36FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 12:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjDPKLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 06:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDPKLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 06:11:40 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16E1E1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 03:11:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id xd13so22866985ejb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681639897; x=1684231897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXlcOAS1nGAgLABpy2LEgEsdYkAtut7JjkmPtZqL66Y=;
        b=gUrKjH9f3EH1rFG9SnwbgYtz1ayqJbLzYy6Iq2Qr0xKKkOL+kfc4SrzIV6VFrC09Di
         IcZpArhnisLC3yOBvk71oykwEMGxuZK/6oSOg/Wpe67gplBYsVIYwqD6AzWrur6aTV6l
         j87/wPaANj7xLlxA4SdqhO+z4znSRyKJKRwucauz9vRZOwzLJmcTFur0s8kXSnEtW2ds
         0GhNMmd3hICk4hzL7BPKUSCOur+/1lIKr5IMo0UTHAoxtipQC4Qd2Bv6/UO2zxD/mLGo
         ORLUuT8lyWiovHtZBpoaZ6kOjxYF4yeApNmSi7Yb7//cV0z6PpDQLHuXhr/+Zjvm01ao
         H3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681639897; x=1684231897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXlcOAS1nGAgLABpy2LEgEsdYkAtut7JjkmPtZqL66Y=;
        b=kLhvmmxogx3hTLo0I/3IdXCWz5yESg5bdgkrNsFtv2wC0i+xjsHCKSSPzb0MYxMdw/
         ULpv7UeeCqxgsV2sVK9qHPQ1WvZ0fzyRZ+uODQ7mYhTV2hLz1mlkIJaSR77hGM4JXb76
         S2m7Sc4ZVZ7wf3QvGiyau22F0Zb4Jxnmqoum7tAirGWculJaj37DkR38OGcCCJRZCGlW
         MmZVGiwDmpFQzXp/lq65kuV0zFpxITu5uDB8E87vdMmojXBgIYH/pMIaUOYYsnHVwsZr
         3FgjMiXCx8Ib3HwTTeCP5/WyI2ueg9ucAx85CXaMp/WTbtCG53CMLjz+kMgZqSY37h/8
         DWyQ==
X-Gm-Message-State: AAQBX9f6ibV4b2yivZi/UXxMxwzuUGnc8FNj9/GIFUXJ7Q/wMd9RQBIX
        s9xc65vNIF23cv6OYfDd/jGqzQ==
X-Google-Smtp-Source: AKy350aLTADs/BLgrJxsRRyl/Pgg+19M0SwiGPfPFQqN4Tu9AAAJrLSGQkFkxNVsZhlY4Sj2rlvtQw==
X-Received: by 2002:a17:906:5255:b0:94a:5a9e:9da0 with SMTP id y21-20020a170906525500b0094a5a9e9da0mr3666069ejm.77.1681639897229;
        Sun, 16 Apr 2023 03:11:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id wg9-20020a17090705c900b0094ea48e9052sm4742755ejb.32.2023.04.16.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:11:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: fix indentation
Date:   Sun, 16 Apr 2023 12:11:31 +0200
Message-Id: <20230416101134.95686-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct indentation to use only tabs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi  |  8 ++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi   | 34 ++++++++---------
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 52 +++++++++++++-------------
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 52 +++++++++++++-------------
 8 files changed, 80 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2b35cb3f5292..2c5780008c84 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -53,8 +53,8 @@ CPU0: cpu@0 {
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
+				compatible = "cache";
+				cache-level = <2>;
 			};
 		};
 
@@ -83,8 +83,8 @@ CPU2: cpu@100 {
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
+				compatible = "cache";
+				cache-level = <2>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ef9bd6ab577d..8fb766f9e8e0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -60,8 +60,8 @@ L2_0: l2-cache {
 				cache-level = <2>;
 				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
-				      cache-level = <3>;
+					compatible = "cache";
+					cache-level = <3>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c5f839dd1c6e..49c07cb76b20 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -42,7 +42,7 @@ L2_0: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
+					compatible = "cache";
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 90424442bb4a..ae0510e687b4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -110,8 +110,8 @@ L2_0: l2-cache {
 				cache-level = <2>;
 				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
-				      cache-level = <3>;
+					compatible = "cache";
+					cache-level = <3>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ae9b6bc446cb..4e8b99e7cf66 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -48,10 +48,10 @@ CPU0: cpu@0 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_0: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
+					compatible = "cache";
 				};
 			};
 		};
@@ -68,8 +68,8 @@ CPU1: cpu@100 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_100: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -85,8 +85,8 @@ CPU2: cpu@200 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_200: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -102,8 +102,8 @@ CPU3: cpu@300 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_300: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -119,8 +119,8 @@ CPU4: cpu@400 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_400: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -136,8 +136,8 @@ CPU5: cpu@500 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_500: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -153,8 +153,8 @@ CPU6: cpu@600 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_600: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -170,8 +170,8 @@ CPU7: cpu@700 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_700: l2-cache {
-			      compatible = "cache";
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2273fa571988..1a229caad8aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -65,8 +65,8 @@ L2_0: l2-cache {
 				cache-level = <2>;
 				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
-				      cache-level = <3>;
+					compatible = "cache";
+					cache-level = <3>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ebcb481571c2..ebe59bd7bcc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -58,12 +58,12 @@ CPU0: cpu@0 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
-				      cache-level = <3>;
+					compatible = "cache";
+					cache-level = <3>;
 				};
 			};
 		};
@@ -80,9 +80,9 @@ CPU1: cpu@100 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_100: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -98,9 +98,9 @@ CPU2: cpu@200 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_200: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -116,9 +116,9 @@ CPU3: cpu@300 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_300: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -134,9 +134,9 @@ CPU4: cpu@400 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_400: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -152,9 +152,9 @@ CPU5: cpu@500 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_500: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -170,9 +170,9 @@ CPU6: cpu@600 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_600: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -188,9 +188,9 @@ CPU7: cpu@700 {
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
 			L2_700: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 595533aeafc4..b15b585f3548 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -57,12 +57,12 @@ CPU0: cpu@0 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 				L3_0: l3-cache {
-				      compatible = "cache";
-				      cache-level = <3>;
+					compatible = "cache";
+					cache-level = <3>;
 				};
 			};
 		};
@@ -79,9 +79,9 @@ CPU1: cpu@100 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -97,9 +97,9 @@ CPU2: cpu@200 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -115,9 +115,9 @@ CPU3: cpu@300 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -133,9 +133,9 @@ CPU4: cpu@400 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
 			L2_400: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -151,9 +151,9 @@ CPU5: cpu@500 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
 			L2_500: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -169,9 +169,9 @@ CPU6: cpu@600 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
@@ -187,9 +187,9 @@ CPU7: cpu@700 {
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 2>;
 			L2_700: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      next-level-cache = <&L3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_0>;
 			};
 		};
 
-- 
2.34.1

